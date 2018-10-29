local LoadLayer = class("LoadLayer",require("base.layer.WaitBaseLayer"))
LoadLayer.RESOURCE_FILENAME = "common/layer/WaitLayer.csb"

-- 通信id（游戏id）
LoadLayer._socketId = nil
-- 通信类型(游戏类型)
LoadLayer._socketType = nil

-- 加载列表
LoadLayer._loadList = nil
-- 加载完成 跳转场景
LoadLayer._enterScene = nil
--是否在加载中
LoadLayer._isLoading = false
--当前加载引索
LoadLayer._loadIndex = 0
--当前需要加载的所有资源
LoadLayer._loadAllCount = 0
-- 进入场景携带的参数
LoadLayer._enterParams = nil



---------------------------
--@param
--@return
function LoadLayer:initUi(info)
    self._enterParams = info
    -- 通信id
    self._socketId = info.socketId
    -- 通信类型
    self._socketType = info.socketType
end

---------------------------
--@param
--@return
function LoadLayer:doEnter()
    self:starLoading(self._info.loadConfig)
end

---------------------------
--@param 开始加载
--@return
function LoadLayer:starLoading(loadConfig)
    self._loadList = loadConfig.res_list
    self._enterScene = loadConfig.scene

    self._isLoading = false
    self._loadIndex = 1
    self._loadAllCount = table.maxn(self._loadList)
    local function update(dt)
        if self._isLoading == false then 
            self:loading()
        end
    end
    self:scheduleUpdateWithPriorityLua(update,1)
end


---------------------------
--加载
--@param
--@return
function LoadLayer:loading()
    self._isLoading = true
    if self._loadIndex > self._loadAllCount  then
        self:unscheduleUpdate()
        --        -- 加载结束 跳转场景
        self:enterScene()
        return 
    end

    local precent = math.ceil((self._loadIndex/self._loadAllCount)*100)
    local loadObj = self._loadList[self._loadIndex]
    if loadObj.type == "image" then
        self:loadImage(loadObj.url)
    elseif loadObj.type == "armatrue-xml" then
        self:loadArmature(loadObj,2)
    elseif loadObj.type == "armatrue-json" then
        self:loadArmature(loadObj,1)
    elseif loadObj.type == "plist" then
        self:loadPlist(loadObj)
    elseif loadObj.type == "sound" then
        audio.preloadSound(loadObj.url)
        self._loadIndex = self._loadIndex + 1
        self._isLoading = false
    elseif loadObj.type == "music" then
        audio.preloadMusic(loadObj.url)
        self._loadIndex = self._loadIndex + 1
        self._isLoading = false
    elseif loadObj.type == "pb" then
        self:loadPBC(loadObj.url)
        self._loadIndex = self._loadIndex + 1
        self._isLoading = false
    end
    print("正在加载："..loadObj.url.."  "..precent)
end

---------------------------
--加载图片
--@param
--@return
function LoadLayer:loadImage(url)
    local function loadImageComplete(parameters)
        self._loadIndex = self._loadIndex + 1
        self._isLoading = false
    end
    cc.Director:getInstance():getTextureCache():addImageAsync(url,loadImageComplete)
end

---------------------------
--加载动画
--type 1 json 2 xml
--@param
--@return
function LoadLayer:loadArmature(obj,type)
    local function loadArmatureComplete(parameters)
        self._loadIndex = self._loadIndex + 1
        self._isLoading = false
    end
    if type == 2 then
        ccs.ArmatureDataManager:getInstance():addArmatureFileInfoAsync(obj.url,obj.plist,obj.keyName,loadArmatureComplete)
    else
        ccs.ArmatureDataManager:getInstance():addArmatureFileInfoAsync(obj.keyName,loadArmatureComplete)
    end
end

---------------------------
--加载纹理合集
--@param
--@return
function LoadLayer:loadPlist(obj)
    local function loadPlistComplete(texture)
        self._loadIndex = self._loadIndex + 1
        self._isLoading = false
        local cache = cc.SpriteFrameCache:getInstance()
        cache:addSpriteFrames(obj.plist,texture)
    end
    cc.Director:getInstance():getTextureCache():addImageAsync(obj.url,loadPlistComplete)
end

---------------------------
--加载probuf 资源
--@param
--@return
function LoadLayer:loadPBC(file)
    local buffer =GameTools:getFileData(file)
    protobuf.register(buffer)
end

---------------------------
--加载结束 进入游戏场景
--@param
--@return
function LoadLayer:enterScene()
    -- 如果需要修改 当前游戏id 和 游戏类型
    if self._socketId and self._socketType then
        DataManager:Instance():setGameId(self._socketId)
        DataManager:Instance():setGameType(self._socketType)
    end
    
    local packageName = self._enterScene.packageName
    local transition = self._enterScene.transition
    local time = self._enterScene.time
    local more = self._enterScene.more
    self:getApp():enterAnyScene(packageName,self._enterParams, transition, time, more)
end

return LoadLayer