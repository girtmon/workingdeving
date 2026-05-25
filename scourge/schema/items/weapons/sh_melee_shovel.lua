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

ITEM.name = "Shovel [Medium]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 9 to equip. This item is a MEDIUM class weapon.</color> A long shovel with a splintery handle and a rusting metal top."
ITEM.class = "f4_begotten_shovel"
ITEM.uniqueID = "f4_begotten_shovel"
ITEM.weaponCategory = "primary"
ITEM.model = "models/halokiller38/fallout/weapons/melee/shovel.mdl"
ITEM.flag = "1"
ITEM.width = 2
ITEM.height = 5
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 9
}

ITEM.iconCam = {
	pos = Vector(541.51422119141, 455.18362426758, 357.42611694336),
	ang = Angle(25, 220, 0),
	fov = 1.4,
}
ITEM.category = "Melee Weaponry"
