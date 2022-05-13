U = {
    B = UI.Box,
    T = UI.Text,
    SS = UI.ScreenSize(),
    SV = UI.SyncValue,
    E = UI.Event
}
 
LKEY1 = U.B.Create()
LKEY1:Set({
   x = U.SS.width * 0.005,
   y = U.SS.height * 0.025,
   width = 310,
   height = 250,
   r = 0,
   g = 0,
   b = 0,
   a = 100})
LAKEY1 = U.B.Create()
LAKEY1:Set({
   x = U.SS.width * 0.01,
   y = U.SS.height * 0.07,
   width = 300,
   height = 1,
   r = 255,
   g = 255,
   b = 255,
   a = 255})
SKEY1 = U.T.Create()
SKEY1:Set({
   text = '特殊鍵欄',
   font = 'small',
   align = 'left',
   x = U.SS.width * 0.01,
   y = U.SS.height * 0.001,
   width = 100,
   height = 100,
   r = 255,
   g = 0,
   b = 0,
   a = 255})
OK11 = U.T.Create()
OK11:Set({
   text = '[B鍵]:武器庫',
   font = 'small',
   align = 'left',
   x = U.SS.width * 0.01,
   y = U.SS.height * 0.06,
   width = 150,
   height = 80,
   r = 255,
   g = 255,
   b = 255,
   a = 255})
OK12 = U.T.Create()
OK12:Set({
   text = '[5鍵]:返回目前進度位置',
   font = 'small',
   align = 'left',
   x = U.SS.width * 0.01,
   y = U.SS.height * 0.09,
   width = 200,
   height = 80,
   r = 255,
   g = 255,
   b = 255,
   a = 255})
OK13 = U.T.Create()
OK13:Set({
   text = '[6鍵]:切換為第三人稱',
   font = 'small',
   align = 'left',
   x = U.SS.width * 0.01,
   y = U.SS.height * 0.12,
   width = 200,
   height = 80,
   r = 255,
   g = 255,
   b = 255,
   a = 255})
OK14 = U.T.Create()
OK14:Set({
   text = '[7鍵]:傳送個人商店並開啟購買能力欄',
   font = 'small',
   align = 'left',
   x = U.SS.width * 0.01,
   y = U.SS.height * 0.15,
   width = 300,
   height = 80,
   r = 255,
   g = 255,
   b = 255,
   a = 255})
SW = U.T.Create()
SW:Set({
   text = '[M鍵]:切換為玩家資訊欄',
   font = 'small',
   align = 'right',
   x = U.SS.width * 0.1,
   y = U.SS.height * 0.29,
   width = 200,
   height = 80,
   r = 255,
   g = 255,
   b = 255,
   a = 255
})

SKEY2 = U.T.Create()
SKEY2:Set({
   text = '玩家資訊欄',
   font = 'small',
   align = 'left',
   x = U.SS.width * 0.01,
   y = U.SS.height * 0.001,
   width = 200,
   height = 100,
   r = 255,
   g = 0,
   b = 0,
   a = 0})
OK21 = U.T.Create()
OK21:Set({
   text = '地圖版本：ver 1.1.1(強化版)',
   font = 'small',
   align = 'left',
   x = U.SS.width * 0.01,
   y = U.SS.height * 0.06,
   width = 300,
   height = 100,
   r = 255,
   g = 255,
   b = 255,
   a = 0})
OK22 = U.T.Create()
OK22:Set({
   text = '剩餘怪物：0隻',
   font = 'small',
   align = 'left',
   x = U.SS.width * 0.01,
   y = U.SS.height * 0.09,
   width = 300,
   height = 100,
   r = 255,
   g = 255,
   b = 255,
   a = 0})
OK23 = U.T.Create()
OK23:Set({
   text = '玩家編號：'..UI.PlayerIndex(index),
   font = 'small',
   align = 'left',
   x = U.SS.width * 0.01,
   y = U.SS.height * 0.12,
   width = 100,
   height = 100,
   r = 255,
   g = 255,
   b = 255,
   a = 0})
OK24 = U.T.Create()
OK24:Set({
   text = '需求經驗：0/10',
   font = 'small',
   align = 'left',
   x = U.SS.width * 0.01,
   y = U.SS.height * 0.15,
   width = 500,
   height = 100,
   r = 255,
   g = 255,
   b = 255,
   a = 0
})

CLKEY1 = U.B.Create()
CLKEY1:Set({
   x = U.SS.width / 3,
   y = U.SS.height / 3,
   width = 300,
   height = 220,
   r = 0,
   g = 0,
   b = 0,
   a = 100})
CLKEY1:Hide()
CLAKEY1 = U.B.Create()
CLAKEY1:Set({
   x = U.SS.width / 2.95,
   y = U.SS.height / 2.6,
   width = 290,
   height = 1,
   r = 255,
   g = 255,
   b = 255,
   a = 0})
SKEY3 = U.T.Create()
SKEY3:Set({
   text = '購買能力欄',
   font = 'small',
   align = 'left',
   x = U.SS.width / 2.9,
   y = U.SS.height / 3.2,
   width = 100,
   height = 100,
   r = 255,
   g = 0,
   b = 0,
   a = 0})
OK31 = U.T.Create()
OK31:Set({
   text = '[1鍵]:購買+100血量上限(1,000元)',
   font = 'small',
   align = 'left',
   x = U.SS.width / 2.9,
   y = U.SS.height / 2.7,
   width = 500,
   height = 100,
   r = 255,
   g = 255,
   b = 255,
   a = 0})
OK32 = U.T.Create()
OK32:Set({
   text = '[2鍵]:購買+100護甲上限(1,500元)',
   font = 'small',
   align = 'left',
   x = U.SS.width / 2.9,
   y = U.SS.height / 2.5,
   width = 500,
   height = 100,
   r = 255,
   g = 255,
   b = 255,
   a = 0})
OK33 = U.T.Create()
OK33:Set({
   text = '[3鍵]:強化手持主武能力+50%(30,000元)',
   font = 'small',
   align = 'left',
   x = U.SS.width / 2.9,
   y = U.SS.height / 2.325,
   width = 500,
   height = 100,
   r = 255,
   g = 255,
   b = 255,
   a = 0})
OK34 = U.T.Create()
OK34:Set({
   text = '[4鍵]:強化手持副武能力+50%(30,000元)',
   font = 'small',
   align = 'left',
   x = U.SS.width / 2.9,
   y = U.SS.height / 2.175,
   width = 500,
   height = 100,
   r = 255,
   g = 255,
   b = 255,
   a = 0})
offm = U.T.Create()
offm:Set({
   text = '[7鍵]:關閉購買能力欄',
   font = 'small',
   align = 'left',
   x = U.SS.width / 2.2,
   y = U.SS.height / 1.8,
   width = 500,
   height = 80,
   r = 255,
   g = 255,
   b = 255,
   a = 0
})

BDL = U.B.Create()
BDL:Set({
   x = U.SS.width * 0.0001,
   y = U.SS.height - 50,
   width = U.SS.width * 0.8,
   height = 120,
   r = 0,
   g = 0,
   b = 0,
   a = 255})
HPM = U.T.Create()
HPM:Set({
   text = 'HP',
   font = 'medium',
   align = 'left',
   x = U.SS.width * 0.01,
   y = U.SS.height * 0.935,
   width = 100,
   height = 80,
   r = 255,
   g = 0,
   b = 0,
   a = 255})
HPN = U.T.Create()
HPN:Set({
   text = '100/100(100.00%)',
   font = 'small',
   align = 'left',
   x = U.SS.width * 0.0475,
   y = U.SS.height * 0.940,
   width = 200,
   height = 80,
   r = 255,
   g = 255,
   b = 255,
   a = 255})
APM = U.T.Create()
APM:Set({
   text = 'AP',
   font = 'medium',
   align = 'left',
   x = U.SS.width * 0.225,
   y = U.SS.height * 0.935,
   width = 100,
   height = 80,
   r = 100,
   g = 100,
   b = 255,
   a = 255})
APN = U.T.Create()
APN:Set({
   text = '100/100(100.00%)',
   font = 'small',
   align = 'left',
   x = U.SS.width * 0.26,
   y = U.SS.height * 0.940,
   width = 200,
   height = 80,
   r = 255,
   g = 255,
   b = 255,
   a = 255})
HP1 = U.B.Create()
HP1:Set({
   x = U.SS.width * 0.048,
   y = U.SS.height - 40,
   width = 175,
   height = 35,
   r = 255,
   g = 0,
   b = 0,
   a = 255})
HP2 = U.B.Create()
HP2:Set({
   x = U.SS.width * 0.048,
   y = U.SS.height - 40,
   width = 175,
   height = 35,
   r = 255,
   g = 0,
   b = 0,
   a = 100})
AP1 = U.B.Create()
AP1:Set({
   x = U.SS.width * 0.26,
   y = U.SS.height - 40,
   width = 175,
   height = 35,
   r = 0,
   g = 0,
   b = 255,
   a = 255})
AP2 = U.B.Create()
AP2:Set({
   x = U.SS.width * 0.26,
   y = U.SS.height - 40,
   width = 175,
   height = 35,
   r = 0,
   g = 0,
   b = 255,
   a = 100
})

CSD = U.T.Create()
CSD:Set({
   text = '目前傷害量:0',
   font = 'small',
   align = 'center',
   x = U.SS.width * 0.45,
   y = U.SS.height * 0.940,
   width = 500,
   height = 80,
   r = 255,
   g = 255,
   b = 255,
   a = 255})
NOT = U.T.Create()
NOT:Set({
   text = '未達標',
   font = 'medium',
   align = 'left',
   x = U.SS.width / 2 - 80,
   y = U.SS.height / 2,
   width = 300,
   height = 100,
   r = 255,
   g = 0,
   b = 0,
   a = 0
})

MHP = U.SV.Create('MHP')
CHP = U.SV.Create('CHP')
HP = U.SV.Create('HP')
MAP = U.SV.Create('MAP')
CAP = U.SV.Create('CAP')
AP = U.SV.Create('AP')

SD = U.SV.Create('SD')
CCSD = U.SV.Create('CCSD')

CPEXP = U.SV.Create('CPEXP')
PLEVEL = U.SV.Create('PLEVEL')
PEXP = U.SV.Create('PEXP')

KNL = U.SV.Create('KNL')
POS = U.SV.Create('POS')

NOtip = U.SV.Create('NOtip')
NOHAP = U.SV.Create('NOHAP')
NOWPN = U.SV.Create('NOWPN')

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

function U.E:OnUpdate(time)
   if NOtip1 ~= 0 then
      NOtip1 = NOtip1 - 1
      NOT:Set({text = '金幣不足', a = NOtip1 })
   end
   if NOHAP1 ~= 0 then
      NOHAP1 = NOHAP1 - 1
      NOT:Set({text = '已達上限', a = NOHAP1 })
   end
   if NOWPN1 ~= 0 then
      NOWPN1 = NOWPN1 - 1
      NOT:Set({text = '未持武器', a = NOWPN1 })
   end
end

SWonoff = 1
SVPTU = 0
KEY3onoff = 0 
function U.E:OnKeyDown (inputs)
   if inputs[UI.KEY.B] == true and SWonoff == 1 and KEY3onoff == 0 then
      UI.Signal(10003)
      OK11:Set({r = 255, g = 255, b = 0})
   elseif inputs[UI.KEY.NUM5] == true and SWonoff == 1 and KEY3onoff == 0 then
       UI.Signal(10009)
       OK12:Set({r = 255, g = 255, b = 0})
   elseif inputs[UI.KEY.NUM6] == true and SWonoff == 1 and KEY3onoff == 0 then
      UI.Signal(10006)
      OK13:Set({r = 255, g = 255, b = 0})
      if SVPTU == 0 then
         SVPTU = 1
         OK13:Set({text = '[6鍵]:切換為第一人稱'})
      elseif SVPTU == 1 then
         SVPTU = 0
         OK13:Set({text = '[6鍵]:切換為第三人稱'})
      end
   elseif inputs[UI.KEY.NUM7] == true and SWonoff == 1 then
      if KEY3onoff == 0 then
         UI.Signal(10008)
         KEY3onoff = 1
         SKEY3:Set({a = 255})
         OK31:Set({a = 255})
         OK32:Set({a = 255})
         OK33:Set({a = 255})
         OK34:Set({a = 255})
         CLKEY1:Show()
         CLAKEY1:Set({a = 255})
         offm:Set({a = 255})
      elseif KEY3onoff == 1 then
         KEY3onoff = 0
         SKEY3:Set({a = 0})
         OK31:Set({a = 0})
         OK32:Set({a = 0})
         OK33:Set({a = 0})
         OK34:Set({a = 0})
         CLKEY1:Hide()
         CLAKEY1:Set({a = 0})
         offm:Set({a = 0})
      end
      OK14:Set({r = 255, g = 255, b = 0})
      offm:Set({r = 255, g = 255, b = 0})
   elseif KEY3onoff == 1 and inputs[UI.KEY.NUM1] == true then
      UI.Signal(10001)
      OK31:Set({r = 255, g = 255, b = 0})
   elseif KEY3onoff == 1 and inputs[UI.KEY.NUM2] == true then
       UI.Signal(10002)
       OK32:Set({r = 255, g = 255, b = 0})
   elseif KEY3onoff == 1 and inputs[UI.KEY.NUM3] == true then
      UI.Signal(10004)
      OK33:Set({r = 255, g = 255, b = 0})
   elseif KEY3onoff == 1 and inputs[UI.KEY.NUM4] == true then
       UI.Signal(10005)
       OK34:Set({r = 255, g = 255, b = 0})
   elseif inputs[UI.KEY.M] == true and KEY3onoff == 0 then
      SW:Set({r = 255, g = 255, b = 0})
      if SWonoff == 1 then
         SWonoff = 0
         SW:Set({text = '[M鍵]:切換為特殊鍵欄'})
         SKEY1:Set({a = 0})
         OK11:Set({a = 0})
         OK12:Set({a = 0})
         OK13:Set({a = 0})
         OK14:Set({a = 0})
         SKEY2:Set({a = 255})
         OK21:Set({a = 255})
         OK22:Set({a = 255})
         OK23:Set({a = 255})
         OK24:Set({a = 255})
      elseif SWonoff == 0 then
         SWonoff = 1
         SW:Set({text = '[M鍵]:切換為玩家資訊欄'})
         SKEY1:Set({a = 255})
         OK11:Set({a = 255})
         OK12:Set({a = 255})
         OK13:Set({a = 255})
         OK14:Set({a = 255})
         SKEY2:Set({a = 0})
         OK21:Set({a = 0})
         OK22:Set({a = 0})
         OK23:Set({a = 0})
         OK24:Set({a = 0})
      end
   else
      OK11:Set({r = 255, g = 255, b = 255})
      OK12:Set({r = 255, g = 255, b = 255})
      OK13:Set({r = 255, g = 255, b = 255})
      OK14:Set({r = 255, g = 255, b = 255})
      OK31:Set({r = 255, g = 255, b = 255})
      OK32:Set({r = 255, g = 255, b = 255})
      OK33:Set({r = 255, g = 255, b = 255})
      OK34:Set({r = 255, g = 255, b = 255})
      SW:Set({r = 255, g = 255, b = 255})
      offm:Set({r = 255, g = 255, b = 255})
   end
end

cDD = 0
function SD:OnSync()
   if cDD == 1 then
      CSD:Set({text = '目前傷害:'..FNT(string.format('%1.0f', self.value))})
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
      elseif self.value > 999999 then
         CSD:Set({r = 255, g = 0, b = 255})
      end
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
      OK24:Set({text = '需求經驗:'..FNT(string.format('%1.0f', self.value))..'/'..FNT(string.format('%1.0f', LVEXP))})
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

function KNL:OnSync()
   OK22:Set({text = '剩餘怪物：'..string.format('%1.0f', self.value)..'隻'})
end
function POS:OnSync()
   if self.value == 1 then
      UI.Signal(10007)
   end
end

NOtip1 = 0
NOHAP1 = 0
NOWPN1 = 0
function NOtip:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOtip1 = 255
   end
end
function NOHAP:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOHAP1 = 255
   end
end
function NOWPN:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOWPN1 = 255
   end
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