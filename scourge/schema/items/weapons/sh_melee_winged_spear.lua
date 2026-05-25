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

ITEM.name = "Winged Spear [Medium]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 7 to equip. This spear is in the MEDIUM category of weaponry.</color> A long wooden spear with a winged metal head on it's front."
ITEM.class = "f4_begotten_twohanded_club"
ITEM.uniqueID = "f4_begotten_twohanded_club"
ITEM.weaponCategory = "primary"
ITEM.model = "models/demonssouls/weapons/winged spear.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 5
ITEM.height = 1
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 7
}

ITEM.iconCam = {
	pos = Vector(20, 200, 0),
	ang = Angle(0, 270, 180),
	fov = 26.941,
}

ITEM.category = "Melee Weaponry"
