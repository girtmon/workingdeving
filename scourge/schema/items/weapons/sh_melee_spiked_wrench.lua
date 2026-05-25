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

ITEM.name = "Spiked Wrench [Medium]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 6 to equip. This item is a MEDIUM class weapon.</color> A rusty red pipe wrench fitted with a large spike. It's now a purely deadly weapon."
ITEM.class = "f4_begotten_wrench_spiked"
ITEM.uniqueID = "f4_begotten_wrench_spiked"
ITEM.weaponCategory = "secondary"
ITEM.model = "models/mosi/fallout4/props/weapons/melee/pipewrench.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 1
ITEM.height = 2
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 6
}


ITEM.iconCam = {
	pos = Vector(257.90200805664, 215.68627929688, 167.3990020752),
	ang = Angle(25, 220, 0),
	fov = 1.7647058823529,
}



ITEM.category = "Melee Weaponry"

