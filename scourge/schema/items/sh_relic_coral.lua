ITEM.name = "Crystalline Coral Relic"
ITEM.uniqueID = "kit_relic_coral"
ITEM.model = "models/kali/miscstuff/stalker/artifacts/bubble.mdl"
ITEM.desc = "A strange object that has a lumpy, crystalline appearance. It reminds you of coral, though you're not sure where you've seen it. Touching it feels as if you're placing your hands atop wet, soggy glass- not something you could easily place. Certain spots are incredibly warm, while others incredibly cold, though these spots seem to shift regularly. A bright green glow emits from the entire thing, and it seems to ward hostile creatures away. A strange sense of peace is always present in your mind when you touch it."
ITEM.flag = "v"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Ethereal"
ITEM.color = Color(255, 255, 255)


ITEM.iconCam = {
	pos = Vector(82.894172668457, 70.436653137207, 50.302917480469),
	ang = Angle(25, 220, 0),
	fov = 4.52,
}

if (CLIENT) then
	function ITEM:drawEntity(entity, item)
		entity:DrawModel()
		entity:DrawShadow(false)
		
		local pos = entity:GetPos()
		local dlight = DynamicLight(entity:EntIndex())
		local perc = ( ( 9000000 - CurTime() )/ 9000000 )
		dlight.Pos = pos
		dlight.r = 102
		dlight.g = 255
		dlight.b = 51
		dlight.Brightness = 5
		dlight.Size = 32
		dlight.Decay = 128
		dlight.style = 5
		dlight.DieTime = CurTime() + .1	
	end
end

ITEM.functions.Fuel = {
	name = "Fuel your future",
	tip = "You sure this is a good idea?",
	icon = "icon16/ruby.png",
	sound = "ambient/explosions/exp3.wav",
	onRun = function(item)
		if (item.player:getChar():getInv():findEmptySlot(1, 1) != nil) then
			item.player:getChar():getInv():add("story_presidents")
		else
			item.player:notify("You don't have any room in your inventory!")
			return false 
		end
		return true
	end
}