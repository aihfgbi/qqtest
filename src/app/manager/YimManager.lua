YimManager = {}

local yimInstance = nil

function YimManager:new(o)
    o = o or {}
    setmetatable(o,self)
    self.__index = self
    return o
end

function YimManager:Instance()
    if self.instance == nil then
        self.instance = self:new()
    end
    return self.instance
end


---------------------------
--@param 初始化 语音接口 并且登录
--@return
function YimManager:init(userId)
    yimInstance = cc.YIM:create()
    print(" 初始化语音 ")
    -- 登录回调
    --0为调用成功，非0表示调用失败，失败后不会有回调通知
    yimInstance.OnLogin = function (errorcode,youmeID)
        print("-------- 登录成功 --------")
        DataManager:Instance():setIsYVsdkLogin(true)
        yimInstance:joinChatRoom("room_id")
        --        self:getLocation()
    end

    -- requestid： 消息id
    -- downloadurl： 文件下载地址，amr格式 －－ fileurl
    -- duration：整型，录音时长，精确到秒
    -- filesize：文件字节数
    -- localpath：录音文件本地地址，wav格式
    -- text：字符串，文本识别结果
    yimInstance.OnSpeechStatus=function(errorcode,requestid,downloadurl,duration,filesize,localpath,text)
        print("--------- 录音完毕 -----------",errorcode)
        if errorcode == 0 then
            self:sendSfsChat(requestid,downloadurl,duration)
        else
            print(errorcode)
        end
    end

    --下载语音成功后回调 
    yimInstance.OnDownload = function (serial,errorcode,strSavepath)
    end
    ---------------------------------------------- 以下接口 未被使用 ---------------------------------------------

    -- 退出登录
    yimInstance.OnLogout = function ()
        DataManager:Instance():setIsYVsdkLogin(true)
    end

    --发送文本消息 发送方消息回调
    yimInstance.OnSendMessageStatus = function(serial,errorcode)
    end

    -- 发送方语音消息回调
    yimInstance.OnSendAudioMessageStatus = function(serial,errorcode,content,localpath,duration)
    end

    -- 收到其她客户发送的消息
    yimInstance.OnRecvMessage = function(bodytype,chattype, serial,recvid,senderid,content,params,duration)
    end

    -- 加入聊天频道
    yimInstance.OnJoinChatroom = function(chatroomid ,errorcode)
    end

    -- 查询历史记录
    yimInstance.OnQueryHistory = function(errorcode,targetid,remaincoutn,msglist)
    end

    -- 获取最近联系人列表
    yimInstance.OnGetRecentContacts =function(contactLists)
    end

    -- 新消息通知
    yimInstance.OnRevMessageNotify=function (count)
    end

    yimInstance.OnGetUserInfo = function ( errorcode, strUserInfo )
        if errorcode == 0 and string.len(strUserInfo) ~= 0 then
        end
    end

    yimInstance.OnGetUserStatus = function ( errorcode, strUserID, status )
        print("获取玩家登录状态,userID:"..strUserID.."_status:"..status)
    end

    yimInstance.OnPlayCompletion = function ( errorcode , path )
        print("播放结束")
    end 

    yimInstance.OnTranslateTextComplete = function (errorcode, requestID, text, srcLangCode, destLangCode)
    
    end 

    yimInstance.OnUpdateLocation = function (errorcode, districtCode, country, province, city, districtCounty, street, longitude, latitude)
        if errorcode == 0 then
            self:noticeSelfLocation(districtCode, country, province, city, districtCounty, street, longitude, latitude)
        end
    end

   yimInstance.OnGetNearbyObjects = function (errorcode, startDistance, endDistance, nearbyList)

   end


   yimInstance.registerScriptHandler(yimInstance,
        yimInstance.OnLogin,
        yimInstance.OnLogout,
        yimInstance.OnDownload,
        yimInstance.OnSendMessageStatus,
        yimInstance.OnSendAudioMessageStatus,
        yimInstance.OnRecvMessage,
        yimInstance.OnJoinChatroom,
        yimInstance.OnSpeechStatus,
        yimInstance.OnQueryHistory,
        yimInstance.OnGetRecentContacts,
        yimInstance.OnRevMessageNotify,

        yimInstance.OnGetUserInfo,
        yimInstance.OnGetUserStatus,
        yimInstance.OnPlayCompletion,
        yimInstance.OnStartSendAudioMessage,
        yimInstance.OnTranslateTextComplete,
        yimInstance.OnUpdateLocation,
        yimInstance.OnGetNearbyObjects

    )
    local ierrorcode = yimInstance:init("YOUME8FD4E92199348379B80122972B83F2EAAD9D20E9",
        "xM5hUe4aIzrlUUrRKp2mh2PY2n2vTmQZdbEm8w/VfKRuiZ4pUUG4Rni1xsb+SYxtSls4FY0SPAwTLGqzLane6d8Bqx3Ffw6Pav8gvt/0oq4HBO40ACSVFW5/zsf17uQnlXP5JU7r1UkXZDiiHoQ5OUj1fqP/zjAGe0HSgve2cHkBAAE=")
    yimInstance:login(userId,"123456","")
end

---------------------------
--@param  开始录音
--该接口启动的录音，只返回音频文件的下载链接，下载链接指向的是AMR格式的音频文件，不会自动发送。
--@return
function YimManager:starVoice()
    if DataManager:Instance():getIsYVsdkLogin() then
        print("--------- 开始录音 -----------")
        local requestid = yimInstance:startAudioSpeech(false)
    end
end


---------------------------
--@param 停止录音
--@return
function YimManager:stopVoive()
    if DataManager:Instance():getIsYVsdkLogin() then
        print("--------- 停止录音 -----------")
        local errorcode = yimInstance:stopAudioSpeech()
    end
    SoundManager:setLocalSoundVolume()
end

---------------------------
--@param 取消录音
--@return
function YimManager:cancleVoive()
    if DataManager:Instance():getIsYVsdkLogin() then
        print("--------- 取消录音 -----------")
        local errorcode = yimInstance:cancleAudioMessage()
    end
    SoundManager:setLocalSoundVolume()
end

---------------------------
--@param sfs发送语言消息 消息id , 下载地址, 语音时长
--@return
function YimManager:sendSfsChat(id,downloadurl,duration)
    local gameId = DataManager:Instance():getGameId()
    local gameType = DataManager:Instance():getGameType()
    local fileurl = id..","..downloadurl..","..duration
    local socketId = GameManager:Instance():getSocket( gameId )    
    if not socketId then
        print(string.format( "没有拿到%d得socket",gameId) )
        return
    end
    socketId:sendChatMsg(4,fileurl,3)
end

---------------------------
--@param 播放语音录音
--@return
function YimManager:playVoice(msg,playVoice,over)
    local arrMsg = string.split(msg,",")
    local id = arrMsg[1]
    local downUrl = arrMsg[2]
    local time = tonumber(arrMsg[3])

    local function funSuccess(data)
        local armPath = cc.FileUtils:getInstance():getWritablePath().."voice/.."..id..".amr"
        local wavPath = cc.FileUtils:getInstance():getWritablePath().."voice/.."..id..".wav"
        local isSave = lfs.writeFile(armPath,data)
        if isSave then
            playVoice(time,armPath,wavPath)
            yimInstance:convertAMRToWav(armPath, wavPath)
            SoundManager:playSoundByKey(wavPath)
            lfs.remove(armPath)
        else
            over()
        end
    end
    local function funError()
        over()
    end
    Utils.utils:sendHpptRequest(downUrl,funSuccess,funError)
end


---------------------------
--@param 获取当前位置信息
--@return
function YimManager:getLocation()
    if DataManager:Instance():getIsYVsdkLogin() then
        local errorcode = yimInstance:getCurrentLocation()
        print("--------- 获取当前位置信息 -----------",errorcode)
    end
end


---------------------------
--@param 广播当前位置信息
--districtCode：行政区划编码 country：国家 pronvice：省份 city：市 districtCounty：区县 street：街道 longitude：经度 latitude：纬度
--@return
function YimManager:noticeSelfLocation(districtCode, country, province, city, districtCounty, street, longitude, latitude)
    print(districtCode, country, province, city, districtCounty, street, longitude, latitude)
    local gameId = DataManager:Instance():getGameId()
    local gameType = DataManager:Instance():getGameType()
    local location = province.." "..city.." "..districtCounty.." "..street.."_"..longitude.."_"..latitude
--    if gameId == gameConfig.gameId.QSMJ then
--        if gameType == gameConfig.gameType.ROOM_CARD then
--            LMMJSfs:Instance():speak(5,location)
--        else 
--            LMMJSfs:Instance():speak(5,location)
--        end
--    end
end

