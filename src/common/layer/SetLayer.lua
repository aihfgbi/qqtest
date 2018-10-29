-- 等待基类
local SetLayer = class("SetLayer",require("base/layer/AlertBaseLayer"))
SetLayer.RESOURCE_FILENAME = "common/layer/SetLayer.csb"

---------------------------
--@param
--@return
function SetLayer:initUi(info)

    
    self:addBtnEvt(self._panel_content:getChildByName("btn_exit"),handler(self,self.relogin))

    local sliderMusic = self._panel_content:getChildByName("slider_music")
    local sliderEffect = self._panel_content:getChildByName("slider_effect")
    local check_invitation = self._panel_content:getChildByName("check_invitation")

    local function percentChangedEvent(sender,eventType)
        if eventType == ccui.SliderEventType.percentChanged then
            if sender == sliderMusic then 
                audio.setMusicVolume(sliderMusic:getPercent()/100)
            else
                audio.setSoundsVolume(sliderEffect:getPercent()/100)
            end
        end
    end  
    
    sliderMusic:addEventListener(percentChangedEvent)
    sliderEffect:addEventListener(percentChangedEvent)

    sliderMusic:setPercent(audio.getMusicVolume()*100)
    sliderEffect:setPercent(audio.getSoundsVolume()*100)

    local function cheeckEvent(sender,type)
        if type == ccui.CheckBoxEventType.selected or type == ccui.CheckBoxEventType.unselected then                      
            SoundManager:playClickSound()
        end
    end

    check_invitation:addEventListener(cheeckEvent)
    check_invitation:setSelected( cc.UserDefault:getInstance():getBoolForKey ("isAcceptInvitation") )
    self:addClickBgClose()
end

---------------------------
--@param 注销登录
--@return
function SetLayer:relogin()
    UiManager:showAlert("你确定注销吗？",CMD.USER_DEFINE.USER_CANCLE)
end


---------------------------
--@param
--@return
function SetLayer:onExit()    
    local sliderMusic = self._panel_content:getChildByName("slider_music")
    local sliderEffect = self._panel_content:getChildByName("slider_effect")
    local check_invitation = self._panel_content:getChildByName("check_invitation")
    cc.UserDefault:getInstance():setStringForKey("musicValue",tostring(sliderMusic:getPercent()/100))
    cc.UserDefault:getInstance():setStringForKey("soundValue",tostring(sliderEffect:getPercent()/100))
    cc.UserDefault:getInstance():setBoolForKey("isAcceptInvitation",check_invitation:isSelected())
end


return SetLayer