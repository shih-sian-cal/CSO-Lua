CM = {
	CW = Common.WEAPON
}

Common.UseWeaponInven(true) -- 使用武器背包功能
Common.SetSaveCurrentWeapons(true) -- 設定將目前裝備中的武器儲存
Common.SetSaveWeaponInven(true) -- 設定儲存武器背包內容(需先設定UseWeaponInven)
Common.SetAutoLoad(true) -- 自動執行讀取儲存資訊。
Common.DisableWeaponParts(false) -- 關閉武器部件功能
Common.DisableWeaponEnhance(false) -- 關閉武器強化功能
Common.DontGiveDefaultItems(true) -- 遊戲開始時不會給予基本武器
Common.DontCheckTeamKill(true) -- 團隊擊殺也會算為正常擊殺
Common.UseScenarioBuymenu(true) -- 商店使用災厄之章商店視窗
Common.SetNeedMoney(true) -- 購買槍枝時需要金錢
Common.UseAdvancedMuzzle(true) -- 發射時槍口效果以新型態呈現(不套用Scale)
Common.SetMuzzleScale(1.0) -- 修正發射時槍口效果大小
Common.SetBloodScale(2) -- 修正被攻擊時血的效果大小
Common.SetGunsparkScale(10) -- 修正子彈射到牆壁等等的效果大小
Common.SetHitboxScale(2.5) -- 修正准心大小
Common.SetMouseoverOutline(true, {r = 255, g = 0, b = 0}) -- 當游標移到怪物等的實體上時標示外框
Common.SetUnitedPrimaryAmmoPrice(0) -- 所有主武器每個彈匣價格相同
Common.SetUnitedSecondaryAmmoPrice(0) -- 所有輔助武器每個彈匣價格相同

-- 比較實數值使用
EPSILON = 0.00001

-- 商店武器清單(最多477)
BuymenuWeaponList =	{
	-- 輔助武器清單
	CM.CW.P228,
	CM.CW.DualBeretta,
	CM.CW.FiveSeven,
	CM.CW.Glock18C,
	CM.CW.USP45,
	CM.CW.DesertEagle50C,
	CM.CW.SawedOffM79,
	-- 狙擊槍清單
	CM.CW.Scout,
	CM.CW.AWP,
	CM.CW.SG550Commando,
	CM.CW.G3SG1,
	-- 步槍清單
	CM.CW.Galil,
	CM.CW.FAMAS,
	CM.CW.M4A1,
	CM.CW.SG552,
	CM.CW.AK47,
	CM.CW.AUG,
	CM.CW.AN94,
	CM.CW.M16A4,
	CM.CW.HK416,
	CM.CW.AK74U,
	CM.CW.AKM,
	CM.CW.L85A2,
	CM.CW.FNFNC,
	CM.CW.TAR21,
	CM.CW.SCAR,
	CM.CW.SKULL4,
	-- 衝鋒槍清單
	CM.CW.MAC10,
	CM.CW.UMP45,
	CM.CW.MP5,
	CM.CW.TMP,
	CM.CW.P90,
	CM.CW.MP7A1ExtendedMag,
	CM.CW.DualKriss,
	CM.CW.KrissSuperV,
	CM.CW.TMPDragon,
	CM.CW.Tempest,
	CM.CW.P90Lapin,
	-- 散彈槍清單
	CM.CW.M3,
	CM.CW.XM1014,
	CM.CW.USAS12,
	CM.CW.JackHammer,
	CM.CW.DoubleBarrelShotgun,
	CM.CW.WinchesterM1887,
	CM.CW.SPAS12Maverick,
	CM.CW.BALROGXI,
	-- 機關槍清單
	CM.CW.M249,
	CM.CW.MG36,
	CM.CW.MK48,
	CM.CW.K3,
	CM.CW.QBB95,
	CM.CW.QBB95AdditionalMag,
	CM.CW.BALROGVII,
	-- 護甲
	2000,
	2001,
	2006,
	2003,
	-- 裝備武器清單
	CM.CW.M32MGL,
	CM.CW.PetrolBoomer,
	CM.CW.Slasher,
	CM.CW.Eruptor,
	CM.CW.Leviathan,
	CM.CW.Salamander,
	-- 手榴彈
	500,
	458,
	375,
	392,
	-- 近戰武器
	4000,
	4024,
	4025,
	4026
}

Common.SetBuymenuWeaponList(BuymenuWeaponList)
	
-- 遊戲中顯示的所有武器清單
WeaponList = {
	-- 輔助武器清單
	CM.CW.P228,
	CM.CW.DualBeretta,
	CM.CW.FiveSeven,
	CM.CW.Glock18C,
	CM.CW.USP45,
	CM.CW.DesertEagle50C,
	CM.CW.DualInfinity,
	CM.CW.DualInfinityCustom,
	CM.CW.DualInfinityFinal,
	CM.CW.SawedOffM79,
	CM.CW.Cyclone,
	CM.CW.AttackM950,
	CM.CW.DesertEagle50CGold,
	CM.CW.ThunderGhostWalker,
	CM.CW.PythonDesperado,
	CM.CW.DesertEagleCrimsonHunter,
	CM.CW.DualBerettaGunslinger,
	-- 狙擊槍清單
	CM.CW.Scout,
	CM.CW.AWP,
	CM.CW.M24,
	CM.CW.BarrettM95,
	CM.CW.SG550Commando,
	CM.CW.G3SG1,
	-- 步槍清單
	CM.CW.Galil,
	CM.CW.FAMAS,
	CM.CW.M4A1,
	CM.CW.SG552,
	CM.CW.AK47,
	CM.CW.AUG,
	CM.CW.AN94,
	CM.CW.M16A4,
	CM.CW.HK416,
	CM.CW.AK74U,
	CM.CW.AKM,
	CM.CW.L85A2,
	CM.CW.FNFNC,
	CM.CW.TAR21,
	CM.CW.SCAR,
	CM.CW.SKULL4,
	CM.CW.OICW,
	CM.CW.PlasmaGun,
	CM.CW.StunRifle,
	CM.CW.StarChaserAR,
	CM.CW.CompoundBow,
	CM.CW.LightningAR2,
	CM.CW.Ethereal,
	CM.CW.LightningAR1,
	CM.CW.F2000,
	CM.CW.Crossbow,
	CM.CW.CrossbowAdvance,
	CM.CW.M4A1DarkKnight,
	CM.CW.AK47Paladin,
	CM.CW.SG552Lycanthrope,
	-- 衝鋒槍清單
	CM.CW.MAC10,
	CM.CW.UMP45,
	CM.CW.MP5,
	CM.CW.TMP,
	CM.CW.P90,
	CM.CW.MP7A1ExtendedMag,
	CM.CW.DualKriss,
	CM.CW.KrissSuperV,
	CM.CW.Tempest,
	CM.CW.TMPDragon,
	CM.CW.P90Lapin,
	CM.CW.DualUZI,
	CM.CW.Needler,
	CM.CW.InfinityLaserFist,
	-- 散彈槍清單
	CM.CW.M3,
	CM.CW.XM1014,
	CM.CW.DoubleBarrelShotgun,
	CM.CW.WinchesterM1887,
	CM.CW.USAS12,
	CM.CW.JackHammer,
	CM.CW.TripleBarrelShotgun,
	CM.CW.SPAS12Maverick,
	CM.CW.FireVulcan,
	CM.CW.BALROGXI,
	CM.CW.BOUNCER,
	CM.CW.FlameJackhammer,
	CM.CW.RailCannon,
	CM.CW.LightningSG1,
	CM.CW.USAS12CAMO,
	CM.CW.WinchesterM1887Gold,
	CM.CW.UTS15PinkGold,
	CM.CW.Volcano,
	-- 機關槍清單
	CM.CW.M249,
	CM.CW.MG3,
	CM.CW.M134Minigun,
	CM.CW.MG36,
	CM.CW.MK48,
	CM.CW.K3,
	CM.CW.QBB95,
	CM.CW.QBB95AdditionalMag,
	CM.CW.BALROGVII,
	CM.CW.MG3CSOGSEdition,
	CM.CW.CHARGER7,
	CM.CW.ShiningHeartRod,
	CM.CW.Coilgun,
	CM.CW.Aeolis,
	CM.CW.BroadDivine,
	CM.CW.LaserMinigun,
	CM.CW.M249Phoenix,
	-- 裝備武器清單
	CM.CW.M32MGL,
	CM.CW.PetrolBoomer,
	CM.CW.Slasher,
	CM.CW.Eruptor,
	CM.CW.Leviathan,
	CM.CW.Salamander,
	CM.CW.RPG7,
	CM.CW.M32MGLVenom,
	CM.CW.Stinger,
	CM.CW.MagnumDrill,
	CM.CW.GaeBolg,
	CM.CW.Ripper,
	CM.CW.BlackDragonCannon,
	CM.CW.Guillotine,
}

-- 武器屬性詳細武器id、價格、等級、使用功能等級、連發、裝填、傷害、R、G、B
function SetOption(weaponid, price, cycletime, reloadtime, damage, red, green, blue)
	option = Common.GetWeaponOption(weaponid)  --[[設置武器]]
	option.price = price
    option.cycletime = cycletime --[[武器連發設定]]
    option.reloadtime = reloadtime --[[武器裝填設定]]
    option.damage = damage --[[武器傷害設定]]

	if red ~= nil then
		option:SetBulletColor({r = red, g = green, b = blue});
	end
end

-- 輔助武器屬性
SetOption(CM.CW.P228, 500, 0.25, 0, 1, 255, 255, 50)
SetOption(CM.CW.DualBeretta, 500, 0.25, 0, 1, 255, 255, 50)
SetOption(CM.CW.FiveSeven, 500, 0.25, 0, 1, 255, 255, 50)
SetOption(CM.CW.Glock18C, 500, 0.25, 0, 1, 255, 255, 50)
SetOption(CM.CW.USP45, 500, 0.25, 0, 1, 255, 255, 50)
SetOption(CM.CW.DesertEagle50C, 500, 0.25, 0, 1, 255, 255, 50)
SetOption(CM.CW.DualInfinity, 2500, 0.25, 0, 1, 255, 255, 50)
SetOption(CM.CW.DualInfinityCustom,	2500, 0.25, 0, 1, 255, 255, 50)
SetOption(CM.CW.DualInfinityFinal, 2500, 0.25, 0, 1, 255, 255, 50)
SetOption(CM.CW.SawedOffM79, 2500, 0.25, 0, 1)
SetOption(CM.CW.Cyclone, 5000, 0.25, 0, 1)
SetOption(CM.CW.AttackM950, 5000, 0.25, 0, 1, 255, 255, 50)
SetOption(CM.CW.DesertEagle50CGold,	5000, 0.25, 0, 1, 255, 255, 50)
SetOption(CM.CW.ThunderGhostWalker,	10000, 0, 0, 1)
SetOption(CM.CW.PythonDesperado, 10000, 0, 0, 1, 255, 255, 50)
SetOption(CM.CW.DesertEagleCrimsonHunter, 10000, 0, 0, 1, 255, 255, 50)
SetOption(CM.CW.DualBerettaGunslinger, 10000, 0, 0, 1, 255, 255, 50)

-- 狙擊槍屬性
SetOption(CM.CW.Scout, 1000, 0, 0, 1, 255, 255, 255)
SetOption(CM.CW.AWP, 1000, 0, 0, 1, 255, 255, 255)
SetOption(CM.CW.M24, 5000, 0, 0, 1, 255, 255, 255)
SetOption(CM.CW.BarrettM95, 5000, 0, 0, 1, 255, 255, 255)
SetOption(CM.CW.SG550Commando, 1000, 0, 0, 1, 255, 255, 255)
SetOption(CM.CW.G3SG1, 1000, 0, 0, 1, 255, 255, 255)

-- 步槍屬性
SetOption(CM.CW.Galil, 1000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.FAMAS, 1000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.M4A1, 1000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.SG552, 1000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.AK47, 1000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.AUG, 1000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.AN94, 1000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.M16A4, 1000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.HK416, 1000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.AK74U, 1000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.AKM, 1000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.L85A2, 1000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.FNFNC, 1000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.TAR21, 1000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.SCAR, 1000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.SKULL4, 5000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.OICW, 5000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.PlasmaGun, 5000, 0, 0, 1, 255, 128, 0)
SetOption(CM.CW.StunRifle, 5000, 0.25, 0.75, 1, 255, 128, 0)
SetOption(CM.CW.StarChaserAR, 5000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.CompoundBow, 5000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.LightningAR2, 5000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.Ethereal, 5000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.LightningAR1, 5000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.F2000, 5000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.Crossbow, 10000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.CrossbowAdvance, 10000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.M4A1DarkKnight, 25000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.AK47Paladin, 25000, 0.25, 0, 1, 255, 128, 0)
SetOption(CM.CW.SG552Lycanthrope, 25000, 0.25, 0, 1, 255, 128, 0)

-- 衝鋒槍屬性
SetOption(CM.CW.MAC10, 1000, 0.25, 0, 1, 128, 255, 255)
SetOption(CM.CW.UMP45, 1000, 0.25, 0, 1, 128, 255, 255)
SetOption(CM.CW.MP5, 1000, 0.25, 0, 1, 128, 255, 255)
SetOption(CM.CW.TMP, 1000, 0.25, 0, 1, 128, 255, 255)
SetOption(CM.CW.P90, 1000, 0.25, 0, 1, 128, 255, 255)
SetOption(CM.CW.MP7A1ExtendedMag, 1000, 0.25, 0, 1, 128, 255, 255)
SetOption(CM.CW.DualKriss,1000, 0.25, 0, 1, 128, 255, 255)
SetOption(CM.CW.KrissSuperV, 1000, 0.25, 0, 1, 128, 255, 255)
SetOption(CM.CW.Tempest, 5000, 0.25, 0, 1, 128, 255, 255)
SetOption(CM.CW.TMPDragon, 1000, 0.25, 0, 1, 128, 255, 255)
SetOption(CM.CW.P90Lapin, 1000, 0.25, 0, 1, 128, 255, 255)
SetOption(CM.CW.DualUZI, 5000, 0.25, 0, 1, 128, 255, 255)
SetOption(CM.CW.Needler, 5000, 0.25, 0, 1, 128, 255, 255)
SetOption(CM.CW.InfinityLaserFist, 50000, 0.25, 0, 1)

-- 散彈槍屬性
SetOption(CM.CW.M3,	1000, 0.25, 0, 1, 50, 255, 50)
SetOption(CM.CW.XM1014,	1000, 0.25, 0, 1, 50, 255, 50)
SetOption(CM.CW.DoubleBarrelShotgun, 5000, 0.25, 0, 1, 50, 255, 50)
SetOption(CM.CW.WinchesterM1887, 5000, 0.25, 0, 1, 50, 255, 50)
SetOption(CM.CW.USAS12,	1000, 0.25, 0, 1, 50, 255, 50)
SetOption(CM.CW.JackHammer,	1000, 0.25, 0, 1, 50, 255, 50)
SetOption(CM.CW.TripleBarrelShotgun, 10000, 1, 0, 1, 50, 255, 50)
SetOption(CM.CW.SPAS12Maverick,	5000, 0.25, 0, 1, 50, 255, 50)
SetOption(CM.CW.FireVulcan,	5000, 0.25, 0, 1, 50, 255, 50)
SetOption(CM.CW.BALROGXI, 5000, 0.25, 0, 1, 50, 255, 50)
SetOption(CM.CW.BOUNCER, 5000, 0.25, 0, 1)
SetOption(CM.CW.FlameJackhammer, 5000, 0.25, 0, 1, 50, 255, 50)
SetOption(CM.CW.RailCannon,	5000, 0.25, 0, 1, 50, 255, 50)
SetOption(CM.CW.LightningSG1, 5000, 0.25, 0, 1, 50, 255, 50)
SetOption(CM.CW.USAS12CAMO,	5000, 0.25, 0, 1, 50, 255, 50)
SetOption(CM.CW.WinchesterM1887Gold, 5000, 0.25, 0, 1, 50, 255, 50)
SetOption(CM.CW.UTS15PinkGold, 5000, 0.25, 0, 1, 50, 255, 50)
SetOption(CM.CW.Volcano, 25000, 0.25, 0, 1, 50, 255, 50)

-- 機關槍屬性
SetOption(CM.CW.M249, 1000, 0.25, 0, 1, 255, 50, 255)
SetOption(CM.CW.MG3, 5000, 0.25, 0, 1, 255, 50, 255)
SetOption(CM.CW.M134Minigun, 5000, 0.25, 0, 1, 255, 50, 255)
SetOption(CM.CW.MG36, 1000, 0.25, 0, 1, 255, 50, 255)
SetOption(CM.CW.MK48, 1000, 0.25, 0, 1, 255, 50, 255)
SetOption(CM.CW.K3, 1000, 0.25, 0, 1, 255, 50, 255)
SetOption(CM.CW.QBB95, 1000, 0.25, 0, 1, 255, 50, 255)
SetOption(CM.CW.QBB95AdditionalMag, 1000, 0.25, 0, 1, 255, 50, 255)
SetOption(CM.CW.BALROGVII, 5000, 0.25, 0, 1, 255, 50, 255)
SetOption(CM.CW.MG3CSOGSEdition, 5000, 0.25, 0, 1, 255, 50, 255)
SetOption(CM.CW.CHARGER7, 5000, 0.25, 0, 1, 255, 50, 255)
SetOption(CM.CW.ShiningHeartRod, 5000, 0, 0, 1, 255, 50, 255)
SetOption(CM.CW.Coilgun, 5000, 0.25, 0, 1, 255, 50, 255)
SetOption(CM.CW.Aeolis, 5000, 0.25, 0, 1, 255, 50, 255)
SetOption(CM.CW.BroadDivine, 5000, 0.25, 0, 1, 255, 50, 255)
SetOption(CM.CW.LaserMinigun, 10000, 0.25, 0, 1)
SetOption(CM.CW.M249Phoenix, 25000, 0.25, 0, 1, 255, 50, 255)

-- 裝備武器屬性
SetOption(CM.CW.M32MGL, 1000, 0.25, 0, 1)
SetOption(CM.CW.PetrolBoomer, 1000, 0.25, 0.25, 10)
SetOption(CM.CW.Slasher, 1000, 0.25, 0, 1)
SetOption(CM.CW.Eruptor, 1000, 0.25, 0.25, 1)
SetOption(CM.CW.Leviathan, 1000, 0.25, 0, 1)
SetOption(CM.CW.Salamander, 1000, 0.25, 0, 1)
SetOption(CM.CW.RPG7, 25000, 0, 0, 1)
SetOption(CM.CW.M32MGLVenom, 10000, 0.25, 0, 1)
SetOption(CM.CW.Stinger, 10000, 0, 0, 1)
SetOption(CM.CW.MagnumDrill, 25000, 0.25, 0, 1, 50, 50, 255)
SetOption(CM.CW.GaeBolg, 25000, 0.25, 0.25, 1)
SetOption(CM.CW.Ripper, 25000, 0, 0, 1)
SetOption(CM.CW.BlackDragonCannon, 25000, 0.25, 0.25, 1)
SetOption(CM.CW.Guillotine, 25000, 0, 0, 1)

return common