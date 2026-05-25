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

ITEM.name = "Silver Fireaxe [Medium]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 8 to equip. This item is a MEDIUM class weapon.</color> A fireaxe made of Silver with a black hilt. It's incredibly sharp."
ITEM.class = "f4_begotten_fireaxe_silver"
ITEM.uniqueID = "f4_begotten_fireaxe_silver"
ITEM.weaponCategory = "primary"
ITEM.model = "models/halokiller38/fallout/weapons/melee/fireaxeunique.mdl"
ITEM.flag = "1"
ITEM.width = 2
ITEM.height = 3
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 8
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 30),
	ang = Angle(0, -0, 0),
	fov = 8,
}

ITEM.category = "Melee Weaponry"
