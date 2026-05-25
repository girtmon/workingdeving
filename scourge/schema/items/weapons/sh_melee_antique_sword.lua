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

ITEM.name = "Antique Sword [Light]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 3 to equip. This sword is in the LIGHT category of weaponry..</color> An antique sword that has seen combat throughout several conflicts."
ITEM.class = "f4_begotten_knife_revolutionarysword"
ITEM.uniqueID = "f4_begotten_knife_revolutionarysword"
ITEM.weaponCategory = "secondary"
ITEM.model = "models/mosi/fallout4/props/weapons/melee/revolutionarysword.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 1
ITEM.height = 2
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 3
}

ITEM.data = { scrapamount = 3 }
ITEM.salvItem = "j_scrap_metal"


ITEM.iconCam = {
	pos = Vector(335.6960144043, 280.78393554688, 216.45434570313),
	ang = Angle(25, 220, 0),
	fov = 1.7647058823529,
}

ITEM.category = "Melee Weaponry"
