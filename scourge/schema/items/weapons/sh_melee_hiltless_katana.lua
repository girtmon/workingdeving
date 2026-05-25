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

ITEM.name = "Hiltless Katana [Light]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 4 to equip. This katana is in the LIGHT category of weaponry.</color> A steel katana lacking a hilt."
ITEM.class = "f4_begotten_hiltless_katana"
ITEM.uniqueID = "f4_begotten_hiltless_katana"
ITEM.weaponCategory = "primary"
ITEM.model = "models/demonssouls/weapons/hiltless.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 1
ITEM.height = 4
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 4
}

ITEM.iconCam = {
	pos = Vector(17, -2, 200),
	ang = Angle(90, 0, 0),
	fov = 4.441,
	outline = true,
	outlineColor = Color(255, 255, 255)
}
ITEM.category = "Melee Weaponry"
