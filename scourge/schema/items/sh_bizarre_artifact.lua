ITEM.name = "Bizzare Artifact"
ITEM.uniqueID = "kit_bizarre_artifact"
ITEM.model = "models/gibs/shield_scanner_gib2.mdl"
ITEM.material = "models/player/player_chrome1"
ITEM.desc = "A strange circular object with a rather rough texture to it. The exterior boasts a strange black, white, and gray stone mixture that emits a soft gray hue. It appears to be a chunk of something larger- an artifact of sorts. It's rather heavy, clocking in at around seventy or so pounds. It's origin is unknown, but you get a sense that it's rather old though not all that important."
ITEM.flag = "v"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Ethereal"
ITEM.color = Color(128, 128, 128)

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 4.1176470588235,
}

if (CLIENT) then
	function ITEM:drawEntity(entity, item)
		entity:DrawModel()
		entity:DrawShadow(false)
		
		local pos = entity:GetPos()
		local dlight = DynamicLight(entity:EntIndex())
		local perc = ( ( 9000000 - CurTime() )/ 9000000 )
		dlight.Pos = pos
		dlight.r = 128
		dlight.g = 128
		dlight.b = 128
		dlight.Brightness = 5
		dlight.Size = 32
		dlight.Decay = 128
		dlight.style = 5
		dlight.DieTime = CurTime() + .1	
	end
end

