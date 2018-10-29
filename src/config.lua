
-- 0 - disable debug info, 1 - less debug info, 2 - verbose debug info
DEBUG = 2

-- use framework, will disable all deprecated API, false - use legacy API
CC_USE_FRAMEWORK = true

-- show FPS on screen
CC_SHOW_FPS = false

-- disable create unexpected global variable
CC_DISABLE_GLOBAL = false

-- for module display
CC_DESIGN_RESOLUTION = {
    width = 1136,
    height = 640,
    autoscale = "EXACT_FIT",
    callback = function(framesize)
        local ratio = framesize.width / framesize.height
        if ratio <= 1.34 then
            -- iPad 768*1024(1536*2048) is 4:3 screen
            return {autoscale = "EXACT_FIT"}
        end
    end
}

-- 本次安装打包的游戏大版本 小于次版本游戏将提示用户下载安装新的游戏
GAME_BIG_VISION = 1
-- 本次从服务器获取到的小版本号 
GAME_SMALL_VISION = 1000

-- 游戏初始打入包
INIT_PACK = {}