
cc.FileUtils:getInstance():setPopupNotify(false)
local systemPath = cc.FileUtils:getInstance():getWritablePath()
cc.FileUtils:getInstance():setSearchPaths({systemPath.."src/",systemPath.."res/","src/","res/",""})
cc.FileUtils:getInstance():addSearchPath("src/")
cc.FileUtils:getInstance():addSearchPath("res/")

package.path = systemPath.."src/?.lua;"..package.path --添加lua文件的搜索路径(require)

require "config"
require "cocos.init"
require "cocos.ui.GuiConstants"
require("cocos.cocos2d.deprecated")
require("cocos.network.NetworkConstants")
require("utils.lfsEx")
json = require("utils.dkjson")

require("socket.protobuf")
require("socket.socket")

local function main()
    -- --游戏资源更新版本
    -- local localVersion = cc.UserDefault:getInstance():getStringForKey("localVersion") 
    -- if localVersion == "" or localVersion == nil then -- 第一次安装
    --     cc.UserDefault:getInstance():setStringForKey("localVersion",tostring(GAME_BIG_VISION))
    --     cc.UserDefault:getInstance():setStringForKey("smallVersion",tostring(GAME_SMALL_VISION))
    --     cc.UserDefault:getInstance():setStringForKey("strUpdateList",json.encode(INIT_PACK))
    --     cc.UserDefault:getInstance():flush()
    --     cc.UserDefault:getInstance():setBoolForKey ("isAcceptInvitation",true)    -- 是否接受邀请
    -- else
    --     -- 如果装了原来的包  且包版本比新安装包底 本次清除调原来所有热更新数据
    --     if tonumber(localVersion) < GAME_BIG_VISION then
    --         lfs.remove(systemPath.."res")
    --         lfs.remove(systemPath.."src")
    --         cc.UserDefault:getInstance():setStringForKey("localVersion",tostring(GAME_BIG_VISION))
    --         cc.UserDefault:getInstance():setStringForKey("smallVersion",tostring(GAME_SMALL_VISION))
    --         cc.UserDefault:getInstance():setStringForKey("strUpdateList",json.encode(INIT_PACK))
    --         cc.UserDefault:getInstance():setStringForKey("strLogin","")
    --         cc.UserDefault:getInstance():flush()
    --         cc.UserDefault:getInstance():setBoolForKey ("isAcceptInvitation",true)    -- 是否接受邀请
    --     end
    -- end
    require("app.MyApp"):create():run()
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print("====================== 程序错误 ==========================")
    print(msg)
    print("====================== 程序错误 ==========================")
end
