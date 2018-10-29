-- 弹出节点基类
-- 考虑所有的弹出层都继承该类 拥有关闭和打开两个动画
-- 拥有关闭时释放资源的能力 防止点击穿透 拥有关闭功能
-- 是否拥有事件监听能力
-- 等待基类
local AlertBaseLayer = class("AlertBaseLayer",require("base.UIBase"))


function AlertBaseLayer:onCreate(info)
    self._isExit = false
    self._info = info
    self.resNode = self:getResourceNode()
    
    self._panel_content = self.resNode:getChildByName("panel_content")
    if not self._panel_content then
        self._panel_content = self.resNode
    end

    self:initUi(info)
end

---------------------------
--@param
--@return
function AlertBaseLayer:initUi(info)
	
end

---------------------------
--@param
--@return
function AlertBaseLayer:onEnter()
    local panel_content = self.resNode:getChildByName("panel_content")
    local btn_close = nil
    if panel_content then   -- 通用结构
        btn_close = panel_content:getChildByName("btn_close")
    else    
        -- 兼容中间少panel_content的情况
        btn_close = self.resNode:getChildByName("btn_close")
    end

    if btn_close then
        self:addBtnEvt(btn_close,handler(self,self.close))
    end

    self:showEnterMove()
    self:doEnter()
end


---------------------------
--@param 关闭显示对象
--@return
function AlertBaseLayer:close()
   self:showExitMove()
end


---------------------------
--@param 添加添加背景 关闭功能
--@return
function AlertBaseLayer:addClickBgClose()
    local panel_bg = self.resNode:getChildByName("layer_lock"):getChildByName("panel_bg")
    self:addBtnEvt(panel_bg,handler(self,self.close))
end

---------------------------
--@param 显示进入动画(默认进入动画，如果子类需要自己设计，那么重写)
--@return
function AlertBaseLayer:showEnterMove()
    local panel_content = self.resNode:getChildByName("panel_content")
    if panel_content then
        panel_content:setScale(0)

        local showAct = cc.Sequence:create(cc.ScaleTo:create(0.1, 1.1), 
                                            cc.DelayTime:create(0.1), 
                                            cc.ScaleTo:create(0.1, 1.0),
                                            cc.DelayTime:create(0.1), 
                                            cc.CallFunc:create(function ()
                                                -- 进入动画完成
                                                self:enterActFinish()
                                            end)
                                        )        
        panel_content:runAction(showAct)
    else
        self:enterActFinish()
    end
end

--==============================--
--desc:进入动画完成
--time:2017-12-03 06:01:34
--@return 
--==============================--
function AlertBaseLayer:enterActFinish()
    
end

---------------------------
--@param 执行关闭动画
--@return
function AlertBaseLayer:showExitMove()
    local panel_content = self.resNode:getChildByName("panel_content")    
    local closeAct = cc.Sequence:create(cc.CallFunc:create(function()
        -- 关闭动画完毕后 执行移除动作
        self:removeSelf()
     end))

     if panel_content then
        -- 结构为通用结构
        panel_content:runAction(closeAct)
     else
        -- 开发者自己使用的结构和通用结构不同时（容错处理）
        self:removeSelf()
     end
end

---------------------------
--@param
--@return
function AlertBaseLayer:doEnter()

end


return AlertBaseLayer