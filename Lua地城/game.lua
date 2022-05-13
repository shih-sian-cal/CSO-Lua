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
ne = 100000000 -- 存款數值
HMA = 10000 -- 玩家最高血量
AMA = 10000 -- 玩家最高護甲
DMA = 1000000 -- 玩家最高攻擊力
ALLK = 1 -- 判斷清除怪物
MNCC = 0 -- 判斷測試怪物
STPV = 0 -- 人稱切換
Kill = 0 -- 總擊殺
DKill = 0 -- 區域擊殺
lint = 0 --初始計算

EXP = 0
Mpos = {}
UP = 1
GPW = {}
GSW = {}
LVC = {}
tm1 = 0
tm2 = 0
tm3 = 0
EM = 0
STPV = 0
BOSSSC = 0
RE = {}
bee_x = {}
bee_y = {}
bee_z = {}
x2 = {}
y2 = {}
z2 = {}
BOSS = 0
RConoff = 0
RC = 0
REPTIME = 0
n = '珍惜現在所擁有'

pn = {
    [1] = '0'
}

function FNT(num)
	local function checknumber(value)
		return tonumber(value) or 0
	end
	local formatted = tostring(checknumber(num))
	local k
	while true do
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
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

function G_RI(max, min)
    return Game.RandomInt(max, min)
end

function G_RF(max, min)
    return Game.RandomFloat(max, min)
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

function G_ST(str, bool)
    return Game.SetTrigger(str, bool)
end

function G_EB_C(a, b, c)
    return G.EB:Create({x = a, y = b, z = c})
end

function DATA_MAX(player)
    pu = player.user
    AddExp(player, 0)
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

function G_PRC(EN, fx, rgb, MAK)
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

function G_DBWP(wt, pos, wn)
    local wp = Game.Weapon.CreateAndDrop(WeaponList[wt], pos)
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

CCSD = G_SV_C('CCSD')
SD = G_SV_C('SD')

CPEXP = G_SV_C('CPEXP')
PLEVEL = G_SV_C('PLEVEL')
PEXP = G_SV_C('PEXP')

KNU = G_SV_C('KNU')
KNL = G_SV_C('KNL')

LVtip = G_SV_C('LVtip')

ATMUtip = G_SV_C('ATMUtip')
ATMDtip = G_SV_C('ATMDtip')

MDtip = G_SV_C('MDtip')
AKtip = G_SV_C('AKtip')
P_LV = G_SV_C('P_LV')

UPC = G_SV_C('UPC')
EEND = G_SV_C('EEND')

NOtip = G_SV_C('NOtip')
NOHAP = G_SV_C('NOHAP')
-- 觸發方塊
E = {
    H = {
        H1 = G_EB_C(-148, -166, 1),
        H2 = G_EB_C(-156, -176, 1),
        H3 = G_EB_C(-182, -150, 1),
        H4 = G_EB_C(-113, -180, 0),
        H5 = G_EB_C(-148, -182, 15),
        H6 = G_EB_C(-171, -156, 15),
    },
    -- 史萊姆跑酷
    S = {
        S1 = G_EB_C(-173, -105, 1),
        S2 = G_EB_C(-175, -79, 1),
        S3 = G_EB_C(-172, -70, 1),
        S4 = G_EB_C(-177, -56, 1)
    },
    -- 黏著跑酷
    B ={
        B1 = G_EB_C(-181, -104, 54),
        B2 = G_EB_C(-181, -101, 54),
        B3 = G_EB_C(-181, -98, 54),
        B4 = G_EB_C(-181, -95, 54),
        B5 = G_EB_C(-167, -92, 57),
        B6 = G_EB_C(-167, -89, 57),
        B7 = G_EB_C(-167, -86, 57),
        B8 = G_EB_C(-167, -83, 57),
        B9 = G_EB_C(-172, -79, 61),
        B10 = G_EB_C(-177, -71, 62),
        B11 = G_EB_C(-177, -68, 62),
        B12 = G_EB_C(-177, -65, 62),
        B13 = G_EB_C(-177, -61, 61),
        B14 = G_EB_C(-177, -58, 61),
        B15 = G_EB_C(-177, -55, 61),
        B16 = G_EB_C(-173, -81, 61),
        B17 = G_EB_C(-179, -71, 62),
        B18 = G_EB_C(-179, -68, 62),
        B19 = G_EB_C(-179, -65, 62),
        B20 = G_EB_C(-179, -61, 61),
        B21 = G_EB_C(-179, -58, 61),
        B22 = G_EB_C(-179, -55, 61)
    },
    WS = G_EB_C(-182, -171, 1),
    ES = G_EB_C(-160, -171, 1),
    GI = G_EB_C(-171, -182, 1),
    TA = G_EB_C(-160, -171, 11),
    P = {
        P1 = G_EB_C(-182, -171, 11),
        P2 = G_EB_C(-174, -138, 1),
        P3 = G_EB_C(-174, -116, 1),
        P4 = G_EB_C(-174, -116, 28),
        P5 = G_EB_C(-174, -116, 36),
        P6 = G_EB_C(-174, -116, 49)
    },
    PAKO = G_EB_C(-179, -140, 15),
    SPK = G_EB_C(-175, -140, 15),
    Silde1 = G_EB_C(-171, -140, 15),
    Silde2 = G_EB_C(-174, -111, 23),
    ETASK = G_EB_C(-167, -140, 15),
    Stick = G_EB_C(-163, -140, 15),
    END = {
        E1 = G_EB_C(-182, -133, 61),
        E2 = G_EB_C(-174, -48, 5),
        E3 = G_EB_C(-174, -48, 30),
        E4 = G_EB_C(-174, -48, 41),
        E5 = G_EB_C(-174, -48, 60)
    },
    EU = G_EB_C(-171, -182, 11),
    ATMU = G_EB_C(-177, -177, 2),
    ATMD = G_EB_C(-177, -179, 2),
    SWEXP = G_EB_C(-142, -180, 2),
    BS = G_EB_C(-37, -133, 9),
    BSC = G_EB_C(-37, -134, 8),
    EBOSS = G_EB_C(-49, -105, 0),
    VUP = G_EB_C(-175, -178, 12)
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
    1650,
    1651,
    1652,
    1653,
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
    1097,
    1098,
    940,
    941,
    1509,
    1520,
    1521
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

-- 重生點座標
HOMEpos = {x = -171,y = -171, z = 3}
HOMETpos = {x = -171,y = -171, z = 13}

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
        for i = 1, #WeaponColor do
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
function G.R:OnPlayerSignal(player, signal)
    ClientID:OnPlayerSignal(player, signal)
    pu = player.user
    if signal == 10001 then
        if player.maxhealth ~= HMA then
            if player.coin >= 1000 then
                player.maxhealth = player.maxhealth + 100
                player.health = player.health + 100
                player.coin = player.coin - 1000
                CHA(player)
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
                player.armor = player.armor + 100
                player.coin = player.coin - 1500
                CHA(player)
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
        if player.coin >= 1000000 then
            if pu.pd ~= DMA then
                CDE.value = player.index
                pu.pd = pu.pd + 1000
                player.coin = player.coin - 1000000
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
            player:SetThirdPersonView (100, 250)
        elseif STPV == 1 then
            STPV = 0
            player:SetFirstPersonView ()
        end
    elseif signal == 10007 then
        if RE[player.index] == 1 then
            HOME(player)
            if player:IsPlayer() then
                player = player:ToPlayer()
                AddExp(player, UP * 100)
                player.coin = player.coin + 10000
            end
            RE[player.index] = 0
        end
    elseif signal == 10008 then
        RE[player.index] = 0
        pu.et = 0
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
            
            KNU.value = DKill
            KNL.value = Kill
            UPC.value = UP
            
            pu.sj = (player.velocity.z - (player.velocity.z + (player.velocity.z)))
        end
    end
end

-- 以遊戲時間運算函數
function G.R:OnUpdate(time)
    ClientID:OnUpdate(time)
end

-- 重生點
function HOME(player)
    player.team = Game.TEAM.CT
    player.gravity = 1
    player.position = HOMEpos
    RE[player.index] = 0
    player:Signal(1)
end

-- 遊樂區
function PA(player)
    player.position = {x = -170, y = -150, z = 17}
    player:Signal(6)
    player.user.et = 0
end

function E.H.H1:OnTouch(player)
    HOME(player)
end
function E.H.H2:OnTouch(player)
    HOME(player)
end
function E.H.H3:OnTouch(player)
    HOME(player)
end
function E.H.H4:OnTouch(player)
    HOME(player)
end
function E.H.H5:OnTouch(player)
    HOME(player)
end
function E.H.H6:OnTouch(player)
    HOME(player)
end

-- 武器商店
function E.WS:OnTouch(player)
    player.position = {x = -175, y = -150, z = 3}
    player:Signal(2)
end

-- 轉蛋商店
function E.ES:OnTouch(player)
    player.position = {x = -150, y = -175, z = 3}
    player:Signal(3)
end

-- 遊戲資訊
function E.GI:OnTouch(player)
    player.position = {x = -145, y = -160, z = 3}
    player:Signal(4)
end

-- 訓練區
function E.TA:OnTouch(player)
    player.position = {x = -148, y = -179, z = 17}
    player:Signal(5)
end
function TMD1(callerOn)
    if tm1 == 0 and G_CO(callerOn) then
        tm1 = 1
        TMO = Game.Monster:Create (MonsterTypes[1], {x = -153, y = -150, z = 19})
        TMO.health = 1000000
        TMO.armor = 0
        TMO.damage = 0
        TMO.coin = 1
        TMO.speed = 1
        TMO.applyKnockback = true
        TMO.canJump = false
        TMO.user.e = 1
        TMO.user.T = 1
    end
end
function TMD2(callerOn)
    if tm2 == 0 and G_CO(callerOn) then
        tm2 = 1
        TMO = Game.Monster:Create (MonsterTypes[2], {x = -148, y = -150, z = 19})
        TMO.health = 1000000
        TMO.armor = 0
        TMO.damage = 0
        TMO.coin = 1
        TMO.speed = 1
        TMO.applyKnockback = true
        TMO.canJump = false
        TMO.user.e = 1
        TMO.user.T = 2
    end
end
function TMD3(callerOn)
    if tm3 == 0 and G_CO(callerOn) then
        tm3 = 1
        TMO = Game.Monster:Create (MonsterTypes[22], {x = -143, y = -150, z = 19})
        TMO.health = 1000000
        TMO.armor = 0
        TMO.damage = 0
        TMO.coin = 1
        TMO.speed = 1
        TMO.applyKnockback = true
        TMO.canJump = false
        TMO.user.e = 1
        TMO.user.T = 3
    end
end

function E.P.P1:OnTouch(player)
    PA(player)
end
function E.P.P2:OnTouch(player)
    PA(player)
end
function E.P.P3:OnTouch(player)
    PA(player)
end
function E.P.P4:OnTouch(player)
    PA(player)
end
function E.P.P5:OnTouch(player)
    PA(player)
end
function E.P.P6:OnTouch(player)
    PA(player)
end

-- 跑酷塔
function E.PAKO:OnTouch(player)
    player.position = {x = -175, y = -130, z = 3}
    player:Signal(8)
end

-- 史萊姆跑酷
function E.SPK:OnTouch(player)
    player.position = {x = -174, y = -113, z = 3}
    player:Signal(9)
end
function E.S.S1:OnTouch(player)
    if player.user.sj < 0.1 then
        return
    else
        player.velocity = {z = player.user.sj / 1.2}
        player.user.sj = player.user.sj / 1.2
    end
end
function E.S.S2:OnTouch(player)
    if player.user.sj < 0.1 then
        return
    else
        player.velocity = {z = player.user.sj / 1.2}
        player.user.sj = player.user.sj / 1.2
    end
end
function E.S.S3:OnTouch(player)
    if player.user.sj < 0.1 then
        return
    else
        player.velocity = {z = player.user.sj / 1.2}
        player.user.sj = player.user.sj / 1.2
    end
end
function E.S.S4:OnTouch(player)
    if player.user.sj < 0.1 then
        return
    else
        player.velocity = {z = player.user.sj / 1.2}
        player.user.sj = player.user.sj / 1.2
    end
end

-- 滑坡
function E.Silde1:OnTouch(player)
    player.position = {x = -174, y = -113, z = 28}
    player:Signal(10)
end
function E.Silde2:OnTouch(player)
    player.position = {x = -174, y = -113, z = 28}
    player:Signal(10)
end

-- 電流棒
function E.ETASK:OnTouch(player)
    player.position = {x = -174, y = -112, z = 36}
    player:Signal(11)
    player.user.et = 1
end

-- 黏著跑酷
function E.Stick:OnTouch(player)
    player.position = {x = -174, y = -113, z = 49}
    player:Signal(12)
end
function E.B.B1:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B2:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B3:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B4:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B5:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B6:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B7:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B8:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B9:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B10:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B11:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B12:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B13:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B14:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B15:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B16:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B17:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B18:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B19:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B20:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B21:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end
function E.B.B22:OnTouch(player)
    player.velocity = {x = 0,y = 0,z = 0}
    player.position = {x = bee_x[player.index],y = bee_y[player.index],z = bee_z[player.index]}
end

function E.END.E1:OnTouch(player)
    AddExp(player, 100000000)
    player.position = {x = -175, y = -130, z = 3}
end
function E.END.E2:OnTouch(player)
    AddExp(player, 50000000)
    player.position = {x = -174, y = -113, z = 3}
end
function E.END.E3:OnTouch(player)
    AddExp(player, 100000000)
    player.position = {x = -174, y = -113, z = 28}
end
function E.END.E4:OnTouch(player)
    AddExp(player, 100000000)
    player.position = {x = -174, y = -112, z = 36}
end
function E.END.E5:OnTouch(player)
    AddExp(player, 100000000)
    player.position = {x = -174, y = -113, z = 49}
end

-- 轉蛋系統
function G_WP(t, pos)
    local wt, wn, RN, RE
    local TE = G_GTE()
    TE = TE:ToPlayer()
    tu = TE.user
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
        if TE.coin >= 500000 then
            TE.coin = TE.coin - 500000
            wt = G_RI(1, 115)
            RN = G_RI(1, 100)

            if RN > 0 and RN < 51 then
                wn = G_RF(1.00, 9.99)
            elseif RN > 50 and RN < 81 then
                wn = G_RF(10.00, 29.99)
            elseif RN > 80 then
                wn = G_RF(30.00, 49.99)
            end
        else
            NOtip.value = TE.index
            return
        end
    elseif t == 3 then
        if tu.level ~= LMA then
            if tu.atm > 0 then
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

    local wp = G_DBWP(wt, pos, wn)
    if wn > 49.99 and wn < 70.00 then
        G_ST('LWO',true)
    elseif wn > 69.99 and wn < 90.00 then
        G_ST('LWY',true)
    elseif wn > 89.99 and wn < 101.01 then
        G_ST('LWG',true)
    end
    return wp
end

-- 絕級轉蛋
function LLW(callerOn)
    if G_CO(callerOn) then
        G_WP(1, {x = -141, y = -176, z = 1})
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
        G_WP(2, {x = -141, y = -172, z = 1})
    end
end

-- 經驗轉蛋
function LE(callerOn)
    if G_CO(callerOn) then
        G_WP(3,0)
    end
end

-- 遠征區
function E.EU:OnTouch(player)
    if BOSSSC == 0 then
        player.position = {x = -115, y = -175, z = 3}
        player:Signal(7)
    elseif BOSSSC == 1 then
        player.position = {x = -50, y = -110, z = 5}
        player:Signal(13)
    end
    RE[player.index] = 1
    if RConoff == 0 then
        RC = G_RI(1, 15)
        RConoff = 1
        if RC == 1 then
            G_ST('RAC',true)
        elseif RC == 2 then
            G_ST('MOV',true)
        elseif RC == 3 then
            G_ST('AOC',true)
        elseif RC == 4 then
            G_ST('MEY',true)
        elseif RC == 5 then
            G_ST('MIN',true)
        elseif RC == 6 then
            G_ST('MRY',true)
        end
    end
    if EM == 0 then
        EM = 1
        MTpos1()
    end
end
function MTpos1()
    Mpos = {x = -119, y = -163, z = 7}
    MonsterC()
    MTpos2()
end
function MTpos2()
    Mpos = {x = -112, y = -160, z = 7}
    MonsterC()
    MTpos3()
end
function MTpos3()
    Mpos = {x = -104, y = -163, z = 7}
    MonsterC()
    MTpos4()
end
function MTpos4()
    Mpos = {x = -114, y = -152, z = 7}
    MonsterC()
    MTpos5()
end
function MTpos5()
    Mpos = {x = -104, y = -153, z = 7}
    MonsterC()
end
function MTpos6()
    Mpos = {x = -70, y = -151, z = 7}
    MonsterC()
    MTpos7()
end
function MTpos7()
    Mpos = {x = -66, y = -138, z = 7}
    MonsterC()
    MTpos8()
end
function MTpos8()
    Mpos = {x = -66, y = -125, z = 7}
    MonsterC()
    MTpos9()
end
function MTpos9()
    Mpos = {x = -79, y = -116, z = 7}
    MonsterC()
    MTpos10()
end
function MTpos10()
    Mpos = {x = -90, y = -112, z = 7}
    MonsterC()
    MTpos11()
end
function MTpos11()
    Mpos = {x = -92, y = -126, z = 7}
    MonsterC()
    MTpos12()
end
function MTpos12()
    Mpos = {x = -124, y = -123, z = 7}
    MonsterC()
    MTpos13()
end
function MTpos13()
    Mpos = {x = -124, y = -109, z = 7}
    MonsterC()
end
function MTpos14()
    Mpos = {x = -122, y = -73, z = 7}
    MonsterC()
    MTpos15()
end
function MTpos15()
    Mpos = {x = -118, y = -68, z = 7}
    MonsterC()
    MTpos16()
end
function MTpos16()
    Mpos = {x = -112, y = -65, z = 7}
    MonsterC()
    MTpos17()
end
function MTpos17()
    Mpos = {x = -104, y = -66, z = 7}
    MonsterC()
    MTpos18()
end
function MTpos18()
    Mpos = {x = -92, y = -65, z = 7}
    MonsterC()
    MTpos19()
end
function MTpos19()
    Mpos = {x = -78, y = -66, z = 7}
    MonsterC()
    MTpos20()
end
function MTpos20()
    Mpos = {x = -71, y = -66, z = 7}
    MonsterC()
    MTpos21()
end
function MTpos21()
    Mpos = {x = -62, y = -69, z = 7}
    MonsterC()
end
function MTpos22()
    Mpos = {x = -51, y = -89, z = 7}
    MonsterC()
    MTpos23()
end
function MTpos23()
    Mpos = {x = -39, y = -91, z = 7}
    MonsterC()
    MTpos24()
end
function MTpos24()
    Mpos = {x = -31, y = -87, z = 7}
    MonsterC()
    MTpos25()
end
function MTpos25()
    Mpos = {x = -26, y = -93, z = 7}
    MonsterC()
    MTpos26()
end
function MTpos26()
    Mpos = {x = -19, y = -92, z = 7}
    MonsterC()
    MTpos27()
end
function MTpos27()
    Mpos = {x = -23, y = -99, z = 7}
    MonsterC()
    MTpos28()
end
function MTpos28()
    Mpos = {x = -21, y = -105, z = 7}
    MonsterC()
    MTpos29()
end
function MTpos29()
    Mpos = {x = -31, y = -100, z = 7}
    MonsterC()
    MTpos30()
end
function MTpos30()
    Mpos = {x = -33, y = -105, z = 7}
    MonsterC()
    MTpos31()
end
function MTpos31()
    Mpos = {x = -42, y = -99, z = 7}
    MonsterC()
end
function MTposB1()
    Mpos = {x = -44, y = -124, z = 7}
    MonsterC()
    MTposB2()
end
function MTposB2()
    Mpos = {x = -32, y = -120, z = 7}
    MonsterC()
    MTposB3()
end
function MTposB3()
    Mpos = {x = -29, y = -134, z = 7}
    MonsterC()
    MTposB4()
end
function MTposB4()
    Mpos = {x = -47, y = -135, z = 7}
    MonsterC()
    MTposB5()
end
function MTposB5()
    Mpos = {x = -45, y = -144, z = 7}
    MonsterC()
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
end

-- 給予BOSS能力
function BOSS1()
    local TE = Game.GetTriggerEntity()
    if TE and TE:IsMonster() then
        TE = TE:ToMonster()
        TE.maxhealth = 50000 * UP
        TE.health = 50000 * UP
        TE.maxarmor = 50000 * UP
        TE.armor = 50000 * UP
        TE.speed = 3
        TE.coin = 5000 * UP
        TE.user.e = 500 * UP
        TE.user.MK2 = 1
        TE:SetRenderFX(Mcolor)
        TE:SetRenderColor({r = 1, g = 1, b = 1})
        if RC == 1 then
            TE:SetRenderFX(18)
        elseif RC == 2 then
            TE.speed = 10
        end
    end
    BOSSSC = 1
end

-- 怪物系統
function MonsterC()
    local MT
    for i = 1, 10 do
        if BOSS == 0 then
            if RC == 3 then
                MT = G_RI(27, 31)
            elseif RC == 6 then
                MT = G_RI(32, 35)
            else
                if DKill >= 10000 then
                    MT = G_RI(1, 30)
                elseif DKill >= 20000 then
                    MT = G_RI(1, 40)
                else
                    MT = G_RI(1, 20)
                end
            end
        elseif BOSS == 1 then
            MT = G_RI(23, 25)
        elseif BOSS == 2 then
            MT = G_RI(39, 40)
        elseif BOSS == 3 then
            MT = G_RI(21, 22)
        end
        Moi = G.M:Create (MonsterTypes[MT], Mpos)
        Moi.health = 10 * Kill * UP or 50
        Moi.armor = 5 * Kill * UP or 10
        Moi.damage = 1 + (Kill / 3) * UP or 5
        if RC == 4 then
            Moi.coin = (1 + Kill * UP) * 5
        else
            Moi.coin = 1 + Kill * UP
        end
        Moi.user.e = 0.1 + (Kill * 0.5) * (UP * UP)
        Moi.speed = 1
        Moi.user.MK = 1
        Moi.viewDistance = 20
        MD = Moi.damage
        if RC == 1 then
            G_PRC(Moi, 18, 0, 0)
        else
            if RC == 2 then
                Moi.speed = 10
            end
            if MD >= 1 and MD < 26 then
                G_PRC(Moi, 19, {r = 255, g = 255, b = 255}, 1)
            elseif MD >= 26 and MD < 51 then
                G_PRC(Moi, 19, {r = 0, g = 0, b = 255}, 1)
            elseif MD >= 51 and MD < 101 then
                G_PRC(Moi, 19, {r = 255, g = 0, b = 0}, 1)
            elseif MD >= 101 and MD < 251 then
                G_PRC(Moi, 19, {r = 255, g = 100, b = 0}, 1)
            elseif MD >= 251 and MD < 501 then
                G_PRC(Moi, 19, {r = 255, g = 255, b = 0}, 1)
            elseif MD >= 501 and MD < 1001 then
                G_PRC(Moi, 19, {r = 0, g = 255, b = 0}, 0)
            elseif MD >= 1001 and MD < 1501 then
                G_PRC(Moi, 19, {r = 0, g = 255, b = 255}, 0)
            elseif MD >= 1501 and MD < 2501 then
                G_PRC(Moi, 19, {r = 255, g = 0, b = 255}, 0)
            elseif MD >= 2501 and MD < 5001 then
                G_PRC(Moi, 19, {r = 1, g = 1, b = 1}, 0)
            elseif MD >= 5001 then
                G_PRC(Moi, 15, 0, 0)
            end
        end
    end
end

-- 怪物傷害系統
function G.R:OnTakeDamage(victim, attacker, damage, weapontype, hitbox)
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
            if vu.T == 1 or vu.T == 2 or vu.T == 3 then
                attacker.coin = attacker.coin + 1
            else
                damageEXP(attacker, victim)
            end
            damage = ADD_damage(attacker, victim, weapontype, damage)
        elseif victim:IsPlayer() then
            victim = victim:ToPlayer()
            vu = victim.user
            victim.velocity = { z = 0}
            return
        end
    elseif attacker:IsMonster() then
        attacker = attacker:ToMonster()
        au = attacker.user
        if victim:IsPlayer() then
            victim = victim:ToPlayer()
            vu = victim.user
            if vu.SA == 1 then
                damage = 0 
            else
                if RC == 5 then
                    victim.velocity = { z = 10000 }
                end

                if au.MK == 98 then
                    damage = 10000
                elseif au.B == 1 then
                    damage = 2500 * UP
                elseif au.MK == 6 then
                    damage = 5000 * UP
                else
                    damage = damage / (500 * 0.15) 
                end
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
        if damage > 50 and victim.user.et == 1 then
            victim.position = {x = -174, y = -112, z = 36}
            victim.armor = victim.maxarmor
            return 1
        end
        CHA(victim)
        return damage
    elseif attacker:IsPlayer() then
        attacker = attacker:ToPlayer()
        victim = victim:ToPlayer()
        au = attacker.user
        vu = victim.user
        CCSD.value = attacker.index
        SD.value = damage 
        CHA(attacker)
        CHA(victim)
        return damage / 500
    else
        return
    end
end

-- 怪物擊殺系統
function G.R:OnKilled(victim, killer)
    if killer == nil or killer:IsMonster() then
        if victim:IsMonster() then
            victim = victim:ToMonster()
            vu = victim.user
            if vu.T == 1 or vu.T == 2 or vu.T == 3  then
                tm1 = 0
                tm2 = 0
                tm3 = 0
            end
        elseif victim:IsPlayer() then
            victim = victim:ToPlayer()
            vu = victim.user
            x2[victim.index] = -171
            y2[victim.index] = -171
            z2[victim.index] = 5
            CHA(victim)
        end
    elseif killer:IsPlayer() then
        if victim:IsMonster() then
            local RW,WV
            victim = victim:ToMonster()
            killer = killer:ToPlayer()
            vu = victim.user
            if vu.MK == 1 then
                Kill = Kill + 1
                DKill = DKill + 1
                KillLM(Kill)
                EXP = EXP + 0.1
                KNU.value = Kill
                KNU.value = DKill
                RW = G_RI(1, 3)
                if DKill >= 1 and DKill < 101 then
                    if RW == 1 then
                        WV = G_RF(1, 5)
                        Add_weapon(WV, killer, victim)
                    end
                elseif DKill >= 101 and DKill < 501 then
                    if RW == 1 then
                        WV = G_RF(6, 10)
                        Add_weapon(WV, killer, victim)
                    end
                elseif DKill >= 501 and DKill < 1001 then
                    if RW == 1 then
                        WV = G_RF(11, 15)
                        Add_weapon(WV, killer, victim)
                    end
                elseif DKill >= 1001 and DKill < 2501 then
                    if RW == 1 then
                        WV = G_RF(16, 20)
                        Add_weapon(WV, killer, victim)
                    end
                elseif DKill >= 2501 and DKill < 5001 then
                    if RW == 1 then
                        WV = G_RF(21, 30)
                        Add_weapon(WV, killer, victim)
                    end
                elseif DKill >= 5001 and DKill < 7501 then
                    if RW == 1 then
                        WV = G_RF(31, 50)
                        Add_weapon(WV, killer, victim)
                    end
                elseif DKill >= 7501 and DKill < 10001 then
                    if RW == 1 then
                        WV = G_RF(51, 70)
                        Add_weapon(WV, killer, victim)
                    end
                elseif DKill >= 10001 then
                    if RW == 1 then
                        WV = G_RF(71, 90)
                        Add_weapon(WV, killer, victim)
                    end      
                end
                if RC == 4 then
                    AddExp(killer, (vu.e + EXP) * 5)
                else
                    AddExp(killer, vu.e + EXP)
                end
            elseif vu.MK2 == 1 then
                Kill = Kill + 1
                DKill = DKill + 1
                KillLM(Kill)
                EXP = EXP + 0.1
                KNU.value = DKill
                KNL.value = Kill
                WV = 70
                if RC == 4 then
                    AddExp(killer, (vu.e + EXP) * 5)
                else
                    AddExp(killer, vu.e + EXP)
                end
                Add_weapon(WV, killer, victim)
            elseif vu.T == 1 then
                tm1 = 0
            elseif vu.T == 2 then
                tm2 = 0
            elseif vu.T == 3 then
                tm3 = 0
            end
        end
        CHA(killer)
    else
        return
    end
end

-- 計算傷害
function ADD_damage(attacker, victim, weapontype, damage)
    vu = victim.user
    au = attacker.user
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
function damageEXP(attacker, victim)
    vu = victim.user
    au = attacker.user
    if RC == 4 then
        AddExp(attacker, ((500 * (vu.MK or vu.MK2)) * UP) * 2)
    else
        AddExp(attacker, (500 * (vu.MK or vu.MK2)) * UP)
    end
    if attacker.coin + ((vu.MK or vu.MK2) + ((500 * 100) * UP)) >= CMA then
        attacker.coin = CMA
    else
        if RC == 4 then
            attacker.coin = attacker.coin + (((vu.MK or vu.MK2) + ((500 * 100) * UP)) * 2)
        else
            attacker.coin = attacker.coin + ((vu.MK or vu.MK2) + ((500 * 100) * UP))
        end
    end
end
-- 處理掉落武器
function Add_weapon(wv, killer, victim)
    local wt = G_RI(1, 116)
    wn = 0

    for i = 1, #Prohweapon do
        if wt == Prohweapon[i] then
            wt = wt - 10
        end
    end

    if (wv + UP) >= 90 then
        wn = G_RF(90, 100)
    else
        wn = wv + UP
    end
    
    local wp = G_DBWP(wt, victim.position, wn)
    return wp
end
-- 區域條件解鎖
function KillLM(Kill)
    if Kill >= 50 and Kill < 130 then
        G_ST('LM1',true)
        if Kill == 50 then
            MTpos6()
        end
    elseif Kill >= 130 and Kill < 210 then
        G_ST('LM2',true)
        if Kill == 130 then
            MTpos14()
        end
    elseif Kill >= 210 and Kill < 310 then
        G_ST('LM3',true)
        if Kill == 210 then
            MTpos22()
        end
    elseif Kill >= 310 and Kill < 311 then
        G_ST('LM4',true)
        if Kill == 310 then
            if DKill >= 5000 then
                BOSS = 2
            elseif DKill >= 10000 then
                BOSS = 3
            else
                BOSS = 1
            end
        end
    elseif Kill >= 311 and Kill < 361 then
        if Kill == 311 then
            MTposB1()
        end
    elseif Kill >= 361 then
        G_ST('LM5',true)
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

-- BOSS區域
function E.EBOSS:OnTouch(player)
    player.position = {x = -50, y = -110, z = 5}
    player:Signal(13)
end

-- 清除區域怪物
function END(callerOn)
    if G_CO(callerOn) then
        EM = 0
        Kill = 0
        EXP = 0
        BOSS = 0
        BOSSSC = 0
        RConoff = 0
        KNL.value = Kill
        if UP == 100 then
            UP = 100
        else
            UP = UP + 1
        end
        E.BS:Event({action = 'reset', value = 0})
        E.BSC:Event({action = 'reset', value = 0})
    
        EEND.value = 1
        G_ST('LM1',false)
        G_ST('LM2',false)
        G_ST('LM3',false)
        G_ST('LM4',false)
        G_ST('LM5',false)
        G_ST('RAC',false)
        G_ST('MOV',false)
        G_ST('AOC',false)
        G_ST('MEY',false)
        UPC.value = UP
    end
end

-- 金幣換難易度
function E.VUP:OnUse(player)
    if UP ~= 100 then
        if player.coin > 9999999 then
            player.coin = player.coin - 10000000
            Game.KillAllMonsters()
            END(true)
        else
            NOtip.value = player.index
            return
        end
    else
        NOHAP.value = player.index
    end
end

function REP(callerOn)
    if G_CO(callerOn) then
        if REPTIME <= Game.GetTime() then
            G_ST('REPST',false)
            EM = 0
            Kill = 0
            EXP = 0
            BOSS = 0
            BOSSSC = 0
            RConoff = 0
            KNL.value = Kill
            E.BS:Event({action = 'reset', value = 0})
            E.BSC:Event({action = 'reset', value = 0})
            Game.KillAllMonsters()
            EEND.value = 1
            G_ST('LM1',false)
            G_ST('LM2',false)
            G_ST('LM3',false)
            G_ST('LM4',false)
            G_ST('LM5',false)
            G_ST('RAC',false)
            G_ST('MOV',false)
            G_ST('AOC',false)
            G_ST('MEY',false)
            G_ST('REPST',true)
            REPTIME = Game.GetTime() + 60
        end
    end
end

-- 玩家重生時呼叫函數
function G.R:OnPlayerSpawn(player)
    pu = player.user
    player.armor = player.maxarmor
    player.health = player.maxhealth
    pu.et = 0
    CHA(player)
    player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    if x2[player.index] == -148 then
        player:Signal(4)
    elseif x2[player.index] == -171 then
        player:Signal(1)
    end
end

-- 玩家選擇角色後初次重生時叫出的函數
function G.R:OnPlayerJoiningSpawn(player)
    if lint == 0 then
        dn = 1.0
        for i = 1, LMA do
            table.insert(PlayerRequireExp, i, round(10^dn))
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
        RE[player.index] = 0
        -- 團隊設定
        player.team = Game.TEAM.CT
        -- 初始座標
        x2[player.index] = -148
        y2[player.index] = -160
        z2[player.index] = 5
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
        pu.sj = 0
        pu.et = 0
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
        player:SetLevelUI(pu.level, pu.expRate)
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
            if player.name == '' then
                pu.p1 = 1
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