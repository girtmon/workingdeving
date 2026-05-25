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

ITEM.name = "Pole Hook [Heavy]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 10 to equip. This item is a HEAVY weapon class.</color> An old polehook used for fishing in the oceans around the Korean Peninsula."
ITEM.class = "f4_begotten_twohanded_polehook"
ITEM.uniqueID = "f4_begotten_twohanded_polehook"
ITEM.weaponCategory = "primary"
ITEM.model = "models/mosi/fallout4/props/weapons/melee/polehook.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 1
ITEM.height = 3
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 10
}

ITEM.iconCam = {
	pos = Vector(416.07531738281, 349.01184082031, 266.66943359375),
	ang = Angle(25, 220, 0),
	fov = 1.35,
}

ITEM.category = "Melee Weaponry"
