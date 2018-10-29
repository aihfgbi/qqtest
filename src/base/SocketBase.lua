local SocketBase = class("SocketBase")
-- 事件注册器 
SocketBase._registerHand = nil
-- 通信socket对象
SocketBase._socket = nil
-- 发送消息缓冲区
SocketBase._sendCache = nil
-- 接受消息缓冲区
SocketBase._recvCache = nil
-- 接受粘包偏移量
SocketBase._offestData = nil
-- 当前socket标号
SocketBase._socketId = nil
-- 当前socket 附加参数那些
SocketBase._socketType = nil

function SocketBase:ctor()
    self._registerHand = {}
end

---------------------------
--@param 链接服务器
--@return
function SocketBase:connetServer(ip,port,socketId,type)
    local isipv6_only = false
    local addrifo = socket.dns.getaddrinfo("www.baidu.com")  
--    local addrifo = socket.dns.getaddrinfo("ipv6.myxiaomai.com")  
    dump(addrifo)
    if addrifo ~= nil then  
        for k,v in pairs(addrifo) do  
            if v.family == "inet6" then  
                isipv6_only = true  
                break  
            end  
        end  
    end  

    if isipv6_only then  
        self._socket = socket.tcp6()  
    else  
        self._socket = socket.tcp()  
    end  
    
    self._socket:settimeout(0)
--    self._socket:setoption("tcp-nodelay", true) --去掉优化 不用处理粘包
    self._socket:connect(ip, port)
    if self._socket then
        self._sendCache = nil
        self._recvCache = {}
        self._offestData = ""
    end
    self._socketId = socketId
    self._socketType = type
end

---------------------------
--@param 关闭与服务器
--@return
function SocketBase:close()
    if not self._socket then
        return
    end
    self._socket:close()
    self._socket = nil
    self._sendCache = nil
    self._registerHand = nil
end

---------------------------
--@param 发送消息,skynet封装好的接收消息是一个2个字节的长度sz后面加上消息
--@return
function SocketBase:sendMsg(cmd,data)
    print(self._socketId,"send cmd",cmd)
    data = cmd..data
    local len = #data
    local tmp = string.pack(">HA",len+8,data)
    if not self._sendCache then
        self._sendCache = ""
    end
    --发送缓冲，提高发送效率
    self._sendCache = self._sendCache .. tmp
end

---------------------------
--@param  循环发送
--@return
function SocketBase:whileSend()
    if not self._socket or not self._sendCache then
        return false
    end
    local n, err = self._socket:send(self._sendCache)
    if nil == n then
        self:socketError(err)
        return false
    end
    self._sendCache = nil
    return true
end

---------------------------
--@param  读取几个字节的消息
--@return
function SocketBase:readMsgByLen(len)
    if not self._socket then
        return nil, false
    end
    local data, receive_status,part = self._socket:receive(len,self._offestData)
    if not data then
        if receive_status ~= "timeout" then -- 处理超时 所有都错误都按端口处理
            self:socketError(receive_status)
        end
        self._offestData = part
        return nil, false
    end
    self._offestData = ""
    return data, true
end

SocketBase._num = 0
---------------------------
--@param  循环接受消息
--@return
function SocketBase:whileRecv()
    local data,res = nil,nil
    if not self._recvCache.cmd then
        --4 字节code
        data, res = self:readMsgByLen(4)-- 读取一个命令
        if not res then
            return false
        end
        local ne, cmd = string.unpack(data, '>I')-- 接包一个命令
        self._recvCache.cmd = cmd        
    end

    if not self._recvCache.len then
        --4 字节长度
        data, res = self:readMsgByLen(4)
        if not res then
            return false
        end
        local ne, length = string.unpack(data, '>I')
        self._recvCache.len = length
    end
    
    local dataLen = self._recvCache.len-8
    if dataLen > 0 then
        data, res = self:readMsgByLen(dataLen) 
        if not res then
            return false
        end    	
    end

    local cmd = self._recvCache.cmd
    local callFun = self._registerHand[cmd]
    print(self._socketId," -- 收到消息 -- ",cmd)
    -- if not callFun then
    --     callFun = self._registerHand[CMD.SOCKET.SOCKET_EXTENDS]
    --     callFun(cmd,data)
    -- else
    --     callFun(data)
    -- end
    self._recvCache = {}
    return true
end

---------------------------
--@param  每一帧 循环执行解包 和 发包
--@return
function SocketBase:whildDo()
    if not self._socket then
        return false
    end
    while self:whileSend() do -- 不停的发送数据
    end
    while self:whileRecv() do -- 不停的接受数据
    end
    return true
end

---------------------------
--@param  注册命令回调
--@return
function SocketBase:registerCallFun(cmd, callFun)
    assert(nil ==  self._registerHand[cmd], "register repeated message")
    self._registerHand[cmd] = callFun
end

---------------------------
--@param 出现网络错误 可能链接已经断开需要重新链接
--@return
function SocketBase:socketError(error)
    -- Utils.utils:sendCustomEvt(CMD.SOCKET.CONNECTION_LOST,{error = error,id = self._socketId,type = self._socketType})
	self:close()
end

return SocketBase