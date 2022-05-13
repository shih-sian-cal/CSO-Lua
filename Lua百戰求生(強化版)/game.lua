G = {
    R = Game.Rule,
    SV = Game.SyncValue,
    EB = Game.EntityBlock,
    MT = Game.MONSTERTYPE,
    M = Game.Monster,
    WT = Game.WEAPONTYPE,
    WC = Game.WEAPONCOLOR,
}

G.R.friendlyfire = false
G.R.enemyfire = true
G.R.respawnTime = 5
G.R.respawnable = true

-- 重生點座標
HOMEpos = {x = -189,y = -188, z = 1}
-- 各關卡座標
LEVEL = {
	[1] = {x = -175,y = -179, z = 5},
	[2] = {x = -114,y = -172, z = 5},
	[3] = {x = -61,y = -175, z = 5},
	[4] = {x = -45,y = -179, z = 5},
	[5] = {x = -9,y = -155, z = 5},
	[6] = {x = 41,y = -151, z = 5},
	[7] = {x = 71,y = -155, z = 5},
	[8] = {x = 116,y = -179, z = 5},
	[9] = {x = 163,y = -151, z = 5},
	[10] = {x = 179,y = -134, z = 5},
}

players = {} -- 玩家資訊
level_pos = HOMEpos -- 目前進度座標
player_pos = {}
playcoin = 0
LEVEL_MIN = 1 -- 玩家最低等級
LEVEL_MAX = 50 -- 玩家最高等級
STPV = 0 -- 人稱切換
LKill = 0 -- 區域擊殺
SGTF = 0
LCM = 0
LVM = 0
GPW = {}
GSW = {}
n = '珍惜現在所擁有'

MHP =  G.SV.Create('MHP')
HP =  G.SV.Create('HP')
CHP =  G.SV.Create('CHP')
MAP =  G.SV.Create('MAP')
AP = G.SV.Create('AP')
CAP = G.SV.Create('CAP')

CPEXP = G.SV.Create('CPEXP')
PLEVEL = G.SV.Create('PLEVEL')
PEXP = G.SV.Create('PEXP')

SD = G.SV.Create('SD')
CCSD = G.SV.Create('CCSD')

KNL = G.SV.Create('KNL')
POS = G.SV.Create('POS')

NOtip = G.SV.Create('NOtip')
NOHAP = G.SV.Create('NOHAP')
NOWPN = G.SV.Create('NOWPN')

-- 各玩家升級專屬座標
P_WP = {
	[1] = {x = -185, y = -179, z = 0},
	[2] = {x = -185, y = -177, z = 0},
	[3] = {x = -185, y = -175, z = 0},
	[4] = {x = -185, y = -173, z = 0},
	[5] = {x = -185, y = -171, z = 0},
	[6] = {x = -185, y = -169, z = 0},
	[7] = {x = -185, y = -167, z = 0},
	[8] = {x = -185, y = -165, z = 0},
	[9] = {x = -185, y = -163, z = 0},
	[10] = {x = -185, y = -161, z = 0},
	[11] = {x = -185, y = -159, z = 0},
	[12] = {x = -185, y = -157, z = 0},
	[13] = {x = -185, y = -155, z = 0},
	[14] = {x = -185, y = -153, z = 0},
	[15] = {x = -185, y = -151, z = 0},
	[16] = {x = -185, y = -149, z = 0},
	[17] = {x = -185, y = -147, z = 0},
	[18] = {x = -185, y = -145, z = 0},
	[19] = {x = -185, y = -143, z = 0},
	[20] = {x = -185, y = -141, z = 0},
	[21] = {x = -185, y = -139, z = 0},
	[22] = {x = -185, y = -137, z = 0},
	[23] = {x = -185, y = -135, z = 0},
	[24] = {x = -185, y = -133, z = 0}
}

-- 各區域怪物編號
MK = {
    [10] = {
        [1] = 11,
        [2] = 12,
        [3] = 13,
        [4] = 14,
        [5] = 15
    },
    [20] = {
        [1] = 21,
        [2] = 22,
        [3] = 23,
        [4] = 24,
        [5] = 25
    },
    [30] = {
        [1] = 31,
        [2] = 32,
        [3] = 33,
        [4] = 34,
        [5] = 35
    },
    [40] = {
        [1] = 41,
        [2] = 42,
        [3] = 43,
        [4] = 44,
        [5] = 45
    },
    [50] = {
        [1] = 51,
        [2] = 52,
        [3] = 53,
        [4] = 54,
        [5] = 55
    },
    [60] = {
        [1] = 61,
        [2] = 62,
        [3] = 63,
        [4] = 64,
        [5] = 65
    },
    [70] = {
        [1] = 71,
        [2] = 72,
        [3] = 73,
        [4] = 74,
        [5] = 75
    },
    [80] = {
        [1] = 81,
        [2] = 82,
        [3] = 83
    },
    [90] = {
        [1] = 91
    },
    [100] = {
        [1] = 101
    }
}

-- 怪物生成位置
LVpos = {
    LV01 = {
        [1] = {x = -170, y = -155, z = 5},
        [2] = {x = -155, y = -170, z = 5}
    },
    LV02 = {
        [1] = {x = -125, y = -155, z = 5},
        [2] = {x = -105, y = -155, z = 5}
    },
    LV03 = {
        [1] = {x = -65, y = -155, z = 5},
        [2] = {x = -85, y = -155, z = 5}
    },
    LV04 = {
        [1] = {x = -30, y = -155, z = 5},
        [2] = {x = -30, y = -170, z = 5}
    },
    LV05 = {
        [1] = {x = 15, y = -155, z = 5},
        [2] = {x = -5, y = -175, z = 5}
    },
    LV06 = {
        [1] = {x = 35, y = -160, z = 5},
        [2] = {x = 55, y = -160, z = 5},
        [3] = {x = 45, y = -170, z = 4}
    },
    LV07 = {
        [1] = {x = 90, y = -160, z = 5},
        [2] = {x = 75, y = -170, z = 5},
        [3] = {x = 95, y = -175, z = 5}
    },
    LV08 = {
        [1] = {x = 135, y = -155, z = 5},
        [2] = {x = 135, y = -175, z = 5},
        [3] = {x = 120, y = -155, z = 5}
    },
    LV09 = {
       [1] = {x = 165, y = -160, z = 5},
       [2] = {x = 175, y = -160, z = 5},
       [3] = {x = 155, y = -160, z = 5}
    },
    LV10 = {
       [1] = {x = 165, y = -125, z = 5},
       [2] = {x = 177, y = -113, z = 5},
       [3] = {x = 154, y = -136, z = 5},
       [4] = {x = 154, y = -113, z = 5}
    }
}

-- 計算各區域怪物擊殺
LVC = {
    [10] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0
    },
    [20] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0
    },
    [30] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0
    },
    [40] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0
    },
    [50] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0
    },
    [60] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0
    },
    [70] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0
    },
    [80] = {
        [1] = 0,
        [2] = 0,
        [3] = 0
    },
    [90] = {
        [1] = 0
    },
    [100] = {
        [1] = 0
    }
}

-- 怪物種類
MonsterTypes = {
    G.MT.NORMAL0,
    G.MT.RUNNER0,
    G.MT.NORMAL1,
    G.MT.RUNNER1,
    G.MT.NORMAL2,
    G.MT.RUNNER2,
    G.MT.NORMAL3,
    G.MT.RUNNER3,
    G.MT.NORMAL4,
    G.MT.RUNNER4,
    G.MT.NORMAL5,
    G.MT.RUNNER5,
    G.MT.NORMAL6,
    G.MT.RUNNER6,
	G.MT.HEAVY1,
	G.MT.HEAVY2,
	G.MT.A101AR,
	G.MT.A104RL,
	G.MT.GHOST,
	G.MT.PUMPKIN,
    G.MT.PUMPKINHEAD,
    763,
    248,
    249,
    250,
    251,
    687,
    688,
    689,
    940,
    941,
    1097,
    1098,
    1509,
    1520,
    1521,
    1650,
    1651,
    1652,
    1653
}

-- 怪物特效
Mcolor = Game.RENDERFX.GLOWSHELL

-- 每級需要的經驗值
PlayerRequireExp = {
	1000,
	2000,
	3000,
	4000,
	5000,
	6000,
	7000,
	8000,
	9000,
	10000,
	15000,
	20000,
	25000,
	30000,
	35000,
	40000,
	45000,
	50000,
	75000,
    100000,
    110000,
    120000,
    130000,
    140000,
    150000,
    160000,
    170000,
    180000,
    190000,
    200000,
    225000,
    250000,
    275000,
    300000,
    325000,
    350000,
    375000,
    400000,
    450000,
    500000,
    600000,
    700000,
    800000,
    900000,
    1000000,
    1200000,
    1400000,
    1600000,
    1800000,
    2000000
}

-- 武器種類
WeaponTypes = {
    G.WT.KNIFE,          -- 近戰
    G.WT.PISTOL,         -- 手槍
    G.WT.GRENADE,        -- 手雷
    G.WT.SUBMACHINEGUN,  -- 衝鋒
    G.WT.SHOTGUN,        -- 散彈
    G.WT.MACHINEGUN,     -- 機槍
    G.WT.RIFLE,          -- 步槍
    G.WT.SNIPERRIFLE,    -- 狙擊
    G.WT.EQUIPMENT       -- 裝備
}

-- 武器顏色
WeaponColor = {
    G.WC.WHITE,
    G.WC.BLUE,
    G.WC.RED,
    G.WC.ORANGE,
    G.WC.YELLOW,
    G.WC.GREEN,
}

SG = G.EB:Create({ x = -181, y = -186, z = 1 })

-------------------------------------------------------------

function G_RI(max, min)
    return Game.RandomInt(max, min)
end

function G_RF(max, min)
    return Game.RandomFloat(max, min)
end

function G_GTE()
    return Game.GetTriggerEntity()
end

function G_ST(str, bool)
    return Game.SetTrigger(str, bool)
end

-- 血量護甲圖形化數據
function CHA(player)
    CHP.value = player.index
    MHP.value = player.maxhealth
    HP.value = player.health
    CAP.value = player.index
    MAP.value = player.maxarmor
    AP.value = player.armor
end

-- 獲得武器後
function G.R:OnGetWeapon(player,weaponid,weapon)
    if weapon == nil then 
        return
    end

    for i = 1, #WeaponColor do
        if weapon.color == WeaponColor[i] then
            break
        elseif i == #WeaponColor then
            if playcoin > 0 then
                wn = 1 + (playcoin * 2.5)
            else
                wn = 1
            end

            WP_NU(weapon, wn)
        end
    end
end

-- UI傳GAME變數
function G.R:OnPlayerSignal( player, signal )
    ClientID:OnPlayerSignal( player, signal );
    GPW = player:GetPrimaryWeapon()
    GSW = player:GetSecondaryWeapon()
    if player:GetPrimaryWeapon() ~= nil then
        GPW = player:GetPrimaryWeapon()
        pu.PD = GPW.damage * 100
    end
    if player:GetSecondaryWeapon() ~= nil then
        GSW = player:GetSecondaryWeapon()
        pu.SD = GSW.damage * 100
    end
    pu = player.user
    if signal == 10001 then
        if player.maxhealth ~= 10000 then
            if player.coin >= 1000 then
                player.maxhealth = player.maxhealth + 100
                player.health = player.health + 100
                player.coin = player.coin - 1000
                CHA(player)
                if player.maxhealth >= 10000 then
                    player.maxhealth = 10000
                    CHA(player)
                    return
                end
            else
                NOtip.value = player.index
            end
        else
            NOHAP.value = player.index
        end
    elseif signal == 10002 then 
        if player.maxarmor ~= 10000 then
            if player.coin >= 1500 then
                player.maxarmor = player.maxarmor + 100
                player.armor = player.armor + 100
                player.coin = player.coin - 1500
                CHA(player)
                if player.maxarmor >= 10000 then
                    player.maxarmor = 10000
                    CHA(player)
                    return
                end
            else
                NOtip.value = player.index
            end
        else
            NOHAP.value = player.index
        end
    elseif signal == 10003 then
        player:ToggleWeaponInven()
	elseif signal == 10004 then
		if GPW ~= nil then
			if GPW.damage ~= 101.00 then
				if player.coin >= 30000 then
					if GSW ~= nil then
						G_WEAPON(GSW.weaponid, P_WP[player.index], GSW.damage)
					end
					player:RemoveWeapon ()
					G_WEAPON(GPW.weaponid, P_WP[player.index], GPW.damage + 0.50)
					player.coin = player.coin - 30000
                    pu.PD = GPW.damage * 100
					if GPW.damage >= 101.00 then
						GPW.damage = 101.00
						return
					end
				else
					NOtip.value = player.index
				end
			else
				NOHAP.value = player.index
			end
		else
			NOWPN.value = player.index
		end
	elseif signal == 10005 then
		if GSW ~= nil then
			if GSW.damage ~= 101.00 then
				if player.coin >= 30000 then
					if GPW ~= nil then
						G_WEAPON(GPW.weaponid, P_WP[player.index], GPW.damage)
					end
					player:RemoveWeapon ()
					G_WEAPON(GSW.weaponid, P_WP[player.index], GSW.damage + 0.50)
					player.coin = player.coin - 30000
                    pu.SD = GSW.damage * 100
					if GSW.damage >= 101.00 then
						GSW.damage = 101.00
						return
					end
				else
					NOtip.value = player.index
				end
			else
				NOHAP.value = player.index
			end
		else
			NOWPN.value = player.index
		end
    elseif signal == 10006 then
        if STPV == 0 then
            STPV = 1
            player:SetThirdPersonView (100, 250)
        elseif STPV == 1 then
            STPV = 0
            player:SetFirstPersonView ()
        end
	elseif signal == 10007 then
        if player_pos[player.index] ~= 11 and pu.SA == 0 then
            player.position = level_pos
            POS.value = 0
        end
    elseif signal == 10008 then
        player.position = P_WP[player.index]
        pu.SA = 1
    elseif signal == 10009 then
        player.position = level_pos
        pu.SA = 0
    elseif signal == 10010 then
        if player.maxhealth >= 10000 then
            player.maxhealth = 10000
        end
        if player.maxarmor >= 10000 then
            player.maxarmor = 10000
        end

        player:SetRenderFX(19)
        if pu.level > 0 and pu.level < 10 then
            player:SetRenderColor({r = 255, g = 255, b = 255})
        elseif pu.level > 9 and pu.level < 20 then
            player:SetRenderColor({r = 0, g = 0, b = 255})
        elseif pu.level > 19 and pu.level < 30 then
            player:SetRenderColor({r = 255, g = 0, b = 0})
        elseif pu.level > 29 and pu.level < 40 then
            player:SetRenderColor({r = 255, g = 100, b = 0})
        elseif pu.level > 39 and pu.level < 50 then
            player:SetRenderColor({r = 255, g = 255, b = 0})
        elseif pu.level == 50 then
            player:SetRenderColor({r = 0, g = 255, b = 0})
        end
        
        if pu.level == LEVEL_MAX then
            CPEXP.value = player.index
            PLEVEL.value = 0
            PEXP.value = 0
        else
            CPEXP.value = player.index
            PLEVEL.value = PlayerRequireExp[pu.level]
            PEXP.value = pu.exp
        end
        CHA(player)
    end
end

-- 生成強化武器
function G_WEAPON(wt, pos, wn)
	wp = Game.Weapon.CreateAndDrop(wt, pos)
    WP_NU(wp, wn)
    return wp
end

-- 處理武器數值
function WP_NU(wp, wn)
    if wp == nil then
        return
    end
    wt = wp:GetWeaponType()
    wp.damage = wn
    wp.criticalrate = wn
    wp.criticaldamage = wn
    if wn > 0.99 and wn < 10.00 then
        wp.color = WeaponColor[1]
    elseif wn > 9.99 and wn < 30.00 then
        wp.bloodsucking = 0.01
        wp.infiniteclip = true
        wp.color = WeaponColor[2]
    elseif wn > 29.99 and wn < 50.00 then
        wp.bloodsucking = 0.05
        wp.infiniteclip = true
        wp.color = WeaponColor[3]
    elseif wn > 49.99 and wn < 70.00 then
        wp.bloodsucking = 0.50
        wp.infiniteclip = true
        wp.color = WeaponColor[4]
    elseif wn > 69.99 and wn < 90.00 then
        wp.bloodsucking = 1.00
        wp.infiniteclip = true
        wp.color = WeaponColor[5]
    elseif wn > 89.99 then
        wp.bloodsucking = 5.00
        wp.infiniteclip = true
        wp.color = WeaponColor[6]
    end

    if wt == WeaponTypes[2] then
        wp.flinch = wn
        wp.speed = wn
    elseif wt == WeaponTypes[4] then
        wp.speed = wn
    elseif wt == WeaponTypes[5] then
        wp.knockback = wn
    elseif wt == WeaponTypes[6] then
        wp.flinch = wn
    elseif wt == WeaponTypes[7] then
        wp.flinch = wn
        wp.knockback = wn
    elseif wt == WeaponTypes[8] then
        wp.knockback = wn
    elseif wt == WeaponTypes[9] then
        wp.flinch = wn
    end
    return wp
end

-- 以遊戲時間運算函數
function G.R:OnUpdate(time)
    ClientID:OnUpdate(time);
end

-- 玩家重生時呼叫函數
function G.R:OnPlayerSpawn(player)
    pu = player.user
    if player_pos[player.index] ~= 0 then
        player.position = P_WP[player.index]
        pu.SA = 1
    end
    player.team = Game.TEAM.CT
    player.armor = player.maxarmor
    player.health = player.maxhealth
    pu.SI = Game.GetTime() + 3
    CHA(player)
end

function SG:OnUse(player)
    if SGTF == 1 then
        player.position = level_pos
    end
end

function LV01(OF)
    if OF == true then
        schedule(1)
        SGTF = 1
	end
end
function LV01_1(OF)
	if OF == true then
		MonsterC(10, 10, 1) --(怪物數量, 怪物編號, 怪物波數)
	end
end
function LV01_2(OF)
	if OF == true then
		MonsterC(10, 10, 2)
	end
end
function LV01_3(OF)
	if OF == true then
		MonsterC(10, 10, 3)
	end
end
function LV01_4(OF)
	if OF == true then
		MonsterC(10, 10, 4)
	end
end
function LV01_5(OF)
	if OF == true then
		MonsterC(10, 10, 5)
	end
end
function LV02(OF)
    if OF == true then
        schedule(2)
	end
end
function LV02_1(OF)
	if OF == true then
		MonsterC(10, 20, 1)
	end
end
function LV02_2(OF)
	if OF == true then
		MonsterC(10, 20, 2)
	end
end
function LV02_3(OF)
	if OF == true then
		MonsterC(10, 20, 3)
	end
end
function LV02_4(OF)
	if OF == true then
		MonsterC(10, 20, 4)
	end
end
function LV02_5(OF)
	if OF == true then
		MonsterC(10, 20, 5)
	end
end
function LV03(OF)
    if OF == true then
        schedule(3)
	end
end
function LV03_1(OF)
	if OF == true then
		MonsterC(10, 30, 1)
	end
end
function LV03_2(OF)
	if OF == true then
		MonsterC(10, 30, 2)
	end
end
function LV03_3(OF)
	if OF == true then
		MonsterC(10, 30, 3)
	end
end
function LV03_4(OF)
	if OF == true then
		MonsterC(10, 30, 4)
	end
end
function LV03_5(OF)
	if OF == true then
		MonsterC(10, 30, 5)
	end
end
function LV04(OF)
    if OF == true then
        schedule(4)
	end
end
function LV04_1(OF)
	if OF == true then
		MonsterC(10, 40, 1)
	end
end
function LV04_2(OF)
	if OF == true then
		MonsterC(10, 40, 2)
	end
end
function LV04_3(OF)
	if OF == true then
		MonsterC(10, 40, 3)
	end
end
function LV04_4(OF)
	if OF == true then
		MonsterC(10, 40, 4)
	end
end
function LV04_5(OF)
	if OF == true then
		MonsterC(10, 40, 5)
	end
end
function LV05(OF)
    if OF == true then
        schedule(5)
	end
end
function LV05_1(OF)
	if OF == true then
		MonsterC(10, 50, 1)
	end
end
function LV05_2(OF)
	if OF == true then
		MonsterC(10, 50, 2)
	end
end
function LV05_3(OF)
	if OF == true then
		MonsterC(10, 50, 3)
	end
end
function LV05_4(OF)
	if OF == true then
		MonsterC(10, 50, 4)
	end
end
function LV05_5(OF)
	if OF == true then
		MonsterC(10, 50, 5)
	end
end
function LV06(OF)
    if OF == true then
        schedule(6)
	end
end
function LV06_1(OF)
	if OF == true then
		MonsterC(20, 60, 1)
	end
end
function LV06_2(OF)
	if OF == true then
		MonsterC(20, 60, 2)
	end
end
function LV06_3(OF)
	if OF == true then
		MonsterC(20, 60, 3)
	end
end
function LV06_4(OF)
	if OF == true then
		MonsterC(20, 60, 4)
	end
end
function LV06_5(OF)
	if OF == true then
		MonsterC(20, 60, 5)
	end
end
function LV07(OF)
    if OF == true then
        schedule(7)
	end
end
function LV07_1(OF)
	if OF == true then
		MonsterC(20, 70, 1)
	end
end
function LV07_2(OF)
	if OF == true then
		MonsterC(20, 70, 2)
	end
end
function LV07_3(OF)
	if OF == true then
		MonsterC(20, 70, 3)
	end
end
function LV07_4(OF)
	if OF == true then
		MonsterC(20, 70, 4)
	end
end
function LV07_5(OF)
	if OF == true then
		MonsterC(20, 70, 5)
	end
end
function LV08(OF)
    if OF == true then
        schedule(8)
	end
end
function LV08_1(OF)
	if OF == true then
		MonsterC(20, 80, 1)
	end
end
function LV08_2(OF)
	if OF == true then
		MonsterC(20, 80, 2)
	end
end
function LV08_3(OF)
	if OF == true then
		MonsterC(20, 80, 3)
	end
end
function LV09(OF)
    if OF == true then
        schedule(9)
	end
end
function LV09_1(OF)
	if OF == true then
		MonsterC(10, 90, 1)
	end
end
function LV10(OF)
    if OF == true then
        schedule(10)
	end
end
function LV10_1(OF)
	if OF == true then
		MonsterC(11, 100, 1)
	end
end

-- 統一處理各區傳送
function schedule(pos)
    for i = 1, 24 do
        if player_pos[i] ~= pos then
            player_pos[i] = pos
            level_pos = LEVEL[pos]
            POS.value = 1
        end
    end
    playcoin = playcoin + 1
end

-- 怪物系統
function MonsterC(LCM, LVM, DF)
    MT = 0 -- 怪物種類
    MLV = 0 -- 怪物能力
    MS = 0 -- 怪物地速
    for i = 1, LCM do
        if LVM == 10 then
            if DF == 5 then
                MT = G_RI(17, 18)
            else
                MT = G_RI(1, 2)
            end
            MLV = G_RI(1, 9) * DF
            MS = 0.5
            Mpos = G_RI(1, 2)
            Moi = G.M:Create (MonsterTypes[MT], LVpos.LV01[Mpos])
        elseif LVM == 20 then
            if DF == 5 then
                MT = G_RI(17, 18)
            else
                MT = G_RI(3, 4)
            end
            MLV = G_RI(50, 59) * DF
            MS = 0.55
            Mpos = G_RI(1, 2)
            Moi = G.M:Create (MonsterTypes[MT], LVpos.LV02[Mpos])
        elseif LVM == 30 then
            if DF == 5 then
                MT = G_RI(17, 18)
            else
                MT = G_RI(5, 6)
            end
            MLV = G_RI(101, 109) * DF
            MS = 0.6
            Mpos = G_RI(1, 2)
            Moi = G.M:Create (MonsterTypes[MT], LVpos.LV03[Mpos])
        elseif LVM == 40 then
            if DF == 5 then
                MT = G_RI(17, 18)
            else
                MT = G_RI(7, 8)
            end
            MLV = G_RI(151, 159) * DF
            MS = 0.65
            Mpos = G_RI(1, 2)
            Moi = G.M:Create (MonsterTypes[MT], LVpos.LV04[Mpos])
        elseif LVM == 50 then
            if DF == 5 then
                MT = G_RI(17, 18)
            else
                MT = G_RI(9, 10)
            end
            MLV = G_RI(201, 209) * DF
            MS = 0.7
            Mpos = G_RI(1, 2)
            Moi = G.M:Create (MonsterTypes[MT], LVpos.LV05[Mpos])
        elseif LVM == 60 then
            if DF == 5 then
                MT = G_RI(17, 18)
            else
                MT = G_RI(28, 29)
            end
            MLV = G_RI(251, 259) * DF
            MS = 0.75
            Mpos = G_RI(1, 3)
            Moi = G.M:Create (MonsterTypes[MT], LVpos.LV06[Mpos])
        elseif LVM == 70 then
            if DF == 5 then
                MT = G_RI(17, 18)
            else
                MT = G_RI(19, 21)
            end
            MLV = G_RI(301, 309) * DF
            MS = 0.8
            Mpos = G_RI(1, 3)
            Moi = G.M:Create (MonsterTypes[MT], LVpos.LV07[Mpos])
        elseif LVM == 80 then
            if DF == 1 then
                MT = G_RI(15, 16)
            elseif DF == 2 then
                MT = G_RI(32, 33)
            elseif DF == 3 then
                MT = G_RI(17, 18)
            end
            MLV = G_RI(401, 500) * DF
            MS = 0.85
            Mpos = G_RI(1, 3)
            Moi = G.M:Create (MonsterTypes[MT], LVpos.LV08[Mpos])
        elseif LVM == 90 then
            MLV = G_RI(81, 89)
            MS = 0.9
            Mpos = G_RI(1, 3)
            Moi = G.M:Create (MonsterTypes[22], LVpos.LV09[Mpos])
        elseif LVM == 100 then
            if i == 1 then
                MT = 1289
                MLV = 1000
                MS = 2.5
                Moi = G.M:Create (MT, LVpos.LV10[1])
            elseif i ~= 1 then
                MT = G_RI(34, 36)
                MLV = 500
                MS = 3
                Mpos = G_RI(2, 4)
                Moi = G.M:Create (MonsterTypes[MT], LVpos.LV10[Mpos])
            end
        end

        LVC[LVM][DF] = LVC[LVM][DF] + 1
        LKill = LCM
        KNL.value = LKill

        if Moi == nil then
            return
        end

        Mu = Moi.user
        if LVM == 90 then
            Moi.health = 500000
            Moi.armor = 500000
            Moi.damage = 0
            Moi.coin = 100000
            Mu.MK = LVM
            Mu.DF = DF
            Mu.DE = 0
        elseif LVM == 100 and MT == 1289 then
            Moi.health = 1000000
            Moi.armor = 1000000
            Moi.damage = G_RI(1, 2) * (MLV / 2)
            Moi.coin = 1000000
            Mu.MK = LVM
            Mu.DF = DF
            Mu.DE = 1
        elseif LVM == 100 and MT ~= 1289 then
            Moi.health = G_RI(100, 250) * MLV
            Moi.armor = G_RI(10, 25) * MLV
            Moi.damage = G_RI(1, 2) * (MLV / 2)
            Moi.coin = G_RI(100, 200) * MLV
            Mu.MK = LVM
            Mu.DF = DF
            Mu.DE = 0
        else
            Moi.health = G_RI(100, 250) * MLV
            Moi.armor = G_RI(10, 25) * MLV
            Moi.damage = G_RI(1, 2) * (MLV / 2)
            Moi.coin = G_RI(100, 200) * MLV
            Mu.MK = LVM
            Mu.DF = DF
            Mu.DE = 0
        end
        Moi.speed = MS
        Mu.SI = Game.GetTime() + 3
        Moi.viewDistance = 20
        Moi:SetRenderFX(Mcolor)
        if Moi.health > 999 and Moi.health < 5000 then
            Moi:SetRenderColor({r = 255, g = 255, b = 255})
            Mu.e = G_RF(0.5, 1) * MLV
            Moi.applyKnockback = true
        elseif Moi.health > 4999 and Moi.health < 10000 then
            Moi:SetRenderColor({r = 0, g = 0, b = 255})
            Mu.e = G_RF(1, 1.5) * MLV
            Moi.applyKnockback = true
        elseif Moi.health > 9999 and Moi.health < 25000 then
            Moi:SetRenderColor({r = 255, g = 0, b = 0})
            Mu.e = G_RF(1.5, 2) * MLV
            Moi.applyKnockback = true
        elseif Moi.health > 24999 and Moi.health < 50000 then
            Moi:SetRenderColor({r = 255, g = 100, b = 0})
            Mu.e = G_RF(2, 2.5) * MLV
            Moi.applyKnockback = true
        elseif Moi.health > 49999 and Moi.health < 75000 then
            Moi:SetRenderColor({r = 255, g = 255, b = 0})
            Mu.e = G_RF(2.5, 5) * MLV
            Moi.applyKnockback = true
        elseif Moi.health > 74999 and Moi.health < 100000 then
            Moi:SetRenderColor({r = 255, g = 0, b = 255})
            Mu.e = G_RF(5, 10) * MLV
            Moi.applyKnockback = true
        elseif Moi.health > 99999 and Moi.health < 125000 then
            Moi:SetRenderColor({r = 100, g = 0, b = 255})
            Mu.e = G_RF(10, 25) * MLV
            Moi.applyKnockback = true
        elseif Moi.health > 124999 and Moi.health < 150000 then
            Moi:SetRenderColor({r = 100, g = 0, b = 0})
            Mu.e = G_RF(25, 50) * MLV
            Moi.applyKnockback = false
        elseif Moi.health > 149999 and Moi.health < 175000 then
            Moi:SetRenderColor({r = 0, g = 0, b = 100})
            Mu.e = G_RF(50, 75) * MLV
            Moi.applyKnockback = false
        elseif Moi.health > 174999 and Moi.health < 200000 then
            Moi:SetRenderColor({r = 0, g = 100, b = 0})
            Mu.e = G_RF(75, 100) * MLV
            Moi.applyKnockback = false
        elseif Moi.health > 199999 and Moi.health < 250000 then
            Moi:SetRenderColor({r = 0, g = 255, b = 0})
            Mu.e = G_RF(75, 100) * MLV
            Moi.applyKnockback = false
        elseif Moi.health > 249999 and Moi.health < 500000 then
            Moi:SetRenderFX(21)
            Mu.e = G_RF(100, 150) * MLV
            Moi.applyKnockback = false
        elseif Moi.health > 499999 then
            Moi:SetRenderColor({r = 50, g = 50, b = 50})
            Mu.e = G_RF(150, 250) * MLV
            Moi.applyKnockback = false
        else
            Mu.e = G_RF(0.1, 0.5) * MLV
            Moi.applyKnockback = true
        end
    end
end

-- 受到基本實體(怪物, 玩家等) 攻擊時叫出的函數
function G.R:OnTakeDamage(victim, attacker, damage, weapontype, hitbox)
    vu = victim.user
	if attacker == nil then
        if vu.SI > Game.GetTime() then
            return 0 
        end
		return 
    end

	if victim:IsMonster() then
        victim = victim:ToMonster()
        attacker = attacker:ToPlayer()
        if attacker == nil then
            return
        end

        au = attacker.user

        if vu.SI == nil then
            return
        end

        if vu.SI > Game.GetTime() then
            return 0 
        end

		damage = ADD_damage(attacker, victim, weapontype, damage)
		damageEXP(attacker, victim)

		CHA(attacker)

		return damage / (vu.MK + vu.DF)
    elseif victim:IsPlayer() then
        victim = victim:ToPlayer()
        attacker = attacker:ToMonster()
        if attacker == nil then
            return
        end

        au = attacker.user

        if vu.SI > Game.GetTime() then
            return 0 
        end

        if au.DE == 1 then
            return 5000
        end

        CHA(victim)

		return damage / vu.level
	end
end

-- 造成怪物傷害計算
function ADD_damage(attacker, victim, weapontype, damage)
    vu = victim.user
    au = attacker.user

    if vu.MK == 100 then
        if weapontype == WeaponTypes[1] then
            damage = (au.level * 10)
        elseif weapontype == WeaponTypes[3] then
            damage = (au.level * 50)
        elseif weapontype == WeaponTypes[2] then
            damage = (au.level * au.SD) / 2
        else
            damage = (au.level * au.PD) / 2
        end
    else
        ad = damage + au.level
        if weapontype == WeaponTypes[1] then
            damage = (ad * 10) * 2
        elseif weapontype == WeaponTypes[2] then
            damage = ad
        elseif weapontype == WeaponTypes[3] then
            damage = (ad * 50) * 2
        else
            if weapontype == WeaponTypes[4] then
                damage = ad * 1.25
            elseif weapontype == WeaponTypes[5] then
                damage = ad * 2
            elseif weapontype == WeaponTypes[6] then
                damage = ad * 0.5
            elseif weapontype == WeaponTypes[7] then
                damage = ad
            elseif weapontype == WeaponTypes[8] then
                damage = ad * 2.5
            elseif weapontype == WeaponTypes[9] then
                damage = ad * 1.5
            end
        end
    end
    CCSD.value = attacker.index
    SD.value = damage
    victim:ShowOverheadDamage(damage, 0)

    return damage
end

-- 造成怪物傷害獎勵
function damageEXP(attacker, victim)
    if attacker:IsPlayer() then
        attacker = attacker:ToPlayer()
        vu = victim.user
        au = attacker.user
        AddExp(attacker, 1 * au.level * vu.MK)
        if attacker.coin + (vu.MK + (G_RI(1, au.level) * 100)) >= 1000000000 then
            attacker.coin = 1000000000
        else
            attacker.coin = attacker.coin + (vu.MK + (G_RI(1, au.level) * 100))
        end
    end
end

-- PVP玩家擊殺系統
function G.R:OnPlayerAttack(victim,attacker,damage,weapontype,hitbox)

    vu = victim.user

    if attacker == nil then
        CHA(victim)
        return
    end

    au = attacker.user

    CCSD.value = attacker.index
    SD.value = damage
	victim:ShowOverheadDamage(damage, 0)

    CHA(attacker)
    CHA(victim)
    return damage
end

-- 擊殺系統
function G.R:OnKilled(victim, killer)
    if killer == nil or killer:IsMonster() then
        if victim:IsMonster() then
            victim = victim:ToMonster()
            vu = victim.user
            if vu.MK == nil or vu.DF == nil then
                return

            elseif vu.MK + vu.DF == MK[vu.MK][vu.DF] then
                if LVC[vu.MK][vu.DF] == 1 then
                    T = (vu.MK / 10)
                    G_ST(string.char(96 + T)..string.format('%1.0f', vu.DF), true)
                    LKill = 0
                else
                    LVC[vu.MK][vu.DF] = LVC[vu.MK][vu.DF] - 1
                    LKill = LKill - 1
                end
            end
            KNL.value = LKill

        elseif victim:IsPlayer() then
            victim = victim:ToPlayer()
            CHA(victim)
        end

    elseif killer:IsPlayer() then
        if victim:IsMonster() then
            victim = victim:ToMonster()
            killer = killer:ToPlayer()
            vu = victim.user

            if vu.MK == nil or vu.DF == nil then
                return

            elseif vu.MK + vu.DF == MK[vu.MK][vu.DF] then
                if LVC[vu.MK][vu.DF] == 1 then
                    T = (vu.MK / 10)
                    G_ST(string.char(96 + T)..string.format('%1.0f', vu.DF), true)
                    LKill = 0
                else
                    LVC[vu.MK][vu.DF] = LVC[vu.MK][vu.DF] - 1
                    LKill = LKill - 1
                end
            end
            KNL.value = LKill
            CHA(killer)

        else
            return
        end
    else
        return
    end
end

-- 等級提升後給予獎勵
function OnLevelUp(player)
    player.maxhealth = player.maxhealth + 10
    player.maxarmor = player.maxarmor + 10
    player.health = player.maxhealth
    CHA(player)
end
-- 以玩家目前的等級和經驗值計算經驗值倍率
function CalcExpRate(level, exp)
	return exp / PlayerRequireExp[level]
end
-- 給予玩家經驗值
function AddExp(player, exp)
    pu = player.user
	-- 滿等的話跳過
    if pu.level >= LEVEL_MAX then
        CPEXP.value = player.index
        PLEVEL.value = 0
        PEXP.value = 0
		return
    else
        CPEXP.value = player.index
        PLEVEL.value = PlayerRequireExp[pu.level]
        PEXP.value = exp
	end
	pu.exp = pu.exp + exp
	 -- 等級提升
	if pu.exp > PlayerRequireExp[pu.level] then
		pu.level = pu.level + 1
		if pu.level >= LEVEL_MAX then
			pu.exp = 0
		else
			pu.exp = pu.exp - PlayerRequireExp[pu.level - 1]
        end
		OnLevelUp(player)
    end

    -- 顯示等級/經驗值 UI更新
	pu.expRate = CalcExpRate(pu.level, pu.exp)
	player:SetLevelUI(pu.level, pu.expRate) -- 等級/經驗值 UI 設定
end

-- 玩家選擇角色後初次重生時叫出的函數
function G.R:OnPlayerJoiningSpawn(player)
    if player == nil then
        return
    end
    pu = player.user
    -- 儲存玩家排列
    players[player.index] = player
    player_pos[player.index] = 0
    player.position = HOMEpos
    -- ThirdPersonFixedView 基礎上修正為計算游標的射線位置的方式
    player:SetThirdPersonFixedPlane(Game.THIRDPERSON_FIXED_PLANE.GROUND)
    -- 團隊設定
    player.team = Game.TEAM.CT
    -- 基本能力
    player.coin = 5000 + (500000 * playcoin)
    player.maxhealth = 50
    player.maxarmor = 50
    pu.level = 1
    pu.exp = 0
    pu.expRate = 0
    pu.PD = 1
    pu.SD = 1
    pu.SA = 0
    pu.SI = Game.GetTime() + 3
    CHA(player)
    player:Signal(1)
    player:SetLevelUI(pu.level, pu.expRate)
end