SoundManager = {}

SoundManager.MUSIC=
{
   hall_bg_music = "platfrom/sound/hallbg.mp3",-- 大厅背景音乐
   game_bg_mj_music1 = "scmj/sound/play_bg.mp3",      
   game_bg_dn_music1 = "niuniu/sound/douniu.mp3",
   game_bg_zjh_music1 = "zjh/sound/zhajinhua.mp3",
   game_bg_wzq_music1 = "wzq/sound/wuziqi.mp3",
   game_bg_ebg_music1 = "erbagang/sound/majiang.mp3",   
   game_bg_wbz_music1 = "wabaozi/sound/majiang.mp3",
   game_bg_pdk_music1 = "pdk/sound/play_bg.mp3",
}

SoundManager.PDK_SOUND = 
    {
        fapai = "pdk/sound/common/fapai.mp3",
        dapai = "pdk/sound/common/cupai.mp3",
        xuanpai = "pdk/sound/common/xuanpai.mp3"
    }
    
SoundManager.SOUND =
{
        game_star = "platfrom/sound/game_star.mp3",
        loss      = "platfrom/sound/loss.mp3",
        win      = "platfrom/sound/win.mp3",
        naozhong      = "platfrom/sound/naozhong.mp3",
}

SoundManager.MJ_SOUND = 
{
        mjout = "mjgame/sound/mjout.mp3",
        hu = "mjgame/sound/hu.mp3",
        send_card = "mjgame/sound/opera_wall.mp3",
        touchmj = "mjgame/sound/mopai.mp3"
}

SoundManager.LANDLORDS_SOUND = 
    {
        fapai = "landlords/sound/common/fapai.mp3",
        dapai = "landlords/sound/common/cupai.mp3",
        xuanpai = "landlords/sound/common/xuanpai.mp3"
    }

SoundManager.YAODIREN_SOUND = 
    {
        fapai = "landlords/sound/common/fapai.mp3",
        dapai = "landlords/sound/common/cupai.mp3",
        xuanpai = "landlords/sound/common/xuanpai.mp3"
    }

    SoundManager.BRDN_SOUND=
    {
        game_bj_music = "bairendn/sound/bj.mp3",--百家乐的背景音乐
        game_chip_music = "bairendn/sound/add_gold.wav",--加金币
        game_sendcard_music = "bairendn/sound/sendCard.mp3",
        game_turncard_music = "bairendn/sound/turnCard.mp3" ,--baidu 
        game_kaishibipai_music = "bairendn/sound/kaishibipai.mp3",
        game_wingold_music = "bairendn/sound/gameWin_new.mp3",
        game_losegold_music = "bairendn/sound/gameLose_new.mp3",
        game_kaishiyazhu_music = "bairendn/sound/startYazhu.mp3",
        game_tongsha_music = "bairendn/sound/tongsha.mp3",
        game_tongpei_music = "bairendn/sound/tongpei.mp3", 
        game_coinsBet_music = "bairendn/sound/coins_bet.mp3", 
        game_coinsFly_music = "bairendn/sound/coins_fly.mp3", 
        game_coinsFlyOut_music = "bairendn/sound/coins_fly_out.mp3",  
    }

-- 语音类型 1 系统默认 
SoundManager._voiceType = 1

function SoundManager:new(o)
    o = o or {}
    setmetatable(o,self)
    self.__index = self
    return o
end

function SoundManager:Instance()
    if self.instance == nil then
        self.instance = self:new()
    end
    return self.instance
end



---------------------------
--@param 设置语音类型
--@return
function SoundManager:setVoiceType(value)
    self._voiceType = value
end

---------------------------
--@param 获取语音类型
--@return
function SoundManager:getVoiceType()
    return self._voiceType
end


---------------------------
--播放点击音效
--@param
--@return
function SoundManager:playClickSound()
	audio.playSound("platfrom/sound/ui_click.mp3",false)
end


---------------------------
--直接播放背景音乐
--@param
--@return
function SoundManager:playBgMusicByKey(key)
	audio.playMusic(key,true)
end


---------------------------
--直接播放游戏音效 
--@param
--@return
function SoundManager:playSoundByKey(key)
    audio.playSound(key,false)
end

---------------------------
--播放性别语音
--@param
--@return
function SoundManager:playSexSound(key,sex)
	
end

---------------------------
--@param 设置声音大小为本地音乐记录大小
--@return 
function SoundManager:setLocalSoundVolume()
    --  设置游戏历史记录的音量
    local musicValue = 0.3
    local soundValue = 0.8
    local defaultmusicValue = cc.UserDefault:getInstance():getStringForKey("musicValue")
    local defaultsoundValue = cc.UserDefault:getInstance():getStringForKey("soundValue")
    --
    if defaultmusicValue and defaultmusicValue~= "" then
        musicValue = tonumber(defaultmusicValue)
    end

    if defaultsoundValue and defaultsoundValue~= "" then
        soundValue = tonumber(defaultsoundValue)
    end

    audio.setMusicVolume(musicValue)
    audio.setSoundsVolume(soundValue)
end

