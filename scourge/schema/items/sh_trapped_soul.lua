ITEM.name = "Trapped Soul"
ITEM.uniqueID = "kit_trapped_soul"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.desc = "A strange jar. You hear screams eminating from within, and a small whisp of light darts from side to side."
ITEM.flag = "v"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Ethereal"
ITEM.color = Color(255, 255, 255)


ITEM.iconCam = {
	pos = Vector(111.33569335938, 93.437652587891, 67.823196411133),
	ang = Angle(25, 220, 0),
	fov = 4.4276943864351,
}

if (CLIENT) then
	function ITEM:drawEntity(entity, item)
		entity:DrawModel()
		entity:DrawShadow(false)
		
		local pos = entity:GetPos()
		local dlight = DynamicLight(entity:EntIndex())
		local perc = ( ( 9000000 - CurTime() )/ 9000000 )
		dlight.Pos = pos
		dlight.r = 255
		dlight.g = 255
		dlight.b = 255
		dlight.Brightness = 10
		dlight.Size = 32
		dlight.Decay = 128
		dlight.style = 5
		dlight.DieTime = CurTime() + .1	
	end
end

ITEM.functions.Release = {
	name = "Release the soul",
	tip = "Set them free.",
	icon = "icon16/ruby.png",
	sound = "ambient/levels/labs/teleport_winddown1.wav",
	onRun = function(item)
		if (item.player:getChar():getInv():findEmptySlot(1, 1) != nil) then
			item.player:getChar():getInv():add("food_heart")
		else
			item.player:notify("You don't have any room in your inventory!")
			return false 
		end
		return true
	end
}