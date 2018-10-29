local MsgTipsNode = class("MsgTipsNode", cc.load("mvc").ViewBase)

MsgTipsNode.RESOURCE_FILENAME = "common/node/MsgTipsNode.csb"

function MsgTipsNode:onCreate(msg)
    local resNode = self:getResourceNode()
    local txtMsg = resNode:getChildByName("txt_msg")
    txtMsg:setString(msg)
end


---------------------------
--@param
--@return
function MsgTipsNode:onEnter(parameters)
    self:moveTo({delay=0.5,easing="backout",time=1,x = display.cx,y=display.cy+100,onComplete = function()
        self:removeSelf()
    end})
end

return MsgTipsNode