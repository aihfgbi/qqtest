DataManager = {}

-- 当前所在游戏id
DataManager._gameId = gameConfig.gameId.NULL
-- 当前游戏类型
DataManager._gameType = gameConfig.gameType.NULL
-- 用户自己的对象信息 UserEntity实例
DataManager._myself = nil
-- 是否旋转场景
DataManager._isRotateScene = false
-- 呀呀语言是否登陆成功
DataManager._isYvsdkLogin = nil
-- 当前链接游戏的链接服务器信息
DataManager._socketInfos = nil
-- 当前加入游戏的游戏信息
DataManager._gameInfo = nil
-- 是否取消本次录音
DataManager.isCancelRecord = true
-- 第一次进入大厅内存
DataManager._firstEnterHallMemory = nil
-- 当前页面是否显示邀请码
DataManager._isShowInvite = true

function DataManager:new(o)
    o = o or {}
    setmetatable(o,self)
    self.__index = self
    return o
end

function DataManager:Instance()
    if self.instance == nil then
        self.instance = self:new()
    end
    return self.instance
end

--------------------------------------------------------游戏事件返回数据设置-------------------------------------------------------

--------------------------------------------------------游戏事件返回数据设置-------------------------------------------------------

---------------------------
-- 获取当前游戏id
--@param
--@return
function DataManager:getGameId()
    return self._gameId
end

---------------------------
-- 获取当前游戏id
--@param
--@return
function DataManager:setGameId(value)
    self._gameId = value
end

---------------------------
-- 获取当前游戏type( 金币场 还是 钻石场 )
--@param
--@return

function DataManager:getGameType()
    return self._gameType
end
--
function DataManager:setGameType(value)
    self._gameType = value
end

---------------------------
--获取自己 用户实例
--@param
--@return
function DataManager:getMySelf()
    if self._myself == nil then
        self._myself = require("app.models.entity.UserEntity"):create()
    end
    return self._myself 
end

---------------------------
--@param
--@return
function DataManager:setMySelf(value)
    self._myself = value
end

---------------------------
--@param 是否旋转场景
--@return
function DataManager:getRotateScene()
    return self._isRotateScene
end

---------------------------
--@param 是否是横屏
--@return
function DataManager:setIsRotateScene(value)
    self._isRotateScene = value
end

---------------------------
--@param
--@return
function DataManager:getIsYVsdkLogin()
    return self._isYvsdkLogin 
end

---------------------------
--@param
--@return
function DataManager:setIsYVsdkLogin(value)
    self._isYvsdkLogin  = value
end


---------------------------
--@param
--@return
function DataManager:getSocketInfos()
    if self._socketInfos == nil then
    	self._socketInfos = {}
    end
    return self._socketInfos
end

---------------------------
--@param 获取游戏信息
--@return
function DataManager:getGameInfo()
    if self._gameInfo == nil then
        self._gameInfo = {}
    end
    return self._gameInfo 
end
--==============================--
--desc:设置手机模版内存（用于判断是否有内存未释放）
--time:2017-11-23 08:03:54
--@args:
--@return 
--==============================--
function DataManager:setPhoneTemplateMemory( memory )    
    if tonumber(memory) and not self._firstEnterHallMemory then
        self._firstEnterHallMemory = tonumber(memory)
    end
end

function DataManager:getPhoneTemplateMemory()
    return self._firstEnterHallMemory and self._firstEnterHallMemory or 0
end

--==============================--
--desc:设置是否显示邀请码
--time:2017-12-20 21:31:54
--@return
--==============================--
function DataManager:setShowInvite(isShowInvite)
    self._isShowInvite = isShowInvite
end

function DataManager:getShowInvite()
    return self._isShowInvite == true
end