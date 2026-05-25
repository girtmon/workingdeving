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

ITEM.name = "Javelin & Steel Shield [Heavy]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 27 to equip. This spear & shield are apart of the HEAVY category of weaponry.</color> A weighty Javelin and a steel shield, a wonderful combo."
ITEM.class = "f4_begotten_javelin_shield"
ITEM.uniqueID = "f4_begotten_javelin_shield"
ITEM.weaponCategory = "primary"
ITEM.model = "models/demonssouls/shields/steel shield.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 4
ITEM.height = 4
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 27
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90.5, 90, 0),
	fov = 12.352941176471,
}

ITEM.category = "Melee Weaponry"
