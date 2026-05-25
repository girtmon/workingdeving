ITEM.name = "Oxycodone"
ITEM.uniqueID = "drug_oxycodone"
ITEM.model = "models/warz/consumables/painkillers.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.desc = "A blue pill bottle full of oxycodone."
ITEM.duration = 100
ITEM.price = 80
ITEM.flag = "M"

ITEM.attribBoosts = {
	["stm"] = -10,
}

ITEM.iconCam = {
	pos = Vector(52.153984069824, 43.705753326416, 31.125635147095),
	ang = Angle(25, 220, 0),
	fov = 3.2,
}

ITEM:hook("_use", function(item)
	item.player:EmitSound("npc/barnacle/barnacle_gulp1.wav")
	item.player:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end)
