
AddCSLuaFile("imgui.lua")

local imgui = include("imgui.lua")

local actualisation = 1
include("shared.lua")

surface.CreateFont( "RCFont", {
	font = "Arial",
	size = 20,
	weight = 500,
	antialias = true,
	shadow = true,
} )

function ENT:Draw()
	local tr = LocalPlayer():GetEyeTrace()

self:DrawModel()

a = LocalPlayer():GetEyeTrace()

if a.Entity == self then

if imgui.Entity3D2D(self, Vector(0, 40, 18), Angle(0, -270, 0), 0.2) then

	surface.SetDrawColor(36, 36, 36, 250)

    surface.DrawRect(-325, -70, 250, 150)

    draw.DrawText("[ Distributeur de munition ]",imgui.xFont("!RCFont@23"), -315, -65, Color( 255, 255, 255, 255 ), -10, -9)

    draw.RoundedBox(2500, -315, -35, 230, 5, Color(255, 255, 255, 255)) -- barre blanche

     draw.DrawText("Par NezuShi",imgui.xFont("!RCFont@15"), -315, 60, HSVToColor( CurTime() % 6 * 60, 1, 1 ), -10, -9)

    if imgui.xTextButton("Prendre les munitions", "!RCFont@15", -265, 0, 140, 25, 3 , Color(255,255,255), Color(182,182,182), Color(13, 255, 0)) then

      net.Start("munition")
      net.SendToServer()
      surface.PlaySound("items/ammo_pickup.wav")

    end

     if imgui.xTextButton("Lien du discord ", "!RCFont@10", -140, 55, 60, 20, 2 , Color(255, 255, 255), Color(182,182,182), Color(13, 255, 0)) then

      chat.AddText(HSVToColor( CurTime() % 6 * 60, 1, 1 ), "Lien du discord ")
      
      surface.PlaySound("buttons/button4.wav")

      end


    imgui.End3D2D()

  end
end

end


net.Receive("munition", function( len, ply)

end)

