Game.Rule.friendlyfire = false
Game.Rule.enemyfire = true
Game.Rule.respawnTime = 0
Game.Rule.respawnable = true

players = {}
MHP =  Game.SyncValue.Create("MHP")
HP =  Game.SyncValue.Create("HP")
CHP =  Game.SyncValue.Create("CHP")
MAP =  Game.SyncValue.Create("MAP")
AP = Game.SyncValue.Create("AP")
CAP = Game.SyncValue.Create("CAP")
CDE = Game.SyncValue.Create("CDE")
PSC = Game.SyncValue.Create("PSC")
CPSC = Game.SyncValue.Create("CPSC")
ENDBN = Game.SyncValue.Create("ENDBN")
SAVEtip = Game.SyncValue.Create("SAVEtip")
DJ = Game.SyncValue.Create("DJ")

x2 = {}
y2 = {}
z2 = {}

ENDS = {}

n = "黃泉驅"

-- 重生點座標
HOMEpos = {x = -182,y = -182, z = 1}

S11 = Game.EntityBlock:Create({ x = -175, y = -166, z = 3 })
S12 = Game.EntityBlock:Create({ x = -178, y = -143, z = 6 })
S13 = Game.EntityBlock:Create({ x = -173, y = -100, z = 4 })
S14 = Game.EntityBlock:Create({ x = -178, y = -83, z = 13 })
S1E = Game.EntityBlock:Create({ x = -176, y = -54, z = 6 })
S21 = Game.EntityBlock:Create({ x = -149, y = -181, z = 6 })
S22 = Game.EntityBlock:Create({ x = -154, y = -158, z = 7 })
S23 = Game.EntityBlock:Create({ x = -143, y = -123, z = 6 })
S24 = Game.EntityBlock:Create({ x = -149, y = -87, z = 6 })
S2E = Game.EntityBlock:Create({ x = -149, y = -54, z = 6 })
S31 = Game.EntityBlock:Create({ x = -122, y = -181, z = 6 })
S32 = Game.EntityBlock:Create({ x = -121, y = -153, z = 9 })
S33 = Game.EntityBlock:Create({ x = -125, y = -104, z = 8 })
S3E = Game.EntityBlock:Create({ x = -122, y = -54, z = 6 })
S41 = Game.EntityBlock:Create({ x = -95, y = -181, z = 6 })
S42 = Game.EntityBlock:Create({ x = -95, y = -162, z = 11 })
S43 = Game.EntityBlock:Create({ x = -90, y = -115, z = 3 })
S4E = Game.EntityBlock:Create({ x = -95, y = -54, z = 6 })
S51 = Game.EntityBlock:Create({ x = -68, y = -181, z = 11 })
S52 = Game.EntityBlock:Create({ x = -73, y = -126, z = 9 })
S53 = Game.EntityBlock:Create({ x = -62, y = -120, z = 4 })
S5E = Game.EntityBlock:Create({ x = -68, y = -54, z = 11 })
SS1 = Game.EntityBlock:Create({ x = -177, y = -181, z = 25 })
SS1E = Game.EntityBlock:Create({ x = -176, y = -54, z = 25 })
SS2 = Game.EntityBlock:Create({ x = -149, y = -181, z = 30 })
SS2E = Game.EntityBlock:Create({ x = -149, y = -54, z = 30 })
SS3 = Game.EntityBlock:Create({ x = -122, y = -181, z = 30 })
SS3E = Game.EntityBlock:Create({ x = -122, y = -54, z = 30 })
SS4 = Game.EntityBlock:Create({ x = -95, y = -181, z = 30 })
SS4E = Game.EntityBlock:Create({ x = -95, y = -54, z = 30 })
SS5 = Game.EntityBlock:Create({ x = -68, y = -181, z = 35 })
SS5E = Game.EntityBlock:Create({ x = -68, y = -54, z = 35 })
END = Game.EntityBlock:Create({ x = -68, y = -50, z = 35 })

SM01 = Game.EntityBlock:Create({ x = -177, y = -171, z = 1 })
SM02 = Game.EntityBlock:Create({ x = -174, y = -150, z = 1 })
SM03 = Game.EntityBlock:Create({ x = -177, y = -134, z = 8 })
SM04 = Game.EntityBlock:Create({ x = -176, y = -118, z = 1 })
SM05 = Game.EntityBlock:Create({ x = -175, y = -106, z = 1 })
SM06 = Game.EntityBlock:Create({ x = -179, y = -90, z = 6 })
SM07 = Game.EntityBlock:Create({ x = -174, y = -88, z = 6 })
SM08 = Game.EntityBlock:Create({ x = -175, y = -74, z = 8 })
SM09 = Game.EntityBlock:Create({ x = -179, y = -65, z = 6 })
SM10 = Game.EntityBlock:Create({ x = -149, y = -168, z = 7 })
SM11 = Game.EntityBlock:Create({ x = -149, y = -153, z = 1 })
SM12 = Game.EntityBlock:Create({ x = -149, y = -142, z = 1 })
SM13 = Game.EntityBlock:Create({ x = -150, y = -113, z = 9 })
SM14 = Game.EntityBlock:Create({ x = -148, y = -99, z = 1 })
SM15 = Game.EntityBlock:Create({ x = -149, y = -90, z = 4 })
SM16 = Game.EntityBlock:Create({ x = -149, y = -79, z = 1 })
SM17 = Game.EntityBlock:Create({ x = -148, y = -75, z = 1 })
SM18 = Game.EntityBlock:Create({ x = -149, y = -58, z = 1 })
SM19 = Game.EntityBlock:Create({ x = -155, y = -56, z = 30 })
SM20 = Game.EntityBlock:Create({ x = -154, y = -56, z = 30 })
SM21 = Game.EntityBlock:Create({ x = -153, y = -56, z = 30 })
SM22 = Game.EntityBlock:Create({ x = -152, y = -56, z = 30 })
SM23 = Game.EntityBlock:Create({ x = -151, y = -56, z = 30 })
SM24 = Game.EntityBlock:Create({ x = -150, y = -56, z = 30 })
SM25 = Game.EntityBlock:Create({ x = -149, y = -56, z = 30 })
SM26 = Game.EntityBlock:Create({ x = -148, y = -56, z = 30 })
SM27 = Game.EntityBlock:Create({ x = -147, y = -56, z = 30 })
SM28 = Game.EntityBlock:Create({ x = -146, y = -56, z = 30 })
SM29 = Game.EntityBlock:Create({ x = -145, y = -56, z = 30 })
SM30 = Game.EntityBlock:Create({ x = -144, y = -56, z = 30 })
SM31 = Game.EntityBlock:Create({ x = -143, y = -56, z = 30 })
SM32 = Game.EntityBlock:Create({ x = -122, y = -164, z = 1 })
SM33 = Game.EntityBlock:Create({ x = -120, y = -145, z = 1 })
SM34 = Game.EntityBlock:Create({ x = -121, y = -126, z = 1 })
SM35 = Game.EntityBlock:Create({ x = -125, y = -107, z = 6 })
SM36 = Game.EntityBlock:Create({ x = -125, y = -86, z = 5 })
SM37 = Game.EntityBlock:Create({ x = -125, y = -67, z = 1 })
SM38 = Game.EntityBlock:Create({ x = -92, y = -174, z = 1 })
SM39 = Game.EntityBlock:Create({ x = -98, y = -174, z = 1 })
SM40 = Game.EntityBlock:Create({ x = -91, y = -161, z = 1 })
SM41 = Game.EntityBlock:Create({ x = -97, y = -161, z = 1 })
SM42 = Game.EntityBlock:Create({ x = -88, y = -159, z = 1 })
SM43 = Game.EntityBlock:Create({ x = -101, y = -159, z = 1 })
SM44 = Game.EntityBlock:Create({ x = -96, y = -149, z = 1 })
SM45 = Game.EntityBlock:Create({ x = -92, y = -131, z = 5 })
SM46 = Game.EntityBlock:Create({ x = -98, y = -122, z = 3 })
SM47 = Game.EntityBlock:Create({ x = -94, y = -110, z = 1 })
SM48 = Game.EntityBlock:Create({ x = -98, y = -106, z = 1 })
SM49 = Game.EntityBlock:Create({ x = -90, y = -97, z = 1 })
SM50 = Game.EntityBlock:Create({ x = -98, y = -85, z = 1 })
SM51 = Game.EntityBlock:Create({ x = -95, y = -58, z = 1 })
SM52 = Game.EntityBlock:Create({ x = -91, y = -174, z = 28 })
SM53 = Game.EntityBlock:Create({ x = -97, y = -169, z = 26 })
SM54 = Game.EntityBlock:Create({ x = -96, y = -143, z = 24 })
SM55 = Game.EntityBlock:Create({ x = -98, y = -139, z = 24 })
SM56 = Game.EntityBlock:Create({ x = -92, y = -139, z = 24 })
SM57 = Game.EntityBlock:Create({ x = -94, y = -137, z = 24 })
SM58 = Game.EntityBlock:Create({ x = -94, y = -137, z = 31 })
SM59 = Game.EntityBlock:Create({ x = -97, y = -134, z = 31 })
SM60 = Game.EntityBlock:Create({ x = -91, y = -134, z = 31 })
SM61 = Game.EntityBlock:Create({ x = -94, y = -131, z = 31 })
SM62 = Game.EntityBlock:Create({ x = -69, y = -172, z = 1 })
SM63 = Game.EntityBlock:Create({ x = -70, y = -135, z = 1 })
SM64 = Game.EntityBlock:Create({ x = -72, y = -119, z = 1 })
SM65 = Game.EntityBlock:Create({ x = -65, y = -126, z = 1 })
SM66 = Game.EntityBlock:Create({ x = -72, y = -93, z = 4 })
SM67 = Game.EntityBlock:Create({ x = -69, y = -79, z = 5 })
SM68 = Game.EntityBlock:Create({ x = -62, y = -64, z = 11 })
SM69 = Game.EntityBlock:Create({ x = -72, y = -71, z = 31 })
SM70 = Game.EntityBlock:Create({ x = -72, y = -62, z = 31 })

-------------------------------------------------------------
function SM01:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM02:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM03:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM04:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM05:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM06:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM07:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM08:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM09:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM10:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM11:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM12:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM13:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM14:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM15:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM16:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM17:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM18:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM19:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM20:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM21:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM22:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM23:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM24:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM25:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM26:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM27:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM28:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM29:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM30:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM31:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM32:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM33:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM34:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM35:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM36:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM37:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM38:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM39:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM40:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM41:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM42:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM43:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM44:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM45:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM46:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM47:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM48:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM49:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM50:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM51:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM52:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM53:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM54:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM55:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM56:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM57:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM58:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM59:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM60:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM61:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM62:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM63:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM64:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM65:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM66:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM67:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM68:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM69:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end
function SM70:OnTouch(player)
    if player.user.sj < 0.1 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    else
        player.velocity = {z = player.user.sj / 1.15}
        player.user.sj = player.user.sj / 1.15
    end
end

function S11:OnTouch(player)
    player.user.x = -175
    player.user.y = -166
    player.user.z = 4
    if player.coin == 0 then
        player.coin = 1
    end
    SN(player)
    player:Signal(2)
    SAVE(player)
end
function S12:OnTouch(player)
    player.user.x = -178
    player.user.y = -144
    player.user.z = 7
    if player.coin == 1 then
        player.coin = 2
    end
    SN(player)
    player:Signal(3)
    SAVE(player)
end
function S13:OnTouch(player)
    player.user.x = -174
    player.user.y = -101
    player.user.z = 5
    if player.coin == 2 then
        player.coin = 3
    end
    SN(player)
    player:Signal(4)
    SAVE(player)
end
function S14:OnTouch(player)
    player.user.x = -179
    player.user.y = -83
    player.user.z = 14
    if player.coin == 3 then
        player.coin = 4
    end
    SN(player)
    player:Signal(5)
    SAVE(player)
end
function S1E:OnTouch(player)
    player.user.x = -176
    player.user.y = -53
    player.user.z = 7
    if player.coin == 4 then
        player.coin = 5
    end
    SN(player)
    player:Signal(6)
    SAVE(player)
end
function S21:OnTouch(player)
    player.user.x = -149
    player.user.y = -182
    player.user.z = 7
    if player.coin == 4 or player.coin == 5 then
        player.coin = 6
    end
    SN(player)
    player:Signal(7)
    SAVE(player)
end
function S22:OnTouch(player)
    player.user.x = -154
    player.user.y = -159
    player.user.z = 8
    if player.coin == 6 then
        player.coin = 7
    end
    SN(player)
    player:Signal(8)
    SAVE(player)
end
function S23:OnTouch(player)
    player.user.x = -143
    player.user.y = -124
    player.user.z = 7
    if player.coin == 7 then
        player.coin = 8
    end
    SN(player)
    player:Signal(9)
    SAVE(player)
end
function S24:OnTouch(player)
    player.user.x = -149
    player.user.y = -88
    player.user.z = 8
    if player.coin == 8 then
        player.coin = 9
    end
    SN(player)
    player:Signal(10)
    SAVE(player)
end
function S2E:OnTouch(player)
    player.user.x = -149
    player.user.y = -53
    player.user.z = 7
    if player.coin == 9 then
        player.coin = 10
    end
    SN(player)
    player:Signal(11)
    SAVE(player)
end
function S31:OnTouch(player)
    player.user.x = -122
    player.user.y = -182
    player.user.z = 7
    if player.coin == 9 or player.coin == 10 then
        player.coin = 11
    end
    SN(player)
    player:Signal(12)
    SAVE(player)
end
function S32:OnTouch(player)
    player.user.x = -122
    player.user.y = -153
    player.user.z = 10
    if player.coin == 11 then
        player.coin = 12
    end
    SN(player)
    player:Signal(13)
    SAVE(player)
end
function S33:OnTouch(player)
    player.user.x = -124
    player.user.y = -104
    player.user.z = 9
    if player.coin == 12 then
        player.coin = 13
    end
    SN(player)
    player:Signal(14)
    SAVE(player)
end
function S3E:OnTouch(player)
    player.user.x = -122
    player.user.y = -53
    player.user.z = 7
    if player.coin == 13 then
        player.coin = 14
    end
    SN(player)
    player:Signal(15)
    SAVE(player)
end
function S41:OnTouch(player)
    player.user.x = -95
    player.user.y = -182
    player.user.z = 7
    if player.coin == 13 or player.coin == 14 then
        player.coin = 15
    end
    SN(player)
    player:Signal(16)
    SAVE(player)
end
function S42:OnTouch(player)
    player.user.x = -95
    player.user.y = -161
    player.user.z = 12
    if player.coin == 15 then
        player.coin = 16
    end
    SN(player)
    player:Signal(17)
    SAVE(player)
end
function S43:OnTouch(player)
    player.user.x = -90
    player.user.y = -115
    player.user.z = 4
    if player.coin == 16 then
        player.coin = 17
    end
    SN(player)
    player:Signal(18)
    SAVE(player)
end
function S4E:OnTouch(player)
    player.user.x = -95
    player.user.y = -53
    player.user.z = 7
    if player.coin == 17 then
        player.coin = 18
    end
    SN(player)
    player:Signal(19)
    SAVE(player)
end
function S51:OnTouch(player)
    player.user.x = -68
    player.user.y = -182
    player.user.z = 12
    if player.coin == 17 or player.coin == 18 then
        player.coin = 19
    end
    SN(player)
    player:Signal(20)
    SAVE(player)
end
function S52:OnTouch(player)
    player.user.x = -74
    player.user.y = -126
    player.user.z = 10
    if player.coin == 19 then
        player.coin = 20
    end
    SN(player)
    player:Signal(21)
    SAVE(player)
end
function S53:OnTouch(player)
    player.user.x = -62
    player.user.y = -119
    player.user.z = 5
    if player.coin == 20 then
        player.coin = 21
    end
    SN(player)
    player:Signal(22)
    SAVE(player)
end
function S5E:OnTouch(player)
    player.user.x = -68
    player.user.y = -53
    player.user.z = 12
    if player.coin == 21 then
        player.coin = 22
    end
    SN(player)
    player:Signal(23)
    SAVE(player)
end
function SS1:OnTouch(player)
    player.user.x = -177
    player.user.y = -182
    player.user.z = 26
    if player.coin == 21 or player.coin == 22 then
        player.coin = 23
    end
    SN(player)
    player:Signal(24)
    SAVE(player)
end
function SS1E:OnTouch(player)
    player.user.x = -176
    player.user.y = -53
    player.user.z = 26
    if player.coin == 23 then
        player.coin = 24
    end
    SN(player)
    player:Signal(25)
    SAVE(player)
end
function SS2:OnTouch(player)
    player.user.x = -149
    player.user.y = -182
    player.user.z = 31
    if player.coin == 23 or player.coin == 24 then
        player.coin = 25
    end
    SN(player)
    player:Signal(26)
    SAVE(player)
end
function SS2E:OnTouch(player)
    player.user.x = -149
    player.user.y = -53
    player.user.z = 31
    if player.coin == 25 then
        player.coin = 26
    end
    SN(player)
    player:Signal(27)
    SAVE(player)
end
function SS3:OnTouch(player)
    player.user.x = -122
    player.user.y = -181
    player.user.z = 31
    if player.coin == 25 or player.coin == 26 then
        player.coin = 27
    end
    SN(player)
    player:Signal(28)
    SAVE(player)
end
function SS3E:OnTouch(player)
    player.user.x = -122
    player.user.y = -53
    player.user.z = 31
    if player.coin == 27 then
        player.coin = 28
    end
    SN(player)
    player:Signal(29)
    SAVE(player)
end
function SS4:OnTouch(player)
    player.user.x = -95
    player.user.y = -182
    player.user.z = 31
    if player.coin == 27 or player.coin == 28 then
        player.coin = 29
    end
    SN(player)
    player:Signal(30)
    SAVE(player)
end
function SS4E:OnTouch(player)
    player.user.x = -95
    player.user.y = -53
    player.user.z = 31
    if player.coin == 29 then
        player.coin = 30
    end
    SN(player)
    player:Signal(31)
    SAVE(player)
end
function SS5:OnTouch(player)
    player.user.x = -68
    player.user.y = -182
    player.user.z = 36
    if player.coin == 29 or player.coin == 30 then
        player.coin = 31
    end
    SN(player)
    player:Signal(32)
    SAVE(player)
end
function SS5E:OnTouch(player)
    player.user.x = -68
    player.user.y = -53
    player.user.z = 36
    if player.coin == 31 then
        player.coin = 32
    end
    SN(player)
    player:Signal(33)
    SAVE(player)
    if ENDS[player.index] == 0 then
        ENDBN.value = player.name
        ENDS[player.index] = 1
    end
end

function SAVE(player)
    x2[player.index] = player.user.x
    y2[player.index] = player.user.y
    z2[player.index] = player.user.z
    SAVEtip.value = player.index
end

function T_O(callerOn)
    if callerOn == nil or callerOn == false then
		return
	end
    local TE = Game.GetTriggerEntity()
	if TE and TE:IsPlayer() then
        TE = TE:ToPlayer()
        TE.position = {x = -149, y = -182, z = 6}
    end
end
function O_E(callerOn)
    if callerOn == nil or callerOn == false then
		return
	end
    local TE = Game.GetTriggerEntity()
	if TE and TE:IsPlayer() then
        TE = TE:ToPlayer()
        TE.position = {x = -176, y = -53, z = 7}
    end
end
function TH_O(callerOn)
    if callerOn == nil or callerOn == false then
		return
	end
    local TE = Game.GetTriggerEntity()
	if TE and TE:IsPlayer() then
        TE = TE:ToPlayer()
        TE.position = {x = -122, y = -182, z = 7}
    end
end
function T_E(callerOn)
    if callerOn == nil or callerOn == false then
		return
	end
    local TE = Game.GetTriggerEntity()
	if TE and TE:IsPlayer() then
        TE = TE:ToPlayer()
        TE.position = {x = -149, y = -53, z = 7}
    end
end
function F_O(callerOn)
    if callerOn == nil or callerOn == false then
		return
	end
    local TE = Game.GetTriggerEntity()
	if TE and TE:IsPlayer() then
        TE = TE:ToPlayer()
        TE.position = {x = -95, y = -182, z = 7}
    end
end
function TH_E(callerOn)
    if callerOn == nil or callerOn == false then
		return
	end
    local TE = Game.GetTriggerEntity()
	if TE and TE:IsPlayer() then
        TE = TE:ToPlayer()
        TE.position = {x = -122, y = -53, z = 7}
    end
end
function FI_O(callerOn)
    if callerOn == nil or callerOn == false then
		return
	end
    local TE = Game.GetTriggerEntity()
	if TE and TE:IsPlayer() then
        TE = TE:ToPlayer()
        TE.position = {x = -68, y = -182, z = 12}
    end
end
function F_E(callerOn)
    if callerOn == nil or callerOn == false then
		return
	end
    local TE = Game.GetTriggerEntity()
	if TE and TE:IsPlayer() then
        TE = TE:ToPlayer()
        TE.position = {x = -95, y = -53, z = 7}
    end
end
function SO_S(callerOn)
    if callerOn == nil or callerOn == false then
		return
	end
    local TE = Game.GetTriggerEntity()
	if TE and TE:IsPlayer() then
        TE = TE:ToPlayer()
        TE.position = {x = -177, y = -182, z = 26}
    end
end
function FI_E(callerOn)
    if callerOn == nil or callerOn == false then
		return
	end
    local TE = Game.GetTriggerEntity()
	if TE and TE:IsPlayer() then
        TE = TE:ToPlayer()
        TE.position = {x = -68, y = -53, z = 12}
    end
end
function ST_S(callerOn)
    if callerOn == nil or callerOn == false then
		return
	end
    local TE = Game.GetTriggerEntity()
	if TE and TE:IsPlayer() then
        TE = TE:ToPlayer()
        TE.position = {x = -149, y = -182, z = 31}
    end
end
function SO_E(callerOn)
    if callerOn == nil or callerOn == false then
		return
	end
    local TE = Game.GetTriggerEntity()
	if TE and TE:IsPlayer() then
        TE = TE:ToPlayer()
        TE.position = {x = -176, y = -53, z = 26}
    end
end
function SH_S(callerOn)
    if callerOn == nil or callerOn == false then
		return
	end
    local TE = Game.GetTriggerEntity()
	if TE and TE:IsPlayer() then
        TE = TE:ToPlayer()
        TE.position = {x = -122, y = -182, z = 31}
    end
end
function ST_E(callerOn)
    if callerOn == nil or callerOn == false then
		return
	end
    local TE = Game.GetTriggerEntity()
	if TE and TE:IsPlayer() then
        TE = TE:ToPlayer()
        TE.position = {x = -149, y = -53, z = 31}
    end
end
function SF_S(callerOn)
    if callerOn == nil or callerOn == false then
		return
	end
    local TE = Game.GetTriggerEntity()
	if TE and TE:IsPlayer() then
        TE = TE:ToPlayer()
        TE.position = {x = -95, y = -182, z = 31}
    end
end
function SH_E(callerOn)
    if callerOn == nil or callerOn == false then
		return
	end
    local TE = Game.GetTriggerEntity()
	if TE and TE:IsPlayer() then
        TE = TE:ToPlayer()
        TE.position = {x = -122, y = -53, z = 31}
    end
end
function SI_S(callerOn)
    if callerOn == nil or callerOn == false then
		return
	end
    local TE = Game.GetTriggerEntity()
	if TE and TE:IsPlayer() then
        TE = TE:ToPlayer()
        TE.position = {x = -68, y = -182, z = 36}
    end
end
function SF_E(callerOn)
    if callerOn == nil or callerOn == false then
		return
	end
    local TE = Game.GetTriggerEntity()
	if TE and TE:IsPlayer() then
        TE = TE:ToPlayer()
        TE.position = {x = -95, y = -53, z = 31}
    end
end

function SN(player)
    PSC.value = player.coin
    CPSC.value = player.index
end

function MoneyJump(callerOn)
    if callerOn == nil or callerOn == false then
		return
    end
    DJ.value = player.index
end

function END:OnUse(player)
    ENDBN.value = player.name
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

-- UI傳GAME變數
function Game.Rule:OnPlayerSignal( player, signal )
    ClientID:OnPlayerSignal( player, signal );
    pu = player.user
    if signal == 10001 then
        player.velocity = {x = 0,y = 0,z = 0}
        player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
    elseif signal == 10002 then 
        player.position = HOMEpos
        player:Signal(1)
    elseif signal == 10003 then 
        player.position = {x = -68, y = -53,z = 36}
    elseif signal == 10004 then 
        player.velocity = {z = 300}
    elseif signal == 10010 then
        if player.maxhealth >= 5000 then
            player.maxhealth = 5000
        elseif player.maxarmor >= 5000 then
            player.maxarmor = 5000
        end

        pu.sj = (player.velocity.z - (player.velocity.z + (player.velocity.z)))

        CHA(player)
    end
end

-- 無摔傷
function Game.Rule:OnPlayerAttack(victim,attacker,damage,weapontype,hitbox)
    if attacker == nil then
        return 0 
    end
end

-- 以遊戲時間運算函數
function Game.Rule:OnUpdate(time)
    ClientID:OnUpdate(time);
end

-- 玩家重生時呼叫函數
function Game.Rule:OnPlayerSpawn(player)
    player.armor = player.maxarmor
    player.health = player.maxhealth
    pu.Spawn_Invincible = Game.GetTime() + 3
    CHA(player)
    player.position = {x = x2[player.index], y = y2[player.index], z = z2[player.index]}
end

-- 玩家選擇角色後初次重生時叫出的函數
function Game.Rule:OnPlayerConnect (player)
    if player == nil then
        return
    end
    pu = player.user
    -- 儲存玩家排列
    players[player.index] = player
     -- 團隊設定
    player.team = Game.TEAM.CT
    -- 初始座標
    x2[player.index] = -177
    y2[player.index] = -182
    z2[player.index] = 1
    -- 基本能力
    player.maxhealth = 1000
    player.maxarmor = 1000
    pu.sj = 0

    CHA(player)
    SN(player)
    player:Signal(1)
end

-- 數值四捨五入
function DoubleToInt(number)
	return math.floor(math.abs(number + EPSILON))
end

function Game.Rule:OnPlayerDisconnect (player)
    pu = player.user
    x2[player.index] = nil
    y2[player.index] = nil
    z2[player.index] = nil
    SN(player)
end

function Game.Rule:OnGameSave(player)
    if player == nil then
        return
    end
    pu = player.user
    SN(player)
end

function Game.Rule:OnLoadGameSave(player)
    if player == nil then
        return
    end
    if pu.coin == nil then
        pu.coin = 0
    else
        pu.coin = DoubleToInt(player:GetGameSave('coin'))
        palyer.coin = pu.coin
    end
    x2[player.index] = nil
    y2[player.index] = nil
    z2[player.index] = nil
    SN(player)
end

function Game.Rule:OnClearGameSave(player)
    pu = player.user
    player.coin = 0
    pu.coin = 0
    CHA(player)
    SN(player)
end