ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Hazmat (10)"
ENT.Category = "NutScript - Combat (Military)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/bloocobalt/splinter cell/chemsuit_cod2.mdl"

--all attributes
ENT.agil = 10
ENT.stre = 10
ENT.accu = 10
ENT.craf = 10
ENT.endu = 10
ENT.luck = 10
ENT.perc = 10
ENT.fort = 10

function ENT:Initialize()
	self:basicSetup()
end