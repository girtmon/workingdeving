local PLUGIN = PLUGIN

PLUGIN.name = "Cassette Player"
PLUGIN.author = "Thermadyle"
PLUGIN.desc = "Cassette player to play custom cassettes."

nut.util.include("cl_plugin.lua")
nut.util.include("sv_plugin.lua")
nut.util.include("sv_hooks.lua")
--[[
t_cassette = {}
function t_cassette.Register(name, playlist)
	for key, tbl in pairs(playlist) do
		tbl.key = key
	end
	local tbl = {name = name, playlist = playlist}
	tbl.key = table.insert(t_cassette, tbl)
	return tbl.key
end
--]]