ITEM.name = "Modern Flashlight"
ITEM.model = "models/pg_props/pg_obj/pg_flashlight.mdl"
ITEM.desc = "A regular flashlight with batteries included."
ITEM.uniqueID = "l_flashlight"
ITEM.price = 0
ITEM.category = "Illumination"
ITEM.flag = "v"
ITEM.width = 2
ITEM.height = 1


ITEM.width = 2
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(0, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 4.1176470588235,
}

ITEM:hook("drop", function(item)
	if (item.player:FlashlightIsOn()) then
		item.player:Flashlight(false)
	end
end)

function ITEM:onTransfered()
	local client = self:getOwner()

	if (IsValid(client) and client:FlashlightIsOn()) then
		client:Flashlight(false)
	end
end