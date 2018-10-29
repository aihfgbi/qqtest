-- 等待基类
local WaitBaseLayer = class("WaitBaseLayer",require("base.UIBase"))
---------------------------
--@param
--@return
function WaitBaseLayer:onEnter()
    local sprite_move = self.resNode:getChildByName("sprite_move")
    local selfAnimate = cc.CSLoader:createTimeline(self.RESOURCE_FILENAME) 
    sprite_move:runAction(selfAnimate) 
    selfAnimate:gotoFrameAndPlay(0,true)
    self:doEnter()
end

---------------------------
--@param
--@return
function WaitBaseLayer:doEnter()
	
end

---------------------------
-- time 显示时间  time = nil 手动清除
--@param
--@return
function WaitBaseLayer:setShowTime(time)
    if time then
        performWithDelay(self,handler(self,self.removeSelf),time)
    end
end



return WaitBaseLayer