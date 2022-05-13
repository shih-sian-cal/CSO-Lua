U = {
   B = UI.Box,
   T = UI.Text,
   SS = UI.ScreenSize(),
   SV = UI.SyncValue,
   E = UI.Event
}

rgb = {
   y = {r = 255,b = 255,b = 0},
   w = {r = 255,b = 255,b = 255}
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

function U_SV_C(str)
   return U.SV.Create(str)
end

function U_TB(TB,text,font,align,x,y,width,height,r,g,b,a)
   str = {}
   if TB == 0 then
      str = U.B.Create()
      str:Set({x = U.SS.width*x,y = U.SS.height*y,width = width,height = height,r = r,g = g,b = b,a = a})
   else
      str = U.T.Create()
      str:Set({text = text,font = font,align = align,x = U.SS.width*x,y = U.SS.height*y,width = width,height = height,r = r,g = g,b = b,a = a})
   end
   return str
end

LKEY1 = U_TB(0,'','','',0.005,0.025,350,250,0,0,0,100)
LAKEY1 = U_TB(0,'','','',0.01,0.07,340,1,255,255,255,255)
SKEY1 = U_TB(1,'特殊鍵欄','small','left',0.01,0.001,100,100,255,0,0,255)
OK1 = U_TB(1,'[B鍵]:武器庫','small','left',0.01,0.06,150,80,255,255,255,255)
OK2 = U_TB(1,'[5鍵]:開關UI介面','small','left',0.01,0.09,200,80,255,255,255,255)
OK3 = U_TB(1,'[6鍵]:切換為第三人稱','small','left',0.01,0.12,200,80,255,255,255,255)
OK4 = U_TB(1,'[7鍵]:開啟購買能力欄','small','left',0.01,0.15,200,80,255,255,255,255)
OK5 = U_TB(1,'[8鍵]:回重生點','small','left',0.01,0.18,200,80,255,255,255,255)
OK5:Hide()
SW = U_TB(1,'[M鍵]:切換為玩家資訊欄','small','right',0.14,0.29,200,80,255,255,255,255)

SKEY2 = U_TB(1,'玩家資訊欄','small','left',0.01,0.001,200,100,255,0,0,0)
MV = U_TB(1,'地圖版本：ver 1.8.0(繼承版)','small','left',0.01,0.04,300,100,255,255,255,0)
LN = U_TB(1,'目前位置：重生點','small','left',0.01,0.07,400,100,255,255,255,0)
UDE = U_TB(1,'目前攻擊力：0','small','left',0.01,0.10,300,100,255,255,255,0)
KillNU = U_TB(1,'總擊殺數：0隻','small','left',0.01,0.13,300,100,255,255,255,0)
LVU = U_TB(1,'目前難度：1階(MIN)','small','left',0.01,0.16,200,100,255,255,255,0)
ATM = U_TB(1,'目前存款：0E','small','left',0.01,0.19,500,100,255,255,255,0)
LMU = U_TB(1,'區域解鎖條件：0/50殺','small','left',0.01,0.22,500,100,255,255,255,0)
EXP = U_TB(1,'需求經驗：0/10','small','left',0.01,0.25,500,100,255,255,255,0)
LVS = U_TB(1,'（0階）','small','left',0.09,0.874,500,100,255,255,255,255)

CLKEY1 = U_TB(0,'','','',0.335,0.335,280,220,0,0,0,100)
CLKEY1:Hide()
CLAKEY1 = U_TB(0,'','','',0.34,0.39,270,1,255,255,255,0)
SKEY3 = U_TB(1,'購買能力欄','small','left',0.34,0.32,100,100,255,0,0,0)
BH = U_TB(1,'[1鍵]:購買+100血量上限(1,000元)','small','left',0.34,0.37,500,100,255,255,255,0)
BA = U_TB(1,'[2鍵]:購買+100護甲上限(1,500元)','small','left',0.34,0.4,500,100,255,255,255,0)
BD = U_TB(1,'[3鍵]:購買攻擊力+1,000(100萬元)','small','left',0.34,0.43,500,100,255,255,255,0)
offm = U_TB(1,'[7鍵]:關閉購買能力欄','small','left',0.44,0.56,500,80,255,255,255,0)

BDL = U_TB(0,'','','',0.0001,0.935,850,100,0,0,0,255)
HP1 = U_TB(0,'','','',0.048,0.95,175,35,255,0,0,255)
HP2 = U_TB(0,'','','',0.048,0.95,175,35,255,0,0,100)
AP1 = U_TB(0,'','','',0.26,0.95,175,35,0,0,255,255)
AP2 = U_TB(0,'','','',0.26,0.95,175,35,0,0,255,100)
HPM = U_TB(1,'HP','medium','left',0.01,0.935,100,80,255,0,0,255)
HPN = U_TB(1,'100/100(100.00%)','small','left',0.0475,0.940,200,80,255,255,255,255)
APM = U_TB(1,'AP','medium','left',0.225,0.935,100,80,100,100,255,255)
APN = U_TB(1,'100/100(100.00%)','small','left',0.26,0.940,200,80,255,255,255,255)
CSD = U_TB(1,'目前傷害量:0','small','center',0.45,0.940,500,80,255,255,255,255)
NOT = U_TB(1,'未達標','medium','center',0.3,0.5,400,100,255,0,0,0)

CLVS = U_SV_C('CLVS')
LEVS = U_SV_C('LEVS')
CDE = U_SV_C('CDE')
DEtip = U_SV_C('DEtip')
CATM = U_SV_C('CATM')
ATMtip = U_SV_C('ATMtip')
CHP = U_SV_C('CHP')
MHP = U_SV_C('MHP')
HP = U_SV_C('HP')
CAP = U_SV_C('CAP')
MAP = U_SV_C('MAP')
AP = U_SV_C('AP')

CCSD = U_SV_C('CCSD')
SD = U_SV_C('SD')

CPEXP = U_SV_C('CPEXP')
PLEVEL = U_SV_C('PLEVEL')
PEXP = U_SV_C('PEXP')

KNU = U_SV_C('KNU')
KNL = U_SV_C('KNL')

LVtip = U_SV_C('LVtip')

ATMUtip = U_SV_C('ATMUtip')
ATMDtip = U_SV_C('ATMDtip')

MDtip = U_SV_C('MDtip')
AKtip = U_SV_C('AKtip')
P_LV = U_SV_C('P_LV')

UPC = U_SV_C('UPC')
EEND = U_SV_C('EEND')

NOtip = U_SV_C('NOtip')
NOHAP = U_SV_C('NOHAP')

P_MAX = 0
color_a = 0

function U.E:OnSignal(signal)
   if signal == 1 then
      LN:Set({text = '目前位置：重生點'})
   elseif signal == 2 then
      LN:Set({text = '目前位置：武器商店'})
   elseif signal == 3 then
      LN:Set({text = '目前位置：轉蛋商店'})
   elseif signal == 4 then
      LN:Set({text = '目前位置：遊戲資訊區'})
   elseif signal == 5 then
      LN:Set({text = '目前位置：訓練區'})
   elseif signal == 6 then
      LN:Set({text = '目前位置：遊樂區'})
   elseif signal == 7 then
      LN:Set({text = '目前位置：遠征區'})
   elseif signal == 8 then
      LN:Set({text = '目前位置：跑酷塔'})
   elseif signal == 9 then
      LN:Set({text = '目前位置：史萊姆跑酷'})
   elseif signal == 10 then
      LN:Set({text = '目前位置：滑坡'})
   elseif signal == 11 then
      LN:Set({text = '目前位置：電流棒'})
   elseif signal == 12 then
      LN:Set({text = '目前位置：黏著跑酷'})
   elseif signal == 12 then
      LN:Set({text = '目前位置：BOSS區'})
   end
end

function U.E:OnUpdate(time)
   if color_a ~= 0 then
      color_a = color_a - 1
      NOT:Set({a = color_a})
   end
end

SWonoff = 1
SVPTU = '三'
KEY3onoff = 0
UIonoff = 0
function U.E:OnKeyDown (inputs)
   if inputs[UI.KEY.B] == true and SWonoff == 1 and KEY3onoff == 0 then
      UI.Signal(10003)
      OK1:Set(rgb.y)
   elseif inputs[UI.KEY.NUM5] == true and SWonoff == 1 and KEY3onoff == 0 then
      if UIonoff == 0 then
         LKEY1:Hide()
         LAKEY1:Hide()
         SKEY1:Hide()
         OK1:Hide()
         OK2:Hide()
         OK3:Hide()
         OK4:Hide()
         OK5:Hide()
         SW:Hide()
         SKEY2:Hide()
         MV:Hide()
         LN:Hide()
         UDE:Hide()
         KillNU:Hide()
         LVU:Hide()
         ATM:Hide()
         EXP:Hide()
         LMU:Hide()
         BDL:Hide()
         HPM:Hide()
         HPN:Hide()
         APM:Hide()
         APN:Hide()
         HP1:Hide()
         HP2:Hide()
         AP1:Hide()
         AP2:Hide()
         UIonoff = 1
      elseif UIonoff == 1 then
         LKEY1:Show()
         LAKEY1:Show()
         SKEY1:Show()
         OK1:Show()
         OK2:Show()
         OK3:Show()
         OK4:Show()
         OK5:Show()
         SW:Show()
         SKEY2:Show()
         MV:Show()
         LN:Show()
         UDE:Show()
         KillNU:Show()
         LVU:Show()
         ATM:Show()
         EXP:Show()
         LMU:Show()
         BDL:Show()
         HPM:Show()
         HPN:Show()
         APM:Show()
         APN:Show()
         HP1:Show()
         HP2:Show()
         AP1:Show()
         AP2:Show()
         UIonoff = 0
      end
      OK2:Set(rgb.y)
   elseif inputs[UI.KEY.NUM6] == true and SWonoff == 1 and KEY3onoff == 0 then
      UI.Signal(10006)
      if SVPTU == '三' then
         SVPTU = '一'
      elseif SVPTU == '一' then
         SVPTU = '三'
      end
      OK3:Set({text = '[6鍵]:切換為第'..SVPTU..'人稱'})
      OK3:Set(rgb.y)
   elseif inputs[UI.KEY.NUM7] == true and SWonoff == 1 then
      if KEY3onoff == 0 then
         KEY3onoff = 1
         SKEY3:Set({a = 255})
         BH:Set({a = 255})
         BA:Set({a = 255})
         BD:Set({a = 255})
         CLKEY1:Show()
         CLAKEY1:Set({a = 255})
         offm:Set({a = 255})
      elseif KEY3onoff == 1 then
         KEY3onoff = 0
         SKEY3:Set({a = 0})
         BH:Set({a = 0})
         BA:Set({a = 0})
         BD:Set({a = 0})
         CLKEY1:Hide()
         CLAKEY1:Set({a = 0})
         offm:Set({a = 0})
      end
      OK4:Set(rgb.y)
      offm:Set(rgb.y)
   elseif inputs[UI.KEY.NUM8] == true and SWonoff == 1 and KEY3onoff == 0 and P_MAX == 1 then
      UI.Signal(10008)
      OK5:Set(rgb.y)
   elseif inputs[UI.KEY.M] == true and KEY3onoff == 0 then
      swstr = ''
      if SWonoff == 1 then
         SWonoff = 0
         swstr = '特殊鍵欄'
         SKEY1:Set({a = 0})
         OK1:Set({a = 0})
         OK2:Set({a = 0})
         OK3:Set({a = 0})
         OK4:Set({a = 0})
         OK5:Set({a = 0})
         SKEY2:Set({a = 255})
         MV:Set({a = 255})
         LN:Set({a = 255})
         UDE:Set({a = 255})
         KillNU:Set({a = 255})
         LVU:Set({a = 255})
         ATM:Set({a = 255})
         EXP:Set({a = 255})
         LMU:Set({a = 255})
      elseif SWonoff == 0 then
         SWonoff = 1
         swstr = '玩家資訊欄'
         SKEY1:Set({a = 255})
         OK1:Set({a = 255})
         OK2:Set({a = 255})
         OK3:Set({a = 255})
         OK4:Set({a = 255})
         OK5:Set({a = 255})
         SKEY2:Set({a = 0})
         KillNU:Set({a = 0})
         MV:Set({a = 0})
         LN:Set({a = 0})
         UDE:Set({a = 0})
         LVU:Set({a = 0})
         ATM:Set({a = 0})
         EXP:Set({a = 0})
         LMU:Set({a = 0})
      end
      SW:Set({text = '[M鍵]:切換為'..swstr})
      SW:Set(rgb.y)
   else
      OK1:Set(rgb.w)
      OK2:Set(rgb.w)
      OK3:Set(rgb.w)
      OK4:Set(rgb.w)
      OK5:Set(rgb.w)
      SW:Set(rgb.w)
      offm:Set(rgb.w)
   end
end

function U.E:OnInput (inputs)
   if KEY3onoff == 1 and inputs[UI.KEY.NUM1] == true then
      UI.Signal(10001)
      BH:Set(rgb.y)
   elseif KEY3onoff == 1 and inputs[UI.KEY.NUM2] == true then
      UI.Signal(10002)
      BA:Set(rgb.y)
   elseif KEY3onoff == 1 and inputs[UI.KEY.NUM3] == true then
      UI.Signal(10004)
      BD:Set(rgb.y)
   else
      BA:Set(rgb.w)
      BH:Set(rgb.w)
      BD:Set(rgb.w)
   end
end


cDD = 0
function SD:OnSync()
   if cDD == 1 then
      if self.value < 100 then
         CSD:Set({r = 255, g = 255, b = 255})
      elseif self.value > 99 and self.value < 500 then
         CSD:Set({r = 130, g = 255, b = 40})
      elseif self.value > 499 and self.value < 1000 then
         CSD:Set({r = 255, g = 255, b = 40})
      elseif self.value > 999 and self.value < 10000 then
         CSD:Set({r = 255, g = 140, b = 40})
      elseif self.value > 9999 and self.value < 100000 then
         CSD:Set({r = 255, g = 40, b = 40})
      elseif self.value > 99999 and self.value < 1000000 then
         CSD:Set({r = 150, g = 40, b = 150})
      elseif self.value > 999999 and self.value < 10000000 then
         CSD:Set({r = 255, g = 0, b = 255})
      elseif self.value > 9999999 and self.value < 100000000 then
         CSD:Set({r = 0, g = 255, b = 255})
      elseif self.value > 99999999 then
         CSD:Set({r = 0, g = 255, b = 0})
      end
      CSD:Set({text = '目前傷害量:'..FNT(string.format('%1.0f', self.value))})
      cDD = 0
   end
end
function CCSD:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cDD = 1
   end
end

cPEXP = 0
LVEXP = 0
function PEXP:OnSync()
   if cPEXP == 1 then
      EXP:Set({text = '需求經驗：'..FNT(string.format('%1.0f', self.value))..'/'..FNT(string.format('%1.0f', LVEXP))})
      cPEXP = 0
   end
end
function CPEXP:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cPEXP = 1
   end
end
function PLEVEL:OnSync()
   if cPEXP == 1 then
      LVEXP = self.value
   end
end

function KNU:OnSync()
   KillNU:Set({text = '總擊殺數：'..FNT(string.format('%1.0f', self.value))..'隻'})
end
function KNL:OnSync()
   str = ''
   if self.value < 361 then
      if self.value < 50 then
         str = '/50殺'
      elseif self.value >= 50 and self.value < 130 then
         str = '/130殺'
      elseif self.value >= 130 and self.value < 210 then
         str = '/210殺'
      elseif self.value >= 210 and self.value < 310 then
         str = '/310殺'
      elseif self.value >= 310 and self.value < 361 then
         str = '/361殺'
      end
      LMU:Set({text = '區域解鎖條件：'..string.format('%1.0f', self.value)..str})
   else
      LMU:Set({text = '區域解鎖條件：完成'})
   end
end

function LVtip:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '等級未達標'})
      color_a = 255
   end
end
function NOtip:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '金幣不足'})
      color_a = 255
   end
end
function NOHAP:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '已達上限'})
      color_a = 255
   end
end
function ATMUtip:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '攜帶金額未滿1億'})
      color_a = 255
   end
end
function ATMDtip:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '無存款'})
      color_a = 255
   end
end

function P_LV:OnSync()
   if self.value == UI.PlayerIndex(index) then
      P_MAX = 1
      OK5:Show()
   end
end

cLVS = 0
function CLVS:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cLVS = 1
   end
end
function LEVS:OnSync()
   if cLVS == 1 then
      LVS:Set({text = '（'..FNT(string.format('%1.0f',self.value))..'階）'})
      cLVS = 0
   end
end
cATM = 0
function CATM:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cATM = 1
   end
end
function ATMtip:OnSync()
   if cATM == 1 then
      ATM:Set({text = '目前存款：'..FNT(string.format('%1.1f', self.value))..'E'})
      cATM = 0
   end
end
cDE = 0
function CDE:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cDE = 1
   end
end
function DEtip:OnSync()
   if cDE == 1 then
      DEstr = ''
      if self.value == 1000000 then
         DEstr = '(MAX)'
      else
         DEstr = ''
      end
      UDE:Set({text = '目前攻擊力：'..FNT(string.format('%1.0f', self.value))..DEstr})
      cDE = 0
   end
end

function UPC:OnSync()
   str = ''
   if self.value == 100 then
      str = '階(MAX)'
   else
      str = '階'
   end
   LVU:Set({text = '目前難度：'..string.format('%1.0f',self.value)..str})
end

function EEND:OnSync()
   UI.Signal(10007)
end

cHP = 0
cAP = 0
mHP = 0
mAP = 0
function HP:OnSync()
   if cHP == 1 then
      a = self.value / mHP
      b = a * 175
      c = self.value
      d = a * 100
      if c <= 0 then
         c = 0
         b = 0
      end
      HPN:Set({text = FNT(string.format('%1.0f', c))..'/'..FNT(string.format('%1.0f', mHP))..'('..string.format('%1.2f', d)..'%)'})
      HP1:Set({width = b})
      cHP = 0
   end
end
function MHP:OnSync()
   if cHP == 1 then
      mHP = self.value
   end
end
function CHP:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cHP = 1
   end
end
function AP:OnSync()
   if cAP == 1 then
      a = self.value / mAP
      b = a * 175
      c = self.value
      d = a * 100
      if c <= 0 then
         c = 0
         b = 0
      end
      APN:Set({text = FNT(string.format('%1.0f', c))..'/'..FNT(string.format('%1.0f', mAP))..'('..string.format('%1.2f', d)..'%)'})
      AP1:Set({width = b})
      cAP = 0
   end
end
function MAP:OnSync()
   if cAP == 1 then
      mAP = self.value
   end
end
function CAP:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cAP = 1
   end
end