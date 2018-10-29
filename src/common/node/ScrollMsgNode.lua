--跑马灯
local ScrollMsgNode = class("ScrollMsgNode", cc.load("mvc").ViewBase)
ScrollMsgNode.RESOURCE_FILENAME = "common/node/ScrollMsg.csb"

-- 滚动宽度
ScrollMsgNode.SCROLL_WIDTH = 495
-- 每条消息 最大滚动次数
ScrollMsgNode.SCROLL_TIMES = 2
-- 字幕滚屏速度
ScrollMsgNode.SPEED = 2

-- 滚动文本框
ScrollMsgNode._scrollTxt = nil
-- 遮遭节点
ScrollMsgNode._maskRect = nil
-- 滚动消息数组
ScrollMsgNode._msgTable = {}

function ScrollMsgNode:onCreate()
    local resNode = self:getResourceNode()
    local imageBg = resNode:getChildByName("sprite_bg")   
    self._maskRect = cc.ClippingRectangleNode:create()
    self._maskRect:setClippingRegion(cc.rect(2,0,self.SCROLL_WIDTH,33))-- 这里用来设置显示区域 以后所有改跑马灯类 切换这里
    imageBg:addChild(self._maskRect)

    self._scrollTxt = cc.Label:createWithSystemFont("", "arial", 22)
    self._maskRect:addChild(self._scrollTxt) 
    self._scrollTxt:setAnchorPoint(0,0)
    self._scrollTxt:setPosition(self.SCROLL_WIDTH,2)
    self._scrollTxt:setPositionX(-10000)
end

---------------------------
--清除滚屏消息
--@param
--@return
function ScrollMsgNode:clearScroll()
    self._msgTable = {}
    self._scrollTxt:setPositionX(-10000)
end 


---------------------------
--添加滚屏消息
--@param
--@return
function ScrollMsgNode:addScrollMsg(msg)
    local msgItem = {msg = msg.msg,times = 0,scrollTimes = msg.times}
    table.insert(self._msgTable,table.maxn(self._msgTable)+1,msgItem)
    if #self._msgTable > 20 then
        table.remove(self._msgTable,1)
    end
    self:onEnter()
    self:setVisible(true)
end


function ScrollMsgNode:onEnter()
    local function update()
        local w = self._scrollTxt:getContentSize().width+20
        local x = self._scrollTxt:getPositionX()
        self._scrollTxt:setPositionX(x-self.SPEED)
        if x < -w then
            if table.maxn(self._msgTable) < 1 then
                self:unscheduleUpdate()
                self:setVisible(false)
                return
            end

            local msgTable = self._msgTable[1]
            msgTable.times = msgTable.times+1

            print(msgTable.msg.."  times:"..msgTable.times)
            if msgTable.times >= msgTable.scrollTimes then
                table.remove(self._msgTable,1)
            end
            self._scrollTxt:setString(msgTable.msg)
            self._scrollTxt:setPositionX(self.SCROLL_WIDTH)
        end 
    end
    self:onUpdate(update)
end

function ScrollMsgNode:onExit()
    self:unscheduleUpdate()
end

return ScrollMsgNode