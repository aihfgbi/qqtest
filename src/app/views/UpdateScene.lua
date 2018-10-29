local UpdateScene = class("UpdateScene", cc.load("mvc").ViewBase)
UpdateScene.RESOURCE_FILENAME = "login/scene/LoadScene.csb"
-- 显示加载消息文本容器
UpdateScene._txtMsg = nil
-- 加载进度条
UpdateScene._loadBar = nil
-- 更新链接
UpdateScene._updateUrl = nil
-- 本次更新列表
UpdateScene._updateList = nil
-- 文件总大小
UpdateScene._allSize = nil
-- 已经下载文件大小
UpdateScene._curSize = nil
-- 服务器最新的更新文件数据对象
UpdateScene._serverVersionData = nil
-- http请求对象
UpdateScene._xhr = nil
-- 更新配置
UpdateScene._config = 
    {
        ios_url = "https://qqltest.oss-cn-shenzhen.aliyuncs.com/ios/",
        android_url = "https://qqltest.oss-cn-shenzhen.aliyuncs.com/android/",
        hall_list_url = "https://qqltest.oss-cn-shenzhen.aliyuncs.com/HallUrlList.lua" -- 获取大厅地址列表连接
    }
-- 游戏大厅链接拷贝
UpdateScene._hallUrlList = nil
-- 可以使用的链接
UpdateScene._successUrl = nil

function UpdateScene:onCreate()
    local resNode = self:getResourceNode():getChildByName("panel_content")
    self._txtMsg = resNode:getChildByName("txt_msg")
    self._loadBar = resNode:getChildByName("LoadingBar_1")
    self._updateList = {}
end


---------------------------
--@param
--@return
function UpdateScene:onEnter()
    if cc.PLATFORM_OS_ANDROID == cc.Application:getInstance():getTargetPlatform() then
        self._updateUrl = self._config.android_url
    elseif  cc.PLATFORM_OS_IPHONE == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_IPAD == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_MAC == cc.Application:getInstance():getTargetPlatform()
    then
        self._updateUrl = self._config.ios_url
    end

    self:initGameUrl()
end

---------------------------
--初始化游戏链接 找服务器获取到本次游戏的大厅ip列表
-- 服务器动态获取 方便过年用户自己维护ip
--@param
--@return
function UpdateScene:initGameUrl()
    local function funSuccess(data)
        self._hallUrlList = loadstring(data,"hallList")()
        self:findSuccessUrl()
    end

    local function funError(xhr)
        self:initGameUrl()
        self:tipsErrorMsg("获取动态大厅地址列表失败")
    end

    self:sendHpptRequest(self._config.hall_list_url,funSuccess,funError)
end

---------------------------
--找到能成功连接的大厅地址列表
--@param
--@return
function UpdateScene:findSuccessUrl()
    -- 1. 从负载均衡列表里面抽取地址做热更新 超时5秒放弃当前链接
    local function funSuccess(data)
        self:stopAllActions()
        self:checkBigVersion()
    end

    local function funError(xhr)
        self._xhr:unregisterScriptHandler()
        self:stopAllActions()
        self:findSuccessUrl() 
    end

    if self._hallUrlList and #self._hallUrlList>0 then
        -- self._successUrl = table.remove(self._hallUrlList,math.random(1,#self._hallUrlList))
        self._successUrl = "192.168.3.32"     -- 测试的本地IP
   
        local testURL= "http://47.92.0.72/jeeplat/i/appinterface/user-login?type=4"--这里需要自己写一个http链接来进行验证
        -- local testURL= "http://"..self._successUrl.."/jeeplat/i/appinterface/user-login?type=4"
        self:sendHpptRequest(testURL,funSuccess,funError)
        performWithDelay(self,funError,5)
    else
        self:initGameUrl()
    end
end

---------------------------
--获取服务器游戏版本信息
--@param
--@return
function UpdateScene:checkBigVersion()
    local function funSuccess(data)           
        local serverVersionList = loadstring(data,"is_full_update")()
        GAME_SMALL_VISION = serverVersionList.smallVersion
        if serverVersionList.bigVersion > GAME_BIG_VISION then
            -- 提示必须重新下载更新
            cc.Application:getInstance():openURL(serverVersionList.downUrl.."?type=1")
        else
            self:updateVision()
        end
    end

    local function funError(xhr)
        self:tipsErrorMsg("大版本信息读取失败!")
        self:checkBigVersion()
    end

    local urlCheckVersion = self._updateUrl.."is_full_update.lua"
    self:sendHpptRequest(urlCheckVersion,funSuccess,funError)
end

---------------------------
--更新版本
--@param
--@return
function UpdateScene:updateVision()  
    self:tipsErrorMsg("正在对比版本信息...")
    local status, localVersionList = xpcall(function()
        return require("version_list.lua")
    end, function(msg)
        print("----  判断为测试包 不执行更新流程 无 version_list ----")
    end)
    print(status,localVersionList)
    if status and  localVersionList then
        self:getServerVersion()
    else
        self:updateFinish()
    end
end

---------------------------
--获取服务器最新文件 配置
--@param
--@return
function UpdateScene:getServerVersion()
    local urlCheckVersion = self._updateUrl.."version_list.lua"
    local function funSuccess(data)
        self._serverVersionData = data
        local serverVersionList = loadstring(data,"version_list")()
        self:countDownLoads(serverVersionList)
    end

    local function funError()
        self:tipsErrorMsg("版本信息获取失败...!")
        -- 提示是否再次尝试
        self:getServerVersion()
    end

    self:sendHpptRequest(urlCheckVersion,funSuccess,funError) 
end

---------------------------
--计算需要下载的 文件大小
--@param
--@return
function UpdateScene:countDownLoads(serverVersionList)
    local localVersionList = require("version_list.lua")
    -- 计算代码更新数量
    self:compareFiles("src",localVersionList["src"],serverVersionList["src"])
    self:compareFiles("res",localVersionList["res"],serverVersionList["res"])

    if #self._updateList > 0 then
        self:downLoadFile()
    else
        self:updateFinish()	
    end
end

---------------------------
--比较文件 是否相同不相同放入更新队列
-- typeName－ 资源类型 localVersionList－本地配置文件信息 serversionList－服务器版本配置信息
--@param
--@return
function UpdateScene:compareFiles(compareKey,localVersionList,serversionList)
    local arrLocals = {}
    local systemPath = cc.FileUtils:getInstance():getWritablePath()
    if localVersionList then -- 如果有本地配置文件 
        for path, versinInfo in pairs(localVersionList) do
            -- 本地配置文件 
            arrLocals[systemPath..path] = {md5Key = versinInfo[1]}
        end
    end

    local arrServers = {}
    if localVersionList then -- 如果有服务器配置文件 
        for path, versinInfo in pairs(serversionList) do
            local pathKey = systemPath..path
            local itemServer = {}
            arrServers[pathKey] = itemServer

            itemServer.md5Key = versinInfo[1]
            itemServer.fileSize = versinInfo[2]
            itemServer.downUrl = self._updateUrl..path
            itemServer.savePath = systemPath..path 
            itemServer.path = path 
        end    
    end
    
    local strUpdateList = cc.UserDefault:getInstance():getStringForKey("strUpdateList")
    local arrList = json.decode(strUpdateList)
    for key, itemServer in pairs(arrServers) do
        local isNeedUpdate = false
        for key, packName in pairs(arrList) do
            if string.find( itemServer.path,  string.format( "%s/%s/", compareKey, packName)) then
                isNeedUpdate = true
        	    break
            end
        end
        -- （本地没有本地md5 或者 服务器不匹配）   并且 需要更新
        if (arrLocals[key] == nil or itemServer.md5Key ~= arrLocals[key].md5Key) and isNeedUpdate then
            table.insert(self._updateList,1,itemServer)
        end
    end
end

---------------------------
--下载更新文件
--@param
--@return
function UpdateScene:downLoadFile()
    self._allSize = 0
    self._curSize = 0
    for key, itemServer in pairs(self._updateList) do
        self._allSize = self._allSize + itemServer.fileSize
    end

    self:downSingleFile(table.remove(self._updateList,1))
end

---------------------------
-- 下载单个文件
--@param
--@return
function UpdateScene:downSingleFile(fileInfo)
    local precent = math.ceil(self._curSize/self._allSize * 100)
    local strMsg = "正在更新：" .. precent .. '%'.. string.format("(%.2fKB)", self._curSize/1024) .."/".. string.format("(%.2fKB)", self._allSize/1024)
    self._loadBar:setPercent(precent)
    self:tipsErrorMsg(strMsg)

    local function funSuccess(data)
        self:saveDownFile(fileInfo,data)
    end

    local function funError()
        self:tipsErrorMsg(fileInfo.path.."下载失败!")
        -- 提示是否再次尝试

    end
    self:sendHpptRequest(fileInfo.downUrl,funSuccess,funError)
end

---------------------------
--保存下载文件
--@param
--@return
function UpdateScene:saveDownFile(fileInfo,data)
    lfs.writeFile(fileInfo.savePath,data)
    self._curSize = self._curSize+fileInfo.fileSize

    if #self._updateList > 0 then
        self:downSingleFile(table.remove(self._updateList,1))
    else
        local savePath = cc.FileUtils:getInstance():getWritablePath().."src/version_list.lua"
        lfs.writeFile(savePath,self._serverVersionData) 
        self:updateFinish()
    end
end

---------------------------
-- 提示错误信息
--@param
--@return
function UpdateScene:tipsErrorMsg(msg)
    print(" msg:"..msg)
    self._txtMsg:setString(msg)
end


---------------------------
--发送http 请求
--@param
--@return
function UpdateScene:sendHpptRequest(url,funSuccess,funError)
    print("url:"..url)
    local xhr = cc.XMLHttpRequest:new()
    xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING
    xhr:open("GET", url)
    local function onReadyStateChange()
        if xhr.readyState == 4 and (xhr.status >= 200 and xhr.status < 207) then
            funSuccess(xhr.response)
        else
            funError(xhr)
        end
    end
    xhr:registerScriptHandler(onReadyStateChange)
    xhr:send()

    self._xhr = xhr
end



---------------------------
--版本更新完成
--@param
--@return
function UpdateScene:updateFinish()
    require("app/models/gameConfig")
    require("cmd.CMD")
    require("utils.Utils")
    require("app.manager.DataManager")
    require("app.manager.UiManager")
    require("app.manager.SoundManager")
    require("app.manager.YimManager")
    require("app/models/UtilsCall")
    require("app.manager.GameManager")

    -- for key, url in pairs(gameConfig.url) do
    --     gameConfig.url[key] = string.gsub(url, "strIp", "118.24.147.183:7780")
    -- end

    -- for key,url in pairs(gameConfig.recharge) do
    --     gameConfig.recharge[key] = string.gsub(url, "strIp", self._successUrl)
    -- end

    UtilsCall:Instance():initUtilsCall()
    GameManager:Instance():initManager()
    UiManager:Instance():setApp(self:getApp())    
    UiManager:openWindow("common/layer/LoadLayer.lua",{loadConfig = gameConfig.game_0.loader})
    self:tipsErrorMsg("资源加载中...")
end

---------------------------
--@param
--@return
function UpdateScene:onExit()

end

return UpdateScene