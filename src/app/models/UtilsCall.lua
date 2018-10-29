-- 大厅sfs管理器
UtilsCall = {}

function UtilsCall:new(o)
    o = o or {}
    setmetatable(o,self)
    self.__index = self
    return o
end

function UtilsCall:Instance()
    if self.instance == nil then
        self.instance = self:new()
    end
    return self.instance
end

---------------------------
-- 其他平台消息返回处理
--@param
--@return
local function callback(value)
    local info = nil 
    local cmd = nil
    if cc.PLATFORM_OS_ANDROID == cc.Application:getInstance():getTargetPlatform() then
        print("android平台："..value)
        info = json.decode(value)
        cmd = info.cmd
        Utils.utils:sendCustomEvt(cmd,info)
    elseif  cc.PLATFORM_OS_IPHONE == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_IPAD == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_MAC == cc.Application:getInstance():getTargetPlatform()
    then
        print("ios平台："..json.encode(value))
        Utils.utils:sendCustomEvt(value.cmd,value)
    end   
end


---------------------------
--初始化通用工具类
--@param
--@return
function UtilsCall:initUtilsCall()
    if cc.PLATFORM_OS_ANDROID == cc.Application:getInstance():getTargetPlatform() then      
        local args = {
            callback, 
        }
        local className = "cn/com/qql/utils/UtilsCall"
        LuaJavaBridge.callStaticMethod(className,"initUtilsCall",args,"(I)V")
    elseif  cc.PLATFORM_OS_IPHONE == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_IPAD == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_MAC == cc.Application:getInstance():getTargetPlatform()
    then 
        local className = "UtilsCall"
        LuaObjcBridge.callStaticMethod(className,"initUtilsCall",{callback = callback})
    end
end

---------------------------
-- 获取网络信号
--@param
--@return
function UtilsCall:getNetStatus()
    if cc.PLATFORM_OS_ANDROID == cc.Application:getInstance():getTargetPlatform() then      
        local args = {
        }
        local className = "cn/com/qql/utils/UtilsCall"
        LuaJavaBridge.callStaticMethod(className,"getNetStatus",args,"()V")
    elseif  cc.PLATFORM_OS_IPHONE == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_IPAD == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_MAC == cc.Application:getInstance():getTargetPlatform()
    then 
        local className = "UtilsCall"
        LuaObjcBridge.callStaticMethod(className,"getNetStatus",{})
    end
end

---------------------------
-- 获取电池电量
--@param
--@return
function UtilsCall:getBatteryValue()
    if cc.PLATFORM_OS_ANDROID == cc.Application:getInstance():getTargetPlatform() then      
        local args = {
        }
        local className = "cn/com/qql/utils/UtilsCall"
        LuaJavaBridge.callStaticMethod(className,"getBatteryValue",args,"()V")
    elseif  cc.PLATFORM_OS_IPHONE == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_IPAD == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_MAC == cc.Application:getInstance():getTargetPlatform()
    then 
        local className = "UtilsCall"
        LuaObjcBridge.callStaticMethod(className,"getBatteryValue",{})
    end
end

---------------------------
-- 获取电池电量
--@param
--@return
function UtilsCall:systemCopy(str)
    if cc.PLATFORM_OS_ANDROID == cc.Application:getInstance():getTargetPlatform() then      
        local args = {
               str
            }
        local className = "cn/com/qql/utils/UtilsCall"
        LuaJavaBridge.callStaticMethod(className,"systemCopy",args,"(Ljava/lang/String;)V")
    elseif  cc.PLATFORM_OS_IPHONE == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_IPAD == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_MAC == cc.Application:getInstance():getTargetPlatform()
    then 
        local className = "UtilsCall"
        LuaObjcBridge.callStaticMethod(className,"systemCopy",{str = str})
    end
end

---------------------------
--微信登陆
--@param
--@return
function UtilsCall:wchatLogin()
    if cc.PLATFORM_OS_ANDROID == cc.Application:getInstance():getTargetPlatform() then      
        local args = {
            "hnmj",
            "snsapi_userinfo",
        }
        local className = "cn/com/qql/utils/UtilsCall"
        LuaJavaBridge.callStaticMethod(className,"wchatLogin",args,"(Ljava/lang/String;Ljava/lang/String;)V")
    elseif  cc.PLATFORM_OS_IPHONE == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_IPAD == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_MAC == cc.Application:getInstance():getTargetPlatform()
    then
        local className = "UtilsCall"
        LuaObjcBridge.callStaticMethod(className,"wchatLogin",{gameName="hnmj",scope="snsapi_userinfo"})
    end
end

---------------------------
--调起微信支付
--@param
--@return
function UtilsCall:wchatPay(appId,nonce_str,sign,timeStamp,prepay,mch_id)
    if cc.PLATFORM_OS_ANDROID == cc.Application:getInstance():getTargetPlatform() then      
        local args = {
            appId
            ,nonce_str,sign,timeStamp,prepay,mch_id
        }
        local className = "cn/com/qql/utils/UtilsCall"
        LuaJavaBridge.callStaticMethod(className,"wchatPay",args,
            "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V")
    elseif  cc.PLATFORM_OS_IPHONE == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_IPAD == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_MAC == cc.Application:getInstance():getTargetPlatform()
    then
        local className = "UtilsCall"
        LuaObjcBridge.callStaticMethod(className,"wchatPay",{appId=appId,nonce_str=nonce_str,
            sign=sign,timeStamp=timeStamp,prepay=prepay,mch_id=mch_id})
    end
end

---------------------------
--微信链接分享
-- path 链接,title标题,description描述分享朋友圈时改字段无效,scene分享场景 1朋友圈 2好友
--@param
--@return
function UtilsCall:shearLink(path,title,description,scene)
    if cc.PLATFORM_OS_ANDROID == cc.Application:getInstance():getTargetPlatform() then      
        local args = {
            path,title,description,scene
        }
        local className = "cn/com/qql/utils/UtilsCall"
        LuaJavaBridge.callStaticMethod(className,"shearLink",args,
            "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V")
    elseif  cc.PLATFORM_OS_IPHONE == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_IPAD == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_MAC == cc.Application:getInstance():getTargetPlatform()
    then
        local className = "UtilsCall"
        LuaObjcBridge.callStaticMethod(className,"shearLink",
            {path=path,title=title,description=description,scene=scene})
    end
end

---------------------------
--分享切屏
--path 链接,title标题,description描述分享朋友圈时改字段无效,scene分享场景 1朋友圈 2好友
--@param
--@return
function UtilsCall:shareScene(path,title,description,scene)
    if cc.PLATFORM_OS_ANDROID == cc.Application:getInstance():getTargetPlatform() then      
        local args = {
            path,title,description,scene
        }
        local className = "cn/com/qql/utils/UtilsCall"
        LuaJavaBridge.callStaticMethod(className,"shareScene",args,
            "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V")
    elseif cc.PLATFORM_OS_IPHONE == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_IPAD == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_MAC == cc.Application:getInstance():getTargetPlatform()
    then
        local className = "UtilsCall"
        LuaObjcBridge.callStaticMethod(className,"shareScene",
            {path=path,title=title,description=description,scene=scene})
    end
end

---------------------------
--请求定位
--@param
--@return
function UtilsCall:location()
    if cc.PLATFORM_OS_ANDROID == cc.Application:getInstance():getTargetPlatform() then      
        local args = {
        }
        local className = "cn/com/qql/utils/UtilsCall"
        LuaJavaBridge.callStaticMethod(className,"location",args,"()V")
    elseif cc.PLATFORM_OS_IPHONE == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_IPAD == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_MAC == cc.Application:getInstance():getTargetPlatform()
    then
        local className = "UtilsCall"
        LuaObjcBridge.callStaticMethod(className,"location",{})
    end
end

---------------------------
--获取手机通信录
--@param
--@return
function UtilsCall:getContacts()
    if cc.PLATFORM_OS_ANDROID == cc.Application:getInstance():getTargetPlatform() then      
        local args = {
            }
        local className = "cn/com/qql/utils/UtilsCall"
        LuaJavaBridge.callStaticMethod(className,"getContacts",args,"()V")
    elseif cc.PLATFORM_OS_IPHONE == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_IPAD == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_MAC == cc.Application:getInstance():getTargetPlatform()
    then
        local className = "UtilsCall"
        LuaObjcBridge.callStaticMethod(className,"getContacts",{})
    end
end

---------------------------
--请求苹果内购
--@param
--@return
function UtilsCall:pay_iap(identifier,orderId)
    if cc.PLATFORM_OS_IPHONE == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_IPAD == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_MAC == cc.Application:getInstance():getTargetPlatform()
    then
        local className = "UtilsCall"
        LuaObjcBridge.callStaticMethod(className,"pay_iap",{identifier=identifier,orderId=orderId})
    end
end

--==============================--
--desc:获取手机唯一标识UUID
--time:2017-12-13 11:16:30
--@return 
--==============================--
function UtilsCall:getUUID()    
    if cc.PLATFORM_OS_ANDROID == cc.Application:getInstance():getTargetPlatform() then      
        local args = {
            }
        local className = "cn/com/qql/utils/UtilsCall"
        LuaJavaBridge.callStaticMethod(className,"getUUID",args,"()V")
    elseif cc.PLATFORM_OS_IPHONE == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_IPAD == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_MAC == cc.Application:getInstance():getTargetPlatform()
    then        
        local className = "UtilsCall"
        LuaObjcBridge.callStaticMethod(className,"getUUID",{})
    end
end
