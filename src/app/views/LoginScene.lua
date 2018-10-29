
-- 登陆注册
local LoginScene = class("LoginScene", cc.load("mvc").ViewBase)
LoginScene.RESOURCE_FILENAME = "login/scene/LoginScene.csb"
--设备唯一标识符
LoginScene._machineId = nil
-- 用户最后的游戏信息
LoginScene._lastGameInfo = nil
-- 根节点
LoginScene._resNode = nil

function LoginScene:onCreate()
    
    self._resNode = self:getResourceNode():getChildByName("panel_content")
    local btn_wx = self._resNode:getChildByName("btn_wx")
    local btn_testLogin = self._resNode:getChildByName("btn_testLogin")
    local function touchEvent(sender,eventType)
        if eventType == ccui.TouchEventType.ended then
            if sender == btn_wx then     
                -- self:getUUID()
                UtilsCall:Instance():wchatLogin()
            elseif sender == btn_testLogin then
                self:login(3,-1,123456,1)
            end
            SoundManager:playClickSound()
        end
    end 
    btn_wx:addTouchEventListener(touchEvent)
    
    local check_mode_1 = self._resNode:getChildByName("check_agree")
    local function cheeckEvent(sender,type)
        if type == ccui.CheckBoxEventType.selected then
            btn_wx:setEnabled(true)                     
        elseif type == ccui.CheckBoxEventType.unselected then
            btn_wx:setEnabled(false)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
        end        
        SoundManager:playClickSound()
    end
end

---------------------------
--@param 缓存登陆
--@return
function LoginScene:cacheLogin()
    local strLogin = cc.UserDefault:getInstance():getStringForKey("strLogin")    
    print("LoginScene:cacheLogin")
    dump(strLogin)
    if strLogin and strLogin ~= "" then
        local loginInfo = json.decode(strLogin) 
        local time = os.time()
        if time - loginInfo.time <= 3600*24 then
            self:login(2,loginInfo.name,loginInfo.pwd,1)    
        else
            cc.UserDefault:getInstance():setStringForKey("strLogin","")
            cc.UserDefault:getInstance():flush()
        end
    end
end

---------------------------
--触发登陆
-- type(type(登陆类型0微信,1手机,2游客)
-- name(为0时name为微信授权登陆后获取的code,1是为电话号码,2时为用户本地保存用户名(参数必填))
-- pwd(登陆密码,微信登陆时可以传递任意参数或不填)
-- appid(对应微信的appid)
--@param 
--@return--
function LoginScene:login(type,acc,pwd,appid)
    UiManager:Instance():showWaitNode(true)
    local url = gameConfig.url.url_login.."?type="..type.."&acc="..acc.."&pwd="..pwd.."&appid="..appid
    local function httpSuccess(data)
        data = json.decode(data)
        dump(data,"登录洗想你想====")
        -- if data.success then
        --     self:httpLoginSuc(data.data)
        --     print("---------------------68--------")
        -- else
        --     if data.code == "201" then
        --         UiManager:showAlert(data.msg)
        --         UiManager:Instance():showWaitNode(false)
        --     else
        --         self:setLoginMsg(data.msg,true) 
        --     end
        -- end
    end  

    local function httpError()
        self:setLoginMsg("获取服务器地址失败!",true)
    end
    self:setLoginMsg("服务器地址获取中...")
    Utils.utils:sendHpptRequest(url,httpSuccess,httpError)
end 

---------------------------
--@param http登陆成功
-- 通过http 请求返回的 用户名 密码 大厅服务器地址信息
--@return
function LoginScene:httpLoginSuc(data)
    UiManager:Instance():showWaitNode(false)
    local strLogin = cc.UserDefault:getInstance():getStringForKey("strLogin")
    local loginInfo = nil
    if strLogin and strLogin ~= "" then
        loginInfo = json.decode(strLogin) 
        loginInfo.name = data.playerId
        loginInfo.pwd = data.token
    else
        loginInfo = {name=data.playerId,pwd=data.token,time = os.time()}    
    end
    cc.UserDefault:getInstance():setStringForKey("strLogin",json.encode(loginInfo))
    cc.UserDefault:getInstance():flush()
    
    local socketInfo = DataManager:Instance():getSocketInfos() 
    socketInfo.uname = data.playerId
    socketInfo.pwd = data.gateServerTicket
    
    UiManager:openWindow("hall/HallWaitLayer.lua",{type = 4,arrSafeIps=data.hall_list,socketId=0,socketType=0})
    print("---------------------109--------")
end

---------------------------
--设置登录信息
--@param
--@return
function LoginScene:setLoginMsg(msg,isShowTips)
    if isShowTips then
        UiManager:showMsgTips(msg)
        UiManager:Instance():showWaitNode(false)

        cc.UserDefault:getInstance():setStringForKey("strLogin","")
        cc.UserDefault:getInstance():flush()
    end
end

function LoginScene:onEnter()
    self:addCustomEvent()
    self:clearGameState()
    audio.stopMusic(false)
    audio.stopAllSounds()
    SoundManager:Instance():setLocalSoundVolume()
    self:cacheLogin()
end

---------------------------
--添加自定义时间 监听
--@param
--@return
function LoginScene:addCustomEvent()
    local function eventCustomEvt(evt) 
        local userData = evt._usedata
        local cmd = evt._cmd
        if cmd == CMD.SYSTEM.UUID_RETURN then
            self:wchatLogin(userData)
        elseif cmd == CMD.SYSTEM.WCHAT_ERROR then    
            self:setLoginMsg(gameConfig.wchatErrorMsg[userData.data],true)
        elseif cmd == CMD.SYSTEM.WCHAT_AUTH_SUCCESS then   
            self:login(0,userData.code,1,userData.appid) 
        elseif cmd == CMD.GATE_SERVER.RES_GATE_LOGIN then
            self:onLoginReturn(userData)
        elseif cmd == CMD.GATE_SERVER.RES_GET_ACCOUNTINFO then
            self:onUserInfoReturn(userData)
        elseif cmd == CMD.USER_DEFINE.DOWNLOAD_GAME_FINISH then
            self:downGameFinish(data)
        end
    end
    local listenerCustom = cc.EventListenerCustom:create(CMD.CUSTOM,eventCustomEvt)
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithSceneGraphPriority(listenerCustom, self)
end

---------------------------
--@param 登陆返回
--@return
function LoginScene:onLoginReturn(data)
    local ret = protobuf.decode("ProtoNet.ResGateLogin",data)
    local resPonseRelut = ret.result
    if resPonseRelut.success then -- 登陆成功
        HallSocket:Instance():getUserInfo()
    else
        HallSocket:Instance():distory()
        UiManager:showMsgTips(resPonseRelut.msg)	
    end
end

---------------------------
--@param 获取用户信息返回
--@return
function LoginScene:onUserInfoReturn(data)
    local ret = protobuf.decode("ProtoNet.ResGetAccountInfo",data)
    local resPonseRelut = ret.result
       
    if resPonseRelut.success then
        local userInfo = ret.accountInfo
        local accountInfos = userInfo.counts
        local lastGameInfo = userInfo.lastGameInfo
        
        local userEntity = DataManager:Instance():getMySelf()
        userEntity:setName(userInfo.name)
        userEntity:setUid(userInfo.uid.."")
        userEntity:setNick(userInfo.nick)
        userEntity:setHead(userInfo.head)
        userEntity:setHeadUrl(userInfo.headUrl)
        userEntity:setPhone(userInfo.phone )
        userEntity:setLevel(userInfo.lv)
        userEntity:setIP(userInfo.ipaddress )
        userEntity:setSex(userInfo.sex)
--        userEntity:setSign(userInfo.fsign)
--        userEntity:setUtype(userInfo.utype)       
           
        for key, accountInfo in pairs(accountInfos) do
            if accountInfo.type == gameConfig.propsId.GOLD  then
                userEntity:setGold(accountInfo.count)
            elseif accountInfo.type == gameConfig.propsId.ROOM_CARD  then
                userEntity:setRoomCard(accountInfo.count)
            elseif accountInfo.type == gameConfig.propsId.SCORE  then
                userEntity:setScore(accountInfo.count)
            elseif accountInfo.type == gameConfig.propsId.PRIZE_CARD  then
                userEntity:setPrizeCard(accountInfo.count)
        	end
        end
        
        if not DataManager:Instance():getIsYVsdkLogin() then
            YimManager:Instance():init(tostring(userInfo.uid))
        end

        self:checkIsGameExit(lastGameInfo)
    else
        UiManager:showMsgTips(ret.msg)
    end
end

---------------------------
--@param 下载游戏成功
--@return
function LoginScene:downGameFinish(gameId)
    self:joinGame(self._lastGameInfo)
end

----------------------------------------------------------------------------------------------------

---------------------------
--@param 检测游戏是否存在
--@return
function LoginScene:checkIsGameExit(lastGameInfo)
    self._lastGameInfo = lastGameInfo
    local gameId = lastGameInfo.gameId
    if gameId ~= 0 and lastGameInfo.logic.isOpen == true then   -- 不在任何游戏中         -- 直接进入大厅
        local isGameExit = GameManager:Instance():isGameExit(gameId)
        if isGameExit then --判断该游戏是否存在
            self:joinGame(lastGameInfo)
        else
            UiManager:openWindow("common/layer/DownGameLayer.lua",gameId)
        end
    else
        UiManager:Instance():getApp():enterAnyScene("hall/HallScene.lua")
    end
end

---------------------------
--@param 根据最后一次 加入房间信息 确定进入什么场景
--@return
function LoginScene:joinGame(lastGameInfo)
    local gameId = lastGameInfo.gameId
    print("------gameId--------",gameId)
    if gameId ~= 0 and lastGameInfo.logic.isOpen == true then -- 不在任何游戏中         -- 直接进入大厅
        local roomId = lastGameInfo.detail.roomId
        local gameType = lastGameInfo.detail.type
        UiManager:openWindow(gameConfig["game_"..gameId.."_"..gameType].waitLayer,
        {type=4,arrSafeIps={lastGameInfo.logic},roomId = roomId,socketId=gameId,socketType=gameType}) 
    else
        UiManager:Instance():getApp():enterAnyScene("hall/HallScene.lua")  
	end
end

---------------------------
--如果是其他页面 直接返回的 需要释放其他页面 资源和scoket
--@param
--@return
function LoginScene:clearGameState()
    local gameId = DataManager:Instance():getGameId()    
    if gameId ~= gameConfig.gameId.NULL then -- 初始化第一次进入
        local gameType = DataManager:Instance():getGameType()
        HallSocket:Instance():distory()
        local curGameSoket = GameManager:Instance():getSocket( tonumber(gameId) )
        if curGameSoket and type(curGameSoket.distory) == "function" then
            print("摧毁！！！！！！！socket")
            curGameSoket:distory()
            GameManager:Instance():removeSocket(gameId)
        end
        -- 如果不是游戏大厅返回 游戏中直接返回需要释放游戏资源
        if gameId ~= gameConfig.gameId.HALL then
            Utils.utils:releaseRes(gameConfig["game_"..gameId.."_"..gameType].release)
        end
    end 
    Utils.displayUtils:releaseWebImage()
    DataManager:Instance():setGameId(gameConfig.gameId.NULL)
    DataManager:Instance():setGameType(gameConfig.gameType.NULL)
end

--==============================--
--desc: 获取手机设备UUID
--time:2017-12-13 11:14:53
--@return 
--==============================--
function LoginScene:getUUID()
    UtilsCall:Instance():getUUID()
end

--==============================--
--desc:
--time:2017-12-13 11:20:11
--@return 
--==============================--
function LoginScene:wchatLogin(userData)
    self._machineId = userData.uuid
    UtilsCall:Instance():wchatLogin()
end

---------------------------
--页面退出时 需要 保存登陆页面记录状态
--@param
--@return
function LoginScene:onExit()
    Utils.utils:releaseRes(gameConfig.game_0.release)
end

return LoginScene
