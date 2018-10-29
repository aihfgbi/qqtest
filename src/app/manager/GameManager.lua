
GameManager = class("GameManager")
GameManager._instance = nil
--==============================--
--desc:构造函数 
--time:2017-11-22 03:39:12
--@return 
--==============================--
function GameManager:ctor()
    self._arrCreateRoomConfig = {}
    self._arrCreateGoldRoomConfig = {}
    self._arrSendChatMsg = {}
    self._arrUserRemark = {}
    self._arrGoldGameList = {}
    self._arrGamePackage = {}
end

--==============================--
--desc:实现单例
--time:2017-11-22 03:39:43
--@return 
--==============================--
function GameManager:Instance()
    if nil == GameManager._instance then
        print("new instance")
        GameManager._instance = GameManager:create()
    end
    return GameManager._instance
end

function GameManager:initManager()   

    -----------------------------------------------------------------------
    -----------------------------------------------------------------------
    -- 需要手动配置的部分
    -- start

    -- 配置游戏ID对应的包名（用于下载游戏,不能同名）
    self._arrGameName = {
        game_8854 = "拼十",
        game_8849 = "拼三张",
        game_8853 = "二八杠",
        game_8862 = "红中麻将",
        game_8866 = "跑得快",
        game_8859 = "五子棋",
        game_8879 = "推筒子",
        game_8875 = "百人斗牛",
        game_8887 = "砀山麻将",
    }

    self._arrGamePackage = {
        game_8854 = "niuniu",
        game_8849 = "zjh",
        game_8853 = "erbagang",
        game_8859 = "wzq",
        game_8862 = "hzmj",
        game_8879 = "wabaozi",
        game_8866 = "pdk",
        game_8875 = "bairendn",
        game_8887 = "dsmj",
    }

    -- 创建房间配置(房卡)
    self._arrCreateRoomConfig = {
        game_8854 = "niuniu/control/NiuNiuCreateControl.lua",
        game_8849 = "zjh/control/ZJHCreateControl.lua",
        game_8853 = "erbagang/control/EBGCreateControl.lua",
        game_8862 = "hzmj/control/HZMJCreateControl.lua", 
        game_8866 = "pdk/control/PDKCreateControl.lua",
        game_8879 = "src/wabaozi/control/WBZCreateControl.lua",
        game_8887 = "dsmj/control/DSMJCreateControl.lua",
    }

    -- 创建房间配置(金币)
    self._arrCreateGoldRoomConfig = {
        game_8854 = "niuniu/control/NiuNiuCreateGoldControl.lua",
        game_8849 = "zjh/control/ZJHCreateGoldControl.lua",
        game_8853 = "erbagang/control/EBGCreateGoldControl.lua",
        game_8862 = "hzmj/control/HZMJCreateGoldControl.lua", 
        game_8866 = "pdk/control/PDKCreateGoldControl.lua",
        -- game_8879 = "wabaozi/control/WBZCreateGoldControl.lua",
        game_8887 = "dsmj/control/DSMJCreateGoldControl.lua",        
    }

    -- 战绩配置
    self._arrUserRemark = {

            game_8854 = {
                -- 第一层用到的
                userNum = 8,

                firstPath = "game/node/UserRemarkItemNode_8.csb",    -- 单层                    
                firstSize = cc.size(900, 150),

                -- 第二层用到的
                secondPath = "game/node/RoomRemarkItemNode_8.csb",
                secondSize = cc.size(1080, 150),
            },

            game_8849 = {
                -- 第一层用到的
                userNum = 8,

                firstPath = "game/node/UserRemarkItemNode_8.csb",    -- 单层
                firstSize = cc.size(900, 150),

                -- 第二层用到的
                secondPath = "game/node/RoomRemarkItemNode_8.csb",
                secondSize = cc.size(1080, 150),
            },

            game_8853 = {
                -- 第一层用到的
                userNum = 8,

                firstPath = "game/node/UserRemarkItemNode_8.csb",    -- 单层
                firstSize = cc.size(900, 150),

                -- 第二层用到的
                secondPath = "game/node/RoomRemarkItemNode_8.csb",
                secondSize = cc.size(1080, 150),
            },



            game_8850 = { 
                -- 第一层用到的
                userNum = 4,

                firstPath = "game/node/UserRemarkItemNode_4.csb",    -- 单层
                firstSize = cc.size(900, 150),

                 -- 第二层用到的
                secondPath = "game/node/RoomRemarkItemNode_4.csb",
                secondSize = cc.size(1080, 150),
            },

            game_8866 = { 
                -- 第一层用到的
                userNum = 4,

                firstPath = "game/node/UserRemarkItemNode_4.csb",    -- 单层
                firstSize = cc.size(900, 150),

                 -- 第二层用到的
                secondPath = "game/node/RoomRemarkItemNode_4.csb",
                secondSize = cc.size(1080, 150),
            },

            game_8862 = { 
                -- 第一层用到的
                userNum = 4,

                firstPath = "game/node/UserRemarkItemNode_4.csb",    -- 单层
                firstSize = cc.size(900, 150),

                 -- 第二层用到的
                secondPath = "game/node/RoomRemarkItemNode_4.csb",
                secondSize = cc.size(1080, 150),
            },

            game_8875 = { 
                --                -- 第一层用到的
                --                userNum = 4,
                
                firstPath = "bairendn/node/UserRemarkItemNode.csb",    -- 单层 
                firstSize = cc.size(820, 140),
            },

            game_8879 = {
                -- 第一层用到的
                userNum = 1,

                firstPath = "game/node/UserRemarkItemNode_1.csb",    -- 单层
                firstSize = cc.size(900, 150),

                -- 第二层用到的
                secondPath = "game/node/RoomRemarkItemNode_1.csb",
                secondSize = cc.size(1080, 150),
            },

            game_8887 = {
                -- 第一层用到的
                userNum = 4,

                firstPath = "game/node/UserRemarkItemNode_4.csb",    -- 单层
                firstSize = cc.size(900, 150),
                -- 第二层用到的
                secondPath = "game/node/RoomRemarkItemNode_4.csb",
                secondSize = cc.size(1080, 150),
            }

    }

    -- end
    -----------------------------------------------------------------------
    -----------------------------------------------------------------------
end

--==============================--
--desc:
--time:2017-11-23 04:58:50
--@gameId: gameId 如果为nil 
--@return 
--==============================--
function GameManager:getUserRemark( gameId )
    if gameId and tonumber(gameId) then
        local userRemark =  self._arrUserRemark[ string.format("game_%d", gameId) ] 
        return userRemark and userRemark or nil
    elseif gameId == "all" then
        return self._arrUserRemark
    end

    return nil
end

--==============================--
--desc:获取配置的所有游戏
--time:2017-12-01 03:23:13
--@args:
--@return 
--==============================--
function GameManager:getAllGame()
    return next(self._arrGamePackage) and self._arrGamePackage or {}    
end

--==============================--
--desc:获取房间房间配置（房卡）
--time:2017-11-22 04:07:58
--@return 
--==============================--
function GameManager:getCreateRoomConfig()
    return next(self._arrCreateRoomConfig) and self._arrCreateRoomConfig or {}
end

--==============================--
--desc:获取创建房间配置（金币）
--time:2017-11-22 04:08:00
--@return 
--==============================--
function GameManager:getCreateGoldRoomConfig()    
    return next(self._arrCreateGoldRoomConfig) and self._arrCreateGoldRoomConfig or {}
end

--==============================--
--desc: 设置当前使用的socket
--time:2017-11-22 09:12:06
--@return
--==============================--
function GameManager:setSocket(gameId, pbSocket)
    if not gameId then
        UiManager:Instance():showMsgTips( string.format( "%d游戏的聊天存储失败，请检测游戏ID", tonumber(gameId) ) )
        return
    end
    self._arrSendChatMsg[ string.format("game_%d", tonumber(gameId)) ] = pbSocket
end

--==============================--
--desc: 获取当前使用的socket
--time:2017-11-22 09:22:42
--@return 
--==============================--
function GameManager:getSocket(gameId)
    return self._arrSendChatMsg[string.format("game_%d", tonumber(gameId))]
end

--==============================--
--desc:移除指定的socket
--time:2017-11-25 11:28:03
--@gameId:
--@return 
--==============================--
function GameManager:removeSocket(gameId)    
    self._arrSendChatMsg[string.format("game_%d", tonumber(gameId))] = nil
end

--==============================--
--desc:设置金币场游戏列表
--time:2017-11-25 04:41:31
--@gameList:游戏列表
--@return 
--==============================--
function GameManager:setGoldGameList(gameList)
    self._arrGoldGameList = gameList and gameList or {}
end

function GameManager:getGoldGameList(gameList)
    return self._arrGoldGameList
end

---------------------------
--@param 判断游戏是否下载
--@return
function GameManager:isGameExit(gameId)
    local strUpdateList = cc.UserDefault:getInstance():getStringForKey("strUpdateList")
    print("strUpdateList==>",strUpdateList)
    local arrList = json.decode(strUpdateList)
    local packName = self:getGameIdToPackage(gameId)
    return table.indexof(arrList,packName)
end

--==============================--
--desc:通过游戏ID获取游戏包名
--time:2017-11-30 06:36:38
--@gameId:
--@return 
--==============================--
function GameManager:getGameIdToPackage(gameId)
    return self._arrGamePackage[string.format("game_%d", tonumber(gameId))]
end

--==============================--
--desc:通过包名获取游戏ID
--time:2017-11-30 07:12:38
--@gamePackage:
--@return 
--==============================--
function GameManager:getPackageToGameId(gamePackage)
    for key, package in pairs(self._arrGamePackage) do
        if gamePackage == package then            
            return string.split(key, "_")[2]
        end
    end
    return nil
end

--==============================--
--desc:通过id获取游戏名字
--time:2017-11-30 07:12:38
--@gamePackage:
--@return
--==============================--
function GameManager:getGameIdToName(gameId)
    return self._arrGameName[string.format("game_%d", tonumber(gameId))]
end

--==============================--
--desc:获取已经下载好的游戏ID（除去五子棋）
--time:2017-12-20 21:45:38
--@gamePackage:
--@return
--==============================--
function GameManager:getExitGameList()
    local arrExitGame = {}
    local strUpdateList = cc.UserDefault:getInstance():getStringForKey("strUpdateList")
    print("strUpdateList==>",strUpdateList)
    local arrList = json.decode(strUpdateList)
    dump(self._arrGamePackage)
    for key, package in pairs(self._arrGamePackage) do
        if table.indexof(arrList,package) and tonumber(string.split(key, "_")[2]) ~= gameConfig.gameId.WZQ then
            arrExitGame[#arrExitGame+1] = tonumber(string.split(key, "_")[2])
        end
    end
    return arrExitGame
end

---------------------------
--@param 获取游戏玩法
--@return
function GameManager:getGoldPtypeStr(gameId,paramString)
    local jsonInfo = json.decode(paramString)
    dump(jsonInfo,"jsonInfosssssssss")
    local strPlay = nil
    if gameId == gameConfig.gameId.NIU_NIU then
        local arrModelName = {"抢庄拼十 ","轮庄拼十 ","牛牛做庄 ","牌大做庄 ","霸王庄 ","通比拼十 ","上庄拼十 "}
        strPlay = arrModelName[jsonInfo.model]
    elseif gameId == gameConfig.gameId.ZJH then
        local arrLaiName = {"闷1跟2\n ","闷1跟3 "}
        strPlay = arrLaiName[jsonInfo.mbet]
    elseif gameId == gameConfig.gameId.EBG then
        local txt_gameType = {"抢庄 ","房主坐庄 ","轮庄 "}
        strPlay = txt_gameType[jsonInfo.gameType]
    elseif gameId == gameConfig.gameId.XUE_ZHAN_MJ then 
        local arrUserNum = {"","二人三门 ","三人三门 ","四人三门 "}
        strPlay = arrUserNum[jsonInfo.maxPlayer]
    elseif gameId == gameConfig.gameId.DANG_SHAN_MJ then
        local arrXiaMa = {[0]="不下码 ",[1]="下一码 "}
        strPlay = arrXiaMa[jsonInfo.xiaMa]
    elseif gameId == gameConfig.gameId.HONG_ZHONG_MJ then 
        local arrFanMa = {[1]="一码全中 ",[3]="博码 ",[4]="4码 ",[6]="6码 "}
        local arrGameType = {"红中麻将 ","翻鬼麻将 ","双鬼麻将 "}
        strPlay = arrGameType[jsonInfo.gameType]
        strPlay = strPlay..arrFanMa[jsonInfo.fanMaType]   
    elseif gameId == gameConfig.gameId.PDK then
        strPlay = ""
        local arr= {"2人16张 ","3人16张 ","3人15张 ","4人13张 "}
        strPlay = ""..arr[jsonInfo.gameMode]
        if  jsonInfo.zhuaNiao == 1 then
            strPlay = strPlay .."抓鸟 "
        end
        if  jsonInfo.canBeGreat == 1 then
            strPlay = strPlay .."\r\n能大必大 "
        end
    end
    
    return strPlay
end
