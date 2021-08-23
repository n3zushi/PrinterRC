AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
util.AddNetworkString("munition")

local interval = 1 


function ENT:Initialize()

  -- self.sound = CreateSound(self, Sound("ambient/tones/industrial2_loop.wav"))
  -- self.sound:SetSoundLevel(60)
  -- self.sound:PlayEx(1, 100)


   self:SetModel("models/Items/ammocrate_smg1.mdl")    
    self:SetAutomaticFrameAdvance(false)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetSolid(MOVETYPE_VPHYSICS)
    self:SetUseType(SOLID_VPHYSICS)

   local phys = self:GetPhysicsObject()
   if phys:IsValid() then
      phys:Wake()
      phys:EnableGravity(true)
   end

   self.timer = CurTime()

end

AddCSLuaFile("imgui.lua")
include("shared.lua")

local imgui = include("imgui.lua")

net.Receive("lediscord", function( len, ply )


chat.AddText(Color(43, 161, 96), "Lien du discord ")


end) 


net.Receive("munition", function( len, ply )
     
local arme = ply:GetActiveWeapon()    
   ply:GiveAmmo(200, game.GetAmmoName(arme:GetPrimaryAmmoType()), true)

--local arme = ply:GetActiveWeapon()

--print ( game.GetAmmoName(arme:GetPrimaryAmmoType()) )


end) 


function ENT:OnRemove()
   if self.sound then
      self.sound:Stop()
   end
   if self.soundfan then
      self.soundfan:Stop()
   end
end
