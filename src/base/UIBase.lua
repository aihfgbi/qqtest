local UIBase = class("UIBase",cc.load("mvc").ViewBase)
-- cocosstudio 绑定的资源对象
UIBase.resNode = nil
-- 传入数据
UIBase._info = nil
-- 释放资源组
UIBase._releaseTable = nil
-- 当前资源资源节点 是否已经关闭
UIBase._isExit = nil

function UIBase:onCreate(info)
    self._isExit = false
    self._info = info
    self.resNode = self:getResourceNode():getChildByName("panel_content")
    if not self.resNode then
        print("获取资源节点失败，请查看是否有panel_content层")
        return
    end
    self:initUi(info)
end

---------------------------
--@param 初始化
--@return
function UIBase:initUi(info)
	
end

---------------------------
--@param 收到事件
--@return
function UIBase:onCoustomEvt(cmd,data)
	
end

---------------------------
--@param
--@return
function UIBase:onEnter()
	
end

---------------------------
--添加自定义时间 监听
--@param
--@return
function UIBase:addCustomEvent()
    local function eventCustomEvt(evt) 
        local userData = evt._usedata
        local cmd = evt._cmd
        self:onCoustomEvt(cmd,userData)
    end
    local listenerCustom = cc.EventListenerCustom:create(CMD.CUSTOM,eventCustomEvt)
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithSceneGraphPriority(listenerCustom, self)
end

---------------------------
--@param
--@return
function UIBase:addBtnEvt(btn,callFun,data,soundKey,isEffect)
    local function btnCallBack(sender,type)
        if type == ccui.TouchEventType.ended then
            if soundKey then
            	SoundManager:playSoundByKey(soundKey)
            else
                SoundManager:playClickSound()
            end
            callFun(data)
        end
        
        if isEffect then
            if type == ccui.TouchEventType.ended or type == ccui.TouchEventType.canceled then
                btn:setScale(1)
            elseif type == ccui.TouchEventType.began then
                btn:setScale(1.1)
            end
        end
    end
    btn:addTouchEventListener(btnCallBack)
end

---------------------------
--@param 发送http get请求
--@return
function UIBase:sendGetHttp(url,funSuccess,funError)
    print(url)
    local xhr = cc.XMLHttpRequest:new()
    xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING
    xhr:open("GET", url,true)
    local function onReadyStateChange()
        if xhr.readyState == 4 and (xhr.status >= 200 and xhr.status < 207) then
            dump(xhr.response)
            if funSuccess and self._isExit == false then
                funSuccess(xhr.response)
            end
        elseif funError then 
            funError(xhr)
        end
        xhr:release()
    end
    xhr:registerScriptHandler(onReadyStateChange)
    xhr:send()
end

---------------------------
--@param 发送http post请求
--@return
function UIBase:sendPostHttp(url,funSuccess,funError,data)
    print(url)
    local xhr = cc.XMLHttpRequest:new()
    xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING
    xhr:open("POST", url,true)
    local function onReadyStateChange()
        if xhr.readyState == 4 and (xhr.status >= 200 and xhr.status < 207) then
            dump(xhr.response)
            if funSuccess and self._isExit == false then
                funSuccess(xhr.response)
            end
        elseif funError then 
            funError(xhr)
        end
        xhr:release()
    end
    xhr:registerScriptHandler(onReadyStateChange)
    xhr:send(data)
end

---------------------------
--@param 显示
--@return
function UIBase:show(parent,p)
    if parent then
   	   parent:addChild(self)
   else
      printError("nil 父对象")	   
   end
   
   if p then
      self:setPosition(p)
   end
end

---------------------------
--@param 释放资源
--@return
function UIBase:releaseRes(resTable)
    Utils.utils:releaseRes(resTable)
    Utils.displayUtils:releaseWebImage()
end


---------------------------
--@param
--@return
function UIBase:onExit()
    self._isExit = true
    if self._releaseTable then
        self:releaseRes(self._releaseTable)
    end

    print("当前纹理内存"..cc.Director:getInstance():getTextureCache():getCachedTextureInfo())
    printInfo(string.format("LUA VM MEMORY USED: %0.2f M", collectgarbage("count")/1024))
end

return UIBase