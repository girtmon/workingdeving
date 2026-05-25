ENT.Type = "anim"
ENT.PrintName = "Cassette"
ENT.Category = "NutScript"
ENT.Author = "Thermadyle"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.IsCassette = true
	
AccessorFunc(ENT, "key", "Key")
	
function ENT:GetData()
	local key = self:GetKey()
	return SCHEMA.t_cassette[key]
end

if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/props_phx2/garbage_metalcan001a.mdl")
		self:SetSolid(SOLID_VPHYSICS)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:PhysWake()
	end
else
	function ENT:Draw()
		self:DrawModel()
	end
end