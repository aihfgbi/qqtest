Utils = {}

--  显示对象 静态函数
local displayUtils = {}
Utils.displayUtils = displayUtils
-- 本次游戏的webimage 数组
displayUtils.webIamgeTable = {}

--  数据对象 静态函数
local dataUtils = {}
Utils.dataUtils = dataUtils

-- 通用操作 静态函数
local utils = {}
Utils.utils = utils

---------------------------
--发送http 请求
--@param
--@return
function utils:sendHpptRequest(url,funSuccess,funError)
    print("url:"..url)
    local xhr = cc.XMLHttpRequest:new()
    xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING
    xhr:open("GET", url,true)
    local function onReadyStateChange()
        if xhr.readyState == 4 and (xhr.status >= 200 and xhr.status < 207) then
            dump(xhr.response)
            funSuccess(xhr.response)
        else
            funError(xhr)
        end
        xhr:release()
    end
    xhr:registerScriptHandler(onReadyStateChange)
    xhr:send()
    
end

---------------------------
--发送http post请求
--@param
--@return
function utils:sendHpptPostRequest(url,funSuccess,funError,data)
    local xhr = cc.XMLHttpRequest:new()
    xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING
    xhr:open("POST", url)
    local function onReadyStateChange()
        if xhr.readyState == 4 and (xhr.status >= 200 and xhr.status < 207) then
            funSuccess(xhr.response)
        else
            funError()
        end
        xhr:release()
    end
    xhr:registerScriptHandler(onReadyStateChange)
    xhr:send(data)
end


---------------------------
--发送自定义事件
--@param
--@return
function utils:sendCustomEvt(cmd,param)
    local event = cc.EventCustom:new(CMD.CUSTOM);
    event._usedata = param;
    event._cmd = cmd;
    cc.Director:getInstance():getEventDispatcher():dispatchEvent(event);
end

---------------------------
-- 释放资源组
--@param
--@return
function utils:releaseRes(releaseTable)
    if releaseTable == nil then return end
    for key, obj in ipairs(releaseTable) do
        if obj.type == "plist" then 
            cc.SpriteFrameCache:getInstance():removeSpriteFramesFromFile(obj.plist)
            cc.Director:getInstance():getTextureCache():removeTextureForKey(obj.url) 
        elseif obj.type == "image" then 
            cc.Director:getInstance():getTextureCache():removeTextureForKey(obj.url) 
        elseif obj.type == "armatrue-json" or obj.type == "armature-xml" then -- 骨骼动画
            ccs.ArmatureDataManager:getInstance():removeArmatureFileInfo(obj.keyName)
        elseif obj.type == "animation" then -- 帧动画
            cc.AnimationCache:getInstance():removeAnimation(obj.url)
        elseif obj.type == "sound" then 
            audio.unloadSound(obj.url)
        elseif obj.type == "music" then 

        end
    end
    print("当前纹理内存"..cc.Director:getInstance():getTextureCache():getCachedTextureInfo())
    printInfo(string.format("LUA VM MEMORY USED: %0.2f M", collectgarbage("count")/1024))
end

---------------------------
--获取贝尔3次曲线 点集
--arrInitPoints 初始点集,counts 需要生产的个数,arrReslutPoints结果点集
--@param
--@return
function utils:getBezierPoints(arrInitPoints,counts,arrReslutPoints)
    local dt = nil
    dt = 1.0 / ( counts - 1 )
    local function pointOnCubicBezier(arrInitPoints,t)

        local ax = nil
        local bx = nil
        local cx = nil
        local ay = nil 
        local by = nil 
        local cy = nil 
        local tSquared = nil 
        local tCubed = nil
        local resultP = {}

        --    /*計算多項式係數*/

        cx = 3.0 * (arrInitPoints[2].x - arrInitPoints[1].x);
        bx = 3.0 * (arrInitPoints[3].x - arrInitPoints[2].x) - cx;
        ax = arrInitPoints[4].x - arrInitPoints[1].x - cx - bx;

        cy = 3.0 * (arrInitPoints[2].y - arrInitPoints[1].y);
        by = 3.0 * (arrInitPoints[3].y - arrInitPoints[2].y) - cy;
        ay = arrInitPoints[4].y - arrInitPoints[1].y - cy - by;

        --    /*計算位於參數值t的曲線點*/

        tSquared = t * t;
        tCubed = tSquared * t;

        resultP.x = (ax * tCubed) + (bx * tSquared) + (cx * t) + arrInitPoints[1].x;
        resultP.y = (ay * tCubed) + (by * tSquared) + (cy * t) + arrInitPoints[1].y;
        resultP.x = math.round(resultP.x)
        resultP.y = math.round(resultP.y)
        return resultP;

    end

    local limit = counts-1
    for var=0, limit do
        local p = pointOnCubicBezier(arrInitPoints,var*dt)
        arrReslutPoints[var+1] = p
    end
end


---------------------------
--@param 获取经纬度距离
--@return
function utils:getLongitudeDis(nx1,ny1,nx2,ny2)
    local radLat1 = ny1* math.pi / 180.0
    local radLat2 = ny2* math.pi / 180.0  

    local radLon1 = nx1* math.pi / 180.0  
    local radLon2 = nx2* math.pi / 180.0


    if radLat1 < 0 then
        radLat1 = math.pi / 2 + math.abs(radLat1)--// south 
    end    
    if radLat1 > 0 then
        radLat1 = math.pi / 2 - math.abs(radLat1)--// north 
    end

    if radLon1 < 0 then
        radLon1 = math.pi * 2 - math.abs(radLon1)--// west 
    end

    if radLat2 < 0 then 
        radLat2 = math.pi / 2 + math.abs(radLat2)--// south  
    end

    if radLat2 > 0 then 
        radLat2 = math.pi / 2 - math.abs(radLat2)--// north  
    end

    if radLon2 < 0 then
        radLon2 = math.pi * 2 - math.abs(radLon2)--// west
    end    
    local EARTH_RADIUS = 6378137
    local x1 = EARTH_RADIUS * math.cos(radLon1) * math.sin(radLat1)
    local y1 = EARTH_RADIUS * math.sin(radLon1) * math.sin(radLat1)
    local z1 = EARTH_RADIUS * math.cos(radLat1)
  
    local x2 = EARTH_RADIUS * math.cos(radLon2) * math.sin(radLat2)
    local y2 = EARTH_RADIUS * math.sin(radLon2) * math.sin(radLat2)
    local z2 = EARTH_RADIUS * math.cos(radLat2)
   
    local  d = math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2)+ (z1 - z2) * (z1 - z2))

    local theta = math.acos((EARTH_RADIUS * EARTH_RADIUS + EARTH_RADIUS * EARTH_RADIUS - d * d) / (2 * EARTH_RADIUS * EARTH_RADIUS))  
    local dist = theta * EARTH_RADIUS
    return (math.ceil(dist)/1000).."km"
end



---------------------------
-- 0 转空串
--@param
--@return
function dataUtils:zoreToNilStr(num)
    if num == 0 then
        return ""
    end
    return num
end


-- 截取utf8 字符串
-- str:            要截取的字符串
-- startChar:    开始字符下标,从1开始
-- numChars:    要截取的字符长度
function dataUtils:utf8sub(str, startChar, numChars)
    local function chsize(char)
        if not char then
            return 0
        elseif char > 240 then
            return 4
        elseif char > 225 then
            return 3
        elseif char > 192 then
            return 2
        else
            return 1
        end
    end
    local startIndex = 1
    while startChar > 1 do
        local char = string.byte(str, startIndex)
        startIndex = startIndex + chsize(char)
        startChar = startChar - 1
    end

    local currentIndex = startIndex

    while numChars > 0 and currentIndex <= #str do
        local char = string.byte(str, currentIndex)
        currentIndex = currentIndex + chsize(char)
        numChars = numChars -1
    end
    return str:sub(startIndex, currentIndex - 1)
end

---------------------------
--@param 
--把时间 秒，转化为xx天xx时xx分xx秒 的形式 
--@return 
function dataUtils:convertTimeForm(second)  
    local timeDay                   = math.floor(second/86400)  
    local timeHour                  = math.fmod(math.floor(second/3600), 24)  
    local timeMinute                = math.fmod(math.floor(second/60), 60)  
    local timeSecond                = math.fmod(second, 60)  
    return timeDay, timeHour, timeMinute, timeSecond  
end 

---------------------------
--@param 
--把时间 秒，转化为xx时xx分xx秒 的形式 
--@return
function dataUtils:formatTime(time)  
    local hour = math.floor(time/3600);  
    local minute = math.fmod(math.floor(time/60), 60)  
    local second = math.fmod(time, 60)  
    local rtTime = string.format("%s:%s:%s", hour, minute, second)  

    return rtTime  
end  


---------------------------
--@param 毫秒 转换为日期
--   --把1990.1.1至今的秒数，转化为年月日，时分  
--endTime 单位毫秒  
--@return
function dataUtils:timeToDateStr(endTime)
    return os.date("%Y-%m-%d  %H:%M",math.floor(endTime/1000))
end

--==============================--
--desc:将 xx-xx-xx aa:aa:aa时间转换成秒
--time:2018-01-03 03:35:07
--@str: 时间
--@return 
--==============================--
function dataUtils:dateToTime(str) 
    local arr = string.split(str," ")
    local arr1 = string.split(arr[1],"-")
    local arr2 = string.split(arr[2],":")
    local t = os.time({year=arr1[1], month=arr1[2], day=arr1[3], hour=arr2[1], min=arr2[2], sec=arr2[3]})
    return t 
end

---------------------------
--获取两点之间的夹角
--@param p1 起点 p2 目标点
--@return
function dataUtils:getPPAngle(p1,p2)
    local pSub = cc.pSub(p1,cc.p(p2.x, p2.y))
    local bulletShotRotation = math.atan(pSub.x/pSub.y)/math.pi*180 -- 子弹射击角度
    if p1.y > p2.y  then -- 减去子弹发出位置到炮 中心的位置
        bulletShotRotation = bulletShotRotation + 180
    end
    return bulletShotRotation
end

---------------------------
--@param 获取几次幂
--@return
function dataUtils:getNumMi(num,miBase)
    print("---",num,"---")
	local starMi = 0
    while num ~= 1 and num ~= 0 do
        starMi = starMi + 1
        num = num/miBase
        if num ~= math.floor(num) then
        	return -1
        end
	end
	
    if num  == 1 then
        return starMi
	end
	
	return -1
end

--==============================--
--desc:将数字转成万，十万，百万，千万字符串
--time:2017-12-13 09:28:58
--@num:数字
--@return 
--==============================--
function dataUtils:numberToString(num)
    if type(num) ~= "number" then
        return num
    end        
    if num < 1000000 then -- 小于100万 直接显示
    	return num
    else --大于等于100万 直接显示单位万
        return string.format( "%.1f万", num / 10000 )
    end
    return num
end

---------------------------
--节点永久闪烁
--@param
--@return
function displayUtils:nodeBlink(node)
    local repeatAction = cc.RepeatForever:create(cc.Blink:create(1, 1))
    node:runAction(repeatAction)
    return repeatAction
end

---------------------------
--节点地震效果
--偏移量默认6
--速度默认为1/32
--@param
--@return
function displayUtils:shark(node,times,offset,speed)
    local sharkAction = nil  
    local sharkTimes= 0
    local num = 0
    local arrOffst = {0,0}
    local nx,ny = node:getPosition()
    if offset == nil then
        offset = 6
    end

    if speed == nil then
        speed = 1/32
    end

    local function shark()
        num = num+1
        if num%4 < 2 then
            arrOffst[num%2+1] = 0
        else
            arrOffst[num%2+1] = offset
        end
        node:setPosition(arrOffst[1]+nx,arrOffst[2]+ny)
        sharkTimes = sharkTimes + 1
        if sharkTimes >= times then
            node:stopAction(sharkAction)
            node:setPosition(nx,ny)
        end
    end
    sharkAction = schedule(node,shark,speed)
end


---------------------------
--创建输入框
--@param
--@return
function displayUtils:createEditBox(editBoxInfo)
    local inputBg = ccui.Scale9Sprite:create("platfrom/image/nilBg.png")
    local editBox = ccui.EditBox:create(editBoxInfo.rectSize,inputBg,inputBg,inputBg)
    --    editBox:setFontSize(editBoxInfo.size)
    editBox:setFontColor(editBoxInfo.color)
    editBox:setPlaceHolder(editBoxInfo.placeh)
    editBox:setPlaceholderFontColor(editBoxInfo.placehColor)
    editBox:setMaxLength(editBoxInfo.maxLen)
    editBox:setPosition(editBoxInfo.position)
    editBoxInfo.parent:addChild(editBox)
    if editBoxInfo.isPwd then
        editBox:setInputFlag(0)
    end  
    return editBox
end

--[[
    @desc: 根据传入的node来创建输入框
    author:{author}
    time:2018-04-23 16:42:05
    --@node: TextField输入框节点
    return
]]
function displayUtils:createEditBoxForNode(node,isPwd)
    if not node then
        print("请传入输入框节点")
        return
    end
    local info ={
        rectSize = node:getContentSize(),
        size = node:getFontSize(),
        placeh = node:getPlaceHolder(),
        position = cc.p(node:getPosition()),
        parent = node:getParent(),
        maxLen = node:getMaxLength(),
        isPwd = isPwd,
        anchorPoint = cc.p(node:getAnchorPoint())
    }
    -- dump(info,"-==0-=0-=0-=0=-")
    return self:createEditBox(info)
end


---------------------------
--@param
--@return
function displayUtils:showWebImage(node,url,p,w,h)
    local webimg = nil
    local systemPath = cc.FileUtils:getInstance():getWritablePath()
    local strEncodeUrl = string.urlencode(url)
    local len = string.len(strEncodeUrl) 
    if len > 20 then
        strEncodeUrl = string.sub(strEncodeUrl,len-20,len)
    end
    local imPath = systemPath.."webimg/"..strEncodeUrl..".png"
    if cc.FileUtils:getInstance():isFileExist(imPath) then -- 本地有网络图片
        webimg = cc.Sprite:create(imPath)
        if webimg then
            local rectSize = webimg:getContentSize()
            webimg:setScale(w/rectSize.width, h/rectSize.height)
            table.insert(self.webIamgeTable,1,imPath)
        else
            lfs.remove(imPath)
            self:showWebImage(node,url,p,w,h)
            return
        end
    else-- 下载改网络图片
        webimg = cc.Sprite:create() 
        webimg:retain()
        local function funSuccess(data)
            local isSave = lfs.writeFile(imPath,data)
            if isSave then                
                local imTexture = cc.Director:getInstance():getTextureCache():addImage(imPath)
                webimg:setTexture(imTexture)
                local textureSize = imTexture:getContentSize()
                webimg:setTextureRect(cc.rect(0,0,textureSize.width,textureSize.height))
                local rectSize = webimg:getContentSize()
                webimg:setScale(w/rectSize.width, h/rectSize.height)
                table.insert(self.webIamgeTable,1,imPath)
            end
            webimg:release()
        end
        local function funError()
            webimg:release()
            print("-- load head net error --"..url)
        end
        utils:sendHpptRequest(url,funSuccess,funError)
    end
    webimg:setPosition(p)
    node:addChild(webimg)
    return webimg
end


---------------------------
--释放外部图片资源资源
--@param
--@return
function displayUtils:releaseWebImage()
    for key, var in pairs(self.webIamgeTable) do     
        cc.Director:getInstance():getTextureCache():removeTextureForKey( var )        
    end
    self.webIamgeTable = {}
end

---------------------------
--@param
--@return
function displayUtils:shareScene()
    local path = device.writablePath
    local size = cc.Director:getInstance():getWinSize()
    local screen = cc.RenderTexture:create(size.width, size.height, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)
    local temp  = cc.Director:getInstance():getRunningScene()
    screen:begin()
    temp:visit()
    screen:endToLua()
    local time = ""
    local pathsave = path..time.."share.png"

    if screen:saveToFile(time..'share.png', cc.IMAGE_FORMAT_PNG) == true then
        print(pathsave)
    end

    return pathsave
end
