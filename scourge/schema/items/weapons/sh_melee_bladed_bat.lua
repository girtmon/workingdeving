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

ITEM.name = "Circular Saw Wooden Bat [Medium]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 10 to equip. This baseball bat is a member of the MEDIUM weapons class.</color> A wooden slugger, with two large circular saws attatched to the sides with duct tape and heavy adhesive."
ITEM.class = "f4_begotten_baseballbat_wood_bladed"
ITEM.uniqueID = "f4_begotten_baseballbat_wood_bladed"
ITEM.weaponCategory = "primary"
ITEM.model = "models/mosi/fallout4/props/weapons/melee/baseballbat.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 1
ITEM.height = 3
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 10
}

ITEM.data = { scrapamount = 4 }

ITEM.salvItem = {
	["j_scrap_wood"] = 8,
	["j_scrap_metal"] = 3
}


ITEM.iconCam = {
	pos = Vector(335.34664916992, 281.52258300781, 220.74806213379),
	ang = Angle(25, 220, 0),
	fov = 1.212,
}

ITEM.category = "Melee Weaponry"

