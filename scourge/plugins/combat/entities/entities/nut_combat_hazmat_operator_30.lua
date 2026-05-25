ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Soldier (30)"
ENT.Category = "NutScript - Combat (Military)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/severance/ceda/ceda_operator1.mdl"

--all attributes
ENT.agil = 30
ENT.stre = 30
ENT.accu = 30
ENT.craf = 30
ENT.endu = 30
ENT.luck = 30
ENT.perc = 30
ENT.fort = 30

function ENT:Initialize()
	self:basicSetup()
end