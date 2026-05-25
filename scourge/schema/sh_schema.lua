SCHEMA.name = "Sample"
SCHEMA.introName = "Scourge Roleplay"
SCHEMA.desc = "People literally can't see this. FUCK you."
SCHEMA.author = "Freelok"
SCHEMA.uniqueID = "jahsasfdbnm," -- Schema will be a unique identifier stored in the database.

nut.currency.set("", "Dollar", "Dollars")

nut.util.include("cl_effects.lua")
nut.util.include("sh_commands.lua")
--nut.util.include("sv_resource.lua")
--nut.util.include("sh_dev.lua") -- Developer Functions

nut.util.includeDir("libs")
nut.util.includeDir("meta")
nut.util.includeDir("hooks")
nut.util.includeDir("derma")

nut.flag.add("F", "Access to food/drink items.")
nut.flag.add("A", "Access to augmentation purchases.")
nut.flag.add("G", "Access to general items.")
nut.flag.add("Z", "Access to special/classified items.")
nut.flag.add("r", "Access to armor items.")
nut.flag.add("L", "Access to illumination items.")

nut.flag.add("1", "Access to melee/makeshift weaponry.")
nut.flag.add("2", "Access to small weaponry.")
nut.flag.add("3", "Access to large weaponry.")
nut.flag.add("4", "Access to special weaponry.")
nut.flag.add("D", "Access to illegal drugs.")
nut.flag.add("N", "Access to netrunning and rigging items.")

nut.flag.add("h", "Access to Handguns.")
nut.flag.add("S", "Access to SMG's.")
nut.flag.add("a", "Access to Assault Rifles.")
nut.flag.add("q", "Access to Shotguns.")
nut.flag.add("H", "Access to Heavy Weaponry.")
nut.flag.add("m", "Access to Melee Weaponry.")
nut.flag.add("s", "Access to Sniper Rifles.")



nut.flag.add("j", "Access to the junk items.")
nut.flag.add("v", "Access to the general items.")
nut.flag.add("V", "Access to the more rare items.")
nut.flag.add("M", "Access to Medical Ttems.")
nut.flag.add("E", "Effects.")
nut.flag.add("C", "Access to Cybonic items.")
nut.flag.add("u", "Ban from OOC.")


--this is dumb, dont do this in the future.
for i = 1,100 do 
	if(i < 10) then
		nut.anim.setModelClass("models/tnb/citizens/female_0"..i..".mdl", "player")
		nut.anim.setModelClass("models/tnb/citizens/male_0"..i..".mdl", "player")
	end
	nut.anim.setModelClass("models/tnb/citizens/female_"..i..".mdl", "player")
	nut.anim.setModelClass("models/tnb/citizens/male_"..i..".mdl", "player")
end


--This is used for some entities to print stuff in the chat to people.
nut.chat.register("mind", {
	onChatAdd = function(speaker, text)
		local color = nut.chat.classes.ic.onGetColor(speaker, text)
		chat.AddText(Color(115, 115, 115), "**\""..text.."\"")
	end,
	onCanHear = 1, --range is set incredibly low so that only the client can see it.
	prefix = {"/mind"},
	font = "nutChatFontItalics",
	filter = "actions",
	deadCanChat = true
})

--Unforunately, I have to put some cassette plugin stuff here
SCHEMA.t_cassette = {}
function SCHEMA.t_cassette.Register(name, playlist)
	for key, tbl in pairs(playlist) do
		tbl.key = key
	end
	local tbl = {name = name, playlist = playlist}
	tbl.key = table.insert(SCHEMA.t_cassette, tbl)
	return tbl.key
end