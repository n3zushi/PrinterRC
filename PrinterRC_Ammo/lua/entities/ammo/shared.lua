ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.Author = "Nezushi"

ENT.PrintName = "Ammo"
ENT.Category = "Moon-Community"
ENT.Spawnable = true

function ENT:SetupDataTables()

    self:NetworkVar("Int" , 1 , "RCells")
    self:NetworkVar( "Int", 1, "MoneyAmount" )
    self:DTVar("Entity",1,"nezushi_ent")

end