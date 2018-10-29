-- probuf socket 基类
-- 包含链接 登陆 心态检查
local PbSocket = class("PbSocket")

PbSocket.TIME_OUT_TIME = 5
-- 通信基类
PbSocket._socketBase = nil
-- 上一次心跳时间
PbSocket._lastHeartTime = nil
-- 上一次收到心跳检测时间
PbSocket._lastRevHeartTime = nil
-- 心跳检测间隔
PbSocket._heartCheckTime = nil
-- 计时器id
PbSocket._schedulerId = nil
-- 通信id
PbSocket._socketId = nil
-- 通信类型
PbSocket._socketType = nil
-- 释放在链接中
PbSocket._isConnecting = nil

---------------------------
--@param 初始化socket
--@return
function PbSocket:init(ip,port,socketId,socketType)
    self:distory()
    self._socketId = socketId
    self._socketType = socketType
    self._schedulerId = cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self, self.update), 0.01, false)
    --创建一个客户端连接
    self._socketBase = require("base/SocketBase.lua").new()
    
    self._socketBase:registerCallFun(CMD.COMMON.RES_CONNECT_CREATE,handler(self,self.onConnectSuc))
    self._socketBase:registerCallFun(CMD.COMMON.RES_HEART_BEAT,handler(self,self.onHeartCheck))
    self._socketBase:registerCallFun(CMD.COMMON.RES_NOTIFY_BE_KICK_OUT,handler(self,self.onKickOut))
    self._socketBase:registerCallFun(CMD.SOCKET.SOCKET_EXTENDS,handler(self,self.onExtends))
    
    self:connect(ip,port)
end

---------------------------
--@param 关闭清除 socket对象
--@return
function PbSocket:distory()    
    if self._schedulerId then
        cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self._schedulerId)
    end

    if self._socketBase then
        self._socketBase:close()
    end

    self._socketBase = nil
    self._schedulerId = nil
    self._lastHeartTime = nil
    self._lastRevHeartTime = nil
    self._heartCheckTime = nil
    self._socketId = nil
    self._socketType = nil
    self._isConnecting = false
end

---------------------------
--@param 执行 帧事件
--@return
function PbSocket:update(dt)
    if self._isConnecting  then
        self._lastHeartTime = self._lastHeartTime + dt
        if self._lastHeartTime >= self.TIME_OUT_TIME then -- 链接超时 提示链接失败
        	self:connectFail()
        end
    else
        self._lastHeartTime = self._lastHeartTime+dt -- 多久没有做过心跳检测
        if self._lastHeartTime >= self._heartCheckTime then  -- 没有心跳检测的时间 大于需要检测间隔 发送心跳检测
            self:heartCheck()
        end
        
        self._lastRevHeartTime = self._lastRevHeartTime + dt
        if self._lastRevHeartTime > self._heartCheckTime*2 then -- 如果两次心跳都没有收到服务器返回的心跳包 默认为游戏已经断线
            print(self._socketId,self._socketType,"心跳验证超时")
            Utils.utils:sendCustomEvt(CMD.SOCKET.CONNECTION_LOST,{id = self._socketId,type = self._socketType})
            self:distory()
        end
    end
    if self._socketBase then
        self._socketBase:whildDo() -- 每一帧 都执行读取数据和发送数据
    end
end

---------------------------
--@param 发送链接请求
--@return
function PbSocket:connect(ip,port)
    print(self._socketId,self._socketType,"正在链接服务器",ip,port)
    self._isConnecting = true
    self._lastHeartTime = 0
    self._socketBase:connetServer(ip,port,self._socketId,self._socketType)
end

---------------------------
--@param 发送心跳检测
--@return
function PbSocket:heartCheck()
    self._lastHeartTime = 0
    local data = protobuf.encode("ProtoNet.ReqHeartBeat", {})
    self._socketBase:sendMsg(CMD.COMMON.REQ_HEART_BEAT,data)
    
--    print("日期:"..os.date("%Y").."-"..os.date("%m").."-"..os.date("%d").." "..os.date("%H")..":"..os.date("%M").." "..os.date("%S"))
end

---------------------------
--@param 链接超时
--@return
function PbSocket:connectFail()
    print(self._socketId,self._socketType,"链接服务器超时")
    Utils.utils:sendCustomEvt(CMD.SOCKET.CONNECTION_FAIL,{id = self._socketId,type = self._socketType})
    self:distory()
end



------------------------------------ 事件返回 ----------------------------------------

--服务器链接成功
function PbSocket:onConnectSuc(data)
    local ret = protobuf.decode("ProtoNet.ResConnectCreat",data)
    self._lastHeartTime = 0
    self._lastRevHeartTime = 0
    self._isConnecting = false
    self._heartCheckTime = ret.heartbeartTime/1000
    Utils.utils:sendCustomEvt(CMD.SOCKET.CONNECTION_SUC,{id = self._socketId,type = self._socketType})
end

-- 心跳检测返回
function PbSocket:onHeartCheck(data)
    self._lastRevHeartTime = 0
end

---------------------------
--@param 被提下线
--@return
function PbSocket:onKickOut(data)
    Utils.utils:sendCustomEvt(CMD.COMMON.RES_NOTIFY_BE_KICK_OUT,data)
    self:distory()
end

---------------------------
--@param
--@return
function PbSocket:onExtends(cmd,data)
    Utils.utils:sendCustomEvt(cmd,data)
end

return PbSocket