ITEM.name = "Inferno Relic"
ITEM.uniqueID = "kit_relic_universe"
ITEM.model = "models/kali/miscstuff/stalker/artifacts/flame.mdl"
ITEM.desc = "A soccerbal size translucent orb. Within, what appears to be a burning galaxy is visible, numerous black holes consuming parts of the galaxy over and over again during the blazing inferno. Pressing your ear up to it allows you to hear the deafening screams of trillions, being burnt alive or sucked into black holes as their entire galaxy is destroyed. Every twenty five minutes the torment seems to 'reset', and the galaxy beings to collapse again. Touching it causes immense fear."
ITEM.flag = "v"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Ethereal"
ITEM.color = Color(255, 255, 255)

ITEM.iconCam = {
	pos = Vector(62.765998840332, 52.66731262207, 38.208595275879),
	ang = Angle(25, 220, 0),
	fov = 4.2410854972104,
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
		dlight.g = 0
		dlight.b = 0
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
			item.player:getChar():getInv():add("story_kings")
		else
			item.player:notify("You don't have any room in your inventory!")
			return false 
		end
		return true
	end
}