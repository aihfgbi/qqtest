-- 等待基类
local AlertLayer = class("AlertLayer",require("base/layer/AlertBaseLayer"))
AlertLayer.RESOURCE_FILENAME = "common/layer/AlertLayer.csb"
-- 确定关闭命令
AlertLayer._cmdYes = nil
-- 取消关闭命令
AlertLayer._cmdNo = nil
-- 发送时间 参数
AlertLayer._userData = nil
---------------------------
--@param
--@return
function AlertLayer:initUi(info)
    
    self:addBtnEvt(self._panel_content:getChildByName("btn_yes"),handler(self,self.onYes))
    self:addBtnEvt(self._panel_content:getChildByName("btn_no"),handler(self,self.onNo))
    self._panel_content:getChildByName("txt_msg"):setString(info.msg)
    
    self._cmdYes = info.cmdYes
    self._cmdNo = info.cmdNo
    self._userData = info.userData
end

---------------------------
--@param 点击确定
--@return
function AlertLayer:onYes()
    printLog(self._cmdYes)
    if self._cmdYes then
        Utils.utils:sendCustomEvt(self._cmdYes,self._userData)
    end
	self:removeSelf()
end

---------------------------
--@param 点击取消
--@return
function AlertLayer:onNo()
    if self._cmdNo then
        Utils.utils:sendCustomEvt(self._cmdNo,self._userData)
    end
    self:removeSelf()
end

return AlertLayer