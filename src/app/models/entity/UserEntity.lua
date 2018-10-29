-- 用户对象实例
local UserEntity = class("UserEntity")

-- 用户登陆名
UserEntity._name = nil
-- 用户id
UserEntity._uid = nil
-- 用户昵称
UserEntity._nick = nil
-- 用户头像
UserEntity._head = nil
-- 用户外部头像链接
UserEntity._headUrl = nil
-- 用户电话
UserEntity._phone = nil
-- 用户等级
UserEntity._level = nil
-- vip
UserEntity._vip = nil
-- 用户签名
UserEntity._sign = nil
-- IP地址
UserEntity._ip = nil
-- 用户类型
UserEntity._utype = nil
-- 性别
UserEntity._sex = nil
-- 是否为自己
UserEntity._isMe = nil
-- 金币
UserEntity._gold = nil
-- 房卡
UserEntity._roomCard = nil
-- 积分
UserEntity._score = nil
-- 抽奖圈
UserEntity._prizeCard = nil

---------------------------
--@param
--@return
function UserEntity:setName(value)
   if value then
       self._name = value   	
   end
end

---------------------------
--@param
--@return
function UserEntity:getName()
    return self._name 
end

---------------------------
--@param
--@return
function UserEntity:setUid(value)
    self._uid = value
end

---------------------------
--@param
--@return
function UserEntity:getUid()
    return self._uid 
end

---------------------------
--@param
--@return
function UserEntity:setNick(value)
    self._nick = value
end

---------------------------
--@param
--@return
function UserEntity:getNick()
    return self._nick
end

---------------------------
--@param
--@return
function UserEntity:setHead(value)
    self._head = value
end

---------------------------
--@param
--@return
function UserEntity:getHead()
    return self._head
end

-------------------------
function UserEntity:setHeadUrl(value)
    self._headUrl = value
end

function UserEntity:getHeadUrl()
    return self._headUrl
end

---------------------------
--用户电话
--@param
--@return
function UserEntity:getPhone()
    return self._phone  
end

function UserEntity:setPhone(value)
    self._phone = value
end

---------------------------
--@param
--@return
function UserEntity:setLevel(value)
    self._level = value
end

function UserEntity:getLevel()
    return self._level
end

---------------------------
--vip
--@param
--@return
function UserEntity:getVip()
    return self._vip
end

function UserEntity:setVip(value)
    self._vip = value
end

---------------------------
--用户签名
--@param
--@return
function UserEntity:getSign()
    return self._sign 
end

function UserEntity:setSign(value)
    self._sign = value
end

---------------------------
--ip地址
--@param
--@return
function UserEntity:getIP()
    return self._ip
end

function UserEntity:setIP(value)
    if not value then
    	value = ""
    end
    self._ip = value
end

---------------------------
--utype 玩家类型
--@param
--@return
function UserEntity:getUtype()
    return self._utype
end

function UserEntity:setUtype(value)
    self._utype = value
end

---------------------------
--玩家性别
--@param
--@return
function UserEntity:getSex()
    return self._sex
end

function UserEntity:setSex(value)
    self._sex = value
end
---------------------------
--是否为自己
--@param
--@return
function UserEntity:setIsMe(value)
    self._isMe = value
end

function UserEntity:getIsMe()
    return self._isMe
end
--金币
--@param
--@return
function UserEntity:getGold()
    return self._gold
end

function UserEntity:setGold(value)
    self._gold = value
end

-- 房卡
function UserEntity:getRoomCard()
    return self._roomCard
end

function UserEntity:setRoomCard(value)
    self._roomCard = value
end

-- 积分
function UserEntity:getScore()
    return self._score
end

function UserEntity:setScore(value)
    self._score = value
end

-- 抽奖圈
function UserEntity:getPrizeCard()
    return self._prizeCard
end

function UserEntity:setPrizeCard(value)
    self._prizeCard = value
end

return UserEntity