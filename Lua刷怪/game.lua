G = {
    R = Game.Rule,
    SV = Game.SyncValue,
    EB = Game.EntityBlock,
    MT = Game.MONSTERTYPE,
    M = Game.Monster,
    WT = Game.WEAPONTYPE,
    WC = Game.WEAPONCOLOR
}

G.R.friendlyfire = false
G.R.enemyfire = true
G.R.respawnTime = 0
G.R.respawnable = true

LMA = 500 -- 玩家最高等級
CMA = 1000000000 -- 玩家最高金幣
ne = 100000000
nm = 1000000
HMA = 10000 -- 玩家最高血量
AMA = 10000 -- 玩家最高護甲
DMA = nm -- 玩家最高攻擊力
ALLK = 1 -- 判斷清除怪物
MNCC = 0 -- 判斷測試怪物
STPV = 0 -- 人稱切換
UKlii = 0 -- 總擊殺
lint = 0 -- 初始計算
UP = 1 -- 難易度
TT = 15
BOSSSC = 0
LCM = 0
LVM = 0
STET = 0
SNU = 0
MOSHP = 0
GPW = {}
GSW = {}
AKLV = {}
pvp = {
    CT = 0,
    TR = 0
}
MTE = {}
STE = nil
MODA = nil
n = '珍惜現在所擁有'

pvip = {}
plvip = {}
pwp = {}
pvl = {}

pn = {
    [1] = '',
}

function FNT(num)
	local function checknumber(value)
		return tonumber(value) or 0
	end
	local formatted = tostring(checknumber(num))
	local k
	while true do
		formatted, k = string.gsub(formatted,"^(-?%d+)(%d%d%d)",'%1,%2')
		if k == 0 then 
			break end
		end
	return formatted
end

function round(number) 
    if (number - (number % 0.1)) - (number - (number % 1)) < 0.5 then 
        number = number - (number % 1) 
    else 
        number = (number - (number % 1)) + 1 
    end 
    return number 
end 

function G_SV_C(str)
    return G.SV.Create(str)
end

function G_RI(max,min)
    return Game.RandomInt(max,min)
end

function G_RF(max,min)
    return Game.RandomFloat(max,min)
end

function G_GTE(entity)
    entity = Game.GetTriggerEntity()
    if entity and entity:IsPlayer() then
        return entity
    end
end

function G_CO(callerOn)
    if callerOn == nil or callerOn == false then
		return false
    else
        return true
	end
end

function G_ST(str,bool)
    return Game.SetTrigger(str,bool)
end

function G_EB_C(a,b,c)
    return G.EB:Create({x = a,y = b,z = c})
end

function PVP_TF(player)
    pu = player.user
    if pu.pvp == 1 then
        if player.team == Game.TEAM.CT then
            pvp.CT = pvp.CT - 1
        elseif player.team == Game.TEAM.TR then
            pvp.TR = pvp.TR - 1
        end
        pu.ps = 1
        pu.pvp = 0
    end
end

function DATA_MAX(player)
    pu = player.user
    AddExp(player,0)
    if player.maxhealth >= HMA then
        player.maxhealth = HMA
    end
    if player.maxarmor >= AMA then
        player.maxarmor = AMA
    end
    if pu.pd == nil then
        pu.pd = 0
    end
    if pu.pd >= DMA then
        pu.pd = DMA
        DEtip.value = DMA
    end
    if player.coin >= CMA then
        player.coin = CMA
    end
end

function G_PRC(EN,fx,rgb,MAK)
    if fx ~= 0 then
        EN:SetRenderFX(fx)
    end
    
    if fx == 19 then
        EN:SetRenderColor(rgb)
    end

    if EN:IsMonster() then
        if MAK == 0 then
            EN.applyKnockback = false
        elseif MAK == 1 then
            EN.applyKnockback = true
        end
    end
end

function G_DBWP(wt,pos,wn)
    local wp = Game.Weapon.CreateAndDrop(WeaponList[wt],pos)
    wp.damage = wn
    wp.criticalrate = wn
    wp.criticaldamage = wn
    wp.speed = wn
    if wn > 0.99 and wn < 10.00 then
        wp.color = WeaponColor[1]
    elseif wn > 9.99 and wn < 30.00 then
        wp.flinch = wn
        wp.color = WeaponColor[2]
        wp.bloodsucking = 0.01
        wp.infiniteclip = true
    elseif wn > 29.99 and wn < 50.00 then
        wp.flinch = wn
        wp.knockback = wn
        wp.color = WeaponColor[3]
        wp.bloodsucking = 0.05
        wp.infiniteclip = true
    elseif wn > 49.99 and wn < 70.00 then
        wp.flinch = wn
        wp.knockback = wn
        wp.color = WeaponColor[4]
        wp.bloodsucking = 0.50
        wp.infiniteclip = true
    elseif wn > 69.99 and wn < 90.00 then
        wp.flinch = wn
        wp.knockback = wn
        wp.bloodsucking = 1.00
        wp.infiniteclip = true
        wp.color = WeaponColor[5]
    elseif wn > 89.99 and wn < 101.01 then
        wp.flinch = wn
        wp.knockback = wn
        wp.bloodsucking = 5.00
        wp.infiniteclip = true
        wp.color = WeaponColor[6]
    end
    return wp
end

function WPCN(wp)
    local total = 0
    if wp.color == WeaponColor[1] then
        total = 100
    elseif wp.color == WeaponColor[2] then
        total = 1000
    elseif wp.color == WeaponColor[3] then
        total = 10000
    elseif wp.color == WeaponColor[4] then
        total = 100000
    elseif wp.color == WeaponColor[5] then
        total = 1000000
    elseif wp.color == WeaponColor[6] then
        total = 10000000
    end
    return total
end

CLVS = G_SV_C('CLVS')
LEVS = G_SV_C('LEVS')
CDE = G_SV_C('CDE')
DEtip = G_SV_C('DEtip')
CATM = G_SV_C('CATM')
ATMtip = G_SV_C('ATMtip')
CHP = G_SV_C('CHP')
MHP = G_SV_C('MHP')
HP = G_SV_C('HP')
CAP = G_SV_C('CAP')
MAP = G_SV_C('MAP')
AP = G_SV_C('AP')

CMOHP = G_SV_C('CMOHP')
MOMHP = G_SV_C('MOMHP')
MOHP = G_SV_C('MOHP')
DMOHP = G_SV_C('DMOHP')

CPEXP = G_SV_C('CPEXP')
PLEVEL = G_SV_C('PLEVEL')
PEXP = G_SV_C('PEXP')

CCSD = G_SV_C('CCSD')
SD = G_SV_C('SD')

KNU = G_SV_C('KNU')

LVtip = G_SV_C('LVtip')
DFtip = G_SV_C('DFtip')

ATMUtip = G_SV_C('ATMUtip')
ATMDtip = G_SV_C('ATMDtip')

AKtip = G_SV_C('AKtip')
P_LV = G_SV_C('P_LV')

NOtip = G_SV_C('NOtip')
NOHAP = G_SV_C('NOHAP')
NOWP = G_SV_C('NOWP')

-- 觸發方塊
E = {
    -- 怪物區
    M = {
        LV01 = G_EB_C(-12,0,1),
        LV50 = G_EB_C(-16,3,1),
        LV100 = G_EB_C(-16,7,1),
        LV150 = G_EB_C(-16,11,1),
        LV200 = G_EB_C(-13,15,1),
        LV250 = G_EB_C(-9,15,1),
        LV300 = G_EB_C(-5,15,1),
        LV400 = G_EB_C(-1,15,1),
        LV500 = G_EB_C(3,15,1)
    },
    -- 怪物區回Home
    MH = {
        LV01 = G_EB_C(-64,-161,1),
        LV50 = G_EB_C(-64,-114,3),
        LV100_01 = G_EB_C(-48,-80,1),
        LV100_02 = G_EB_C(-49,15,1),
        LV150_01 = G_EB_C(-96,-176,1),
        LV150_02 = G_EB_C(-97,-81,1),
        LV200_01 = G_EB_C(-96,-64,1),
        LV200_02 = G_EB_C(-97,31,1),
        LV250_01 = G_EB_C(-96,48,1),
        LV250_02 = G_EB_C(-97,143,1),
        LV300_01 = G_EB_C(-144,-176,1),
        LV300_02 = G_EB_C(-145,-145,-12),
        LV400 = G_EB_C(-144,-128,1),
        LV500_01 = G_EB_C(-144,-80,1),
        LV500_02 = G_EB_C(-145,-17,1)
    },
    -- 遊樂區
    AM = {
        A = G_EB_C(-4,0,1),
        PK = G_EB_C(0,0,1),
        SI = G_EB_C(4,0,1),
        PVP = G_EB_C(8,0,1),
        SM = G_EB_C(12,0,1)
    },
    -- 採礦區
    A = {
        O = G_EB_C(19,16,1),
        HOME = {
            O = G_EB_C(112,-1,1),
        }
    },
    -- 跑酷區
    PK = {
        O = G_EB_C(19,9,1),
        O2 = G_EB_C(23,9,1),
        O3 = G_EB_C(27,9,1),
        O4 = G_EB_C(31,9,1),
        END = {
            O = G_EB_C(-13,97,7),
            O2 = G_EB_C(35,97,7),
            O3 = G_EB_C(83,97,7),
            O4 = G_EB_C(132,34,42)
        },
        HOME = {
            O = G_EB_C(-13,33,1),
            O2 = G_EB_C(35,33,1),
            O3 = G_EB_C(83,33,1),
            O4 = G_EB_C(132,34,1)
        }
    },
    -- 滑坡區
    SI = {
        O = G_EB_C(19,2,1),
        O2 = G_EB_C(23,2,1),
        O3 = G_EB_C(27,2,1),
        O4 = G_EB_C(31,2,1),
        END = {
            O = G_EB_C(-14,177,7),
            O2 = G_EB_C(82,177,7),
            O3 = G_EB_C(34,177,7),
            O4 = G_EB_C(157,81,31)
        },
        HOME = {
            O = G_EB_C(-13,112,6),
            O2 = G_EB_C(83,113,6),
            O3 = G_EB_C(35,114,6),
            O4 = G_EB_C(131,81,31)
        }
    },
    -- PVP區
    PVP = {
        O = G_EB_C(19,-5,1),
        O2 = G_EB_C(23,-5,1),
        O3 = G_EB_C(27,-5,1),
        HOME = {
            O = G_EB_C(144,-161,1),
            O2_1 = G_EB_C(119,-151,1),
            O2_2 = G_EB_C(104,-170,1),
            O3_1 = G_EB_C(79,-160,1),
            O3_2 = G_EB_C(48,-161,1)
        },
        SP = {
            O = G_EB_C(22,-11,1),
            O2 = G_EB_C(26,-11,1),
            O3 = G_EB_C(30,-11,1),
            HOME = {
                O = G_EB_C(144,-161,14),
                O2 = G_EB_C(95,-161,13),
                O3 = G_EB_C(64,-176,10)
            }
        }
    },
    -- 特殊怪物區
    SM = {
        O = G_EB_C(19,-12,1),
        O2 = G_EB_C(23,-12,1),
        O3 = G_EB_C(27,-12,1),
        O4 = G_EB_C(31,-12,1),
        HOME = {
            O = G_EB_C(-49,33,1),
            O2 = G_EB_C(-48,80,1),
            O3 = G_EB_C(-48,128,1),
            O4 = G_EB_C(-145,31,1)
        }
    },
    -- 回Home
    H = {
        A = G_EB_C(17,13,1),
        PK = G_EB_C(17,6,1),
        SI = G_EB_C(17,-1,1),
        PVP = G_EB_C(17,-8,1),
        SM = G_EB_C(17,-15,1)
    },
    WPER = G_EB_C(0,-13,1),
    VIP = G_EB_C(12,-13,2),
    LVIP = G_EB_C(12,-9,2),
    VIPLW = G_EB_C(8,-31,1),
    MBOSS = G_EB_C(-161,-1,15),
    UP = G_EB_C(-15,-6,2),
    DN = G_EB_C(-15,-4,2),
    ATMU = G_EB_C(2,-31,2),
    ATMD = G_EB_C(4,-31,2),
    SWEXP = G_EB_C(-6,-31,2)
}

MK = {
    [1] = 1,
    [2] = 2,
    [3] = 3,
    [4] = 4,
    [5] = 5,
    [6] = 6,
    [7] = 7,
    [8] = 8,
    [9] = 9,
    [100] = 100,
    [101] = 101,
    [102] = 102,
    [103] = 103
}

MLC = {
    [1] = 0,
    [2] = 0,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [7] = 0,
    [8] = 0,
    [9] = 0,
    [100] = 0,
    [101] = 0,
    [102] = 0,
    [103] = 0
}

-- 怪物生成位置
LVpos = {
    LV01 = {x = -52,y = -160,z = 14},
    LV50 = {x = -48,y = -113,z = 14},
    LV100 = {
        [1] = {x = -48, y = -62, z = 14},
        [2] = {x = -48, y = -32, z = 14},
        [3] = {x = -48, y = -5, z = 14}
    },
    LV150 = {x = -96,y = -128,z = 14},
    LV200 = {
        [1] = {x = -97,y = -45,z = 14},
        [2] = {x = -97,y = -16,z = 14},
        [3] = {x = -97,y = 17,z = 14}
    },
    LV250 = {
        [1] = {x = -97,y = 66,z = 14},
        [2] = {x = -97,y = 96,z = 14},
        [3] = {x = -97,y = 123,z = 14}
    },
    LV300 = {
        [1] = {x = -145,y = -161,z = 14},
        [2] = {x = -150,y = -160,z = -3}
    },
    LV400 = {x = -144,y = -120,z = 14},
    LV500 = {x = -145,y = -49,z = 14},
    LVSM1 = {x = -49,y = 48,z = 14},
    LVSM2 = {x = -48,y = 96,z = 42},
    LVSM3 = {x = -49,y = 143,z = 14},
    LVSM4 = {x = -144,y = 16,z = 14}
}

-- 各區域玩家數量
LVNU = {
    LV01 = 0,
    LV50 = 0,
    LV100 = 0,
    LV150 = 0,
    LV200 = 0,
    LV250 = 0,
    LV300 = 0,
    LV400 = 0,
    LV500 = 0,
    LVSM1 = 0,
    LVSM2 = 0,
    LVSM3 = 0,
    LVSM4 = 0
}

-- 計算各區域怪物擊殺
LVC = {
    [1] = 0,
    [2] = 0,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [6] = 0,
    [7] = 0,
    [8] = 0,
    [9] = 0,
    [100] = 0,
    [101] = 0,
    [102] = 0,
    [103] = 0
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
	G.MT.HEAVY1,--15
	G.MT.HEAVY2,
	G.MT.A101AR,--17
	G.MT.A104RL,
	G.MT.GHOST,--19
	G.MT.PUMPKIN,
    G.MT.PUMPKINHEAD,
    763, --雪人22
    248, --楓之谷23
    249,
    250,
    251,
    687,
    688, --黃巾28
    689,
    940, --機甲30
    941,
    1097, --足球32
    1098,
    1509, --毒花34
    1520, --狂暴35
    1521, --自爆36
    1650, --朝鮮37
    1651,
    1652,
    1653
}

-- 禁止掉落特定武器
Prohweapon = {
    102,
    67,
    53,
    52,
    51,
    17,
    16,
    15,
    14
}

-- 怪物特效
Mcolor = Game.RENDERFX.GLOWSHELL

-- 每級需要的經驗值
PlayerRequireExp = {}

-- 武器種類
WeaponTypes = {
    G.WT.KNIFE,
    G.WT.PISTOL,
    G.WT.GRENADE,
    G.WT.SUBMACHINEGUN,
    G.WT.SHOTGUN,
    G.WT.MACHINEGUN,
    G.WT.RIFLE,
    G.WT.SNIPERRIFLE,
    G.WT.EQUIPMENT
}

-- 武器顏色
WeaponColor = {
    G.WC.WHITE,
    G.WC.BLUE,
    G.WC.RED,
    G.WC.ORANGE,
    G.WC.YELLOW,
    G.WC.GREEN
}

-- 遊樂區各個傳送點
AMpos = {
    A = {x = 25,y = 12,z = 1},
    PK = {x = 25,y = 5,z = 1},
    SI = {x = 25,y = -2,z = 1},
    PVP = {x = 25,y = -9,z = 1},
    SM = {x = 25,y = -16,z = 1}
}

-- 重生點座標
HOMEpos = {x = -13,y = -13,z = 3}

-------------------------------------------------------------

-- 血量護甲圖形化數據
function CHA(player)
    pu = player.user
    CLVS.value = player.index
    if pu.vip == nil then
        pu.vip = 0
    end
    if pu.p1 == nil then
        pu.p1 = 0
    end
    if pu.LVS == nil then
        pu.LVS = 0
    end
    LEVS.value = pu.LVS
    CDE.value = player.index
    if pu.pd == nil then
        pu.pd = 0
    end
    DEtip.value = pu.pd
    CATM.value = player.index
    if pu.atm == nil then
        pu.atm = 1
    end
    if player.coin > (ne * 9.9) then
        player.coin = player.coin - ne
        pu.atm = pu.atm + 1
    end
    ATMtip.value = pu.atm
    CHP.value = player.index
    MHP.value = player.maxhealth
    HP.value = player.health
    CAP.value = player.index
    MAP.value = player.maxarmor
    AP.value = player.armor
end

function WAC(player)
    pu = player.user
    GPW[player.index] = player:GetPrimaryWeapon()
    GSW[player.index] = player:GetSecondaryWeapon()
    if GPW[player.index] ~= nil then
        GPW[player.index] = player:GetPrimaryWeapon()
        GPW[player.index]:AddClip1(5)
        pu.PD = GPW[player.index].damage * 100
    end
    if GSW[player.index] ~= nil then
        GSW[player.index] = player:GetSecondaryWeapon()
        GSW[player.index]:AddClip1(5)
        pu.SD = GSW[player.index].damage * 100
    end
end

-- 切換武器
function G.R:OnSwitchWeapon(player)
    WAC(player)
end

-- 獲得武器後
function G.R:OnGetWeapon(player,weaponid,weapon)
    if weapon ~= nil then 
        for i = 1,#WeaponColor do
            if weapon.color == WeaponColor[i] then
                break
            elseif i == #WeaponColor then
                weapon.color = WeaponColor[1]
                weapon.damage = 1
            end
        end
        WAC(player)
    end
end

-- UI傳GAME變數
function G.R:OnPlayerSignal(player,signal)
    ClientID:OnPlayerSignal(player,signal)
    pu = player.user
    if signal == 10001 then
        if player.maxhealth ~= HMA then
            if player.coin >= 1000 then
                player.maxhealth = player.maxhealth + 100
                player.health = player.maxhealth
                player.coin = player.coin - 1000
            else
                NOtip.value = player.index
            end
        else
            NOHAP.value = player.index
        end
    elseif signal == 10002 then 
        if player.maxarmor ~= AMA then
            if player.coin >= 1500 then
                player.maxarmor = player.maxarmor + 100
                player.armor = player.maxarmor
                player.coin = player.coin - 1500
            else
                NOtip.value = player.index
            end
        else
            NOHAP.value = player.index
        end
    elseif signal == 10003 then
        player:ToggleWeaponInven()
    elseif signal == 10004 then
        if pu.pd == nil then
            pu.pd = 0
        end
        if player.coin >= nm then
            if pu.pd ~= DMA then
                pu.pd = pu.pd + 1000
                player.coin = player.coin - nm
                DEtip.value = pu.pd
            else
                NOHAP.value = player.index
            end
        else
            NOtip.value = player.index
        end
    elseif signal == 10006 then
        if STPV == 0 then
            STPV = 1
            player:SetThirdPersonView(100,250)
        elseif STPV == 1 then
            STPV = 0
            player:SetFirstPersonView()
        end
    elseif signal == 10007 then
        if AKLV[player.index] == 1 then
            HOME(player)
            AKLV[player.index] = 0
            player.gravity = 1
        end
    elseif signal == 10008 then
        PVP_TF(player)
        player.team = Game.TEAM.CT
        player.gravity = 1
        pu.ps = 0
        HOME(player)
    elseif signal == 10010 then
        if player ~= nil then
            DATA_MAX(player)
            CHA(player)
            WAC(player)
            if pu.LVS == 0 and pu.level ~= 500 then
                if pu.level > 49 and pu.level < 100 then
                    G_PRC(player,19,{r = 0,g = 0,b = 255},0)
                elseif pu.level > 99 and pu.level < 150 then
                    G_PRC(player,19,{r = 255,g = 0,b = 0},0)
                elseif pu.level > 149 and pu.level < 200 then
                    G_PRC(player,19,{r = 255,g = 100,b = 0},0)
                elseif pu.level > 199 and pu.level < 250 then
                    G_PRC(player,19,{r = 255,g = 255,b = 0},0)
                elseif pu.level > 249 and pu.level < 300 then
                    G_PRC(player,19,{r = 255,g = 0,b = 255},0)
                elseif pu.level > 299 and pu.level < 350 then
                    G_PRC(player,19,{r = 100,g = 0,b = 255},0)
                elseif pu.level > 349 and pu.level < 400 then
                    G_PRC(player,19,{r = 0,g = 100,b = 0},0)
                elseif pu.level > 399 and pu.level < 450 then
                    G_PRC(player,19,{r = 0,g = 255,b = 0},0)
                elseif pu.level > 449 and pu.level < LMA then
                    G_PRC(player,21,0,0)
                else
                    G_PRC(player,19,{r = 255,g = 255,b = 255},0)
                end
            elseif pu.LVS > 99 then
                G_PRC(player,18,0,0)
            else
                G_PRC(player,19,{r = G_RI(1,255),g = G_RI(1,255),b = G_RI(1,255)},0)
            end

            if MTE ~= nil then
                G_PRC(MTE,19,{r = G_RI(1,255),g = G_RI(1,255),b = G_RI(1,255)},1)
            end

            if STE ~= nil then
                su = STE.user
                if STET == 0 then
                    if su.SK <= Game.GetTime() + 2 then
                        su.SI = Game.GetTime() + 2
                        G_PRC(STE,19,{r = 255,g = 255,b = 255},0)
                        STE:Stop(true)
                    end
    
                    if su.SK <= Game.GetTime() then
                        MSS(STE,51)
                        STET = 1
                    end
                else
                    G_PRC(STE,19,{r = 50,g = 50,b = 50},0)
                    STE:Stop(false)
                end
            end

            if MODA ~= nil then
                CMOHP.value = player.index
                MOMHP.value = MODA.maxhealth
                MOHP.value = MODA.health
                if MOSHP <= Game.GetTime() then
                    DMOHP.value = player.index
                end
            end

            if E.VIP.onoff == true and pvip[player.index] == player.index then
                pu.LVS = pu.LVS + 1
                E.VIP:Event({action="reset"},0)
                pvip[player.index] = 0
            end

            if E.LVIP.onoff == true and plvip[player.index] == player.index then
                pu.level = pu.level + 1
                E.LVIP:Event({action="reset"},0)
                plvip[player.index] = 0
            end

            if E.WPER.onoff == true and pwp[player.index] == player.index then
                if GPW[player.index] == nil and GSW[player.index] == nil then
                    NOWP.value = player.index
                elseif GSW[player.index] == nil then
                    player.coin = player.coin + WPCN(GPW[player.index])
                    player:RemoveWeapon()
                elseif GPW[player.index] == nil then
                    player.coin = player.coin + WPCN(GSW[player.index])
                    player:RemoveWeapon()
                else
                    player.coin = player.coin + (WPCN(GPW[player.index]) + WPCN(GSW[player.index]))
                    player:RemoveWeapon()
                end
                E.WPER:Event({action="reset"},0)
                pwp[player.index] = 0
            end

            if E.VIPLW.onoff == true and pvl[player.index] == player.index then
                G_WP(2,{x = 8,y = -32,z = 2})
                E.VIPLW:Event({action="reset"},0)
                pvl[player.index] = 0
            end
        end
    elseif signal == 20 then
        ALLK = 1
        AKtip.value = 0
        G_ST('AKtime',false)
    end
end

function E.VIP:OnUse(player)
    pvip[player.index] = player.index
end

function E.LVIP:OnUse(player)
    plvip[player.index] = player.index
end

function E.WPER:OnUse(player)
    pwp[player.index] = player.index
end

function E.VIPLW:OnUse(player)
    pvl[player.index] = player.index
end

-- 以遊戲時間運算函數
function G.R:OnUpdate(time)
    ClientID:OnUpdate(time)
end

-- 玩家重生時呼叫函數
function G.R:OnPlayerSpawn(player)
    pu = player.user
    if pu.ps == 1 then
        player.position = AMpos.PVP
        pu.ps = 0
        player:Signal(28)
    else
        player:Signal(1)
    end
    player.team = Game.TEAM.CT
    player.armor = player.maxarmor
    player.health = player.maxhealth
    player.gravity = 1
    AKLV[player.index] = 0
    MCC()
    CHA(player)
end

-- 各區域玩家觸碰觸發方塊
function E.M.LV01:OnTouch(player)
    player.position = {x = -55,y = -155,z = 5} -- 傳送該區域
    PLVE(player)
    player:Signal(2) -- 顯示位置
    LVNU.LV01 = LVNU.LV01 + 1 -- 該區域玩家數量+1
    MNC(1)
end
function E.M.LV50:OnTouch(player)
    pu = player.user
    if pu.level > 49 or pu.LVS > 0 then
        player.position = {x = -55,y = -115,z = 5}
        player:Signal(3)
        PLVE(player)
        LVNU.LV50 = LVNU.LV50 + 1
        MNC(2)
    else
        LVtip.value = player.index
    end
end
function E.M.LV100:OnTouch(player)
    pu = player.user
    if pu.level > 99 or pu.LVS > 0 then
        PR = G_RI(1,2)
        if PR == 1 then
            player.position = {x = -45,y = -70,z = 5}
        else
            player.position = {x = -45,y = 5,z = 5}
        end
        player:Signal(4)
        PLVE(player)
        LVNU.LV100 = LVNU.LV100 + 1
        MNC(3)
    else
        LVtip.value = player.index
    end
end
function E.M.LV150:OnTouch(player)
    pu = player.user
    if pu.level > 149 or pu.LVS > 0 then
        PR = G_RI(1,2)
        if PR == 1 then
            player.position = {x = -105,y = -165,z = 5}
        else
            player.position = {x = -85,y = -90,z = 5}
        end
        player.gravity = 0.25
        player:Signal(5)
        PLVE(player)
        LVNU.LV150 = LVNU.LV150 + 1
        MNC(4)
    else
        LVtip.value = player.index
    end
end
function E.M.LV200:OnTouch(player)
    pu = player.user
    if pu.level > 199 or pu.LVS > 0 then
        PR = G_RI(1,2)
        if PR == 1 then
            player.position = {x = -90,y = -55,z = 5}
        else
            player.position = {x = -90,y = 20,z = 5}
        end
        player:Signal(6)
        PLVE(player)
        LVNU.LV200 = LVNU.LV200 + 1
        MNC(5)
        G_ST('ENRA',true)
    else
        LVtip.value = player.index
    end
end
function E.M.LV250:OnTouch(player)
    pu = player.user
    if pu.level > 249 or pu.LVS > 0 then
        PR = G_RI(1,2)
        if PR == 1 then
            player.position = {x = -100,y = 55,z = 5}
        else
            player.position = {x = -100,y = 135,z = 5}
        end
        player:Signal(7)
        PLVE(player)
        LVNU.LV250 = LVNU.LV250 + 1
        MNC(6)
    else
        LVtip.value = player.index
    end
end
function E.M.LV300:OnTouch(player)
    pu = player.user
    if pu.level > 299 or pu.LVS > 0 then
        player.position = {x = -150,y = -170,z = 5}
        player:Signal(8)
        PLVE(player)
        LVNU.LV300 = LVNU.LV300 + 1
        MNC(7)
    else
        LVtip.value = player.index
    end
end
function E.M.LV400:OnTouch(player)
    pu = player.user
    if pu.level > 399 or pu.LVS > 0 then
        player.position = {x = -145,y = -100,z = 5}
        player:Signal(9)
        PLVE(player)
        LVNU.LV400 = LVNU.LV400 + 1
        MNC(8)
    else
        LVtip.value = player.index
    end
end
function E.M.LV500:OnTouch(player)
    pu = player.user
    if pu.LVS > 0 then
        player.position = {x = -156,y = -48,z = 5}
        player:Signal(10)
        PLVE(player)
        LVNU.LV500 = LVNU.LV500 + 1
        MNC(9)
    else
        LVtip.value = player.index
    end
end

function PLVE(player)
    AKLV[player.index] = 1
    player.user.SA = 0
end

-- 偵測該區域玩家數量
function E.MH.LV01:OnTouch(player)
    LVNU.LV01 = LVNU.LV01 - 1
    HOME(player)
end
function E.MH.LV50:OnTouch(player)
    LVNU.LV50 = LVNU.LV50 - 1
    HOME(player)
end
function E.MH.LV100_01:OnTouch(player)
    LVNU.LV100 = LVNU.LV100 - 1
    HOME(player)
end
function E.MH.LV100_02:OnTouch(player)
    LVNU.LV100 = LVNU.LV100 - 1
    HOME(player)
end
function E.MH.LV150_01:OnTouch(player)
    LVNU.LV150 = LVNU.LV150 - 1
    player.gravity = 1
    HOME(player)
end
function E.MH.LV150_02:OnTouch(player)
    LVNU.LV150 = LVNU.LV150 - 1
    player.gravity = 1
    HOME(player)
end
function E.MH.LV200_01:OnTouch(player)
    LVNU.LV200 = LVNU.LV200 - 1
    HOME(player)
end
function E.MH.LV200_02:OnTouch(player)
    LVNU.LV200 = LVNU.LV200 - 1
    HOME(player)
end
function E.MH.LV250_01:OnTouch(player)
    LVNU.LV250 = LVNU.LV250 - 1
    HOME(player)
end
function E.MH.LV250_02:OnTouch(player)
    LVNU.LV250 = LVNU.LV250 - 1
    HOME(player)
end
function E.MH.LV300_01:OnTouch(player)
    LVNU.LV300 = LVNU.LV300 - 1
    HOME(player)
end
function E.MH.LV300_02:OnTouch(player)
    LVNU.LV300 = LVNU.LV300 - 1
    HOME(player)
end
function E.MH.LV400:OnTouch(player)
    LVNU.LV400 = LVNU.LV400 - 1
    HOME(player)
end
function E.MH.LV500_01:OnTouch(player)
    LVNU.LV500 = LVNU.LV500 - 1
    HOME(player)
end
function E.MH.LV500_02:OnTouch(player)
    LVNU.LV500 = LVNU.LV500 - 1
    HOME(player)
end

-- 轉蛋系統
function G_WP(t,pos)
    local wt,wn,wp,RN,RE,TE
    if t ~= 2 then
        TE = G_GTE()
        TE = TE:ToPlayer()
        tu = TE.user
    end
    if t == 1 then
        if tu.level > 249 or tu.LVS > 0 then
            if tu.atm >= 0.1 then
                tu.atm = tu.atm - 0.1
                wt = G_RI(1,116)
                RN = G_RI(1,100)

                if RN > 0 and RN < 76 then
                    wn = G_RF(50.00,69.99)
                elseif RN > 75 and RN < 96 then
                    wn = G_RF(70.00,89.99)
                elseif RN > 95 then
                    if tu.LVS == 100 then
                        wn = G_RF(99.00,100.01)
                    else
                        wn = G_RF(90.00,100.01)
                    end
                end
            else
                NOtip.value = TE.index
                return
            end
        else
            LVtip.value = TE.index
            return
        end
    elseif t == 2 then
        wt = G_RI(1,116)
        wn = G_RF(99.90,100.01)
    elseif t == 3 then
        if TE.coin > 499999 then
            TE.coin = TE.coin - 500000
            wt = G_RI(1,116)
            RN = G_RI(1,100)

            if RN > 0 and RN < 51 then
                wn = G_RF(1.00,9.99)
            elseif RN > 50 and RN < 81 then
                wn = G_RF(10.00,29.99)
            elseif RN > 80 then
                wn = G_RF(30.00,49.99)
            end
        else
            NOtip.value = TE.index
            return
        end
    elseif t == 4 then
        if tu.level ~= LMA then
            if tu.atm >= 1 then
                tu.atm = tu.atm - 1
                RN = G_RI(1,100)
                RE = PlayerRequireExp[tu.level]
                if RN > 0 and RN < 51 then
                    RE = RE * G_RF(0.01,0.1)
                elseif RN > 50 and RN < 81 then
                    RE = RE * G_RF(0.11,0.25)
                    G_ST('EXPO',true)
                    G_ST('EXPO',false)
                elseif RN > 80 and RN < 96 then
                    RE = RE * G_RF(0.26,0.40)
                    G_ST('EXPY',true)
                    G_ST('EXPY',false)
                elseif RN > 95 then
                    RE = RE * G_RF(0.41,0.50)
                    G_ST('EXPG',true)
                    G_ST('EXPG',false)
                end
                E.SWEXP:Event({action = 'text',value = '恭喜獲得\n'..FNT(string.format('%1.0f',RE))..'\n經驗'})
                AddExp(TE,RE)
                return
            else
                ATMDtip.value = TE.index
                return
            end
        else
            NOHAP.value = TE.index
        end
    else
        return
    end

    wp = G_DBWP(wt,pos,wn)
    if wn > 49.99 and wn < 70.00 then
        G_ST('LWO',true)
    elseif wn > 69.99 and wn < 90.00 then
        G_ST('LWY',true)
    elseif wn > 89.99 and wn < 101.01 then
        if t == 2 then
            G_ST('VWG',true)
        else
            G_ST('LWG',true)
        end
    end
    return wp
end

function VWSG()
    G_ST('VWG',false)
end

-- 絕級轉蛋
function LLW(callerOn)
    if G_CO(callerOn) then
        G_WP(1,{x = 11,y = -32,z = 2})
    end
end
function LWSG()
    G_ST('LWG',false)
end
function LWSY()
    G_ST('LWY',false)
end
function LWSO()
    G_ST('LWO',false)
end

-- 一般轉蛋
function FLW(callerOn)
    if G_CO(callerOn) then
        G_WP(3,{x = 14,y = -32,z = 2})
    end
end

-- 經驗轉蛋
function LE(callerOn)
    if G_CO(callerOn) then
        G_WP(4,0)
    end
end

-- 測試用怪物
function MCC()
    if MNCC == 0 then
        Mo = G.M:Create(MonsterTypes[15],{x = -1,y = -18,z = 5})
        Mu = Mo.user
        Mo.health = nm
        Mo.armor = nm
        Mu.MK = 200
        Mu.e = 1
        Mu.w = 300
        Mu.SI = 0
        Mo.damage = 0
        MNCC = 1
        MTE = Mo
    end
end

-- 遊樂區
function E.AM.A:OnTouch(player)
    player.position = AMpos.A
    player:Signal(25)
end
function E.H.A:OnTouch(player)
    HOME(player)
end
function E.AM.PK:OnTouch(player)
    player.position = AMpos.PK
    player:Signal(26)
end
function E.H.PK:OnTouch(player)
    HOME(player)
end
function E.AM.SI:OnTouch(player)
    player.position = AMpos.SI
    player:Signal(27)
end
function E.H.SI:OnTouch(player)
    HOME(player)
end
function E.AM.PVP:OnTouch(player)
    player.position = AMpos.PVP
    player:Signal(28)
end
function E.H.PVP:OnTouch(player)
    HOME(player)
    player.user.ps = 0
end
function E.AM.SM:OnTouch(player)
    player.position = AMpos.SM
    player:Signal(29)
end
function E.H.SM:OnTouch(player)
    HOME(player)
end

function E.A.O:OnTouch(player)
    player.position = {x = 115,y = -5,z  = 1}
    player:Signal(51)
end
function E.A.HOME.O:OnTouch(player)
    player.position = AMpos.A
    player:Signal(25)
end

function E.PK.O:OnTouch(player)
    player.position = {x = -14,y = 36,z = 1}
    player:Signal(61)
end
function E.PK.END.O:OnTouch(player)
    AddExp(player,5000000)
    player.position = {x = -14,y = 36,z = 1}
end
function E.PK.HOME.O:OnTouch(player)
    player.position = AMpos.PK
    player:Signal(26)
end
function E.PK.O2:OnTouch(player)
    player.position = {x = 34,y = 36,z = 1}
    player:Signal(62)
end
function E.PK.END.O2:OnTouch(player)
    AddExp(player,1000000000)
    player.position = {x = 34,y = 36,z = 1}
end
function E.PK.HOME.O2:OnTouch(player)
    player.position = AMpos.PK
    player:Signal(26)
end
function E.PK.O3:OnTouch(player)
    player.position = {x = 83,y = 36,z = 1}
    player:Signal(63)
end
function E.PK.END.O3:OnTouch(player)
    AddExp(player,250000000)
    player.position = {x = 83,y = 36,z = 1}
end
function E.PK.HOME.O3:OnTouch(player)
    player.position = AMpos.PK
    player:Signal(26)
end
function E.PK.O4:OnTouch(player)
    player.position = {x = 135,y = 40,z = 1}
    player:Signal(64)
end
function E.PK.END.O4:OnTouch(player)
    AddExp(player,500000000)
    player.position = {x = 135,y = 40,z = 1}
end
function E.PK.HOME.O4:OnTouch(player)
    player.position = AMpos.PK
    player:Signal(26)
end

function E.SI.O:OnTouch(player)
    player.position = {x = -14,y = 115,z = 7}
    player:Signal(71)
end
function E.SI.END.O:OnTouch(player)
    AddExp(player,5000000)
    player.position = {x = -14,y = 115,z = 7}
end
function E.SI.HOME.O:OnTouch(player)
    player.position = AMpos.SI
    player:Signal(27)
end
function E.SI.O2:OnTouch(player)
    player.position = {x = 82,y = 117,z = 6}
    player:Signal(72)
end
function E.SI.END.O2:OnTouch(player)
    AddExp(player,10000000)
    player.position = {x = 82,y = 117,z = 6}
end
function E.SI.HOME.O2:OnTouch(player)
    player.position = AMpos.SI
    player:Signal(27)
end
function E.SI.O3:OnTouch(player)
    player.position = {x = 35,y = 120,z = 7}
    player:Signal(73)
end
function E.SI.END.O3:OnTouch(player)
    AddExp(player,ne)
    player.position = {x = 35,y = 120,z = 7}
end
function E.SI.HOME.O3:OnTouch(player)
    player.position = AMpos.SI
    player:Signal(27)
end
function E.SI.O4:OnTouch(player)
    player.position = {x = 142,y = 82,z = 34}
    player:Signal(74)
end
function E.SI.END.O4:OnTouch(player)
    AddExp(player,ne*10)
    player.position = {x = 142,y = 82,z = 34}
end
function E.SI.HOME.O4:OnTouch(player)
    player.position = AMpos.SI
    player:Signal(27)
end

function E.PVP.O:OnTouch(player)
    PVPDB(1,player,{x = 160,y = -146,z  = 1},{x = 160,y = -175,z  = 1})
    player:Signal(81)
end
function E.PVP.HOME.O:OnTouch(player)
    PVPDB(2,player,nil,nil)
end
function E.PVP.O2:OnTouch(player)
    PVPDB(1,player,{x = 120,y = -175,z  = 1},{x = 105,y = -145,z  = 1})
    player:Signal(82)
end
function E.PVP.HOME.O2_1:OnTouch(player)
    PVPDB(2,player,nil,nil)
end
function E.PVP.HOME.O2_2:OnTouch(player)
    PVPDB(2,player,nil,nil)
end
function E.PVP.O3:OnTouch(player)
    PVPDB(1,player,{x = 57,y = -161,z  = 1},{x = 70,y = -161,z  = 1})
    player:Signal(83)
end
function E.PVP.HOME.O3_1:OnTouch(player)
    PVPDB(2,player,nil,nil)
end
function E.PVP.HOME.O3_2:OnTouch(player)
    PVPDB(2,player,nil,nil)
end

function E.PVP.SP.O:OnTouch(player)
    player.position = {x = 170,y = -160,z = 14}
    player:Signal(101)
end
function E.PVP.SP.O2:OnTouch(player)
    player.position = {x = 125,y = -160,z = 14}
    player:Signal(102)
end
function E.PVP.SP.O3:OnTouch(player)
    player.position = {x = 63,y = -146,z = 10}
    player:Signal(103)
end
function E.PVP.SP.HOME.O:OnTouch(player)
    player.position = AMpos.PVP
    player:Signal(28)
end
function E.PVP.SP.HOME.O2:OnTouch(player)
    player.position = AMpos.PVP
    player:Signal(28)
end
function E.PVP.SP.HOME.O3:OnTouch(player)
    player.position = AMpos.PVP
    player:Signal(28)
end

function PVPDB(N,player,TRpos,CTpos)
    if N == 1 then
        player.user.SA = Game.GetTime() + 3
        if pvp.TR - pvp.CT == 0 or pvp.CT > pvp.TR then
            player.team = Game.TEAM.TR
            player.position = TRpos
            pvp.TR = pvp.TR + 1
        elseif pvp.TR > pvp.CT then
            player.team = Game.TEAM.CT
            player.position = CTpos
            pvp.CT = pvp.CT + 1
        end
        player.user.pvp = 1
    elseif N == 2 then
        PVP_TF(player)
        player.team = Game.TEAM.CT
        player.position = AMpos.PVP
        player:Signal(28)
    end
end

function E.SM.O:OnTouch(player)
    pu = player.user
    if pu.level > 99 or pu.LVS > 0 then
        player.position = {x = -45,y = 40,z = 5}
        player:Signal(91)
        PLVE(player)
        LVNU.LVSM1 = LVNU.LVSM1 + 1
        MNC(100)
    else
        LVtip.value = player.index -- 提示未達標的玩家
    end
end
function E.SM.HOME.O:OnTouch(player)
    LVNU.LVSM1 = LVNU.LVSM1 - 1
    player.position = AMpos.SM
    player:Signal(29)
end
function E.SM.O2:OnTouch(player)
    pu = player.user
    if pu.level > 249 or pu.LVS > 0 then
        player.position = {x = -50,y = 105,z = 5}
        player:Signal(92)
        PLVE(player)
        LVNU.LVSM2 = LVNU.LVSM2 + 1
        MNC(101)
    else
        LVtip.value = player.index -- 提示未達標的玩家
    end
end
function E.SM.HOME.O2:OnTouch(player)
    LVNU.LVSM2 = LVNU.LVSM2 - 1
    player.position = AMpos.SM
    player:Signal(29)
end
function E.SM.O3:OnTouch(player)
    pu = player.user
    if pu.level > 499 or pu.LVS > 0 then
        player.position = {x = -50,y = 155,z = 5}
        player:Signal(93)
        PLVE(player)
        LVNU.LVSM3 = LVNU.LVSM3 + 1
        MNC(102)
    else
        LVtip.value = player.index -- 提示未達標的玩家
    end
end
function E.SM.HOME.O3:OnTouch(player)
    LVNU.LVSM3 = LVNU.LVSM3 - 1
    player.position = AMpos.SM
    player:Signal(29)
end
function E.SM.O4:OnTouch(player)
    pu = player.user
    if pu.LVS > 4 then
        player.position = {x = -140,y = 5,z = 5}
        player:Signal(94)
        PLVE(player)
        LVNU.LVSM4 = LVNU.LVSM4 + 1
        MNC(103)
    else
        LVtip.value = player.index -- 提示未達標的玩家
    end
end
function E.SM.HOME.O4:OnTouch(player)
    LVNU.LVSM4 = LVNU.LVSM4 - 1
    player.position = AMpos.SM
    player:Signal(29)
end

-- 重生點
function HOME(player)
    player.position = HOMEpos
    AKLV[player.index] = 0
    player.user.SA = 1
    player:Signal(1)
end

-- 難易度
function E.UP:OnUse(player)
    if UP >= 9 then
        UP = 9
    else
        UP = UP + 2
    end
    DFtip.value = UP
end
function E.DN:OnUse(player)
    if UP <= 1 then
        UP = 1
    else
        UP = UP - 2
    end
    DFtip.value = UP
end

-- 雲端銀行
function E.ATMU:OnUse(player)
    pu = player.user
    if player.coin >= ne then
        if pu.atm == nil then
            pu.atm = 2
        else
            pu.atm = pu.atm + 1
        end
        player.coin = player.coin - ne
    else
        ATMUtip.value = player.index
    end
    ATMtip.value = pu.atm
end
function E.ATMD:OnUse(player)
    pu = player.user
    if pu.atm == nil then
        pu.atm = 0
    end

    if pu.atm > 0 then
        if (player.coin + ne) <= CMA then
            pu.atm = pu.atm - 1
            player.coin = player.coin + ne
        else
            NOHAP.value = player.index
        end
    else
        ATMDtip.value = player.index
    end
    ATMtip.value = pu.atm
end

-- 計算怪物數量
function MNC(LVMO)
    if LVMO == 103 then
        MLC[LVMO] = 1 - LVC[LVMO]
    elseif LVMO == 1 or LVMO == 2 or LVMO == 6 or LVMO == 102 then
        MLC[LVMO] = 5 - LVC[LVMO]
    elseif LVMO == 5 then
        MLC[LVMO] = 11 - LVC[LVMO]
    else
        MLC[LVMO] = 10 - LVC[LVMO]
    end

    LCM = MLC[LVMO]
    LVM = LVMO
    MonsterC(LCM,LVM)
end

-- 怪物系統
function MonsterC(LCM,LVM)
    MT = 0
    MLV = 0
    MS = 0
    for i = 1, LCM do
        if LVNU.LV01 ~= 0 and LVM == 1 then
            MT = G_RI(1,2) -- 怪物種類
            MLV = G_RI(1,50) * UP -- 怪物等級
            MS = 0.5 -- 怪物地速
            Moi = G.M:Create(MonsterTypes[MT],LVpos.LV01) -- 怪物生成
            LVC[1] = LVC[1] + 1
        elseif LVNU.LV50 ~= 0 and LVM == 2 then
            MT = G_RI(11,12)
            MLV = G_RI(51,99) * UP
            MS = 0.7
            Moi = G.M:Create(MonsterTypes[MT],LVpos.LV50)
            LVC[2] = LVC[2] + 1
        elseif LVNU.LV100 ~= 0 and LVM == 3 then
            MT = G_RI(23,27)
            MLV = G_RI(100,249) * UP
            MS = 1
            Mpos = G_RI(1,3)
            Moi = G.M:Create(MonsterTypes[MT],LVpos.LV100[Mpos])
            LVC[3] = LVC[3] + 1
        elseif LVNU.LV150 ~= 0 and LVM == 4 then
            MR = G_RI(1,2)
            if MR == 1 then
                MT = G_RI(17,18)
            else
                MT = G_RI(30,31)
            end
            MLV = G_RI(250,499) * UP
            MS = 1.5
            Moi = G.M:Create(MonsterTypes[MT],LVpos.LV150)
            LVC[4] = LVC[4] + 1
        elseif LVNU.LV200 ~= 0 and LVM == 5 then
            MLV = 500 * UP
            if BOSSSC == 0 then
                MS = 5
                Moi = G.M:Create(1289,LVpos.LV200[3])
            else
                MT = G_RI(15,16)
                MS = 1.5
                Mpos = G_RI(1,2)
                Moi = G.M:Create(MonsterTypes[MT],LVpos.LV200[Mpos])
            end
            LVC[5] = LVC[5] + 1
        elseif LVNU.LV250 ~= 0 and LVM == 6 then
            MLV = G_RI(500,750) * UP
            MS = 2
            Mpos = G_RI(1,3)
            Moi = G.M:Create(1289,LVpos.LV250[Mpos])
            LVC[6] = LVC[6] + 1
        elseif LVNU.LV300 ~= 0 and LVM == 7 then
            MT = G_RI(34,36)
            MLV = G_RI(750,1000) * UP
            MS = 2.5
            Mpos = G_RI(1,2)
            Moi = G.M:Create(MonsterTypes[MT],LVpos.LV300[Mpos])
            LVC[7] = LVC[7] + 1
        elseif LVNU.LV400 ~= 0 and LVM == 8 then
            MT = G_RI(28,29)
            MLV = G_RI(1000,1250) * UP
            MS = 3
            Moi = G.M:Create(MonsterTypes[MT],LVpos.LV400)
            LVC[8] = LVC[8] + 1
        elseif LVNU.LV500 ~= 0 and LVM == 9 then
            MT = G_RI(32,33)
            MLV = G_RI(1250,1500) * UP
            MS = 5
            Moi = G.M:Create(MonsterTypes[MT],LVpos.LV500)
            LVC[9] = LVC[9] + 1
        elseif LVNU.LVSM1 ~= 0 and LVM == 100 then
            MLV = 100 * UP
            MS = 1.5
            Moi = G.M:Create(MonsterTypes[19],LVpos.LVSM1)
            LVC[100] = LVC[100] + 1
        elseif LVNU.LVSM2 ~= 0 and LVM == 101 then
            MLV = 150 * UP
            MS = 1
            Moi = G.M:Create(MonsterTypes[22],LVpos.LVSM2)
            LVC[101] = LVC[101] + 1
        elseif LVNU.LVSM3 ~= 0 and LVM == 102 then
            MLV = 300 * UP
            MS = 1.5
            Moi = G.M:Create(MonsterTypes[36],LVpos.LVSM3)
            LVC[102] = LVC[102] + 1
        elseif LVNU.LVSM4 ~= 0 and LVM == 103 then
            MLV = 500 * UP
            MS = 2
            Moi = G.M:Create(MonsterTypes[35],LVpos.LVSM4)
            LVC[103] = LVC[103] + 1
        end

        if Moi == nil then
            i = i - 1
            return
        end

        if BOSSSC == 0 and LVM == 5 then
            Moi.health = nm
            Moi.armor = nm
            Moi.damage = 2500 * UP
            Moi.coin = 100000 * UP
            Moi.speed = 5
        else
            Moi.health = G_RI(100,250) * MLV
            Moi.armor = G_RI(10,25) * MLV
            Moi.damage = G_RI(1,2) * MLV
            Moi.coin = G_RI(200,400) * MLV
            Moi.speed = MS
        end
        if Moi.maxhealth >= 1000000 then
            Moi.maxhealth = 1000000
        end
        Mu = Moi.user
        Moi.viewDistance = 20
        Mu.SI = Game.GetTime() + 3
        Mu.MK = LVM

        if LVM == 103 then
            STE = Moi
            Mu.SK = Game.GetTime() + 5
        end

        if LVM < 100 then
            if LVM == 5 and BOSSSC == 0 then
                Mu.w = 151
                Mu.B = 1
                G_PRC(Moi,19,{r = 1,g = 1,b = 1},0)
                BOSSSC = 1
            else
                if Moi.health > 999 and Moi.health < 5000 then
                    G_PRC(Moi,19,{r = 255,g = 255,b = 255},1)
                    Mu.w = G_RF(1.5,3)
                    Mu.e = G_RF(0.5,1) * MLV
                elseif Moi.health > 4999 and Moi.health < 10000 then
                    G_PRC(Moi,19,{r = 0,g = 0,b = 255},1)
                    Mu.w = G_RF(3,5)
                    Mu.e = G_RF(1,1.5) * MLV
                elseif Moi.health > 9999 and Moi.health < 25000 then
                    G_PRC(Moi,19,{r = 255,g = 0,b = 0},1)
                    Mu.w = G_RF(5,7.5)
                    Mu.e = G_RF(1.5,2) * MLV
                elseif Moi.health > 24999 and Moi.health < 50000 then
                    G_PRC(Moi,19,{r = 255,g = 100,b = 0},1)
                    Mu.w = G_RF(7.5,10)
                    Mu.e = G_RF(2,2.5) * MLV
                elseif Moi.health > 49999 and Moi.health < 75000 then
                    G_PRC(Moi,19,{r = 255,g = 255,b = 0},1)
                    Mu.w = G_RF(10,15)
                    Mu.e = G_RF(2.5,5) * MLV
                elseif Moi.health > 74999 and Moi.health < 100000 then
                    G_PRC(Moi,19,{r = 255,g = 0,b = 255},1)
                    Mu.w = G_RF(15,20)
                    Mu.e = G_RF(5,10) * MLV
                elseif Moi.health > 99999 and Moi.health < 125000 then
                    G_PRC(Moi,19,{r = 100,g = 0,b = 255},1)
                    Mu.w = G_RF(20,25)
                    Mu.e = G_RF(10,25) * MLV
                elseif Moi.health > 124999 and Moi.health < 150000 then
                    G_PRC(Moi,19,{r = 100,g = 0,b = 0},0)
                    Mu.w = G_RF(25,30)
                    Mu.e = G_RF(25,50) * MLV
                elseif Moi.health > 149999 and Moi.health < 175000 then
                    G_PRC(Moi,19,{r = 0,g = 0,b = 100},0)
                    Mu.w = G_RF(30,35)
                    Mu.e = G_RF(50,100) * MLV
                elseif Moi.health > 174999 and Moi.health < 200000 then
                    G_PRC(Moi,19,{r = 0,g = 100,b = 0},0)
                    Mu.w = G_RF(35,40)
                    Mu.e = G_RF(100,250) * MLV
                elseif Moi.health > 199999 and Moi.health < 250000 then
                    G_PRC(Moi,19,{r = 0,g = 255,b = 0},0)
                    Mu.w = G_RF(40, 45)
                    Mu.e = G_RF(250, 500) * MLV
                elseif Moi.health > 249999 and Moi.health < 500000 then
                    G_PRC(Moi,21,0,0)
                    Mu.w = G_RF(45,50)
                    Mu.e = G_RF(500,1000) * MLV
                elseif Moi.health > 499999 and Moi.health < 750000 then
                    G_PRC(Moi,19,{r = 50,g = 50,b = 50},0)
                    Mu.w = G_RF(50,60)
                    Mu.e = G_RF(1000,10000) * MLV
                elseif Moi.health > 749999 then
                    G_PRC(Moi,15,0,0)
                    Mu.w = G_RF(60,70)
                    Mu.e = G_RF(10000,20000) * MLV
                else
                    G_PRC(Moi,0,0,1)
                    Mu.w = G_RF(1,1.5)
                    Mu.e = G_RF(0.1,0.5) * MLV
                end
                Mu.B = 0
            end
        elseif LVM > 99 then
            if LVM == 100 then
                G_PRC(Moi,18,0,0)
            else
                G_PRC(Moi,19,{r = 50,g = 50,b = 50},0)
            end
            Mu.w = 150
            Mu.e = G_RF(100,200) * MLV
            Mu.B = 0
        end
    end
end

-- 怪物傷害系統
function G.R:OnTakeDamage(victim,attacker,damage,weapontype,hitbox)
	if attacker == nil then
        if victim:IsMonster() then
            victim = victim:ToMonster()
            vu = victim.user
            if vu.SI > Game.GetTime() then
                damage = 0 
            end
            return damage
        elseif victim:IsPlayer() then
            victim = victim:ToPlayer()
            vu = victim.user
            return damage
        end
	elseif attacker:IsPlayer() then
        attacker = attacker:ToPlayer()
        au = attacker.user
        if victim:IsMonster() then
            victim = victim:ToMonster()
            vu = victim.user

            if vu.SI > Game.GetTime() then
                return 0
            end

            if vu.MK == 200 then
                attacker.coin = attacker.coin + 1
            else
                damageEXP(attacker,victim)
            end
            damage = ADD_damage(attacker,victim,weapontype,damage)
            MODA = victim
            MOSHP = Game.GetTime() + 1
        elseif victim:IsPlayer() then
            victim = victim:ToPlayer()
            vu = victim.user
            if au.pvp == 0 or vu.pvp == 0 then
                return
            else
                if attacker.team == Game.TEAM.CT and victim.team == Game.TEAM.TR then
                    attacker.coin = attacker.coin + (vu.LVS * vu.level)
                    AddExp(attacker, (vu.LVS * vu.level))
                elseif attacker.team == Game.TEAM.TR and victim.team == Game.TEAM.CT then
                    attacker.coin = attacker.coin + (vu.LVS * vu.level)
                    AddExp(attacker, (vu.LVS * vu.level))
                else
                    victim.velocity = { z = 0 }
                    return
                end
            end
            return damage
        end
    elseif attacker:IsMonster() then
        attacker = attacker:ToMonster()
        au = attacker.user
        if victim:IsPlayer() then
            victim = victim:ToPlayer()
            vu = victim.user
            if au.B == 1 then
                damage = 2500 * UP
            elseif au.MK == 6 then
                damage = 5000 * UP
            elseif au.MK == 101 then
                victim.velocity = {z = 10000}
            else
                damage = damage / (500 * 0.25) 
            end
            return damage
        elseif victim:IsMonster() then
            victim = victim:ToMonster()
            vu = victim.user
            if vu.SI > Game.GetTime() then
                damage = 0 
            end
            return damage
        end
    else
        return
	end
end
-- 玩家傷害系統
function G.R:OnPlayerAttack(victim,attacker,damage,weapontype,hitbox)
    if attacker == nil then
        victim = victim:ToPlayer()
        vu = victim.user
        return damage
    elseif attacker:IsPlayer() then
        attacker = attacker:ToPlayer()
        victim = victim:ToPlayer()
        au = attacker.user
        vu = victim.user
        if au.pvp == 0 or vu.pvp == 0 or vu.SA > Game.GetTime() then
            damage = 0
        end
        CCSD.value = attacker.index
        SD.value = damage 
        return damage / 500
    else
        return
    end
end

-- 怪物擊殺系統
function G.R:OnKilled(victim,killer)
    if killer == nil or killer:IsMonster() then
        if victim:IsMonster() then
            victim = victim:ToMonster()
            vu = victim.user
            if vu.MK == 200 then
                MNCC = 0
                MCC()
            elseif vu.B == 1 then
                BOSSSC = 0
                LVC[5] = LVC[5] - 1
            end
        elseif victim:IsPlayer() then
            victim = victim:ToPlayer()
            vu = victim.user
            PVP_TF(victim)
        end
    elseif killer:IsPlayer() then
        killer = killer:ToPlayer()
        ku = killer.user
        if victim:IsMonster() then
            victim = victim:ToMonster()
            vu = victim.user
            UKlii = UKlii + 1
            KNU.value = UKlii

            if vu.MK == 51 then
                SNU = SNU + 1
                if SNU >= 4 then
                    STET = 0
                    STE.user.SK = Game.GetTime() + 5
                    SNU = 0
                end
            end

            if vu.MK == 103 then
                G_ST('SK2',false)
            end

            if vu.MK > 0 and vu.MK < 104 and vu.B == 0 then
                if vu.MK == 102 then
                    MSS(victim,50)
                    Total_area(vu.MK,vu.B)
                elseif vu.MK == 50 then
                elseif vu.MK == 51 then
                else
                    Total_area(vu.MK,vu.B)
                end
                AddExp(killer,vu.e)
            elseif vu.MK == 5 and vu.B == 1 then
                Total_area(vu.MK,vu.B)
                AddExp(killer,nm * UP * 5)
            elseif vu.MK == 200 then
                MNCC = 0
                MCC()
            end
            Add_weapon(killer,victim)
            MODA = nil
            CMOHP.value = player.index
            MOMHP.value = victim.maxhealth
            MOHP.value = 0
        elseif victim:IsPlayer() then
            victim = victim:ToPlayer()
            vu = victim.user
            if killer.team == Game.TEAM.CT and victim.team == Game.TEAM.TR then
                killer.coin = killer.coin + (vu.LVS * 5000)
                AddExp(killer,(ku.LVS * vu.LVS * 5000))
            elseif killer.team == Game.TEAM.TR and victim.team == Game.TEAM.CT then
                killer.coin = killer.coin + (vu.LVS * 5000)
                AddExp(killer,(ku.LVS * vu.LVS * 5000))
            else
                return
            end
        end
    else
        return
    end
end
-- 玩家擊殺系統
function G.R:OnPlayerKilled(victim,killer)
    if killer == nil then
        if victim:IsPlayer() then
            victim = victim:ToPlayer()
            PVP_TF(victim)
        end
        return
    elseif killer:IsPlayer() and victim:IsPlayer() then
        victim = victim:ToPlayer()
        killer = killer:ToPlayer()
        vu = victim.user
        ku = killer.user
        PVP_TF(victim)
    else
        return
    end
end

function MSS(victim,SN)
    for i = 1, 4 do
        Moi = G.M:Create(MonsterTypes[18],victim.position)
        if Moi == nil then
            i = i - 1
        end
        Moi.health = 10000
        Moi.armor = 10000
        Moi.damage = 1000
        Moi.coin = 10000 * UP
        Moi.speed = 2
        Mu = Moi.user
        Moi.viewDistance = 20
        Mu.SI = 0
        Mu.MK = SN
        G_PRC(Moi,19,{r = 255,g = 0,b = 0},1)
        Mu.w = G_RF(60,70)
        Mu.e = G_RF(10000,20000) * Mu.MK
    end
end

-- 計算傷害
function ADD_damage(attacker,victim,weapontype,damage)
    vu = victim.user
    au = attacker.user
    if vu.MK == 103 then
        return 100
    end
    if vu.B == 1 then
        if weapontype == WeaponTypes[1] then
            damage = (500 + au.pd) * 2 / UP
        elseif weapontype == WeaponTypes[2] then
            damage = (500 + pu.SD + au.pd) * 10 / UP
        elseif weapontype == WeaponTypes[3] then
            damage = (damage + 500 + au.pd) * 5 / UP
        else
            damage = (500 + pu.PD + au.pd) * 10 / UP
        end
    else
        if weapontype == WeaponTypes[1] then
            damage = (damage + 500 + au.pd) * 2 / UP
        elseif weapontype == WeaponTypes[3] then
            damage = (damage + 500 + au.pd) * 5 / UP
        else
            damage = damage + 500 + au.pd / UP
        end
    end
    CCSD.value = attacker.index
    SD.value = damage
    victim:ShowOverheadDamage(damage,0)
    return damage
end
-- 傷害獎勵
function damageEXP(attacker,victim)
    vu = victim.user
    au = attacker.user
    AddExp(attacker,(vu.MK + (500 * UP)))
    if attacker.coin + (vu.MK + (500 * UP)) >= CMA then
        attacker.coin = CMA
    else
        attacker.coin = attacker.coin + (vu.MK + (500 * UP))
    end
end
-- 區域計算
function Total_area(vu_MK,vu_B)
    if vu_MK == 103 then
        LVC[vu_MK] = LVC[vu_MK] - 1
        if LVC[vu_MK] ~= 1 then
            MNC(vu_MK)
        end
    elseif vu_MK == 1 or vu_MK == 2 or vu_MK == 6 or vu_MK == 102 then
        LVC[vu_MK] = LVC[vu_MK] - 1
        if LVC[vu_MK] ~= 5 then
            MNC(vu_MK)
        end
    else
        if vu_MK == 5 and vu_B == 1 then
            BOSSSC = 0
        end
        LVC[vu_MK] = LVC[vu_MK] - 1
        if LVC[vu_MK] ~= 10 then
            MNC(vu_MK)
        end
    end 
end
-- 處理掉落武器
function Add_weapon(killer,victim)
    local wt = G_RI(1,116)
    vu = victim.user
    ku = killer.user
    wn = 0

    if vu.w == 150 then
        local RN = G_RI(1,100)

        if RN > 0 and RN < 51 then
            return
        elseif RN > 51 then
            wn = 50 + UP
        end
    elseif vu.w == 300 then
        return
    else
        if vu.MK == 6 or vu.w == 151 then
            wn = 85 + UP
        else
            for i = 1, #Prohweapon do
                if wt == Prohweapon[i] then
                    wt = wt - 10
                end
            end
            
            wn = vu.w + UP
        end
    end
    
    local wp = G_DBWP(wt,victim.position,wn)
    return wp
end

-- 清除所有怪物
function ALLKILL(callerOn)
    if G_CO(callerOn) then
        if ALLK == 1 then
            Game.KillAllMonsters()
            G_ST('AKtime',true)
            AKtip.value = 1
            BOSSSC = 0
            ALLK = 0
            for i = 1,9 do
                LVC[i] = 0
            end
            LVC[100] = 0
            LVC[101] = 0
            LVC[102] = 0
        end
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
function CalcExpRate(level,exp)
    if exp ~= nil then
        return exp / PlayerRequireExp[level]
    end
end
-- 給予玩家經驗值
function AddExp(player,exp)
    pu = player.user
    if pu.LVS == nil then
        pu.LVS = 0
    end
    CPEXP.value = player.index
	-- 滿等的話跳過
    if pu.level >= LMA then
        pu.level = 1
        pu.LVS = pu.LVS + 1
        P_LV.value = player.index
    elseif pu.LVS > 0 then
        P_LV.value = player.index
	end
    PLEVEL.value = PlayerRequireExp[pu.level]
    pu.exp = pu.exp + exp
    PEXP.value = pu.exp
	 -- 等級提升
	if pu.exp > PlayerRequireExp[pu.level] then
		pu.level = pu.level + 1
		if pu.level >= LMA then
			pu.exp = 0
		else
			pu.exp = pu.exp - PlayerRequireExp[pu.level - 1]
        end
		OnLevelUp(player)
    end

    -- 顯示等級/經驗值 UI更新
	pu.expRate = CalcExpRate(pu.level,pu.exp)
	player:SetLevelUI(pu.level,pu.expRate) -- 等級/經驗值 UI 設定
end

-- 玩家選擇角色後初次重生時叫出的函數
function G.R:OnPlayerJoiningSpawn(player)
    if lint == 0 then
        dn = 1.0
        for i = 1,LMA do
            table.insert(PlayerRequireExp,i,round(10^dn))
            if i > 9 and i < 20 then
                dn = dn + 0.09
            elseif i > 19 and i < 30 then
                dn = dn + 0.08
            elseif i > 29 and i < 40 then
                dn = dn + 0.07
            elseif i > 39 and i < 50 then
                dn = dn + 0.06
            elseif i > 49 and i < 100 then
                dn = dn + 0.05
            elseif i > 99 and i < 250 then
                dn = dn + 0.01
            elseif i > 249 and i < 500 then
                dn = dn + 0.005
            else
                dn = dn + 0.1
            end
        end
        lint = 1
    end
    if player ~= nil then
        pu = player.user
        -- 儲存玩家排列
        AKLV[player.index] = 0
        pvip[player.index] = 0
        pwp[player.index] = 0
        pvl[player.index] = 0
        -- 團隊設定
        if player.team == Game.TEAM.TR then
            player.team = Game.TEAM.CT
        end
        -- 基本能力
        player.coin = 500000
        player.maxhealth = 50
        player.maxarmor = 50
        pu.level = 1
        pu.LVS = 0
        pu.exp = 0
        pu.expRate = 0
        pu.atm = 1
        pu.pd = 0
        pu.pvp = 0
        pu.SA = 0
        pu.SD = 1
        pu.PD = 1
        pu.p1 = 0
        pu.vip = 0
        DEtip.value = pu.pd
        if player.name == n then
            pu.level = 499
            pu.LVS = 5
            pu.atm = 100
            player.maxhealth = HMA
            player.maxarmor = AMA
        end
        CHA(player)
        player:Signal(1)
        player:SetLevelUI(pu.level,pu.expRate)
    end
end

-- 玩家離線
function G.R:OnPlayerDisconnect(player)
    if player ~= nil then
        pu = player.user

        if pu.level == nil or pu.exp == nil or pu.atm == nil or pu.pd == nil or pu.LVS == nil or pu.p1 == nil or pu.vip == nil then
            return
        end
    
        player:SetGameSave('level',pu.level)
        player:SetGameSave('LVS',pu.LVS)
        player:SetGameSave('exp',pu.exp)
        player:SetGameSave('atm',pu.atm)
        player:SetGameSave('pd',pu.pd)
        player:SetGameSave('p1',pu.p1)
        player:SetGameSave('vip',pu.vip)
    end
end
-- 紀錄計算
function DoubleToInt(number)
    if number ~= nil then
        return math.floor(math.abs(number + EPSILON))
    end
end
-- 各玩家儲存資訊
function G.R:OnGameSave(player)
    if player ~= nil then
        pu = player.user

        if pu.level == nil or pu.exp == nil or pu.atm == nil or pu.pd == nil or pu.LVS == nil or pu.p1 == nil or pu.vip == nil then
            return
        end
    
        player:SetGameSave('level',pu.level)
        player:SetGameSave('LVS',pu.LVS)
        player:SetGameSave('exp',pu.exp)
        player:SetGameSave('atm',pu.atm)
        player:SetGameSave('pd',pu.pd)
        player:SetGameSave('p1',pu.p1)
        player:SetGameSave('vip',pu.vip)
    end
end
-- 各玩家 save 資訊Load
function G.R:OnLoadGameSave(player)
	if player ~= nil then
        pu = player.user

        -- 等級、經驗值 Load
        if pu.level == nil then
            pu.level = 1
        else
            pu.level = DoubleToInt(player:GetGameSave('level'))
        end
        if pu.LVS == nil then
            pu.LVS = 0
        else
            pu.LVS = DoubleToInt(player:GetGameSave('LVS'))
        end
        if pu.exp == nil then
            pu.exp = 0
        else
            pu.exp = DoubleToInt(player:GetGameSave('exp'))
        end
        if pu.atm == nil then
            pu.atm = 1
        else
            pu.atm = DoubleToInt(player:GetGameSave('atm'))
        end
        if pu.pd == nil then
            pu.pd = 0
        else
            pu.pd = DoubleToInt(player:GetGameSave('pd'))
        end
        if pu.p1 == nil then
            pu.p1 = 0
        else
            pu.p1 = DoubleToInt(player:GetGameSave('p1'))
        end
        if pu.vip == nil then
            pu.vip = 0
        else
            pu.vip = DoubleToInt(player:GetGameSave('vip'))
        end

        if pu.p1 == 0 then
            if player.name == '我只是個wack' then
                pu.p1 = 1
                pu.level = 250
                pu.atm = pu.atm + 500
            end
        end

        DATA_MAX(player)
        CHA(player)
        pu.expRate = CalcExpRate(pu.level,pu.exp)

        -- 各等級 UI 初始化
        OnLevelUp(player)
        player:SetLevelUI(pu.level,pu.expRate)
    end
end
-- 各玩家 save 資訊初始化
function G.R:OnClearGameSave(player)
    pu = player.user
	pu.level = 1
    pu.LVS = 0
	pu.exp = 0
    pu.expRate = 0
    pu.SA = 0
    pu.pvp = 0
    pu.pd = 0
    pu.SD = 1
    pu.PD = 1
    pu.atm = 1
    pu.p1 = 0
    pu.vip = 0
    player.coin = 500000
    player.maxhealth = 50
    player.health = 50
    player.maxarmor = 50
    player.armor = 50
	player:RemoveWeapon()
    player:ClearWeaponInven()
    CHA(player)
	OnLevelUp(player)
	player:SetLevelUI(pu.level,pu.expRate)
end