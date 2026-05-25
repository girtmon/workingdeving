--[[
    NutScript is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    NutScript is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with NutScript.  If not, see <http://www.gnu.org/licenses/>.
--]]

ITEM.name = "Poolcue Spear [Medium]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 6 to equip. This spear is apart of the MEDIUM weapons class.</color> A poolcue with a combat knife attatched to the tip."
ITEM.class = "f4_begotten_spear_poolcue"
ITEM.uniqueID = "f4_begotten_spear_poolcue"
ITEM.weaponCategory = "primary"
ITEM.model = "models/mosi/fallout4/props/weapons/melee/poolcue.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 3
ITEM.height = 1
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 6
}

ITEM.data = { scrapamount = 4 }

ITEM.salvItem = {
	["j_scrap_wood"] = 8,
	["j_scrap_metal"] = 2
}


ITEM.iconCam = {
	pos = Vector(585.28594970703, 491.18417358398, 386.18676757813),
	ang = Angle(25, 220, -89.411766052246),
	fov = 2.9411764705882,
}
ITEM.category = "Melee Weaponry"

