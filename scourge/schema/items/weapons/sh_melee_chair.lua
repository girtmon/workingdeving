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

ITEM.name = "Chair [Light]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 2 to equip. This chair is in the  LIGHT category of weaponry.</color> A metal chair."
ITEM.class = "f4_begotten_chair"
ITEM.uniqueID = "f4_begotten_chair"
ITEM.weaponCategory = "primary"
ITEM.model = "models/props_c17/chair02a.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 2
ITEM.height = 3
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 2
}

ITEM.iconCam = {
	pos = Vector(16, 200, 5),
	ang = Angle(0, 270, 0),
	fov = 8.8235294117647,
}
ITEM.category = "Melee Weaponry"
