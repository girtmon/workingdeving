ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Hazmat (5)"
ENT.Category = "NutScript - Combat (Military)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/bloocobalt/splinter cell/chemsuit_cod2.mdl"

--all attributes
ENT.agil = 5
ENT.stre = 5
ENT.accu = 5
ENT.craf = 5
ENT.endu = 5
ENT.luck = 5
ENT.perc = 5
ENT.fort = 5

function ENT:Initialize()
	self:basicSetup()
end