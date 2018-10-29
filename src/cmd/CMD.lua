-- cmd 类
CMD = {}

-- lua层 事件派发基础事件
CMD.CUSTOM = "CUSTOM"

-- 系统底层抛出事件
CMD.SYSTEM = 
    {
        --// 获取微信用户授权 成功
        WCHAT_AUTH_SUCCESS                 = "WCHAT_AUTH_SUCCESS",
        --// 微信其他操作成功
        WCHAT_OTHER_SUCCESS                = "WCHAT_OTHER_SUCCESS",
        -- // 微信错误
        WCHAT_ERROR                        = "WCHAT_ERROR",
        --//获取到手机电量
        BATTERY_VALUE                      = "BATTERY_VALUE",
        --// 获取到手机网络类型
        NET_WORK_TYPE                      = "NET_WORK_TYPE",
        --// 定位失败
        LOCATION_FAIL                      = "LOCATION_FAIL",
        --// 定位成功
        LOCATION_SUCCESS                   = "LOCATION_SUCCESS",
        -- 切换到后台 
        BACK_PAUSE                         = "BACK_PAUSE",
        --        // 获取系统通信录成功
        CONTACT_RETURN                     = "CONTACT_RETURN",
        -- 内存支付成功
        APPLE_BUY_DATA                     = "APPLE_BUY_DATA",
        -- 内购失败
        APPLE_BUY_FAILED                   = "APPLE_BUY_FAILED",
        --// 获取设备唯一标识符
        UUID_RETURN                        = "UUID_RETURN"
    }

-- 用户自定义
CMD.USER_DEFINE = 
    {
        -- 抖动结束
        SHRAK_OVER                         = "SHRAK_OVER",
        -- 返回大厅
        RETURN_HALL                       = "RETURN_HALL",
        -- 用户注销
        USER_CANCLE                        = "USER_CANCLE",
        -- 有语言播放完毕
        SPEARK_PLAY_OVER                   = "SPEARK_PLAY_OVER",
        -- 退出游戏
        EXIT_GAME                          = "EXIT_GAME",
        -- 返回大厅
        RETURN_HALL                        = "RETURN_HALL",
        -- 退出游戏房间
        EXIT_GAME_ROOM                     = "EXIT_GAME_ROOM",
        -- 解释房间
        BREAK_GAME_ROOM                     = "BREAK_GAME_ROOM",
        -- 小结算页面关闭
        CUSTOM_CLOSE_RESULT                  = "CUSTOM_CLOSE_RESULT",
        -- 换房
        CUSTOM_CHANGE_ROOM                    = "CUSTOM_CHANGE_ROOM",
        -- 语言录制结束
        VOICE_STATUS_END                      = "VOICE_STATUS_END",
        -- 游戏模块断线重连服务器链接登录成功
        GAME_RELOGIN_SUC                      = "GAME_RELOGIN_SUC",
        -- 发生动态表情
        SEND_FLY_MOVE                         = "SEND_FLY_MOVE",
        -- 被踢出游戏
        KICK_GAME                             = "KICK_GAME",
        -- 进入任意场景
        GOTO_SCENE                             = "GOTO_SCENE",
        -- 随机进入游戏初级场
        RANDOM_ENTER_GAME                     = "RANDOM_ENTER_GAME",
        -- 取消随机进入游戏
        CANCEL_RANDOM_ENTER_GAME                     = "CANCEL_RANDOM_ENTER_GAME",
        -- 确定输入
        SURE_NUM                                 = "SURE_NUM",
        -- 加入金币游戏
        JOIN_GOLD_GAME                          = "JOIN_GOLD_GAME",
        -- 下载游戏
        DOWNLOAD_GAME                           = "DOWNLOAD_GAME",        
        -- 下载游戏 完成
        DOWNLOAD_GAME_FINISH                    = "DOWNLOAD_GAME_FINISH",        
        -- 完成进入动画
        ENTER_ACT_FINISH                        = "ENTER_ACT_FINISH",
        -- 炸金花 看牌页面关闭
        ZJH_LOOK_CARD_OVER_8849               = "ZJH_LOOK_CARD_OVER_8849",
        -- 比牌结束
        ZJH_COMPARE_OVER_8849                 = "ZJH_COMPARE_OVER_8849",
        -- 炸金花操作玩家确认
        ZJH_DEAL_SURE_8849                    = "ZJH_DEAL_SURE_8849",
        --扣牌
        SEND_KOU                            = "SEND_KOU",
        --板子炮只剩癞子检测
        ONLY_LAI                            = "ONLY_LAI"
    }


-- 网络基础事件
CMD.SOCKET = 
    {
        --网络连接失败
        CONNECTION_FAIL                    = "CONNECTION_FAIL",
        -- 链接成功
        CONNECTION_SUC                    = "CONNECTION_SUC",
        --丢失网络连接
        CONNECTION_LOST                    = "CONNECTION_LOST",
        -- 网络扩展事件
        SOCKET_EXTENDS                     = "SOCKET_EXTENDS"
    }

-- 通用事件
CMD.COMMON = 
    {
        RES_NOTIFY_DISSOLUTION_CONNECT = 999990,--//返回通知释放当前链接
        RES_NOTIFY_CHAT_ARRIVE = 999991,--//返回通知聊天消息到达
        RES_CHAT = 999992,--//返回聊天结果
        REQ_CHAT = 999993,--//请求聊天,--
        RES_NOTIFY_BE_KICK_OUT = 999994,--//返回通知被T除链接
        RES_EXCEPTION_CATCH = 999995,--//返回异常捕获
        RES_HEART_BEAT = 999996,--//返回心跳包
        REQ_HEART_BEAT = 999997,--//请求心跳包
        RES_CONNECT_CREATE = 999998,--//返回链接建立成功
        RES_NOTIFY_ALERT = 999999,--//返回通知提示信息
    }

CMD.LOGIC_SERVER = 
    {
        REQ_LOGIC_LOGIN = 799999,--//请求logic登陆
        RES_LOGIC_LOGIN = 799998,--//返回logic登陆
        REQ_CREATE_GAMEROOM = 799997,--//请求创建房间
        RES_CREATE_GAMEROOM = 799996,--//返回创建房间结果
        RES_NOTIFY_GAMEROOM_CREATE = 799995,--//通知房间被创建
        REQ_JOIN_GAMEROOM = 799994,--//请求加入游戏房间
        RES_JOIN_GAMEROOM = 799993,--//返回加入游戏房间
        RES_NOTIFY_SOMEONE_JOIN_GAMEROOM = 799992,--//通知某人加入游戏房间
        REQ_EXIT_GAMEROOM = 799991,--//请求主动退出游戏房间
        RES_EXIT_GAMEROOM = 799990,--//返回主动退出游戏房间结果
        RES_NOTIFY_SOMEONE_EXIT_GAMEROOM = 799989,--//通知某人退出游戏房间
        REQ_GAME_READY = 799988,--//请求准备游戏
        RES_GAME_READY = 799987,--//返回准备游戏结果



        REQ_DISSOLUTION_GAMEROOM = 799983,--//请求解散房间
        RES_DISSOLUTION_GAMEROOM = 799982,--//返回解散房间结果
        RES_NOTIFY_SOMEONE_REQ_DISSOLUTION_GAMEROOM = 799981,--//返回通知某人请求解散房间
        REQ_AGREE_DISSOLUTION_GAMEROOM = 799980,--//请求同意解散房间
        RES_AGREE_DISSOLUTION_GAMEROOM = 799979,--//返回同意解散房间结果
        RES_NOTIFY_SOMEONE_AGREE_DISSOLUTION_GAMEROOM = 799978,--//返回通知某人同意解散房间
        RES_NOTIFY_GAMEROOM_DISSOLUTION = 799977,--//返回通知游戏房间解散
        RES_NOTIFY_GAMEOVER = 799976,--//返回通知游戏结束
        REQ_GET_ROOM_INFO = 799975,--//请求获取游戏房间信息
        RES_GET_ROOM_INFO = 799974,--//返回获取游戏房间信息结果
        RES_NOTIFY_SOMEONE_GAME_READY = 799973,--//返回通知某人游戏准备状态
        REQ_CHANGE_ONLINE_STATUS = 799972,--//请求改变在线状态
        RES_CHANGE_ONLINE_STATUS = 799971,--//返回改变在线状态结果
        RES_NOTIFY_SOMEONE_CHANGE_ONLINE_STATUS = 799970,--//返回通知某人改变在线状态
        RES_NOTIFY_BIG_CALCULATE_PANEL = 799969,--//返回通知大结算面板
        REQ_CORRECT_TIMER = 799966,--//请求矫正倒计时
        RES_CORRECT_TIMER = 799965,--//返回矫正倒计时
        REQ_QUICK_CHANGE_ROOM = 799964,--//请求快速换桌(金币模式该接口有效)
        RES_QUICK_CHANGE_ROOM = 799963,--//返回快速换桌(金币模式该接口有效)
        RES_NOTIFY_SOMEONE_CHANGE_ROBOT = 799962,--//返回通知某人改变机器人状态
        RES_NOTIFY_CHANGE_TO_OLDROOM = 799961,--返回通知跳转到老的房间(进行加入(快速加入和加入都可能返回该消息))
        REQ_SIT_DOWN = 799960,--坐下
        RES_SIT_DOWN = 799959,--坐下返回值
        RES_NOTIFY_SOMEONE_SIT_DOWN = 799958,--坐下广播
        REQ_STAND_UP = 799957,--站起
        RES_STAND_UP = 799956,--站起返回
        RES_NOTIFY_SOMEONE_STAND_UP = 799955,--站起来广播
        REQ_WATCHER_LIST = 799951,--请求无座位观战者列表
        RES_WATCHER_LIST = 799950,--返回无座位观战者列表
        RES_NOTIFY_CHANGE_TO_OLDROOM = 799961,--//返回通知跳转到老的房间(进行加入(快速加入和加入都可能返回该消息))
        
        RES_NOTIFY_SOMEONE_ENTER_CHARGE = 799954,--//返回通知某人进入到充值阶段
        RES_NOTIFY_ACCOUNTS_CHANGE = 799953,--//返回通知账户信息改变
        RES_NOTIFY_CHARGE_OVER = 799952--//返回通知充值完成
    }

CMD.GATE_SERVER = 
    {
        REQ_GATE_LOGIN = 899999,--//请求gate服务器登陆
        RES_GATE_LOGIN = 899998,--//返回gate服务器登陆
        REQ_GET_ACCOUNTINFO = 899997,--//请求获取账号信息 
        RES_GET_ACCOUNTINFO = 899996,--//返回获取账号信息
        REQ_GET_GAMEZONEINFO_LIST = 899995,--//请求获取游戏信息列表
        RES_GET_GAMEZONEINFO_LIST = 899994,--//返回获取游戏信息列表
        REQ_GET_GAMEZONE_DETAIL = 899993,--//请求获取指定游戏内厅信息
        RES_GET_GAMEZONE_DETAIL = 899992,--//返回获取指定游戏内厅信息
        REQ_JOIN_LOGIC_GAMEROOM = 899991,--//请求加入逻辑服务器游戏房间
        RES_JOIN_LOGIC_GAMEROOM = 899990,--//返回加入逻辑服务器游戏房间
        REQ_QUICK_JOIN_GAMEROOM = 899989,--//请求快速加入游戏房间
        RES_QUICK_JOIN_GAMEROOM = 899988,--//返回快速加入游戏房间结果
        RES_NOTIFY_BROAD_PLAT_MARQUEE = 899987,--//返回通知广播平台跑马灯
        RES_NOTIFY_SELF_DATA_CHANGE = 899986,--//返回通知自身数据改变
        REQ_GET_ROOMBRIFE_LIST = 899985,--//请求获取房间简略信息列表(金币场该接口有数据)
        RES_GET_ROOMBRIFE_LIST = 899984,--//返回获取房间简略信息列表(金币场该接口有数据)
        REQ_CHECK_IN_MATCH = 899983,--//请求检查自己是否在房间
        RES_CHECK_IN_MATCH = 899982,--//返回检查自己是否在房间
        REQ_OPEN_ROOM_REPLACE = 899981,--//请求代开房
        RES_OPEN_ROOM_REPLACE = 899980,--//返回代开放结果
        REQ_OPEN_ROOM_REPLACE_RECORD_LIST = 899979,--//请求我的代开房记录列表
        RES_OPEN_ROOM_REPLACE_RECORD_LIST = 899978,--//返回我的代开房记录列表
        REQ_DISSOLUTION_OPEN_ROOM_REPLACE = 899977,--//请求解散代开房
        RES_DISSOLUTION_OPEN_ROOM_REPLACE = 899976,--//返回解散代开房结果
        REQ_GAME_ROOM_LIST = 899975,--//请求房间列表(金币场)
        RES_GAME_ROOM_LIST = 899974,--//返回房间列表(金币场)
    }

CMD.MATCH_SERVER = 
    {
        REQ_GET_MATCH_LIST = 699999,--//请求获取可报名列表
        RES_GET_MATCH_LIST = 699998,--//返回获取可报名列表
        REQ_SIGNUP_MATCH=699997,--//请求报名比赛
        RES_SIGNUP_MATCH = 699996,--//返回报名比赛结果
        RES_NOTIFY_ENTER_MATCH = 699995,--//返回通知进入比赛
        REQ_CANLE_SIGN_MATCH = 699994,--//请求取消报名
        RES_CANLE_SIGN_MATCH = 699993,--//请求取消报名
        RES_NOTIFY_MATCHROOM_WAITTING_CHANGE = 699992,--//通知比赛房间等待状态变化
        RES_NOTIFY_TIMES_OVER = 699991,--//通知当前轮次结束
        REQ_CONTINUE_MATCH = 699990,--//请求继续比赛
        RES_CONTINUE_MATCH = 699989,--//返回继续比赛结果
    }

CMD.LOGIC_WATCHER=
    {
        REQ_SEAT_DOWN = 799799,--//请求坐下
        RES_SEAT_DOWN = 799798,--//返回坐下结果
        REQ_BE_WATHER = 799797,--//请求成为观战者
        RES_BE_WATHER = 799796,--//请求成为观战者
        RES_NOTIFY_ADD_WATHER = 799795,--//通知增加观战者
        RES_NOTIFY_REMOVE_WATHER = 799794,--//通知减少观战者
    }

CMD.XUECHAN_SERVER = 
    {
        RES_NOTIFY_XUECHAN_GAMESTART = 789999,--//返回通知雪禅斗地主游戏开始
        REQ_DO_OPERATE = 789998,--//庄家请求雪禅抓地主
        RES_DO_OPERATE = 789997,--//返回抓地主操作数据
        RES_NOTIFY_CHANGE_OPERATE_POS = 789996,--//通知返回改变操作位置
        RES_NOTIFY_SELF_CARDS = 789995,--//通知返回自己的手牌信息
        RES_NOTIFY_CHANGE_DISPACHER = 789994,--//通知改变出牌玩家
        REQ_DISPACHER_CARD = 789993,--//请求出牌
        RES_DISPACHER_CARD = 789992,--//返回出牌结果
        REQ_GET_SELF_CARD_INFO = 789991,--//获取个人手牌信息
        RES_GET_SELF_CARD_INFO = 789990,--//返回获取个人手牌信息
        REQ_CALCULATE_PANEL = 789989,--//请求获取小结算面板
        RES_CALCULATE_PANEL = 789988,--//返回获取小结算面板
        REQ_BIG_CALCULATE_PANEL = 789987,--//请求获取大结算面板
        RES_BIG_CALCULATE_PANEL = 789986,--//返回获取大结算面板数据
        REQ_RECOVER_GAMESCEEN = 789985,--//请求恢复游戏场景数据
        RES_RECOVER_GAMESCEEN = 789984,--//返回恢复游戏场景数据
    }


CMD.DOUNIU_SERVER = 
    {
        REQ_QIANGZHUANG_8854 = 709998,--//请求抢庄
        RES_QIANGZHUANG_8854 = 709997,--//返回抢庄
        RES_NOTIFY_SOMEONE_QIANGZHUANG_8854 = 709996,--//返回通知某人抢庄
        RES_NOTIFY_GAME_START_8854 = 709995,--//返回通知游戏开始
        RES_NOTIFY_DISPACH_CARD_8854 = 709994,--//返回通知发手牌
        REQ_YAZHU_8854 = 709992,--//请求押注
        RES_YAZHU_8854 = 709991,--//返回押注
        RES_NOTIFY_SOMEONE_YAZHU_8854 = 709990,--//返回通知某人押注
        RES_NOTIFY_DISPACH_LEFT_CARD_8854 = 709989,--//返回通知发剩余的牌
        REQ_LIANG_PAI_8854 = 709988,--//请求亮牌
        RES_LIANG_PAI_8854 = 709987,--//返回亮牌
        RES_NOTIFY_SOMEONE_LIANG_PAI_8854 = 709986,--//返回通知某人亮牌
        REQ_SMALL_CALCULATE_PANEL_8854 = 709985,--//请求小结算面板
        RES_SMALL_CALCULATE_PANEL_8854 = 709984,--//返回小结算面板
        REQ_BIG_CALCULATE_PANEL_8854 = 709983,--//请求大结算面板
        RES_BIG_CALCULATE_PANEL_8854 = 709982,--//返回大结算面板
        REQ_RECOVER_GAMESCEEN_8854 = 709981,--//请求恢复场景
        RES_RECOVER_GAMESCEEN_8854 = 709980,--//返回恢复场景
    }

CMD.JINHHUA_SERVER = 
    {
        REQ_RECOVER_GAMESCEEN_8849 = 759999,--//恢复场景
        RES_RECOVER_GAMESCEEN_8849 = 759998,--//恢复场景反馈
        RES_NOTIFY_GAME_BEGIN_8849 = 759997,--//开始游戏
        RES_NOTIFY_TURN_PLAY_8849 = 759996,--//通知玩家操作
        REQ_LOOK_8849 = 759995,--//看牌
        RES_LOOK_8849 = 759994,--//看牌反馈（自己）
        RES_NOTIFY_LOOK_8849 = 759993,--//看牌反馈(广播)
        REQ_GIVE_UP_8849 = 759992,--//弃牌
        RES_GIVE_UP_8849 = 759991,--//弃牌反馈（自己）
        RES_NOTIFY_GIVE_UP_8849 = 759990,--//弃牌反馈(广播)
        REQ_BET_8849 = 759989,--//跟注/加注
        RES_BET_8849 = 759988,--//跟注/加注反馈（自己）
        RES_NOTIFY_BET_8849 = 759987,--//跟注/加注反馈（广播）
        REQ_COMPARE_8849 = 759986,--//比牌
        RES_COMPARE_8849 = 759985,--//比牌反馈（自己）
        RES_NOTIFY_COMPARE_8849 = 759984,--//比牌反馈（广播）
        REQ_KAI_8849 = 759983,--//开牌
        RES_KAI_8849 = 759982,--//开牌反馈（自己）
        RES_NOTIFY_KAI_8849 = 759981,--//开牌反馈（广播）
        REQ_CALCULATE_PANEL_8849 = 759980,--//请求获取小结算面板
        RES_CALCULATE_PANEL_8849 = 759979,--//返回获取小结算面板
        REQ_BIG_CALCULATE_PANEL_8849 = 759978,--//请求获取大结算面板
        RES_BIG_CALCULATE_PANEL_8849 = 759977,--//返回获取大结算面板数据
    }    

CMD.SCCDMJ_SERVER = 
    {
        RES_NOTIFY_GAMESTART_8848 = 769999,--//开始
        REQ_CHANGE_CARD_8848 = 769998,--//换牌请求
        RES_CHANGE_CARD_8848 = 769997,--//换牌返回
        RES_NOTIFY_CHANGE_CARD_INFO_8848 = 769996,--//通知换牌完成情况
        RES_NOTIFY_CHANGE_CARD_SUCC_8848 = 769995,--//通知换牌成功
        REQ_DING_QUE_8848 = 769994,--//定缺请求
        RES_DING_QUE_8848 = 769993,--//定缺返回
        RES_NOTIFY_DING_QUE_INFO_8848 = 769992,--//-- 广播谁定缺成功
        RES_NOTIFY_DING_QUE_RESULT_8848 = 769991,--//定缺结果
        RES_NOTIFY_SP_CTRL_CARD_8848 = 769990,--//特殊操作牌(1碰,2明杠,3胡,4暗杠,5点杠,)
        REQ_CTRL_CARD_8848 = 769989,--//操作类型（1过,2碰,3明杠,4胡,5暗杠,6点杠，7自摸）
        RES_CTRL_CARD_8848 = 769988,--//广播玩家操作(1过,2碰,3明杠,4胡,5暗杠,6点杠) 
        RES_NOTIFY_CTRL_CARD_8848 = 769987,--//广播玩家操作(1过,2碰,3明杠,4胡,5暗杠,6点杠) 
        RES_NOTIFY_GET_CARD_8848 = 769986,--//起牌
        RES_NOTIFY_OUT_CARD_DIRECTION_8848 = 769985,--//通知出牌方位
        REQ_OUT_CARD_8848 = 769984,--//出牌请求
        RES_OUT_CARD_8848 = 769983,--//出牌请求返回
        RES_NOTIFY_OUT_CARD_8848 = 769982,--//广播有玩玩家打牌
        RES_NOTIFY_GAME_STATUS_8848 = 769981,--//通知前端游戏状态更新
        RES_NOTIFY_GAME_COUNT_DOWN_8848 = 769980,--//通知前端游戏时间

        REQ_CALCULATE_PANEL_8848 = 769899,--//请求获取小结算面板
        RES_CALCULATE_PANEL_8848 = 769898,--//返回获取小结算面板
        REQ_BIG_CALCULATE_PANEL_8848 = 769897,--//请求获取大结算面板
        RES_BIG_CALCULATE_PANEL_8848 = 769896,--//返回获取大结算面板

        REQ_RECOVER_GAMESCEEN_8848 = 769895,--//请求恢复游戏场景数据
        RES_RECOVER_GAMESCEEN_8848 = 769894,--//返回恢复游戏场景数据
    }


CMD.WUZIQI_SERVER = 
    {
        REQ_SET_XUEFEI_8859 = 399998,--//请求设置学费
        RES_SET_XUEFEI_8859 = 399997,--//返回设置学费
        RES_NOTIFY_SOMEONE_SET_XUEFEI_8859 = 399996,--//通知某人设置学费
        REQ_SHOU_XUEFEI_8859 = 399995,--//请求收学费
        RES_SHOU_XUEFEI_8859 = 399994,--//返回收学费
        REQ_RECOVER_GAMESCEEN_8859 = 399993,--//请求恢复场景
        RES_RECOVER_GAMESCEEN_8859 = 399992,--//返回恢复场景
        RES_NOTIFY_SHOU_XUEFEI_SUCCESS_8859 = 399991,--//通知收学费成功
        REQ_WUZIQI_GAMEROOM_8859 = 399990,--//请求五子棋房间信息
        RES_WUZIQI_GAMEROOM_8859 = 399989,--//返回五子棋房间信息
    }

CMD.EBG_SERVER = 
    {
        RES_NOTIFYQIANGZHUANG=379999,--通知抢庄
        REQ_QIANGZHUANG=379998,--抢庄请求
        RES_QIANGZHUANGSTATUS=379997,--抢庄回调(成功或者重复抢庄)
        RES_ZHUANGJIAID=379996,--广播当前房间庄家的id
        RES_XIAZHU=379995,--通知下注
        REQ_XIAZHUBEISHU=379994,--下注的分数
        RES_XIAZHUSTATUS=379993,--下注回调(成功或者重复抢庄)
        RES_KAIPAI=379992,--所有玩家下注以后开牌
        REQ_REQKAIPAI=379991,--请求开牌
        RES_RESKAIPAISTATUS=379990,--回调开牌
        --RES_NOTIFY_GAMEOVER=379989,--通知小结算
        REQ_SMALLGAMEOVER=379988,--请求小结算
        RES_SMALLGAMEOVERRESULTS=379987,--返回小结算结果
        --RES_NOTIFY_BIG_CALCULATE_PANEL_VALUE=379986,--通知大结算
        REQ_BIGGAMEOVER=379985,--请求大结算
        RES_BIGGAMEOVERRESULTS=379984,--大计算结果
        REQ_CGAMEHALFWAYBACK=379983,--请求中途回复
        RES_SGAMEHALFWAYBACK=379982,--返回中途恢复信息
        RES_FAIPA=379981,--发牌
        RES_GAMESTART=379980,--通知游戏开始
        REQ_ZHUANGJIAGAMESTART=379979,--房主第一局请求游戏开始
        RES_ZHUANGJIAGAMESTARTSTATUS=379978,--房主开始游戏返回

        RES_RADIO_QIANGZHUANG=379977,--广播抢庄
        RES_RADIO_XIAZHU=379976,--广播下注
        RES_RADIO_KAIPAI=379975,--广播开牌
    }


    CMD.HZMJ_SERVER = 
    {
        RES_NOTIFY_GAMESTART_8862 = 629999;--//开始
        RES_NOTIFY_SP_CTRL_CARD_8862 = 629990;--//特殊操作牌(1碰,2明杠,3胡,4暗杠,5点杠,)
        REQ_CTRL_CARD_8862 = 629989;--//操作类型（1过,2碰,3明杠,4胡,5暗杠,6点杠，7自摸）
        RES_CTRL_CARD_8862 = 629988;--//广播玩家操作(1过,2碰,3明杠,4胡,5暗杠,6点杠) 
        RES_NOTIFY_CTRL_CARD_8862 = 629987;--//广播玩家操作(1过,2碰,3明杠,4胡,5暗杠,6点杠) 
        RES_NOTIFY_GET_CARD_8862 = 629986;--//起牌
        REQ_OUT_CARD_8862 = 629984;--//出牌请求
        RES_OUT_CARD_8862 = 629983;--//出牌请求返回
        RES_NOTIFY_OUT_CARD_8862 = 629982;--//广播有玩玩家打牌
        RES_NOTIFY_GAME_STATUS_8862 = 629981;--//通知前端游戏状态更新
        RES_NOTIFY_GAME_COUNT_DOWN_8862 = 629980;--//倒计时更新 广播
        
        REQ_CALCULATE_PANEL_8862 = 629899;--//请求获取小结算面板
        RES_CALCULATE_PANEL_8862 = 629898;--//返回获取小结算面板
        REQ_BIG_CALCULATE_PANEL_8862 = 629897;--//请求获取大结算面板
        RES_BIG_CALCULATE_PANEL_8862 = 629896;--//返回获取大结算面板
        
        REQ_RECOVER_GAMESCEEN_8862 = 629895;--//请求恢复游戏场景数据
        RES_RECOVER_GAMESCEEN_8862 = 629894;--//返回恢复游戏场景数据
    }

    CMD.BZP_SERVER = 
    {
        RES_NOTIFY_BANZIPAO_BEGIN_8850 = 749999;--返回通知板子炮开始
        RES_NOTIFY_CHANGE_DO_OPERATE_8850 = 749998;--返回通知改变做操作玩家
        REQ_DO_OPERATE_8850 = 749997;--请求做操作
        RES_DO_OPERATE_8850 = 749996;--返回做操作
        RES_NOTIFY_CHANGE_DISPATHER_8850 = 749995;--返回通知改变出牌玩家
        REQ_DISPATH_CARD_8850 = 749994;--请求出牌
        RES_DISPATH_CARD_8850 = 749993;--返回出牌结果
        REQ_CALCULATE_PANEL_8850 = 749992;--请求获取小结算面板
        RES_CALCULATE_PANEL_8850 = 749991;--返回获取小结算面板
        REQ_BIG_CALCULATE_PANEL_8850 = 749990;--请求获取大结算面板
        RES_BIG_CALCULATE_PANEL_8850 = 749989;--返回获取大结算面板数据
        REQ_RECOVER_GAMESCEEN_8850 = 749988;--请求恢复游戏场景数据
        RES_RECOVER_GAMESCEEN_8850 = 749987;--返回恢复游戏场景数据
        REQ_HUAN_8850 = 749986;--请求选择换两张的牌张
        RES_HUAN_8850 = 749985;--返回换两张
        RES_NOTIFY_HUAN_8850 = 749984;--返回通知换两张
    }

    CMD.WBZ_SERVER = 
    {
        REQ_WANNA_BANKER_LIST=309999,--上庄列表请求
        RES_WANNA_BANKER_LIST=309998,--上庄列表返回
        REQ_WANNA_BANKER=309997,--上下庄请求
        RES_WANNA_BANKER=309996,--上下庄返回
        RES_GAMESTART=309995,--游戏开始
        REQ_BET=309994,--下注请求
        RES_BET=309993,--下注返
        REQ_SMALLGAMEOVER=309988,--小结算请求
        RES_SMALLGAMEOVER=309987,--小结算返回
        REQ_RECOVER_GAMESCEEN = 309983,--请求恢复游戏场景数据
        RES_RECOVER_GAMESCEEN = 309982,--返回恢复游戏场景数据 
        REQ_CONTROLLER_LIST=309980,--玩家列表请求
        RES_CONTROLLER_LIST=309979,--玩家列表返回
        REQ_GAEM_RECORD_LIST=309978,--游戏记录请求
        RES_GAEM_RECORD_LIST=309977,--游戏记录返回
        REQ_SOFA=309976,--沙发请求
        RES_SOFA=309975,--沙发返回
        RES_BANKER_UPD=309974,--换庄通知
        RES_TICKET_OUT = 309971--通知踢出房间
    }

    CMD.PDK_SERVER = 
    {
        RES_NOTIFY_PAODEKUAI_GAMESTART_8866 = 580000,--;//返回通知跑得快游戏开始
        RES_NOTIFY_CHANGE_OPERATE_POS_8866 = 580001,--;//通知返回改变操作位置
        RES_NOTIFY_SELF_CARDS_8866 = 580002,--;//通知返回自己的手牌信息
        RES_NOTIFY_SPADES_OUT_CARD_CHAIR_8866 = 580003,--;//通知先出牌玩家的座位号
        RES_NOTIFY_CHANGE_DISPACHER_8866 = 580004,--;//通知改变出牌玩家
        REQ_DISPACHER_CARD_8866 = 580005,--;//请求出牌
        RES_DISPACHER_CARD_8866 = 580006,--;//返回出牌结果
       
        REQ_CALCULATE_PANEL_8866 = 580007,--;//请求获取小结算面板
        RES_CALCULATE_PANEL_8866 = 580008,--;//返回获取小结算面板
        REQ_BIG_CALCULATE_PANEL_8866 = 580009,--;//请求获取大结算面板
        RES_BIG_CALCULATE_PANEL_8866 = 580010,--;//返回获取大结算面板数据
        REQ_RECOVER_GAMESCEEN_8866 = 580012,--;//请求恢复游戏场景数据
        RES_RECOVER_GAMESCEEN_8866 =580013,--;//返回恢复游戏场景数据
        RES_NOTIFY_RESTART_GAME_8866 = 580015,--;//返回通知重新开始
        
    }
    
    CMD.BRDN_SERVER = {
        RES_NOTIFY_GAME_START_8875 = 349999,--返回通知游戏开始
        REQ_YAZHU_8875 = 349998,--请求押注
        RES_YAZHU_8875 = 349997,--返回押注
        RES_NOTIFY_FAPAI_8875 = 349995,--通知发牌
        REQ_JIESUAN_8875 = 349994,--请求结算
        RES_JIESUAN_8875 = 349993,--返回结算
        REQ_ROOM_HISTORY_8875 = 349992,--请求房间历史纪录
        RES_ROOM_HISTORY_8875 = 349991,--返回房间历史纪录
        REQ_JOIN_GAME_8875 = 349990,--请求加入游戏
        RES_JOIN_GAME_8875 = 349989,--返回加入游戏
        RES_NOTIFY_TICHU_8875 = 349988,--通知踢出房间
        RES_NOTIFY_YAZHU_8875 = 349987,--通知押注
        REQ_RECOVER_GAMESCEEN_8875 = 349986,----恢复场景
        RES_RECOVER_GAMESCEEN_8875 = 349985,--恢复场景反馈
        REQ_CHECK_TIME_8875 = 349984,--请求校对时间
        RES_CHECK_TIME_8875 = 349983,--返回时间校对
        RES_NOTIFY_XIPAI_8875 = 349982, --通知洗牌
    
        RES_GETUSERSINFO_8875=349974,--返回房间内玩家的信息
        REQ_SITDOWN_8875=349981,--请求坐下
        RES_SITDOWN_8875=349980,--返回坐下
        RES_NOTIFY_SHUAXIN_8875=349979,--广播刷新
        REQ_SHANGZHUANG_8875=349978,--请求上庄
        RES_SHANGZHUANG_8875=349977,--返回上庄
        RES_NOTIFY_SHANGZHUANG_8875=349976,--广播上庄
        REQ_GETUSERSINFO_8875=349975,--请求房间内玩家的信息
        RES_GETUSERSINFO_8875=349974,--返回房间内玩家的信息
    
        REQ_EXITROOM_8875=349973,--玩家退出房间前-请求
        RES_EXITROOM_8875=349972,--玩家退出房间前-返回
    
        REQ_SHUANXIN_8875=349971,--刷新庄和坐下玩家的信息
        RES_SHUANXIN_8875=349970,--返回庄和坐下玩家的信息
    
        REQ_SHANGZHUANGLIST_8875=349969,--获取上庄的玩家列表
        RES_SHANGZHUANGLIST_8875=349968,--返回上庄的玩家列表
    
        REQ_DOWNZHUANG_8875=349967,--玩家主动下庄
        RES_DOWNZHUANG_8875=349966,--返回玩家下庄结果
    
        REQ_CARDSRECORD_8875=349963;--请求 每副牌的输赢记录 天地玄黄
        RES_CARDSRECORD_8875=349962;--返回 每副牌的输赢记录 天地玄黄
        
            --通知玩家庄家和坐下条件不足  
        RES_OUTZHUANG_8875=349965;--返回玩家不满足庄家条件被下庄    1是在上庄列表中   2是在当庄的时候被下庄
        RES_OUTSIT_8875=349964;--返回玩家条件不满足，起来
        RES_NOTIFY_USERNUM_8875 = 349961,--//广播房间人数
        
        RES_NOTIFY_UPDATESTATUS_8875 = 349960;--//时间房间状态更新
    }
    
    
        --砀山麻将
    CMD.DSMJ_SERVER = 
    {
        RES_NOTIFY_GAMESTART_8887 = 609999;--//开始
        
        REQ_DING_ZHUANG_CARD_8887 = 609998;--//请求定庄翻牌
        RES_DING_ZHUANG_CARD_8887 = 609997;--//返回定庄翻牌
        RES_NOTIFY_DING_ZHUANG_CARD_8887 = 609996;--//广播定庄翻牌
        RES_NOTIFY_DING_ZHUANG_RESULT_8887 = 609995;--//广播定庄翻牌
        
        REQ_XIA_MA_8887 = 609994;--//请求下马
        RES_XIA_MA_8887 = 609993;--//返回下马
        RES_NOTIFY_XIA_MA_8887 = 609992;--//广播下马
        
        RES_NOTIFY_FA_PAI_8887 = 609991;--//开始
        RES_NOTIFY_SP_CTRL_CARD_8887 = 609990;--//特殊操作牌(1碰,2明杠,3胡,4暗杠,5点杠,)
        REQ_CTRL_CARD_8887 = 609989;--//操作类型（1过,2碰,3明杠,4胡,5暗杠,6点杠，7自摸）
        RES_CTRL_CARD_8887 = 609988;--//广播玩家操作(1过,2碰,3明杠,4胡,5暗杠,6点杠) 
        RES_NOTIFY_CTRL_CARD_8887 = 609987;--//广播玩家操作(1过,2碰,3明杠,4胡,5暗杠,6点杠) 
        RES_NOTIFY_GET_CARD_8887 = 609986;--//起牌
        REQ_OUT_CARD_8887 = 609984;--//出牌请求
        RES_OUT_CARD_8887 = 609983;--//出牌请求返回
        RES_NOTIFY_OUT_CARD_8887 = 609982;--//广播有玩玩家打牌
        RES_NOTIFY_GAME_STATUS_8887 = 609981;--//通知前端游戏状态更新
        RES_NOTIFY_GAME_COUNT_DOWN_8887 = 609980;--//倒计时更新 广播
        REQ_TING_8887 = 609979;--//听牌请求
        RES_TING_8887 = 609978;--//返回听牌请求
        RES_NOTIFY_TING_8887 = 609977;--//广播听牌
        
        
        REQ_CALCULATE_PANEL_8887 = 609899;--//请求获取小结算面板
        RES_CALCULATE_PANEL_8887 = 609898;--//返回获取小结算面板
        REQ_BIG_CALCULATE_PANEL_8887 = 609897;--//请求获取大结算面板
        RES_BIG_CALCULATE_PANEL_8887 = 609896;--//返回获取大结算面板
        
        REQ_RECOVER_GAMESCEEN_8887 = 609895;--//请求恢复游戏场景数据
        RES_RECOVER_GAMESCEEN_8887 = 609894;--//返回恢复游戏场景数据
    }
