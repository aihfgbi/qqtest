-- 等待基类
local WebViewLayer = class("WebViewLayer",require("base/layer/AlertBaseLayer"))
WebViewLayer.RESOURCE_FILENAME = "common/layer/WebViewLayer.csb"

---------------------------
--@param
--@return
function WebViewLayer:initUi(info)        
    self:openWeb(info)
end

---------------------------
--@param
--@return
function WebViewLayer:showEnterMove()
    self._originalPos = cc.p(self._panel_content:getPositionX(), self._panel_content:getPositionY())
    self._panel_content:setPosition(cc.p(self._originalPos.x, -640))
    self._panel_content:runAction(cc.MoveTo:create(0.3, self._originalPos))
end

---------------------------
--@param
--@return
function WebViewLayer:enterActFinish()
    self:openWeb(self._info)
end

---------------------------
--@param
--@return
function WebViewLayer:doEnter()
	self:addCustomEvent()
end

---------------------------
--@param 收到事件
--@return
function WebViewLayer:onCoustomEvt(cmd,data)
   if cmd == CMD.SOCKET.CONNECTION_LOST then
          self:close()
   end
end

---------------------------
--@param 打开webView
--@return
function WebViewLayer:openWeb(url)
    print(url)
    local winSize = cc.Director:getInstance():getVisibleSize()
    self._webView = ccexp.WebView:create()
    self._webView:setPosition(568, 40+320)
    self._webView:setContentSize(1136,560)
    self._webView:loadURL(url)
    self._webView:setScalesPageToFit(true)
    self._webView:setOnDidFinishLoading(function(sender, url)
        self._webView:setVisible(true)        
        UiManager:Instance():showWaitNode(false) 
    end)
    self._webView:setVisible(false)
    self._panel_content:addChild(self._webView)    
    UiManager:Instance():showWaitNode(true)
end

---------------------------
--@param 关闭显示对象
--@return
function WebViewLayer:close()
    UiManager:Instance():showWaitNode(false)    
    local closeAct = cc.Sequence:create(cc.MoveTo:create(0.3, cc.p(self._originalPos.x, -640)), cc.CallFunc:create(function()
        -- 关闭动画完毕后 执行移除动作
        self:removeSelf()
     end))
     self._panel_content:runAction(closeAct)
end


return WebViewLayer