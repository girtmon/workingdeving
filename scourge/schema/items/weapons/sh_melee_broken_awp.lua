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

ITEM.name = "Broken AWP [Medium]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 9 to equip. This AWP is in the MEDIUM category of weaponry.</color> An AWP, with all the internal mechanisms gutted. It does not fire, but it's good to bash in some skulls with."
ITEM.class = "f4_begotten_awp"
ITEM.uniqueID = "f4_begotten_awp"
ITEM.weaponCategory = "primary"
ITEM.model = "models/weapons/w_snip_awp.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 4
ITEM.height = 2
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 9
}

ITEM.iconCam = {
	pos = Vector(1, 200, 8),
	ang = Angle(0, 270, 0),
	fov = 14.882,
}
ITEM.category = "Melee Weaponry"
