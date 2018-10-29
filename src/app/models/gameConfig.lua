gameConfig =  
    {       
        -- 微信错误对应提示信息
        wchatErrorMsg = 
        {
            ERROR_WECHAT_NOT_INSTALLED = "未安装微信",
            ERROR_INVALID_PARAMETERS = "参数错误",
            ERROR_USER_CANCEL = "用户点击取消并返回",
            ERROR_AUTH_DENIED = "微信授权失败",
            ERROR_SENT_FAILED = "向微信发送信息失败",
            ERROR_UNSUPPORT = "微信不支持",
            ERROR_COMMON = "普通错误类型",
            ERROR_UNKNOWN = "未知错误",
            WECHAT_NOT_IINSTALL = "用户未安装微信"
        },

        chat = 
        {
            -- 重庆话
            chat_1 = "别个都输哭了，就假巴意思让别个赢一盘嘛。",
            chat_2 = "不是踏雪你，豆你勒种打法，只有输得哭。",
            chat_3 = "等哈哈，我切接个电话，马上豆回来。",
            chat_4 = "嘿锤子给，楞个好的牌都打输老。",
            chat_5 = "啷个炸弹楞个多哟，我都遭炸昏了",
            chat_6 = "勒把牌，明摆起要打得你们满街跑。",
            chat_7 = "勒把牌巴适，你们要遭安逸哟",
            chat_8 = "勒把牌打得好，配合得相当巴适哟。",
            chat_9 = "你豆是个宝气，哪有恁个打牌的嘛。",
            chat_10 = "你还踏血北个，你个人的窑裤都输起疤疤了。",
            chat_11 = "咋子了哟，啷个又掉线了嘛，网络也太撇了噻",

            -- 普通话
            chat_12 = "哎呀全是套路啊",
            chat_13 = "苍天啊，能不能让我赢一把",
            chat_14 = "还打不打啊，快点儿嘛",
            chat_15 = "急什么，让我再想想",            
            chat_16 = "老天爷啊，赐我一把好牌吧",
            chat_17 = "能不能快点，我妈叫我回家吃饭了",
            chat_18 = "呜呜呜打错了",
            chat_19 = "这把稳了",
            chat_20 = "这真是百年一遇的好牌啊",     

            --牛牛
            chat_21 = "不好意思，刚刚接了个电话",
            chat_22 = "房间没满，房主快去找几个嘛",
            chat_23 = "爆发吧我的小宇宙，这把我要通杀",
            chat_24 = "快点，别磨蹭了，时间就是金钱",            
            chat_25 = "哎哟！我的妈呀，手气有点旺啊！",
            chat_26 = "哥这庄一柱擎天，稳如泰山呐，哈哈哈！",
            chat_27 = "把把都是赢，你咋不把上天呐",
            chat_28 = "牛牛斗起来，气氛搞起来",
            chat_29 = "这～这牌气得我手直抖",     
            chat_30 = "又是没牛，今晚要输得吐血啦",
            chat_31 = "快点啊，等你好了，我厕所都上了一趟啦",
            chat_32 = "风水轮流转，底裤都输光",
            chat_33 = "莫闹莫闹，少批垮，赶紧打牌。",

            --二八杠
            chat_34 = "咋子了哟，啷个又掉线了嘛，网络也太撇了噻",
            chat_35 = "等哈哈，我切接个电话，马上逗回来。",
            chat_36 = "快点哟，不要耽过我赢钱哦！",
            chat_37 = "嘿嘿，勒(lei）把我赌庄家通赔！",
            chat_38 = "快点快点，勒(lei）把我要通杀全场！",
            chat_39 = "不要走了嘛，我们耍到天亮噻。",
            chat_40 = "莫要吵了，专心点，一哈小心摇裤遭输落了！",   
            chat_41 = "押的少赢得少，只有回家找大嫂。",
            chat_42 = "押得多赢得多，取个婆娘回屋暖被窝。",

            --跑得快
            chat_43 = "大家好,很高兴见到各位。",
            chat_44 ="再见了，我会想念大家的。",
            chat_45 ="诶！各位真是不好意思哦，我得离开一会儿。",
            chat_46 ="光脚的不怕穿鞋的，且跑且珍惜。",
            chat_47 ="这手牌太好了，你们跟着后面吃灰吧。",
            chat_48 ="快点啊，都等得我花都谢了！",
            chat_49 ="又断线了，什么破网络啊！",
            chat_50 ="步子不要迈太大，小心扯着蛋。",
            chat_51 ="苍天啊，给个出牌的机会吧！",
            chat_52 ="这牌拆得，伤不起啊！",
        }, 
        -- 游戏id
        gameId = 
        {
            NULL = nil,             -- 闲置
            HALL = 0,               -- 大厅
            NIU_NIU = 8854,         -- 拼十
            ZJH = 8849,             -- 金花            
--            XUE_ZHAN_MJ = 8848,     -- 血战麻将
            EBG = 8853,             -- 二八杠
--            BZP = 8850,             -- 板子炮
            PDK = 8866,             -- 跑得快  
            WBZ = 8879,             -- 推筒子
            BRDN = 8875,            -- 百人斗牛
            DANG_SHAN_MJ = 8887,    -- 砀山麻将
            HONG_ZHONG_MJ = 8862,   -- 红中麻将
            WZQ = 8859,             -- 五子棋
        },       

        -- 游戏类型
        gameType = 
        {
            NULL = nil,     -- 未进游戏（大厅）            
            GOLD = 1,      -- 钻石模式
            ROOM_CARD = 2, -- 房卡模式 
            MATCH = 3       -- 比赛模式
        },
        
        goldTypeName = {"菜鸟场","平民场","进阶场","欢乐场","龙虎场","高手场","富甲场","土豪场","体验场"},
    
        -- 商品道具id
        propsId = 
        {
            GOLD            =  1001,    -- 金币 
            ROOM_CARD       =  1002,    -- 钻石
            SCORE           =  1003,    -- 积分
            PRIZE_CARD      =  1009,    -- 抽奖券
        },
        
        urlRemark = -- 战绩
        {
            url_getUserRemark = "http://ipAndPort/v1/get-game-log", -- 获取自己的战绩内容
            url_getRoomRemark = "http://ipAndPort/v1/get-history-log", -- 获取房间的战绩列表
            url_getRemarkMove = "http://ipAndPort/v1/get-playback-detail", -- 对局的战绩            

            url_getUserGoldRemark = "http://ipAndPort/v1/get-history-log-gold-allgame", -- 获取某个用户所有的金币场战绩
            url_getUserGameGoldRemark = "http://ipAndPort/v1/get-history-log-gold", -- 获取某个用户特定游戏的金币场战绩

        },
        
        
        
        url =
        {
            -- url_login = "http://strIp/accountCheck",-- 登陆地址，
            url_login = "http://118.24.147.183:7780/accountCheck",-- 登陆地址，
        },
            
        -- 默认游戏大厅
        game_0 =
        {
            -- 加载资源
            loader = 
            {
                -- 资源
                res_list = 
                {   
                    -- {type="pb",url = "pb/MsgCode.pb"},                  

                    {type="plist",url="common/plist/common_ui.png",plist="common/plist/common_ui.plist"},
                    {type="plist",url="game/plist/game_public.png",plist="game/plist/game_public.plist"}

                },

                --跳转场景名 
                scene = 
                {
                    packageName = "app/views/LoginScene.lua"
                }
            },

            release = 
            {
                {type="image",url="login/image/big/loading_bg.png"},
                {type="plist",url="login/plist/welcome_ui.png",plist="login/plist/welcome_ui.plist"}
            }
        },
                        
        -- 拼十 金币
        game_8854_1 =
        {
            -- 加载资源
            loader = 
            {
                -- 资源
                res_list = 
                {       
                    {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                    {type="armatrue-json",url = "",keyName="niuniu/move/XueChan_Xing.ExportJson"},
                    {type="armatrue-json",url = "",keyName="game/move/XueChan_KaiShi.ExportJson"},
                    {type="armatrue-json",url = "",keyName="game/move/XueChan_Kuang.ExportJson"},
                    {type="armatrue-json",url = "",keyName="game/move/JieSuan.ExportJson"},

                    {type="plist",url="game/plist/game_alert.png",plist="game/plist/game_alert.png"}, 
                },

                --跳转场景名 
                scene = 
                {
                    packageName = "niuniu/NiuNiuGameScene.lua"
                }
            },

            release = 
            {
                {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},
                
                {type="armatrue-json",url = "",keyName="niuniu/move/XueChan_Xing.ExportJson"},
                {type="plist",url="niuniu/move/XueChan_Xing0.png",plist="niuniu/move/XueChan_Xing0.plist"},
                
                {type="armatrue-json",url = "",keyName="game/move/XueChan_KaiShi.ExportJson"},
                {type="plist",url="game/move/XueChan_KaiShi0.png",plist="game/move/XueChan_KaiShi0.plist"},
                {type="plist",url="game/move/XueChan_KaiShi1.png",plist="game/move/XueChan_KaiShi1.plist"},

                {type="armatrue-json",url = "",keyName="game/move/XueChan_Kuang.ExportJson"},
                {type="plist",url="game/move/XueChan_Kuang0.png",plist="game/move/XueChan_Kuang0.plist"},
                
                {type="armatrue-json",url = "",keyName="game/move/JieSuan.ExportJson"},
                {type="plist",url="game/move/JieSuan0.png",plist="game/move/JieSuan0.plist"},

                {type="plist",url="game/plist/face_ui.png",plist="game/plist/face_ui.plist"},
                {type="plist",url="cardgame/plist/card_ui.png",plist="cardgame/plist/card_ui.plist"},
                
                {type="plist",url="niuniu/plist/game_ui.png",plist="niuniu/plist/game_ui.plist"},
                {type="image",url="niuniu/image/big/game_bg.png"},
                {type="plist",url="game/plist/game_alert.png",plist="game/plist/game_alert.png"}, 

            },
            -- 加载等待场景
            waitLayer = "niuniu/layer/NiuNiuWaitLayer.lua",

            --快捷聊天
            chat = {21,22,23,24,25,26,27,28,29,30,31,32} 
        },
        
        -- 拼十 房卡
        game_8854_2 =
        {
            -- 加载资源
            loader = 
            {
                -- 资源
                res_list = 
                {       
                    {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                    {type="armatrue-json",url = "",keyName="niuniu/move/XueChan_Xing.ExportJson"},
                    {type="armatrue-json",url = "",keyName="game/move/XueChan_KaiShi.ExportJson"},
                    {type="armatrue-json",url = "",keyName="game/move/XueChan_Kuang.ExportJson"},
                    {type="armatrue-json",url = "",keyName="game/move/JieSuan.ExportJson"},

                    {type="plist",url="game/plist/game_alert.png",plist="game/plist/game_alert.png"}, 
                },

                --跳转场景名 
                scene = 
                {
                    packageName = "niuniu/NiuNiuGameScene.lua"
                }
            },

            release = 
            {
                {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},
                
                {type="armatrue-json",url = "",keyName="niuniu/move/XueChan_Xing.ExportJson"},
                {type="plist",url="niuniu/move/XueChan_Xing0.png",plist="niuniu/move/XueChan_Xing0.plist"},
                
                {type="armatrue-json",url = "",keyName="game/move/XueChan_KaiShi.ExportJson"},
                {type="plist",url="game/move/XueChan_KaiShi0.png",plist="game/move/XueChan_KaiShi0.plist"},
                {type="plist",url="game/move/XueChan_KaiShi1.png",plist="game/move/XueChan_KaiShi1.plist"},

                {type="armatrue-json",url = "",keyName="game/move/XueChan_Kuang.ExportJson"},
                {type="plist",url="game/move/XueChan_Kuang0.png",plist="game/move/XueChan_Kuang0.plist"},
                
                {type="armatrue-json",url = "",keyName="game/move/JieSuan.ExportJson"},
                {type="plist",url="game/move/JieSuan0.png",plist="game/move/JieSuan0.plist"},
                
                {type="plist",url="game/plist/face_ui.png",plist="game/plist/face_ui.plist"},
                {type="plist",url="cardgame/plist/card_ui.png",plist="cardgame/plist/card_ui.plist"},
                
                {type="plist",url="niuniu/plist/game_ui.png",plist="niuniu/plist/game_ui.plist"},
                {type="image",url="niuniu/image/big/game_bg.png"},

                {type="plist",url="game/plist/game_alert.png",plist="game/plist/game_alert.png"}, 
            },
            -- 加载等待场景
            waitLayer = "niuniu/layer/NiuNiuWaitLayer.lua",

            --快捷聊天
            chat = {21,22,23,24,25,26,27,28,29,30,31,32} 
        },
        
        -- 炸金花 金币
        game_8849_1 =
        {
            -- 加载资源
            loader = 
            {
                -- 资源
                res_list = 
                {      
                    {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                    {type="armatrue-json",url = "",keyName="zjh/move/XueChan_JinHua.ExportJson"},
                    {type="armatrue-json",url = "",keyName="game/move/XueChan_KaiShi.ExportJson"},
                    {type="armatrue-json",url = "",keyName="game/move/XueChan_Kuang.ExportJson"},
                    {type="armatrue-json",url = "",keyName="game/move/JieSuan.ExportJson"},

                    {type="plist",url="game/plist/game_alert.png",plist="game/plist/game_alert.png"}, 
                    {type="armatrue-json",url = "",keyName="zjh/move/YaMan.ExportJson"},
                },

                --跳转场景名 
                scene = 
                {
                    packageName = "zjh/ZJHGameScene.lua"
                }
            },

            release = 
            {
                {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},
                
                {type="armatrue-json",url = "",keyName="zjh/move/XueChan_JinHua.ExportJson"},
                {type="plist",url="zjh/move/XueChan_JinHua0.png",plist="zjh/move/XueChan_JinHua0.plist"},
                
                {type="armatrue-json",url = "",keyName="game/move/XueChan_KaiShi.ExportJson"},
                {type="plist",url="game/move/XueChan_KaiShi0.png",plist="game/move/XueChan_KaiShi0.plist"},
                {type="plist",url="game/move/XueChan_KaiShi1.png",plist="game/move/XueChan_KaiShi1.plist"},

                {type="armatrue-json",url = "",keyName="game/move/XueChan_Kuang.ExportJson"},
                {type="plist",url="game/move/XueChan_Kuang0.png",plist="game/move/XueChan_Kuang0.plist"},
                
                {type="armatrue-json",url = "",keyName="game/move/JieSuan.ExportJson"},
                {type="plist",url="game/move/JieSuan0.png",plist="game/move/JieSuan0.plist"},

                {type="plist",url="game/plist/face_ui.png",plist="game/plist/face_ui.plist"},
                {type="plist",url="cardgame/plist/card_ui.png",plist="cardgame/plist/card_ui.plist"},

                {type="plist",url="zjh/plist/game_ui.png",plist="cardgame/plist/game_ui.plist"},
                {type="image",url="zjh/image/big/game_bg.png"},

                {type="image",url="zjh/number/num_lost.png"},
                {type="image",url="zjh/number/num_add.png"},
                {type="image",url="zjh/number/num_win.png"},

                {type="plist",url="game/plist/game_alert.png",plist="game/plist/game_alert.png"}, 

                {type="armatrue-json",url = "",keyName="zjh/move/YaMan.ExportJson"},
                {type="plist",url="zjh/move/YaMan0.png",plist="zjh/move/YaMan0.plist"},

            },
            -- 加载等待场景
            waitLayer = "zjh/layer/ZJHWaitLayer.lua",
            --快捷聊天
            chat = {12,13,14,15,16,17,18,19,20}
        },      
        -- 炸金花 房卡
        game_8849_2 =
        {
            -- 加载资源
            loader = 
            {
                -- 资源
                res_list = 
                {      
                    {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                    {type="armatrue-json",url = "",keyName="zjh/move/XueChan_JinHua.ExportJson"},
                    {type="armatrue-json",url = "",keyName="game/move/XueChan_KaiShi.ExportJson"},
                    {type="armatrue-json",url = "",keyName="game/move/XueChan_Kuang.ExportJson"},
                    {type="armatrue-json",url = "",keyName="game/move/JieSuan.ExportJson"},

                    {type="plist",url="game/plist/game_alert.png",plist="game/plist/game_alert.png"}, 
                    {type="armatrue-json",url = "",keyName="zjh/move/YaMan.ExportJson"},
                },

                --跳转场景名 
                scene = 
                {
                    packageName = "zjh/ZJHGameScene.lua"
                }
            },

            release = 
            {
                {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},
                
                {type="armatrue-json",url = "",keyName="zjh/move/XueChan_JinHua.ExportJson"},
                {type="plist",url="zjh/move/XueChan_JinHua0.png",plist="zjh/move/XueChan_JinHua0.plist"},
                
                {type="armatrue-json",url = "",keyName="game/move/XueChan_KaiShi.ExportJson"},
                {type="plist",url="game/move/XueChan_KaiShi0.png",plist="game/move/XueChan_KaiShi0.plist"},
                {type="plist",url="game/move/XueChan_KaiShi1.png",plist="game/move/XueChan_KaiShi1.plist"},
                
                {type="armatrue-json",url = "",keyName="game/move/XueChan_Kuang.ExportJson"},
                {type="plist",url="game/move/XueChan_Kuang0.png",plist="game/move/XueChan_Kuang0.plist"},
                
                {type="armatrue-json",url = "",keyName="game/move/JieSuan.ExportJson"},
                {type="plist",url="game/move/JieSuan0.png",plist="game/move/JieSuan0.plist"},

                {type="plist",url="game/plist/face_ui.png",plist="game/plist/face_ui.plist"},
                {type="plist",url="cardgame/plist/card_ui.png",plist="cardgame/plist/card_ui.plist"},

                {type="plist",url="zjh/plist/game_ui.png",plist="cardgame/plist/game_ui.plist"},
                {type="image",url="zjh/image/big/game_bg.png"},

                {type="image",url="zjh/number/num_lost.png"},
                {type="image",url="zjh/number/num_add.png"},
                {type="image",url="zjh/number/num_win.png"},

                {type="plist",url="game/plist/game_alert.png",plist="game/plist/game_alert.png"}, 

                {type="armatrue-json",url = "",keyName="zjh/move/YaMan.ExportJson"},
                {type="plist",url="zjh/move/YaMan0.png",plist="zjh/move/YaMan0.plist"},
            },
            -- 加载等待场景
            waitLayer = "zjh/layer/ZJHWaitLayer.lua",
            --快捷聊天
            chat = {12,13,14,15,16,17,18,19,20}
        },      
        
        -- 二八杠 金币
        game_8853_1 =
        {
            -- 加载资源
            loader = 
            {
                -- 资源
                res_list = 
                {      
                    {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},  
                    {type="plist",url="mjgame/plist/mj_game.png",plist="mjgame/plist/mj_game.plist"}, 
                    {type="plist",url="erbagang/plist/game_ui.png",plist="erbagang/plist/game_ui.plist"},

                    {type="armatrue-json",url = "",keyName="game/move/XueChan_KaiShi.ExportJson"},                
                    {type="armatrue-json",url = "",keyName="game/move/XueChan_Kuang.ExportJson"},
                    
                    {type="armatrue-json",url = "",keyName="erbagang/move/XueChan_Xing.ExportJson"},
                    {type="armatrue-json",url = "",keyName="erbagang/move/jiesuan.ExportJson"},

                    {type="plist",url="game/plist/game_alert.png",plist="game/plist/game_alert.png"}, 

                },

                --跳转场景名 
                scene = 
                {
                    packageName = "erbagang/EBGGameScene.lua"
                }
            },

            release = 
            {

                {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},

                {type="plist",url="erbagang/plist/game_ui.png",plist="erbagang/plist/game_ui.plist"},  
                {type="plist",url="mjgame/plist/mj_game.png",plist="mjgame/plist/mj_game.plist"}, 
                {type="plist",url="game/plist/face_ui.png",plist="game/plist/face_ui.plist"},

                {type="armatrue-json",url = "",keyName="game/move/XueChan_KaiShi.ExportJson"},
                {type="plist",url="game/move/XueChan_KaiShi0.png",plist="game/move/XueChan_KaiShi0.plist"},
                {type="plist",url="game/move/XueChan_KaiShi1.png",plist="game/move/XueChan_KaiShi1.plist"},

                {type="armatrue-json",url = "",keyName="game/move/XueChan_Kuang.ExportJson"},
                {type="plist",url="game/move/XueChan_Kuang0.png",plist="game/move/XueChan_Kuang0.plist"},
                
                {type="image",url="erbagang/image/big/game_bg.png"},
                {type="plist",url="mjgame/plist/mj_game.png",plist="mjgame/plist/mj_game.plist"}, 
                {type="plist",url="erbagang/plist/game_ui.png",plist="erbagang/plist/game_ui.plist"},

                {type="armatrue-json",url = "",keyName="erbagang/move/XueChan_Xing.ExportJson"},
                {type="plist",url="erbagang/move/XueChan_Xing0.png",plist="erbagang/move/XueChan_Xing0.plist"},

                {type="armatrue-json",url = "",keyName="erbagang/move/jiesuan.ExportJson"},
                {type="plist",url="erbagang/move/jiesuan0.png",plist="erbagang/move/jiesuan0.plist"},

                {type="plist",url="game/plist/game_alert.png",plist="game/plist/game_alert.png"}, 

            },
            -- 加载等待场景
            waitLayer = "erbagang/layer/EBGWaitLayer.lua",
            --快捷聊天
            chat = {34,35,36,37,38,39,40,41,42}
        },   
        -- 二八杠 房卡
        game_8853_2 =
        {
            -- 加载资源
            loader = 
            {
                -- 资源
                res_list = 
                {      
                    {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},  
                    {type="plist",url="mjgame/plist/mj_game.png",plist="mjgame/plist/mj_game.plist"}, 
                    {type="plist",url="erbagang/plist/game_ui.png",plist="erbagang/plist/game_ui.plist"} ,    
                    
                    {type="armatrue-json",url = "",keyName="game/move/XueChan_KaiShi.ExportJson"},                
                    {type="armatrue-json",url = "",keyName="game/move/XueChan_Kuang.ExportJson"},

                    {type="armatrue-json",url = "",keyName="erbagang/move/XueChan_Xing.ExportJson"},
                    {type="armatrue-json",url = "",keyName="erbagang/move/jiesuan.ExportJson"},

                    {type="plist",url="game/plist/game_alert.png",plist="game/plist/game_alert.png"}, 
                },

                --跳转场景名 
                scene = 
                {
                    packageName = "erbagang/EBGGameScene.lua"
                }
            },

            release = 
            {

                {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},

                {type="plist",url="erbagang/plist/game_ui.png",plist="erbagang/plist/game_ui.plist"},  
                {type="plist",url="mjgame/plist/mj_game.png",plist="mjgame/plist/mj_game.plist"},
                {type="plist",url="game/plist/face_ui.png",plist="game/plist/face_ui.plist"},
                
                {type="armatrue-json",url = "",keyName="game/move/XueChan_KaiShi.ExportJson"},
                {type="plist",url="game/move/XueChan_KaiShi0.png",plist="game/move/XueChan_KaiShi0.plist"},
                {type="plist",url="game/move/XueChan_KaiShi1.png",plist="game/move/XueChan_KaiShi1.plist"},

                {type="armatrue-json",url = "",keyName="game/move/XueChan_Kuang.ExportJson"},
                {type="plist",url="game/move/XueChan_Kuang0.png",plist="game/move/XueChan_Kuang0.plist"},

                {type="image",url="erbagang/image/big/game_bg.png"},
                {type="plist",url="mjgame/plist/mj_game.png",plist="mjgame/plist/mj_game.plist"}, 
                {type="plist",url="erbagang/plist/game_ui.png",plist="erbagang/plist/game_ui.plist"},

                {type="armatrue-json",url = "",keyName="erbagang/move/XueChan_Xing.ExportJson"},
                {type="plist",url="erbagang/move/XueChan_Xing0.png",plist="erbagang/move/XueChan_Xing0.plist"},

                {type="armatrue-json",url = "",keyName="erbagang/move/jiesuan.ExportJson"},
                {type="plist",url="erbagang/move/jiesuan0.png",plist="erbagang/move/jiesuan0.plist"},

                {type="plist",url="game/plist/game_alert.png",plist="game/plist/game_alert.png"}, 

            },
            -- 加载等待场景
            waitLayer = "erbagang/layer/EBGWaitLayer.lua",
            --快捷聊天
            chat = {34,35,36,37,38,39,40,41,42}
        },
        
        
        -- 红中麻将 金币
        game_8862_1 =
        {
            -- 加载资源
            loader = 
            {
                -- 资源
                res_list = 
                {         
                    
                    {type="plist",url="mjgame/plist/mj_game.png",plist="mjgame/plist/mj_game.plist"}, 

                    {type="armatrue-json",url = "",keyName="mjgame/move/8X_zhuo.ExportJson"},                    
                    {type="armatrue-json",url = "",keyName="mjgame/move/ChiPengGangHu.ExportJson"},                    
                    {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},                           
                    
                },

                --跳转场景名 
                scene = 
                {
                    packageName = "hzmj/HZMJGameScene.lua"
                }
            },

            release = 
            {
                {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},
                
                {type="plist",url="game/plist/face_ui.png",plist="game/plist/face_ui.plist"},
                {type="plist",url="mjgame/plist/mj_game.png",plist="mjgame/plist/mj_game.plist"}, 

                {type="armatrue-json",url = "",keyName="mjgame/move/ChiPengGangHu.ExportJson"},
                {type="plist",url="mjgame/move/ChiPengGangHu0.png",plist="mjgame/move/ChiPengGangHu0.plist"},
                {type="plist",url="mjgame/move/ChiPengGangHu1.png",plist="mjgame/move/ChiPengGangHu1.plist"},
                
                {type="armatrue-json",url = "",keyName="mjgame/move/8X_zhuo.ExportJson"},
                {type="plist",url="mjgame/move/8X_zhuo0.png",plist="mjgame/move/8X_zhuo0.plist"},
                {type="plist",url="mjgame/move/8X_zhuo1.png",plist="mjgame/move/8X_zhuo1.plist"},
                {type="plist",url="mjgame/move/8X_zhuo2.png",plist="mjgame/move/8X_zhuo2.plist"},

                {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},

                -- 游戏内部
                {type="plist",url="hzmj/plist/game_ui.png",plist="hzmj/plist/game_ui.plist"},
                {type="image",url="hzmj/image/big/game_bg.png"},
                {type="image",url="hzmj/image/big/relustAndOver_bg.png"},                
            },
            -- 加载等待场景
            waitLayer = "hzmj/layer/HZMJWaitLayer.lua",
            -- 回放场景
            remarkScene = "hzmj/HZMJRemarkScene.lua",
            --快捷聊天            
            chat = {12,13,14,15,16,17,18,19,20}
        },

        -- 红中麻将 房卡
        game_8862_2 =
        {
            -- 加载资源
            loader = 
            {
                -- 资源
                res_list = 
                {         
                    {type="plist",url="mjgame/plist/mj_game.png",plist="mjgame/plist/mj_game.plist"}, 
                    
                    {type="armatrue-json",url = "",keyName="mjgame/move/8X_zhuo.ExportJson"},                    
                    {type="armatrue-json",url = "",keyName="mjgame/move/ChiPengGangHu.ExportJson"},                    
                    {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                },

                --跳转场景名 
                scene = 
                {
                    packageName = "hzmj/HZMJGameScene.lua"
                }
            },

            release = 
            {
                {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},
                
                {type="plist",url="game/plist/face_ui.png",plist="game/plist/face_ui.plist"},
                {type="plist",url="mjgame/plist/mj_game.png",plist="mjgame/plist/mj_game.plist"}, 

                {type="armatrue-json",url = "",keyName="mjgame/move/ChiPengGangHu.ExportJson"},
                {type="plist",url="mjgame/move/ChiPengGangHu0.png",plist="mjgame/move/ChiPengGangHu0.plist"},
                {type="plist",url="mjgame/move/ChiPengGangHu1.png",plist="mjgame/move/ChiPengGangHu1.plist"},
                
                {type="armatrue-json",url = "",keyName="mjgame/move/8X_zhuo.ExportJson"},
                {type="plist",url="mjgame/move/8X_zhuo0.png",plist="mjgame/move/8X_zhuo0.plist"},
                {type="plist",url="mjgame/move/8X_zhuo1.png",plist="mjgame/move/8X_zhuo1.plist"},
                {type="plist",url="mjgame/move/8X_zhuo2.png",plist="mjgame/move/8X_zhuo2.plist"},


                {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},

                -- 游戏内部
                {type="plist",url="hzmj/plist/game_ui.png",plist="hzmj/plist/game_ui.plist"},
                {type="image",url="hzmj/image/big/game_bg.png"},  
                {type="image",url="hzmj/image/big/relustAndOver_bg.png"},
            },
            -- 加载等待场景
            waitLayer = "hzmj/layer/HZMJWaitLayer.lua",
            -- 回放场景
            remarkScene = "hzmj/HZMJRemarkScene.lua",
            --快捷聊天            
            chat = {12,13,14,15,16,17,18,19,20}
        },
        

        -- 血战麻将 金币
        game_8848_1 =
        {
            -- 加载资源
            loader = 
            {
                -- 资源
                res_list = 
                {         
                    {type="armatrue-json",url = "",keyName="mjgame/move/ChiPengGangHu.ExportJson"},                    
                    {type="plist",url="mjgame/plist/mj_game.png",plist="mjgame/plist/mj_game.plist"},
                    {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},                           
                },

                --跳转场景名 
                scene = 
                {
                    packageName = "scmj/SCMJGameScene.lua"
                }
            },

            release = 
            {
                {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},

                {type="armatrue-json",url = "",keyName="mjgame/move/ChiPengGangHu.ExportJson"},
                {type="plist",url="mjgame/move/ChiPengGangHu0.png",plist="mjgame/move/ChiPengGangHu0.plist"},

                -- {type="armatrue-json",url = "",keyName="mjgame/move/ChiPengGangHu.ExportJson"},
                {type="plist",url="mjgame/move/ChiPengGangHu1.png",plist="mjgame/move/ChiPengGangHu1.plist"},

                {type="image",url="scmj/image/big/game_bg.png"},
                {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},
                {type="plist",url="game/plist/game_public.png",plist="game/plist/game_public.plist"}, 
                {type="plist",url="scmj/plist/game_ui.png",plist="scmj/plist/game_ui.plist"}, 
                {type="plist",url="game/plist/face_ui.png",plist="game/plist/face_ui.plist"},

                {type="plist",url="mjgame/plist/mj_game.png",plist="mjgame/plist/mj_game.plist"},
                {type="plist",url="game/plist/game_alert.png",plist="game/plist/game_alert.png"}, 
            },
            -- 加载等待场景
            waitLayer = "scmj/layer/SCMJWaitLayer.lua",
            -- 回放场景
            remarkScene = "scmj/SCMJRemarkScene.lua",
            --快捷聊天
            chat = {12,13,14,15,16,17,18,19,20}
        },
        
        -- 血战麻将 房卡
        game_8848_2 =
        {
            -- 加载资源
            loader = 
            {
                -- 资源
                res_list = 
                {         
                    {type="armatrue-json",url = "",keyName="mjgame/move/ChiPengGangHu.ExportJson"},                    
                    {type="plist",url="mjgame/plist/mj_game.png",plist="mjgame/plist/mj_game.plist"},
                    {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},                           
                },

                --跳转场景名 
                scene = 
                {
                    packageName = "scmj/SCMJGameScene.lua"
                }
            },

            release = 
            {
                {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},

                {type="armatrue-json",url = "",keyName="mjgame/move/ChiPengGangHu.ExportJson"},
                {type="plist",url="mjgame/move/ChiPengGangHu0.png",plist="mjgame/move/ChiPengGangHu0.plist"},

                -- {type="armatrue-json",url = "",keyName="mjgame/move/ChiPengGangHu.ExportJson"},
                {type="plist",url="mjgame/move/ChiPengGangHu1.png",plist="mjgame/move/ChiPengGangHu1.plist"},

                {type="image",url="scmj/image/big/game_bg.png"},
                {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},
                {type="plist",url="game/plist/game_public.png",plist="game/plist/game_public.plist"}, 
                {type="plist",url="scmj/plist/game_ui.png",plist="scmj/plist/game_ui.plist"}, 
                {type="plist",url="game/plist/face_ui.png",plist="game/plist/face_ui.plist"},

                {type="plist",url="mjgame/plist/mj_game.png",plist="mjgame/plist/mj_game.plist"},
                {type="plist",url="game/plist/game_alert.png",plist="game/plist/game_alert.png"}, 
            },
            -- 加载等待场景
            waitLayer = "scmj/layer/SCMJWaitLayer.lua",
            -- 回放场景
            remarkScene = "scmj/SCMJRemarkScene.lua",
            --快捷聊天
            chat = {12,13,14,15,16,17,18,19,20}
        },

        -- 板子炮 金币
        game_8850_1 =
        {
            -- 加载资源
            loader = 
            {
                -- 资源
                res_list = 
                {      
                    {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},  
                    {type="plist",url="banzipao/plist/game_ui.png",plist="banzipao/plist/game_ui.plist"} ,    
                    {type="plist",url="banzipao/plist/result_ui.png",plist="banzipao/plist/result_ui.plist"} , 
                    {type="armatrue-json",url = "",keyName="banzipao/move/DATING.ExportJson"}, 
                    {type="armatrue-json",url = "",keyName="banzipao/move/jiesuan.ExportJson"},   
                    {type="plist",url="cardgame/plist/card_ui.png",plist="cardgame/plist/card_ui.plist"},     
                    {type="plist",url="game/plist/game_alert.png",plist="game/plist/game_alert.png"},   
                },
     
                --跳转场景名 
                scene = 
                {
                    packageName = "banzipao/BZPGameScene.lua"
                }
            },
     
            release = 
            {
                {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},

                {type="armatrue-json",url = "",keyName="banzipao/move/DATING.ExportJson"},   
                {type="plist",url="banzipao/move/DATING0.png",plist="banzipao/move/DATING0.plist"},    
                {type="plist",url="banzipao/move/DATING1.png",plist="banzipao/move/DATING1.plist"},     
                {type="plist",url="banzipao/move/DATING2.png",plist="banzipao/move/DATING2.plist"},
                {type="plist",url="banzipao/move/DATING3.png",plist="banzipao/move/DATING3.plist"}, 
                
                {type="plist",url="banzipao/plist/game_ui.png",plist="banzipao/plist/game_ui.plist"}, 
                {type="plist",url="banzipao/plist/result_ui.png",plist="banzipao/plist/result_ui.plist"}, 
                {type="plist",url="game/plist/face_ui.png",plist="game/plist/face_ui.plist"},

                {type="plist",url="game/plist/game_public.png",plist="game/plist/game_public.png"}, 
                {type="plist",url="game/plist/game_alert.png",plist="game/plist/game_alert.png"}, 

                {type="armatrue-json",url = "",keyName="banzipao/move/jiesuan.ExportJson"},
                {type="plist",url="banzipao/move/jiesuan0.png",plist="banzipao/move/jiesuan0.plist"},
                
                {type="image",url="banzipao/image/big/game_bg.png"},
                {type="plist",url="cardgame/plist/card_ui.png",plist="cardgame/plist/card_ui.plist"},
            },
            -- 加载等待场景
             waitLayer = "banzipao/layer/BZPWaitLayer.lua",
            -- 回放场景
            remarkScene = "banzipao/BZPRemarkScene.lua",
             --快捷聊天
             chat = {1,2,3,4,5,6,7,8,9,10,11,33}     
         },   

         -- 板子炮 房卡
         game_8850_2 =
         {
             -- 加载资源
             loader = 
             {
                 -- 资源
                 res_list = 
                 {      
                    {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},  
                    {type="plist",url="banzipao/plist/game_ui.png",plist="banzipao/plist/game_ui.plist"} ,    
                    {type="plist",url="banzipao/plist/result_ui.png",plist="banzipao/plist/result_ui.plist"} , 
                    {type="armatrue-json",url = "",keyName="banzipao/move/DATING.ExportJson"},
                    {type="armatrue-json",url = "",keyName="banzipao/move/jiesuan.ExportJson"},       
                    {type="plist",url="cardgame/plist/card_ui.png",plist="cardgame/plist/card_ui.plist"},
                    {type="plist",url="game/plist/game_alert.png",plist="game/plist/game_alert.png"}, 
                 },
 
                 --跳转场景名 
                 scene = 
                 {
                    packageName = "banzipao/BZPGameScene.lua"
                 }
             },
 
             release = 
             {
                {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},

                {type="armatrue-json",url = "",keyName="banzipao/move/DATING.ExportJson"},   
                {type="plist",url="banzipao/move/DATING0.png",plist="banzipao/move/DATING0.plist"},    
                {type="plist",url="banzipao/move/DATING1.png",plist="banzipao/move/DATING1.plist"},     
                {type="plist",url="banzipao/move/DATING2.png",plist="banzipao/move/DATING2.plist"},
                {type="plist",url="banzipao/move/DATING3.png",plist="banzipao/move/DATING3.plist"}, 
                
                {type="plist",url="banzipao/plist/game_ui.png",plist="banzipao/plist/game_ui.plist"}, 
                {type="plist",url="banzipao/plist/result_ui.png",plist="banzipao/plist/result_ui.plist"}, 
                {type="plist",url="game/plist/face_ui.png",plist="game/plist/face_ui.plist"},

                {type="plist",url="game/plist/game_public.png",plist="game/plist/game_public.png"}, 

                {type="armatrue-json",url = "",keyName="banzipao/move/jiesuan.ExportJson"},
                {type="plist",url="banzipao/move/jiesuan0.png",plist="banzipao/move/jiesuan0.plist"},
                
                {type="image",url="banzipao/image/big/game_bg.png"},
                {type="plist",url="cardgame/plist/card_ui.png",plist="cardgame/plist/card_ui.plist"},
                {type="plist",url="game/plist/game_alert.png",plist="game/plist/game_alert.png"}, 
                
             },
            -- 加载等待场景
            waitLayer = "banzipao/layer/BZPWaitLayer.lua",
             -- 回放场景
            remarkScene = "banzipao/BZPRemarkScene.lua",
             --快捷聊天
             chat = {1,2,3,4,5,6,7,8,9,10,11,33}
         },

        
         -- 推筒子 金币
         game_8879_1 =
         {
             -- 加载资源
             loader = 
             {
                 -- 资源
                 res_list = 
                 {      
                    {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},  
                    {type="plist",url="cardgame/plist/card_ui.png",plist="cardgame/plist/card_ui.plist"},
                    {type="plist",url="game/plist/game_alert.png",plist="game/plist/game_alert.png"}, 

                    {type="armatrue-json",url = "",keyName="game/move/XueChan_KaiShi.ExportJson"},
                    {type="armatrue-json",url = "",keyName="game/move/XueChan_Kuang.ExportJson"},

                    {type="armatrue-json",url = "",keyName="wabaozi/move/XueChan_Xing.ExportJson"},
                    {type="armatrue-json",url = "",keyName="wabaozi/move/jiesuan.ExportJson"},
                    {type="armatrue-json",url = "",keyName="wabaozi/move/ZuoMian/ZuoMian.ExportJson"},

                 },
 
                 --跳转场景名 
                 scene = 
                 {
                    packageName = "wabaozi/WBZGameScene.lua"
                 }
             },
 
             release = 
             {
                {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},
                {type="plist",url="wabaozi/plist/game_ui_chips.png",plist="wabaozi/plist/game_ui_chips.plist"},
                
                {type="armatrue-json",url = "",keyName="wabaozi/move/ZuoMian/ZuoMian.ExportJson"},
                {type="plist",url="wabaozi/move/ZuoMian/ZuoMian.png",plist="wabaozi/move/ZuoMian/ZuoMian.plist"},
              

                {type="plist",url="wabaozi/plist/game_ui.png",plist="wabaozi/plist/game_ui.plist"},  
                {type="plist",url="mjgame/plist/mj_game.png",plist="mjgame/plist/mj_game.plist"}, 
                {type="plist",url="game/plist/face_ui.png",plist="game/plist/face_ui.plist"},

                {type="armatrue-json",url = "",keyName="game/move/XueChan_KaiShi.ExportJson"},
                {type="plist",url="game/move/XueChan_KaiShi0.png",plist="game/move/XueChan_KaiShi0.plist"},
                {type="plist",url="game/move/XueChan_KaiShi1.png",plist="game/move/XueChan_KaiShi1.plist"},

                {type="armatrue-json",url = "",keyName="game/move/XueChan_Kuang.ExportJson"},
                {type="plist",url="game/move/XueChan_Kuang0.png",plist="game/move/XueChan_Kuang0.plist"},
                

                {type="image",url="wabaozi/image/big/game_bg.png"},
                {type="image",url="wabaozi/image/big/sprite_result_1.png"},
                {type="image",url="wabaozi/image/big/sprite_result_2.png"},
                {type="plist",url="mjgame/plist/mj_game.png",plist="mjgame/plist/mj_game.plist"}, 
                {type="plist",url="wabaozi/plist/game_ui.png",plist="wabaozi/plist/game_ui.plist"},

                {type="armatrue-json",url = "",keyName="wabaozi/move/XueChan_Xing.ExportJson"},
                {type="plist",url="wabaozi/move/XueChan_Xing0.png",plist="wabaozi/move/XueChan_Xing0.plist"},

                {type="armatrue-json",url = "",keyName="wabaozi/move/jiesuan.ExportJson"},
                {type="plist",url="wabaozi/move/jiesuan0.png",plist="wabaozi/move/jiesuan0.plist"},
                
                {type="armatrue-json",url = "",keyName="wabaozi/move/ZuoMian/ZuoMian.ExportJson"},
                {type="plist",url="wabaozi/move/ZuoMian/ZuoMian0.png",plist="bairendn/move/ZuoMian/ZuoMian0.plist"},
                {type="plist",url="wabaozi/move/ZuoMian/ZuoMian1.png",plist="wabaozi/move/ZuoMian/ZuoMian1.plist"},

             },
            -- 加载等待场景
            waitLayer = "wabaozi/layer/WBZWaitLayer.lua",
             --快捷聊天
             chat = {1,2,3,4,5,6,7,8,9,10,11,33}
         },

                         -- 跑得快 金币
        game_8866_1 =
        {
            -- 加载资源
            loader = 
            {
                -- 资源
                res_list = 
                {      
                    {type="armatrue-json",url = "",keyName="pdk/move/doudizhu_4.ExportJson"},   
                    {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                    {type="armatrue-json",url = "",keyName="pdk/move/jiesuan.ExportJson"},

                    {type="plist",url="cardgame/plist/card_ui.png",plist="cardgame/plist/card_ui.plist"},
                },

                --跳转场景名 
                scene = 
                {
                    packageName = "pdk/PdkGameScene.lua"
                }
            },

            release = 
            {
                {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},

                {type="plist",url="game/plist/face_ui.png",plist="game/plist/face_ui.plist"},
                {type="plist",url="cardgame/plist/card_ui.png",plist="cardgame/plist/card_ui.plist"},

                {type="armatrue-json",url = "",keyName="pdk/move/doudizhu_4.ExportJson"},
                {type="plist",url="pdk/move/doudizhu_40.png",plist="pdk/move/doudizhu_40.plist"},
                {type="plist",url="pdk/move/doudizhu_41.png",plist="pdk/move/doudizhu_41.plist"},
                {type="plist",url="pdk/move/doudizhu_42.png",plist="pdk/move/doudizhu_42.plist"},

                {type="armatrue-json",url = "",keyName="pdk/move/jiesuan.ExportJson"},
                {type="plist",url="pdk/move/jiesuan0.png",plist="pdk/move/jiesuan0.plist"},
                -- {type="plist",url="game/plist/game_public.png",plist="game/plist/game_public.plist"},
                {type="plist",url="game/plist/game_create.png",plist="game/plist/game_create.plist"},
                
                {type="plist",url="common/plist/common_ui.png",plist="common/plist/common_ui.plist"},
                {type="plist",url="game/plist/game_alert.png",plist="game/plist/game_alert.plist"},
                {type="plist",url="pdk/plist/game_ui.png",plist="pdk/plist/game_ui.plist"},
                {type="plist",url="hall/plist/glodGame_ui.png",plist="hall/plist/glodGame_ui.plist"},        
                
                
                {type="image",url="pdk/image/rule/im_bg.png"},
                {type="image",url="pdk/image/big/game_bg.png"},
                
                {type="image",url="game/number/num_win.png"},
                {type="image",url="game/number/num_lose.png"},
                {type="image",url="pdk/number/num_bei.png"},
                {type="image",url="pdk/number/num_lose.png"},
                {type="image",url="pdk/number/num_time.png"},
                {type="image",url="pdk/number/num_win.png"},
                
            },
            -- 加载等待场景
            waitLayer = "pdk/layer/PdkWaitLayer.lua",
            -- 回放场景
            remarkScene = "pdk/PdkRemarkScene.lua",
            --快捷聊天
            chat = {43,44,45,46,47,48,49,50,51,52},
        },
        -- 跑得快 房卡
        game_8866_2 =
        {
            -- 加载资源
            loader = 
            {
                -- 资源
                res_list = 
                {       
                    {type="armatrue-json",url = "",keyName="pdk/move/doudizhu_4.ExportJson"},   
                    {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                    {type="armatrue-json",url = "",keyName="pdk/move/jiesuan.ExportJson"},

                    {type="plist",url="cardgame/plist/card_ui.png",plist="cardgame/plist/card_ui.plist"},
                },

                --跳转场景名 
                scene = 
                {
                    packageName = "pdk/PdkGameScene.lua"
                }
            },

            release = 
            {
                {type="armatrue-json",url = "",keyName="pdk/move/doudizhu_4.ExportJson"},
                {type="plist",url="pdk/move/doudizhu_40.png",plist="pdk/move/doudizhu_40.plist"},
                {type="plist",url="pdk/move/doudizhu_41.png",plist="pdk/move/doudizhu_41.plist"},
                {type="plist",url="pdk/move/doudizhu_42.png",plist="pdk/move/doudizhu_42.plist"},
                -- {type="plist",url="game/plist/game_public.png",plist="game/plist/game_public.plist"},
                {type="plist",url="game/plist/game_create.png",plist="game/plist/game_create.plist"},
                {type="armatrue-json",url = "",keyName="pdk/move/jiesuan.ExportJson"},
                {type="plist",url="pdk/move/jiesuan0.png",plist="pdk/move/jiesuan0.plist"},

                {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},

                {type="plist",url="game/plist/face_ui.png",plist="game/plist/face_ui.plist"},
                {type="plist",url="pdk/plist/game_ui.png",plist="pdk/plist/game_ui.plist"},
                {type="plist",url="cardgame/plist/card_ui.png",plist="cardgame/plist/card_ui.plist"},

                {type="image",url="pdk/image/big/game_bg.png"},
                {type="image",url="pdk/image/rule/im_bg.png"},
                {type="image",url="pdk/number/num_bei.png"},
                {type="image",url="pdk/number/num_lose.png"},
                {type="image",url="pdk/number/num_time.png"},
                {type="image",url="pdk/number/num_win.png"},

                
            },
            -- 加载等待场景
            waitLayer = "pdk/layer/PdkWaitLayer.lua",
            -- 回放场景
            remarkScene = "pdk/PdkRemarkScene.lua",
            --快捷聊天
            chat = {43,44,45,46,47,48,49,50,51,52},
        },

         
         -- 砀山麻将 金币
         game_8887_1 =
         {
             -- 加载资源
             loader = 
             {
                 -- 资源
                 res_list = 
                 {         
                     {type="armatrue-json",url = "",keyName="mjgame/move/ChiPengGangHu.ExportJson"},                    
                     {type="plist",url="mjgame/plist/mj_game.png",plist="mjgame/plist/mj_game.plist"},
                     {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},                           
                 },
 
                 --跳转场景名 
                 scene = 
                 {
                     packageName = "dsmj/DSMJGameScene.lua"
                 }
             },
 
             release = 
             {
                 {type="plist",url="game/plist/face_ui.png",plist="game/plist/face_ui.plist"},
                 {type="plist",url="mjgame/plist/mj_game.png",plist="mjgame/plist/mj_game.plist"}, 
 
                 {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                 {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},
 
                 {type="armatrue-json",url = "",keyName="mjgame/move/ChiPengGangHu.ExportJson"},
                 {type="plist",url="mjgame/move/ChiPengGangHu0.png",plist="game/move/ChiPengGangHu0.plist"},
                 {type="plist",url="mjgame/move/ChiPengGangHu1.png",plist="game/move/ChiPengGangHu1.plist"},
 
 
                 -- 游戏内部
                 {type="plist",url="dsmj/plist/game_ui.png",plist="dsmj/plist/game_ui.plist"},
                 {type="image",url="dsmj/image/big/game_bg.png"},  
                 {type="image",url="dsmj/image/big/relustAndOver_bg.png"},                                  
             },
             -- 加载等待场景
             waitLayer = "dsmj/layer/DSMJWaitLayer.lua",
             -- 回放场景
             remarkScene = "dsmj/DSMJRemarkScene.lua",
             --快捷聊天
             chat = {12,13,14,15,16,17,18,19,20}
         },
         
         -- 砀山麻将 房卡
         game_8887_2 =
         {
             -- 加载资源
             loader = 
             {
                 -- 资源
                 res_list = 
                 {         
                     {type="armatrue-json",url = "",keyName="mjgame/move/ChiPengGangHu.ExportJson"},                    
                     {type="plist",url="mjgame/plist/mj_game.png",plist="mjgame/plist/mj_game.plist"},
                     {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},                           
                 },
 
                 --跳转场景名 
                 scene = 
                 {
                     packageName = "dsmj/DSMJGameScene.lua"
                 }
             },
 
             release = 
             {
                 {type="plist",url="game/plist/face_ui.png",plist="game/plist/face_ui.plist"},
                 {type="plist",url="mjgame/plist/mj_game.png",plist="mjgame/plist/mj_game.plist"}, 
 
                 {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"},
                 {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},
 
                 {type="armatrue-json",url = "",keyName="mjgame/move/ChiPengGangHu.ExportJson"},
                 {type="plist",url="mjgame/move/ChiPengGangHu0.png",plist="game/move/ChiPengGangHu0.plist"},
                 {type="plist",url="mjgame/move/ChiPengGangHu1.png",plist="game/move/ChiPengGangHu1.plist"},
 
 
                 -- 游戏内部
                 {type="plist",url="dsmj/plist/game_ui.png",plist="dsmj/plist/game_ui.plist"},
                 {type="image",url="dsmj/image/big/game_bg.png"},  
                 {type="image",url="dsmj/image/big/relustAndOver_bg.png"},                                  
             },
             -- 加载等待场景
             waitLayer = "dsmj/layer/DSMJWaitLayer.lua",
             -- 回放场景
             remarkScene = "dsmj/DSMJRemarkScene.lua",
             --快捷聊天
             chat = {12,13,14,15,16,17,18,19,20}
         },
         
         -- 五子棋 
        game_8859_2 =
        {
            -- 加载资源
            loader = 
            {
                -- 资源
                res_list = 
                {
                },

                --跳转场景名 
                scene = 
                {
                    packageName = "wzq/WzqGameScene.lua"
                }
            },

            release = 
            {
                {type="plist",url="game/plist/face_ui.png",plist="game/plist/face_ui.plist"},
                {type="plist",url="wzq/plist/game_ui.png",plist="wzq/plist/game_ui.plist"}, 
                {type="image",url="wzq/image/big/game_bg.png"},                
            },
            -- 加载等待场景
            waitLayer = "wzq/layer/WzqWaitLayer.lua",
            --快捷聊天
            chat = 
            {}, 
        },
        
        --百人斗牛 金币
        game_8875_1 =
        {
            -- 加载资源
            loader = 
            {
                -- 资源
                res_list = 
                {      
                    {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"}, 
                    {type="armatrue-json",url = "",keyName="bairendn/move/XiPai.ExportJson"} , 
                    {type="armatrue-json",url = "",keyName="bairendn/move/ZuoMian.ExportJson"} , 
                    
                    {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},
                    {type="plist",url="bairendn/move/ZuoMian0.png",plist="bairendn/move/ZuoMian0.plist"},
                    {type="plist",url="bairendn/move/XiPai0.png",plist="bairendn/move/XiPai0.plist"},
                    
                    {type="plist",url="bairendn/plist/game_ui.png",plist="bairendn/plist/game_ui.plist"}, 
                    {type="plist",url="game/plist/game_public.png",plist="game/plist/game_public.plist"}, 
                    {type="plist",url="cardgame/plist/card_ui.png",plist="cardgame/plist/card_ui.plist"},  
                    {type="plist",url="bairendn/plist/game_other.png",plist="bairendn/plist/game_other.plist"}               
                },

                --跳转场景名 
                scene = 
                {
                    packageName = "bairendn/BRDNGameScene.lua" 
                }
            },

            release = 
            {

                {type="armatrue-json",url = "",keyName="game/move/biaoqing.ExportJson"}, 
                {type="armatrue-json",url = "",keyName="bairendn/move/XiPai.ExportJson"} , 
                {type="armatrue-json",url = "",keyName="bairendn/move/ZuoMian.ExportJson"} , 
                
                {type="plist",url="game/move/biaoqing0.png",plist="game/move/biaoqing0.plist"},
                {type="plist",url="bairendn/move/ZuoMian0.png",plist="bairendn/move/ZuoMian0.plist"},
                {type="plist",url="bairendn/move/ZuoMian1.png",plist="bairendn/move/ZuoMian1.plist"},

                {type="plist",url="bairendn/move/XiPai0.png",plist="bairendn/move/XiPai0.plist"},
                
                {type="plist",url="bairendn/plist/game_ui.png",plist="bairendn/plist/game_ui.plist"}, 
                {type="plist",url="game/plist/game_public.png",plist="game/plist/game_public.plist"}, 
                {type="plist",url="cardgame/plist/card_ui.png",plist="cardgame/plist/card_ui.plist"},  
                {type="plist",url="bairendn/plist/game_other.png",plist="bairendn/plist/game_other.plist"}           
            },
            -- 加载等待场景
            waitLayer = "bairendn/layer/BRDNWaitLayer.lua",
            -- 回放场景
            remarkScene = nil,
            --快捷聊天
            chat = 
            {
            },       
        },

        -- 分享
        share = 
        {
            gameName = "王者棋牌",
            shareUrlCode = "http://wz.bzkfqw.com/jeeplat/we/mp/scan",
            shareUrl = "http://wz.bzkfqw.com/jeeplat/we/mp/shareIndex" 
        },

        -- 充值链接
        recharge = 
        {
            wchat = "http://strIp/jeeplat/wechat/app.do",
            webRecharge = "http://strIp/jeeplat/i/jubaopay/pay.do",            
            thirdParty = "http://strIp/jeeplat/i/appinterface/getPayUrl",

            url_apple_order = "http://strIp/jeeplat/i/apple/v1/createOrder.do",   --苹果内购请求订单
            url_apple_buy = "http://strIp/jeeplat/i/apple/v1/verify.do",   --苹果内购订单验证POST                        
        },
    }