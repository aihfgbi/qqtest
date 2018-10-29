-- 等待基类
local DownGameLayer = class("DownGameLayer",require("base.layer.WaitBaseLayer"))
DownGameLayer.RESOURCE_FILENAME = "common/layer/DownGameLayer.csb"
-- 显示加载消息文本容器
DownGameLayer._txtMsg = nil
-- 更新链接
DownGameLayer._updateUrl = nil
-- 本次更新列表
DownGameLayer._updateList = nil
-- 文件总大小
DownGameLayer._allSize = nil
-- 已经下载文件大小
DownGameLayer._curSize = nil
-- 服务器最新的更新文件数据对象
DownGameLayer._serverVersionData = nil

local updateScene = require("app/views/UpdateScene.lua")
 -- 更新配置
DownGameLayer._config = updateScene._config
---------------------------
--@param
--@return
function DownGameLayer:initUi(info)
    self._downPackName = GameManager:Instance():getGameIdToPackage(info)
    self._txtMsg = self.resNode:getChildByName("txt_msg")
    
    if cc.PLATFORM_OS_ANDROID == cc.Application:getInstance():getTargetPlatform() then
        self._updateUrl = self._config.android_url
    elseif  cc.PLATFORM_OS_IPHONE == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_IPAD == cc.Application:getInstance():getTargetPlatform() or 
        cc.PLATFORM_OS_MAC == cc.Application:getInstance():getTargetPlatform()
    then
        self._updateUrl = self._config.ios_url
    end
end

---------------------------
--@param
--@return
function DownGameLayer:doEnter()
    self:getServerVersion()
end


---------------------------
--获取服务器最新文件 配置
--@param
--@return
function DownGameLayer:getServerVersion()
    local urlCheckVersion = self._updateUrl.."version_list.lua"
    local function funSuccess(data)
        self._serverVersionData = data
        local serverVersionList = loadstring(data,"version_list")()
        self:countDownLoads(serverVersionList)
    end

    local function funError()
        self:tipsErrorMsg("版本信息获取失败...!")
        -- 提示是否再次尝试
        self:getServerVersion()
    end

    self:sendGetHttp(urlCheckVersion,funSuccess,funError) 
end

---------------------------
--计算需要下载的 文件大小
--@param
--@return
function DownGameLayer:countDownLoads(serverVersionList)
    self._updateList = {}
    -- 计算代码更新数量
    self:compareFiles("src",serverVersionList["src"])
    self:compareFiles("res",serverVersionList["res"])

    if #self._updateList > 0 then
        self:downLoadFile()
    else
        UiManager:showMsgTips("无游戏下载配置！")
        self:close()
    end
end

---------------------------
--比较文件 是否相同不相同放入更新队列
-- typeName－ 资源类型 localVersionList－本地配置文件信息 serversionList－服务器版本配置信息
--@param
--@return
function DownGameLayer:compareFiles(compareKey,serversionList)
    local systemPath = cc.FileUtils:getInstance():getWritablePath()
    for path, versinInfo in pairs(serversionList) do
        local pathKey = systemPath..path
        local itemServer = {}
        itemServer.md5Key = versinInfo[1]
        itemServer.fileSize = versinInfo[2]
        itemServer.downUrl = self._updateUrl..path
        itemServer.savePath = systemPath..path  
        itemServer.path = path 
        if string.find( path,  string.format( "%s/%s/", compareKey, self._downPackName )) then
            table.insert(self._updateList,1,itemServer)
        end 
    end    
end

---------------------------
--下载更新文件
--@param
--@return
function DownGameLayer:downLoadFile()
    self._allSize = 0
    self._curSize = 0
    for key, itemServer in pairs(self._updateList) do
        self._allSize = self._allSize + itemServer.fileSize
    end
    self:downSingleFile(table.remove(self._updateList,1))
end

---------------------------
-- 下载单个文件
--@param
--@return
function DownGameLayer:downSingleFile(fileInfo)
    local precent = math.ceil(self._curSize/self._allSize * 100)
    local strMsg = "正在下载：" .. precent .. '%'.. string.format("(%.2fKB)", self._curSize/1024) .."/".. string.format("(%.2fKB)", self._allSize/1024)
    self:tipsErrorMsg(strMsg)

    local function funSuccess(data)
        self:saveDownFile(fileInfo,data)
    end

    local function funError()
        self:tipsErrorMsg(fileInfo.path.."下载失败!")
        UiManager:showMsgTips("游戏下载失败!")
        -- 提示是否再次尝试
        self:close()
    end
    self:sendGetHttp(fileInfo.downUrl,funSuccess,funError)
end

---------------------------
--保存下载文件
--@param
--@return
function DownGameLayer:saveDownFile(fileInfo,data)
    lfs.writeFile(fileInfo.savePath,data)
    self._curSize = self._curSize+fileInfo.fileSize

    if #self._updateList > 0 then
        self:downSingleFile(table.remove(self._updateList,1))
    else
        self:downGameFinish()
    end
end

---------------------------
--@param 游戏下载完成
--@return
function DownGameLayer:downGameFinish()
    local strUpdateList = cc.UserDefault:getInstance():getStringForKey("strUpdateList")
    local arrList = json.decode(strUpdateList)
    arrList[#arrList+1] = self._downPackName
    cc.UserDefault:getInstance():setStringForKey("strUpdateList",json.encode(arrList))
    cc.UserDefault:getInstance():flush()
    UiManager:showMsgTips("游戏下载成功!")
    Utils.utils:sendCustomEvt(CMD.USER_DEFINE.DOWNLOAD_GAME_FINISH,self._info)
    self:close()
end

---------------------------
-- 提示错误信息
--@param
--@return
function DownGameLayer:tipsErrorMsg(msg)
    print(" msg:"..msg)
    self._txtMsg:setString(msg)
end

return DownGameLayer