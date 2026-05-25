--[[
	© 2013 Slidefuse.net
	© 2015 Novabox.org
--]]

ITEM.name = "Cassette Player"
ITEM.uniqueID = "cassette_player"
ITEM.price = 50
ITEM.model = "models/props_lab/citizenradio.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.flag = "V"
ITEM.category = "Music"
ITEM.noBusiness = false
ITEM.desc = "It's a state of the art cassette player."

ITEM.functions.Use = {
	onRun = function(item)
		local trace = item.player:GetEyeTraceNoCursor()
		local PLUGIN = nut.plugin.list["cassette"]

		if (trace.HitPos:Distance(item.player:GetShootPos()) <= 192) then
			local entity = ents.Create("nut_cassette_player")

			entity:SetPos(trace.HitPos)
			entity:Spawn()

			PLUGIN:SaveCassettes()
		else
			item.player:notifyLocalized("You cannot drop a cassette player that far away!")

			return false
		end
	end
}