screen = UI.ScreenSize()

SKEY = UI.Text.Create()
SKEY:Set({text = '特殊鍵區', font='small', align='left', x = screen.width * 0.01, y = screen.height * 0.01, width = 100, height = 100, r = 255, g = 0, b = 0})
SK1 = UI.Text.Create()
SK1:Set({text = "[1鍵]:返回上一個記錄點", font = "small", align = "left", x = screen.width * 0.01, y = screen.height * 0.06, width = 500, height = 80, r = 255, g = 255, b = 255})
SK2 = UI.Text.Create()
SK2:Set({text = "[2鍵]:返回重生點", font = "small", align = "left", x = screen.width * 0.01, y = screen.height * 0.09, width = 500, height = 80, r = 255, g = 255, b = 255})
SK3 = UI.Text.Create()
SK3:Set({text = "[3鍵] + [4鍵]:開/關UI介面", font = "small", align = "left", x = screen.width * 0.01, y = screen.height * 0.12, width = 500, height = 80, r = 255, g = 255, b = 255})
SK4 = UI.Text.Create()
SK4:Set({text = "[5鍵]:返回終點", font = "small", align = "left", x = screen.width * 0.01, y = screen.height * 0.15, width = 500, height = 80, r = 255, g = 255, b = 255, a = 0})
SMKEY = UI.Text.Create()
SMKEY:Set({text = '玩家資訊區', font='small', align='left', x = screen.width * 0.01, y = screen.height * 0.2, width = 100, height = 100, r = 255, g = 0, b = 0})
LN = UI.Text.Create()
LN:Set({text = '目前位置：重生點', font='small', align='left', x = screen.width * 0.01, y = screen.height * 0.25, width = 500, height = 80, r = 255, g = 255, b = 255})
DC = UI.Text.Create()
DC:Set({text = '關卡難度：簡單', font='small', align='left', x = screen.width * 0.01, y = screen.height * 0.28, width = 500, height = 80, r = 255, g = 255, b = 255})
PS = UI.Text.Create()
PS:Set({text = '目前分數：0分', font='small', align='left', x = screen.width * 0.01, y = screen.height * 0.31, width = 500, height = 80, r = 255, g = 255, b = 255})
LE = UI.Text.Create()
LE:Set({text = '自身跑酷階級：萌新', font='small', align='left', x = screen.width * 0.01, y = screen.height * 0.34, width = 500, height = 80, r = 255, g = 255, b = 255})
SEtip = UI.Text.Create()
SEtip:Set({text = "記錄已儲存", font = "medium", align = "left", x = screen.width / 2.3, y = screen.height / 2, width = 500, height = 100, r = 255, g = 255, b = 0, a = 0})
ENDtip = UI.Text.Create()
ENDtip:Set({text = "恭喜", font = "medium", align = "center", x = screen.width * 0.3, y = screen.height / 2.5, width = 500, height = 100, r = 255, g = 0, b = 0, a = 0})
HPM = UI.Text.Create()
HPM:Set({text = 'HP', font='medium', align='left', x = screen.width * 0.01, y = screen.height * 0.945, width = 500, height = 80, r = 255, g = 0, b = 0})
HPN = UI.Text.Create()
HPN:Set({text = '100/100(100%)', font='small', align='left', x = screen.width * 0.05, y = screen.height * 0.945, width = 500, height = 80, r = 255, g = 255, b = 255})
APM = UI.Text.Create()
APM:Set({text = 'AP', font='medium', align='left', x = screen.width * 0.17, y = screen.height * 0.945, width = 500, height = 80, r = 100, g = 100, b = 255})
APN = UI.Text.Create()
APN:Set({text = '100/100(100%)', font='small', align='left', x = screen.width * 0.215, y = screen.height * 0.945, width = 500, height = 80, r = 255, g = 255, b = 255})
LKEY1 = UI.Box.Create ()
LKEY1:Set({x = screen.width * 0.005, y = screen.height * 0.025, width = 250, height = 155, r = 0, g = 0, b = 0, a = 100})
LAKEY1 = UI.Box.Create ()
LAKEY1:Set({x = screen.width * 0.01, y = screen.height * 0.07, width = 240, height = 1, r = 255, g = 255, b = 255})
LKEY2 = UI.Box.Create ()
LKEY2:Set({x = screen.width * 0.005, y = screen.height * 0.22, width = 250, height = 150, r = 0, g = 0, b = 0, a = 100})
LAKEY2 = UI.Box.Create ()
LAKEY2:Set({x = screen.width * 0.01, y = screen.height * 0.265, width = 240, height = 1, r = 255, g = 255, b = 255})
BDL = UI.Box.Create ()
BDL:Set({x = screen.width * 0.0001, y = screen.height - 50, width = 950, height = 120, r = 0, g = 0, b = 0})
HP1 = UI.Box.Create ()
HP1:Set({x = screen.width * 0.048, y = screen.height - 40, width = 50,height = 35, r = 255, g = 0, b = 0})
HP2 = UI.Box.Create ()
HP2:Set({x = screen.width * 0.048, y = screen.height - 40, width = 50,height = 35, r = 255, g = 0, b = 0, a = 100})
AP1 = UI.Box.Create ()
AP1:Set({x = screen.width * 0.21, y = screen.height - 40, width = 50, height = 35, r = 0, g = 0, b = 255})
AP2 = UI.Box.Create ()
AP2:Set({x = screen.width * 0.21, y = screen.height - 40, width = 50, height = 35, r = 0, g = 0, b = 255, a = 100})

MHP = UI.SyncValue.Create("MHP")
CHP = UI.SyncValue.Create("CHP")
HP = UI.SyncValue.Create("HP")
MAP = UI.SyncValue.Create("MAP")
CAP = UI.SyncValue.Create("CAP")
AP = UI.SyncValue.Create("AP")
CDE = UI.SyncValue.Create("CDE")
PSC = UI.SyncValue.Create("PSC")
CPSC = UI.SyncValue.Create("CPSC")
ENDBN = UI.SyncValue.Create("ENDBN")
SAVEtip = UI.SyncValue.Create("SAVEtip")
DJ = UI.SyncValue.Create("DJ")

UIonoff = 1
SE = 0
END = 0
ENDname = ''
ENDPOS = 0
MJ = 0

function UI.Event:OnSignal(signal)
   if signal == 1 then
      LN:Set({text = '目前位置：重生點'})
      DC:Set({text = '關卡難度：簡單'})
   elseif signal == 2 then
      LN:Set({text = '目前位置：第1-1關'})
      DC:Set({text = '關卡難度：初級'})
   elseif signal == 3 then
      LN:Set({text = '目前位置：第1-2關'})
      DC:Set({text = '關卡難度：中級'})
   elseif signal == 4 then
      LN:Set({text = '目前位置：第1-3關'})
      DC:Set({text = '關卡難度：高級'})
   elseif signal == 5 then
      LN:Set({text = '目前位置：第1-4關'})
      DC:Set({text = '關卡難度：中級'})
   elseif signal == 6 then
      LN:Set({text = '目前位置：第1-E關'})
      DC:Set({text = '關卡難度：簡單'})
   elseif signal == 7 then
      LN:Set({text = '目前位置：第2-1關'})
      DC:Set({text = '關卡難度：高級'})
   elseif signal == 8 then
      LN:Set({text = '目前位置：第2-2關'})
      DC:Set({text = '關卡難度：困難'})
   elseif signal == 9 then
      LN:Set({text = '目前位置：第2-3關'})
      DC:Set({text = '關卡難度：困難'})
   elseif signal == 10 then
      LN:Set({text = '目前位置：第2-4關'})
      DC:Set({text = '關卡難度：困難'})
   elseif signal == 11 then
      LN:Set({text = '目前位置：第2-E關'})
      DC:Set({text = '關卡難度：簡單'})
   elseif signal == 12 then
      LN:Set({text = '目前位置：第3-1關'})
      DC:Set({text = '關卡難度：困難'})
   elseif signal == 13 then
      LN:Set({text = '目前位置：第3-2關'})
      DC:Set({text = '關卡難度：超難'})
   elseif signal == 14 then
      LN:Set({text = '目前位置：第3-3關'})
      DC:Set({text = '關卡難度：困難'})
   elseif signal == 15 then
      LN:Set({text = '目前位置：第3-E關'})
      DC:Set({text = '關卡難度：簡單'})
   elseif signal == 16 then
      LN:Set({text = '目前位置：第4-1關'})
      DC:Set({text = '關卡難度：超難'})
   elseif signal == 17 then
      LN:Set({text = '目前位置：第4-2關'})
      DC:Set({text = '關卡難度：超難'})
   elseif signal == 18 then
      LN:Set({text = '目前位置：第4-3關'})
      DC:Set({text = '關卡難度：極難'})
   elseif signal == 19 then
      LN:Set({text = '目前位置：第4-E關'})
      DC:Set({text = '關卡難度：簡單'})
   elseif signal == 20 then
      LN:Set({text = '目前位置：第5-1關'})
      DC:Set({text = '關卡難度：極難'})
   elseif signal == 21 then
      LN:Set({text = '目前位置：第5-2關'})
      DC:Set({text = '關卡難度：極難'})
   elseif signal == 22 then
      LN:Set({text = '目前位置：第5-3關'})
      DC:Set({text = '關卡難度：極難'})
   elseif signal == 23 then
      LN:Set({text = '目前位置：第5-E關'})
      DC:Set({text = '關卡難度：簡單'})
   elseif signal == 24 then
      LN:Set({text = '目前位置：第S1-S關'})
      DC:Set({text = '關卡難度：天界'})
   elseif signal == 25 then
      LN:Set({text = '目前位置：第S1-E關'})
      DC:Set({text = '關卡難度：簡單'})
   elseif signal == 26 then
      LN:Set({text = '目前位置：第S2-S關'})
      DC:Set({text = '關卡難度：天界'})
   elseif signal == 27 then
      LN:Set({text = '目前位置：第S2-E關'})
      DC:Set({text = '關卡難度：簡單'})
   elseif signal == 28 then
      LN:Set({text = '目前位置：第S3-S關'})
      DC:Set({text = '關卡難度：天界'})
   elseif signal == 29 then
      LN:Set({text = '目前位置：第S3-E關'})
      DC:Set({text = '關卡難度：簡單'})
   elseif signal == 30 then
      LN:Set({text = '目前位置：第S4-S關'})
      DC:Set({text = '關卡難度：天界'})
   elseif signal == 31 then
      LN:Set({text = '目前位置：第S4-E關'})
      DC:Set({text = '關卡難度：簡單'})
   elseif signal == 32 then
      LN:Set({text = '目前位置：第S5-S關'})
      DC:Set({text = '關卡難度：天界'})
   elseif signal == 33 then
      LN:Set({text = '目前位置：終點'})
      DC:Set({text = '關卡難度：簡單'})
      SK4:Set({a = 255})
      ENDPOS = 1
   end
end

function UI.Event:OnKeyDown (inputs)
   if inputs[UI.KEY.NUM1] == true then
      UI.Signal(10001)
      SK1:Set({r = 255, g = 255, b = 0})
   elseif inputs[UI.KEY.NUM2] == true then
      UI.Signal(10002)
      SK2:Set({r = 255, g = 255, b = 0})
   elseif inputs[UI.KEY.NUM3] == true and inputs[UI.KEY.NUM4] == true then
      SK3:Set({r = 255, g = 255, b = 0})
      if UIonoff == 1 then
         UIonoff = 0
         SKEY:Hide()
         SMKEY:Hide()
         SK1:Hide()
         SK2:Hide()
         SK3:Hide()
         SK4:Hide()
         LN:Hide()
         DC:Hide()
         PS:Hide()
         LE:Hide()
         HPM:Hide()
         HPN:Hide()
         APM:Hide()
         APN:Hide()
         LKEY1:Hide()
         LKEY2:Hide()
         LAKEY1:Hide()
         LAKEY2:Hide()
         BDL:Hide()
         HP1:Hide()
         HP2:Hide()
         AP1:Hide()
         AP2:Hide()
      elseif UIonoff == 0 then
         UIonoff = 1
         SKEY:Show()
         SMKEY:Show()
         SK1:Show()
         SK2:Show()
         SK3:Show()
         SK4:Show()
         LN:Show()
         DC:Show()
         PS:Show()
         LE:Show()
         HPM:Show()
         HPN:Show()
         APM:Show()
         APN:Show()
         LKEY1:Show()
         LKEY2:Show()
         LAKEY1:Show()
         LAKEY2:Show()
         BDL:Show()
         HP1:Show()
         HP2:Show()
         AP1:Show()
         AP2:Show()
      end
   elseif inputs[UI.KEY.NUM5] == true and ENDPOS == 1 then
      UI.Signal(10003)
      SK4:Set({r = 255, g = 255, b = 0})
   elseif inputs[UI.KEY.SPACE] == true and MJ == 1 then
      UI.Signal(10004)
   else
      SK1:Set({r = 255, g = 255, b = 255})
      SK2:Set({r = 255, g = 255, b = 255})
      SK3:Set({r = 255, g = 255, b = 255})
      SK4:Set({r = 255, g = 255, b = 255})
   end
end

function DJ:OnSync()
   if self.value == UI.PlayerIndex(index) then
      if MJ == 0 then
         MJ = 1
      else
         MJ = 0
      end
   end
end

function SAVEtip:OnSync()
   if self.value == UI.PlayerIndex(index) then
      SE = 255
   end
end

function ENDBN:OnSync()
   END = 255
   ENDname = self.value
end

function UI.Event:OnUpdate(time)
   if SE ~= 0 then
      SE = SE - 1
      SEtip:Set({ a = SE })
   end
   if END ~= 0 then
      END = END - 1
      ENDtip:Set({text = '恭喜'..ENDname..'到達終點', a = END })
   end
end

cPSC = 0

function PSC:OnSync()
   cPSC = self.value
end

function CPSC:OnSync()
   if self.value == UI.PlayerIndex(index) then
      if cPSC == 32 then
         PS:Set({text = '目前分數：32分(MAX)'})
      else
         PS:Set({text = '目前分數：'..string.format("%1.0f", cPSC)..'分'})
      end
      if cPSC > 0 and cPSC <= 2 then
         LE:Set({text = '自身跑酷階級：菜鳥'})
      elseif cPSC > 2 and cPSC <= 4 then
         LE:Set({text = '自身跑酷階級：新手'})
      elseif cPSC > 4 and cPSC <= 7 then
         LE:Set({text = '自身跑酷階級：好手'})
      elseif cPSC > 7 and cPSC <= 11 then
         LE:Set({text = '自身跑酷階級：老手'})
      elseif cPSC > 11 and cPSC <= 16 then
         LE:Set({text = '自身跑酷階級：高手'})
      elseif cPSC > 16 and cPSC <= 21 then
         LE:Set({text = '自身跑酷階級：大師'})
      elseif cPSC > 21 and cPSC <= 31 then
         LE:Set({text = '自身跑酷階級：神人'})
      elseif cPSC == 32 then
         LE:Set({text = '自身跑酷階級：大神'})
         SK4:Set({a = 255})
         ENDPOS = 1
      end
   end
end

cHP = 0
cAP = 0
mHP = 0
mAP = 0
Hc = 0
Ac = 0

function HP:OnSync()
   if cHP == 1 then
      a = self.value / mHP
      b = a * 125
      c = self.value
      d = a * 100
      if c <= 0 then
         c = 0
         b = 0
      end
      HPN:Set({text = string.format("%1.0f", c)..'/'..string.format("%1.0f", mHP)..'('..string.format("%1.0f", d)..'%)'})
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
      b = a * 125
      c = self.value
      d = a * 100
      if c <= 0 then
         c = 0
         b = 0
      end
      APN:Set({text = string.format("%1.0f", c)..'/'..string.format("%1.0f", mAP)..'('..string.format("%1.0f", d)..'%)'})
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