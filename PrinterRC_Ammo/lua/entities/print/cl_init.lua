include("shared.lua")

AddCSLuaFile("imgui.lua")

local imgui = include("imgui.lua")

local actualisation = 1
include("shared.lua")

function ENT:Draw()
	local tr = LocalPlayer():GetEyeTrace()

self:DrawModel()

a = LocalPlayer():GetEyeTrace()

if a.Entity == self then
if imgui.Entity3D2D(self, Vector(85, 40, 70), Angle(0, -270, 86), 0.2) then

	local valeurRC = self:GetMoneyAmount()

	surface.SetDrawColor(36, 36, 36, 250)

    surface.DrawRect(-30, -100, 250, 300)

    draw.DrawText("[ Implanteur RC ]",imgui.xFont("RCFont"), 30, -95, Color( 255, 255, 255, 255 ), -10, -9)

    draw.RoundedBox(2500, -20, -70, 230, 5, Color(255, 255, 255, 255)) -- barre blanche

    draw.RoundedBox(2500, -25, -45, 200, 35, Color(109, 109, 109, 95))

    draw.DrawText("Rc disponible :",imgui.xFont("RCFont"), -15, -37, Color( 255, 255, 255, 255 ), -10, -9)

     draw.DrawText("Par NezuShi et Lombrès",imgui.xFont("!RCFont@15"), -25, 183, HSVToColor( CurTime() % 6 * 60, 1, 1 ), -10, -9)

    draw.SimpleText(valeurRC.." RC", imgui.xFont("RCFont"), 110, -37)

    if imgui.xTextButton("Prendre les rc", "!RCFont@15", 100, 150, 100, 25, 2 , Color(255,255,255), Color(182,182,182), Color(13, 255, 0)) then

      net.Start("DatapadHud")

      net.SendToServer()

      surface.PlaySound("buttons/button4.wav")

    end

     if imgui.xTextButton("Lien du discord ", "!RCFont@10", 160, 180, 60, 20, 2 , Color(255, 255, 255), Color(182,182,182), Color(13, 255, 0)) then

      chat.AddText(HSVToColor( CurTime() % 6 * 60, 1, 1 ), "Lien du discord ")
      
      surface.PlaySound("buttons/button4.wav")

      end


    imgui.End3D2D()

  end
end

end


function ENT:Think()
  
  local valeurRC = self:GetMoneyAmount()
  
  self:NextThink( CurTime() + actualisation ) -- Tu peux definir l'actualisation du panneau en haut 

  return true
  
end


