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

ITEM.name = "Kings Blade[HEAVY]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 15 to equip. This sword is in the HEAVY category of weaponry.</color> A sword with a hilt made of gold, embued with a beautiful ruby. The sword itself is made out of a slightly translucent chrystalline material, which is extremely sharp."
ITEM.class = "f4_begotten_twohanded_kings_blade"
ITEM.uniqueID = "f4_begotten_twohanded_kings_blade"
ITEM.weaponCategory = "primary"
ITEM.model = "models/demonssouls/weapons/large sword of moonlight.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 2
ITEM.height = 6
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 15
}

ITEM.iconCam = {
	pos = Vector(23, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 6.999,
	outline = true,
	outlineColor = Color(255, 255, 255)
}

ITEM.category = "Melee Weaponry"
