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

ITEM.name = "Javelin [Medium]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 8 to equip. This javelin is in the MEDIUM category of weaponry.</color> A weighty Javelin. It's long handle is made out of wood."
ITEM.class = "f4_begotten_spear_javelin"
ITEM.uniqueID = "f4_begotten_spear_javelin"
ITEM.weaponCategory = "primary"
ITEM.model = "models/demonssouls/weapons/cut javelin.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 5
ITEM.height = 1
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 8
}

ITEM.iconCam = {
	pos = Vector(19, 200, 0),
	ang = Angle(0, 270, -180),
	fov = 23.294,
}

ITEM.category = "Melee Weaponry"
