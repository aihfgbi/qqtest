UiManager = {}
-- 图层
UiManager.SCENE_LAYER = 
{
    --基础底层
    BASE_LAYER = 1,
    -- 弹出UI层
    WINDOW_UI = 100,
    -- 提示弹出层
    ALERT_UI = 200,
    -- 文字提示弹出层
    STRING_ALERT = 300,
    -- 强制顶层
    MUST_TOP = 1000
}

-- 游戏app
UiManager._app = nil

-- 滚屏消息组件
UiManager._scrollMsgNode = nil
-- 等待界面
UiManager._waitNode = nil

function UiManager:new(o)
    o = o or {}
    setmetatable(o,self)
    self.__index = self
    return o
end

function UiManager:Instance()
    if self.instance == nil then
        self.instance = self:new()
        self.instance:initManager()
    end
    return self.instance
end


---------------------------
--初始管理器
--@param
--@return
function UiManager:initManager()
    self._scrollMsgNode =  require("common/node/ScrollMsgNode.lua"):create()
    self._scrollMsgNode:retain()
	self:addCustomEvent()
end

---------------------------
--显示滚屏消息
--@param
--@return
--参数：需要添加的节点，位置，table{msg = 字符串，times = 滚动的次数}
function UiManager:showScrollMsg(nx,ny,msg)
    local scrollMsgNode = self._scrollMsgNode
    if scrollMsgNode:getParent() then
        scrollMsgNode:removeFromParent()
    end
    if msg then
        scrollMsgNode:addScrollMsg(msg)
    end
    local runScene = cc.Director:getInstance():getRunningScene()
    runScene:addChild(scrollMsgNode,UiManager.SCENE_LAYER.BASE_LAYER)
    scrollMsgNode:setPosition(nx,ny)
end

---------------------------
--添加自定义时间 监听
--@param
--@return
function UiManager:addCustomEvent()
    local function eventCustomEvt(evt)
        local userData = evt._usedata
        local cmd = evt._cmd
        if cmd == CMD.SOCKET.CONNECTION_LOST then            
            self:connectLost(userData)
        elseif cmd == CMD.USER_DEFINE.EXIT_GAME then
            self:exitGame()
        elseif cmd == CMD.USER_DEFINE.RETURN_HALL then
            UiManager:Instance():getApp():enterAnyScene("hall/HallScene.lua")
        elseif cmd == CMD.USER_DEFINE.USER_CANCLE then
            cc.UserDefault:getInstance():setStringForKey("strLogin","")
            cc.UserDefault:getInstance():flush()
            UiManager:Instance():getApp():enterScene("LoginScene")
        elseif cmd == CMD.COMMON.RES_EXCEPTION_CATCH then
            self:onServerError(userData)
        elseif cmd == CMD.COMMON.RES_NOTIFY_DISSOLUTION_CONNECT then
            self:onKickConnet(userData)
        elseif cmd == CMD.COMMON.RES_NOTIFY_BE_KICK_OUT then
            UiManager:showAlert("你已被挤下线？",CMD.USER_DEFINE.USER_CANCLE,CMD.USER_DEFINE.USER_CANCLE)
        elseif cmd == CMD.COMMON.RES_NOTIFY_ALERT then
            self:showServerAlert(userData)
        elseif cmd == CMD.MATCH_SERVER.RES_NOTIFY_ENTER_MATCH then
            self:enterMatchRoom(userData)
        elseif cmd == CMD.LOGIC_SERVER.RES_NOTIFY_CHANGE_TO_OLDROOM then
            self:joinOtherGame(userData)
        elseif cmd == CMD.USER_DEFINE.GOTO_SCENE then
            self:gotoScene(userData)
        end
    end
    local listenerCustom = cc.EventListenerCustom:create(CMD.CUSTOM,eventCustomEvt)
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithFixedPriority(listenerCustom, 1)
end

---------------------------
--@param 退出游戏
--@return
function UiManager:exitGame()
--    cc.UserDefault:getInstance():setStringForKey("strLogin","")
--    cc.UserDefault:getInstance():flush()
    cc.Director:getInstance():endToLua()
    --  os.exit()
end

---------------------------
--@网络链接中断
--@return
function UiManager:connectLost(userData)   
  print(" 收到游戏断线 ",userData.id,userData.type)
  local socketInfo = DataManager:Instance():getSocketInfos() -- 记住大厅服务器 登录信息用于断线从链
  GameManager:Instance():removeSocket(userData.id)
  local arrIpAndPort=socketInfo["game_"..userData.id.."_"..userData.type]
  if userData.id == gameConfig.gameId.HALL then
        UiManager:openWindow("hall/HallWaitLayer.lua",{type = 3,arrSafeIps = arrIpAndPort,socketId=0,socketType=0 })
  elseif DataManager:Instance():getGameId() == userData.id then
        UiManager:openWindow(gameConfig["game_"..userData.id.."_"..userData.type].waitLayer,
            {type=3,arrSafeIps = arrIpAndPort,socketId=userData.id,socketType=userData.type,playKey=DataManager:Instance():getGameInfo().playKey})
  end
  
end

---------------------------
--@param 收到服务器异常
--@return
function UiManager:onServerError(data)
    local ret = protobuf.decode("ProtoNet.ResExceptionCatch",data)
    print(ret.msg)
end


---------------------------
--@param 收到客户端需要端口socket 链接
--@return
function UiManager:onKickConnet(data)
    local ret = protobuf.decode("ProtoNet.ResNotifyDissolutionConnect",data)
    dump(ret)
    if ret.type == 1 or ret.type == 2 then
        Utils.utils:sendCustomEvt(CMD.USER_DEFINE.KICK_GAME,ret.type)
    else
        UiManager:showAlert(ret.msg,CMD.USER_DEFINE.RETURN_HALL,CMD.USER_DEFINE.RETURN_HALL)
    end
end

---------------------------
--@param 进入match 房间
--@return
function UiManager:enterMatchRoom(data)
    local ret = protobuf.decode("ProtoNet.ResNotifyEnterMatch",data)
    UiManager:openWindow(gameConfig["game_"..ret.gameId.."_"..ret.roomType].waitLayer,
        {type=7,arrSafeIps = {ret.serverInfo},socketId=ret.gameId,socketType=ret.roomType,roomId=ret.roomId})
end

---------------------------
--@param 错误提示
--@return
function UiManager:showServerAlert(data)
    local ret = protobuf.decode("ProtoNet.ResNotifyAlert",data)
    dump(ret) 
    local isYes=nil
    local isNo=nil
    if ret.extendStr and tonumber(ret.extendStr) == 1001 then
        isYes = CMD.USER_DEFINE.RETURN_HALL
        isNo = CMD.USER_DEFINE.RETURN_HALL
    end
    self:showAlert(ret.msg, isYes, isNo)    
end

---------------------------
--@param 玩家在游戏中 需要加入进去
--@return
function UiManager:joinOtherGame(data)
    local ret = protobuf.decode("ProtoNet.ResNotifyChangeToOldRoom",data)
    local roomId = ret.roomId
    local gameType = ret.roomType
    local gameId = ret.gameId
    UiManager:openWindow(gameConfig["game_"..gameId.."_"..gameType].waitLayer,
        {type=4,arrSafeIps={ret.bestServerInfo},roomId = roomId,socketId=gameId,socketType=gameType}) 
end


---------------------------
--@param 进入指定场景
--@return
function UiManager:gotoScene(data)
    UiManager:Instance():getApp():enterAnyScene(data.sceneName,data.data)
end

--------------------------------------------- 全局 方法----------------------------------------------

---------------------------
--\弹出零时提示
--@param
--@return
function UiManager:showMsgTips(msg)
    local msgTipsNode = require("common/node/MsgTipsNode.lua"):create("MsgTipsNode",self._app,msg)
    local runScene = cc.Director:getInstance():getRunningScene()
    runScene:addChild(msgTipsNode,UiManager.SCENE_LAYER.MUST_TOP)
    msgTipsNode:setPosition(display.cx,display.cy)
    if DataManager:Instance():getRotateScene() then
        msgTipsNode:setRotation(90)
    end
end

---------------------------
--显示 提示消息
--@param
--@return
function UiManager:showAlert(msg,cmdYes,cmdNo,userData)
    local runScene = cc.Director:getInstance():getRunningScene()
    if runScene:getChildByName("sys_alert_view") then
        runScene:removeChildByName("sys_alert_view")
    end
    local alertLayer = UiManager:openWindow("common/layer/AlertLayer.lua",{msg = msg,cmdYes = cmdYes,cmdNo=cmdNo,userData = userData})
    return alertLayer
end


---------------------------
--显示等待节点
--@param
--@return
function UiManager:showWaitNode(isShow,time)
    if self._waitNode == nil then
        local alertNode = require("common/layer/WaitLayer.lua"):create()
        self._waitNode = alertNode  
        self._waitNode:retain()
    end

    if self._waitNode:getParent() then
        self._waitNode:removeSelf()
    end

    if isShow then
        local runScene = cc.Director:getInstance():getRunningScene()
        self._waitNode:show(runScene,time)
        self._waitNode:setLocalZOrder(UiManager.SCENE_LAYER.STRING_ALERT)
    end
    return self._waitNode
end

---------------------------
--@param 弹出节点
--@return
function UiManager:openWindow(windowName,data)
    local app  = UiManager:Instance():getApp()
    local alertNode = require(windowName):create(app,nil,data)
    local runScene = cc.Director:getInstance():getRunningScene()
    alertNode:show(runScene)
    alertNode:setLocalZOrder(UiManager.SCENE_LAYER.ALERT_UI)
    return alertNode
end

---------------------------
--@param
--@return
function UiManager:startHeart()
    self:stopHeart()
    self._lastHeartTime = os.time()
    local function update()
        if os.time() - self._lastHeartTime >= 10 then
            self:stopHeart()
            Utils.utils:sendCustomEvt(CMD.USER_DEFINE.CUSTOM_NO_HEART)
        end
        self._lastHeartTime = os.time()
    end
    self._heartTimerKey = cc.Director:getInstance():getScheduler():scheduleScriptFunc(update, 1, false) 
end

---------------------------
--停止心跳
--@param
--@return
function UiManager:stopHeart()
    if self._heartTimerKey then
        cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self._heartTimerKey)
        self._heartTimerKey = nil
    end
end

--@param
--@return
function UiManager:setApp(app)
	self._app = app 
end

---------------------------
--@param
--@return
function UiManager:getApp()
	return self._app
end
