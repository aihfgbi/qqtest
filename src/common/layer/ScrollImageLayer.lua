local ScrollImageLayer = class("ScrollImageLayer",require("base.layer.AlertBaseLayer"))
ScrollImageLayer.RESOURCE_FILENAME = "common/layer/ScrollImageLayer.csb"

---------------------------
--@param
--@return
function ScrollImageLayer:initUi(info)
    
    self:getScrollImage()
    self:addClickBgClose()
end

---------------------------
--滚屏广告
--@param
--@return
function ScrollImageLayer:getScrollImage()
    local url = gameConfig.url.url_getScrollImage
    local function httpSuccess(data)
        if data == nil or data == "" then            
            UiManager:Instance():showMsgTips("http返回登录参数错误！")
            return
        end
        data = json.decode(data)
        if data.code == 200 then
            self:showScrollImage(data)
        end           
    end  

    local function httpError()        
        UiManager:Instance():showMsgTips("获取服务器地址失败!")
    end  
    self:sendGetHttp(url,httpSuccess,httpError)    
end

---------------------------
--@param
--@return
function ScrollImageLayer:showScrollImage(data)
    self._scrollImageList = data.platAdvertList    
    local page_image = self._panel_content:getChildByName("page_image")
    local arrImage = {}
    local size = page_image:getContentSize()
    
    for k, v in pairs( self._scrollImageList ) do
        local layout = ccui.Layout:create()
        layout:setContentSize(cc.size(size.width, size.height))   
        local webImage = Utils.displayUtils:showWebImage(layout,v.adurl,cc.p(size.width/2,size.height/2),size.width,size.height)
        layout:setAnchorPoint(cc.p(0.5, 0.5))
        page_image:addPage(layout)
    end

    local function changePage()
        local curPage = page_image:getCurrentPageIndex()
        if curPage < #self._scrollImageList - 1 then
            page_image:scrollToPage(curPage+1)
        else
            page_image:scrollToPage(0)
        end
    end
    schedule(self,changePage,5)

    local function btnCallBack(sender,eventType)
        if eventType == ccui.TouchEventType.ended then
            local curPage = sender:getCurrentPageIndex()+1
            local imageInfo = self._scrollImageList[curPage]
            cc.Application:getInstance():openURL(imageInfo.bizurl) 
        end
    end
    -- page_image:addTouchEventListener(btnCallBack)
end

---------------------------
--@param
--@return
function ScrollImageLayer:onExit()
    self._isExit = true
    Utils.displayUtils:releaseWebImage() 
end

return ScrollImageLayer