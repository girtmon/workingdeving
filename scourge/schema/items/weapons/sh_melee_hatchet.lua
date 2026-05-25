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

ITEM.name = "Hatchet [Light]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 4 to equip. This item is a LIGHT class weapon.</color> A small hatchet able to be held comfortably in ones hand."
ITEM.class = "f4_begotten_hatchet"
ITEM.uniqueID = "f4_begotten_hatchet"
ITEM.weaponCategory = "primary"
ITEM.model = "models/halokiller38/fallout/weapons/melee/hatchet.mdl"
ITEM.flag = "1"
ITEM.width = 1
ITEM.height = 2
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 4
}

ITEM.iconCam = {
	pos = Vector(192.60690307617, 163.75241088867, 126.66711425781),
	ang = Angle(25, 220, 0),
	fov = 1.74,
}

ITEM.category = "Melee Weaponry"
