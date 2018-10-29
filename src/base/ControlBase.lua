local ControlBase = class("ControlBase")

-- 控制器资源
ControlBase._resNode = nil
-- 使用控制器的节点
ControlBase._useNode = nil

function ControlBase:createControl(resNode,useNode)
    local control = self:create()
    control._resNode = resNode
    control._useNode = useNode
    control:onCreate()
    return control
end

---------------------------
--@param
--@return
function ControlBase:onCreate()
   
end

---------------------------
--@param
--@return
function ControlBase:addBtnEvt(btn,callFun,data,soundKey)
    local function btnCallBack(sender,type)
        if type == ccui.TouchEventType.ended then
            if soundKey then
                SoundManager:playSoundByKey(soundKey)
            else
                SoundManager:playClickSound()
            end
            callFun(data)
        end
    end
    btn:addTouchEventListener(btnCallBack)
end

---------------------------
--@param
--@return
function ControlBase:show()
    self._resNode:setVisible(true)
end

---------------------------
--@param
--@return
function ControlBase:hide()
    self._resNode:setVisible(false)
end


return ControlBase