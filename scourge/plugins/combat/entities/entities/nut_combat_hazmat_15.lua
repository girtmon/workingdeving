ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Hazmat (15)"
ENT.Category = "NutScript - Combat (Military)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/bloocobalt/splinter cell/chemsuit_cod2.mdl"

--all attributes
ENT.agil = 15
ENT.stre = 15
ENT.accu = 15
ENT.craf = 15
ENT.endu = 15
ENT.luck = 15
ENT.perc = 15
ENT.fort = 15

function ENT:Initialize()
	self:basicSetup()
end