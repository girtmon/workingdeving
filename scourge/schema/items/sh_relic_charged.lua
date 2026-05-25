ITEM.name = "Extremely Charged Relic"
ITEM.uniqueID = "kit_relic_charged"
ITEM.model = "models/kali/miscstuff/stalker/artifacts/battery.mdl"
ITEM.desc = "Before you lay a small contraption made of Obsidian. Small, blue voltaic lightning bolts are trapped within, contained by smaller 'pillars' across it's sides. Looking at it gives you a sense of genuine unease, terror so to speak. One can feel that it's presence is a sort of cosmic disturbance in it of itself, making a sort of rift glow near it. Blue eminates from within and touching it makes you feel immense power coarsing through your body."
ITEM.flag = "v"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Ethereal"
ITEM.color = Color(255, 255, 255)

ITEM.iconCam = {
	pos = Vector(84.967323303223, 69.894996643066, 51.053001403809),
	ang = Angle(25, 220, 0),
	fov = 4.328,
}

if (CLIENT) then
	function ITEM:drawEntity(entity, item)
		entity:DrawModel()
		entity:DrawShadow(false)
		
		local pos = entity:GetPos()
		local dlight = DynamicLight(entity:EntIndex())
		local perc = ( ( 9000000 - CurTime() )/ 9000000 )
		dlight.Pos = pos
		dlight.r = 30
		dlight.g = 144
		dlight.b = 255
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
			item.player:getChar():getInv():add("story_dukes")
		else
			item.player:notify("You don't have any room in your inventory!")
			return false 
		end
		return true
	end
}