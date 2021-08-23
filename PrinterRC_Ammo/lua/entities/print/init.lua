AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
util.AddNetworkString("DatapadHud")

local interval = 350


function ENT:Initialize()

  -- self.sound = CreateSound(self, Sound("ambient/tones/industrial2_loop.wav"))
  -- self.sound:SetSoundLevel(60)
 --  self.sound:PlayEx(1, 100)


   self:SetModel("models/generator-wall/generator-wall.mdl")    
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

local actualisation = 1 --ici 




function ENT:Think()
   
    if CurTime() > self.timer + interval then 
        rc = self:GetMoneyAmount()
        
        self.timer = CurTime()

        self:SetMoneyAmount(self:GetMoneyAmount() + 2)

        self:EmitSound("ambient/tones/industrial2_loop.wav",75,10,1, CHAN_AUTO)

    end
  
  -- Bon désolé je l'ai fait a l'arrache mais cela fonctionne enfin j'espère ;'c
  if (RemoveMoney) then
    
    self:SetMoneyAmount(0)
    
    RemoveMoney = false
    
  end

end


net.Receive("DatapadHud", function( len, ply )
    
    
    ply:SetNetworkedInt("RCells", ply:GetNetworkedInt("RCells", 0) + rc)
    
    RemoveMoney = true 


end) 


function ENT:OnRemove()
   if self.sound then
      self.sound:Stop()
   end
   if self.soundfan then
      self.soundfan:Stop()
   end
end
