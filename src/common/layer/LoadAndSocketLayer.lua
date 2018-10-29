-- 资源加载并且 链接网络
-- 几种情况下实用 1.创建房间 2.加入房间 3.登陆页回复 4.断线立即回复
-- 通用功能 链接服务器（筛选ip port 能力） 登陆服务器 
local LoadAndSocketLayer = class("LoadAndSocketLayer",require("common.layer.LoadLayer"))

-- 通信 对象
LoadAndSocketLayer._pbSocket = nil
-- 游戏本次可用的ip 和 端口队列
LoadAndSocketLayer._arrIpAndPort = nil

-- 游戏登陆成功后 金币模式是创建房间是值为nil 否则为加入房间的房间号
LoadAndSocketLayer._goldRoomId = nil
-- 是否是换桌
LoadAndSocketLayer._isChangeDisk = nil

---------------------------
--@param
--@return
function LoadAndSocketLayer:initUi(info)
    -- 通信id
    self._socketId = info.socketId
    -- 通信类型
    self._socketType = info.socketType
   
    self:getArrIpAndPorts()
end

---------------------------
--@param
--@return
function LoadAndSocketLayer:doEnter()
    self:addCustomEvent()
    self:doWait()
end

---------------------------
--@param 根据 游戏情况 执行wait操作
--@return
function LoadAndSocketLayer:doWait()
    -- 1.创建房间 2.加入房间 3.断线重连 4.重新登陆进入 5.直接链接服务器
    local type = self._info.type
    if type == 1 then -- 需要根据游戏id 
        HallSocket:Instance():getGameServer(self._socketId,self._socketType)-- 获取游戏的服务器信息
    elseif type == 2 then  
        self:connetGameServer()
    elseif type == 3 then
        self:delayConnet()
    elseif type == 4 then
        self:connetGameServer()
    elseif type == 5 then --快速加入金币房间
        HallSocket:Instance():quickGoldGame(self._socketId,self._socketType,self._info.goldType,self._socketId.."_playKey_"..self._info.playKey)
    elseif type == 6 then -- 金币换桌
        self._pbSocket:changeDisk(self._socketId.."_playKey_"..self._info.playKey) 
    elseif type == 7 then -- 加油比赛模式
        self:connetGameServer() 
    elseif type == 8 then -- 加入金币游戏列表
        self:connetGameServer() 
    end
end

---------------------------
--@param
--@return
function LoadAndSocketLayer:onCoustomEvt(cmd,userData)
    if cmd == CMD.SOCKET.CONNECTION_SUC and self._socketId == userData.id then
        self:loginServer()
    elseif cmd == CMD.SOCKET.CONNECTION_FAIL and self._socketId == userData.id then
        self:delayConnet()
    elseif cmd == CMD.SOCKET.CONNECTION_LOST and self._socketId == userData.id then 
        self:close()
    elseif cmd == CMD.GATE_SERVER.RES_GET_GAMEZONE_DETAIL then
        self:onGameServerReturn(userData)   
    elseif cmd == CMD.GATE_SERVER.RES_QUICK_JOIN_GAMEROOM then
        self:onQuickJionRoom(userData)
    elseif cmd == CMD.LOGIC_SERVER.RES_QUICK_CHANGE_ROOM  then -- 换桌返回
        self:onChangeDiskRetuen(userData)   
    else
        self:onExtendEvt(cmd,userData)    
    end
end

------------------------- 事件监听 --------------------------------
---------------------------
--@param 获取游戏的 服务器信息返回
--@return
function LoadAndSocketLayer:onGameServerReturn(data)
    local ret = protobuf.decode("ProtoNet.ResGetGameZoneDetail",data)
    local responseResult = ret.result
    if responseResult.success then
        local arrSafeIps = ret.logicDetails -- 服务器线路信息
        self._arrIpAndPort = {} 
        for key, serverItem in pairs(arrSafeIps) do
            if serverItem.isOpen then
                local safeIpAndPortDetails = serverItem.safeIpAndPortDetails
                for key, ipAndPortItem in pairs(safeIpAndPortDetails) do
                    if ipAndPortItem.evironment == GAME_EVIRONMENT then
                        self._arrIpAndPort[#self._arrIpAndPort+1] = {ip=ipAndPortItem.safeIp,port=ipAndPortItem.safePort}
                    end
                end
            end
        end
        local socketInfo = DataManager:Instance():getSocketInfos() 
        socketInfo["game_"..self._socketId.."_"..self._socketType] = self._arrIpAndPort
        self:connetGameServer()
    else
        self:showErrMsg(responseResult.msg,true)
    end
end

---------------------------
--@param 金币模式快速加入房间返回
--@return
function LoadAndSocketLayer:onQuickJionRoom(data)
    local ret = protobuf.decode("ProtoNet.ResQuickJoinGameRoom",data)
    self:decodeGoldRoomInfo(ret)
end

---------------------------
--@param 换桌  返回
--@return
function LoadAndSocketLayer:onChangeDiskRetuen(data)
    local ret = protobuf.decode("ProtoNet.ResQuickChangeRoom",data)
    self:decodeGoldRoomInfo(ret)
end

------------------------- 交给子类 重写 --------------------------------
---------------------------
--@param 链接失败 延迟在做处理
---- 1.创建房间 2.加入房间 3.断线重连 4.重新登陆进入
--@return
function LoadAndSocketLayer:delayConnet()
    if self._info.type == 3 then
        performWithDelay(self,function ()
            self:connetGameServer()
        end,5)
    else
        self:showErrMsg(self._socketId.." 服务器链接失败，等待再次尝试",true)
    end
end

---------------------------
--@param 链接游戏服务器
--@return
function LoadAndSocketLayer:connetGameServer()
    if #self._arrIpAndPort > 0 then
        local ipAndPortItem = self._arrIpAndPort[math.random(1,#self._arrIpAndPort)]
        self._pbSocket:init(ipAndPortItem.ip,ipAndPortItem.port,self._socketId,self._socketType)
    else
        print(self._socketId,self._socketType,"无可用链接")
        self:showErrMsg("无可用链接",true)
    end
end

---------------------------
--@param 遇到错误 
--@return
function LoadAndSocketLayer:showErrMsg(msg,isClose)
    if isClose then
        self._pbSocket:distory()
        self:close()
    end
    UiManager:showMsgTips(msg)
end


---------------------------
--@param 解析 金币场 加油游戏和换桌数据对象
--@return
function LoadAndSocketLayer:decodeGoldRoomInfo(ret)
    local responseResult = ret.result
    if responseResult.success then
        if ret.changeServer == 0 then
            self._isChangeDisk = true
            if ret.operate == 0 then -- 需要创建一个房间
                self._goldRoomId = nil
            else -- 直接请求加入一个房间
                self._goldRoomId = ret.roomId
            end 
            self:joinGoldRoom()
        else
            self._isChangeDisk = false
            local arrSafeIps = nil
            if ret.operate == 0 then -- 需要创建一个房间
                self._goldRoomId = nil
                arrSafeIps = ret.logicDetails
            else -- 直接请求加入一个房间
                self._goldRoomId = ret.roomId
                arrSafeIps={ret.bestServerInfo}
            end    
            self._arrIpAndPort = {} 
            for key, serverItem in pairs(arrSafeIps) do
                if serverItem.isOpen then
                    local safeIpAndPortDetails = serverItem.safeIpAndPortDetails
                    for key, ipAndPortItem in pairs(safeIpAndPortDetails) do
                        if ipAndPortItem.evironment == GAME_EVIRONMENT then
                            self._arrIpAndPort[#self._arrIpAndPort+1] = {ip=ipAndPortItem.safeIp,port=ipAndPortItem.safePort}
                        end
                    end
                end
            end
            local socketInfo = DataManager:Instance():getSocketInfos() 
            socketInfo["game_"..self._socketId.."_"..self._socketType] = self._arrIpAndPort
            self:connetGameServer()
        end
    else
        self:showErrMsg(responseResult.msg,true)
        UiManager:Instance():getApp():enterAnyScene("hall/GoldTimesScene.lua",self._socketId)
    end
end

--------------------------------------- 子类重写 -------------------------------------------------

---------------------------
--@param 子类从写ip 和 端口 数组 解析方法
--@return
function LoadAndSocketLayer:getArrIpAndPorts()
end

---------------------------
--@param 发起登陆请求
--@return
function LoadAndSocketLayer:loginServer()
end

---------------------------
--@param 加入金币房间
--@return
function LoadAndSocketLayer:joinGoldRoom()
end

---------------------------
--@param 其她事件根据 子类逻辑特殊处理
--@return
function LoadAndSocketLayer:onExtendEvt(cmd,data)
end

return LoadAndSocketLayer