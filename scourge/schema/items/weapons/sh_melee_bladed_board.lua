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

ITEM.name = "Bladed Wooden Board [Heavy]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 15 to equip. This wooden board is apart of the HEAVY weapons class.</color> A wooden board fitted with a handle and two circular saw blades. It causes a fair amount of damage."
ITEM.class = "f4_begotten_board_bladed"
ITEM.uniqueID = "f4_begotten_board_bladed"
ITEM.weaponCategory = "primary"
ITEM.model = "models/mosi/fallout4/props/weapons/melee/board.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 1
ITEM.height = 3
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 15
}

ITEM.data = { scrapamount = 4 }

ITEM.salvItem = {
	["j_scrap_wood"] = 8,
	["j_scrap_metal"] = 4
}


ITEM.iconCam = {
	pos = Vector(554.14208984375, 462.93463134766, 365.23376464844),
	ang = Angle(25, 220, 0),
	fov = 1.2,
}
ITEM.category = "Melee Weaponry"

