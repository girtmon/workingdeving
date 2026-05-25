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

ITEM.name = "Industrial Fist [Heavy]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 30 to equip. This item is a HEAVY weapon class.</color> A heavy industrial fist fitted with a hydraulic system and a heavy stone block on the front. Made for crushing heavy objects."
ITEM.class = "f4_begotten_fists_powerfist"
ITEM.uniqueID = "f4_begotten_fists_powerfist"
ITEM.weaponCategory = "secondary"
ITEM.model = "models/mosi/fallout4/props/weapons/melee/powerfist.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 2
ITEM.height = 2
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 30
}

ITEM.iconCam = {
	pos = Vector(288.52111816406, 242.12812805176, 189.36904907227),
	ang = Angle(25.788200378418, 220, 96.470588684082),
	fov = 3.3,
}

ITEM.category = "Melee Weaponry"

