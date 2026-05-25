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

ITEM.name = "Bone Dagger [Light]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 3 to equip. This dagger is in the LIGHT category of weaponry.</color> A wide dagger made of bone."
ITEM.class = "f4_begotten_bone_dagger"
ITEM.uniqueID = "f4_begotten_bone_dagger"
ITEM.weaponCategory = "secondary"
ITEM.model = "models/dawnguardd/weapon_dragonbone_dagger.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 1
ITEM.height = 2
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 3
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 180, 0),
	fov = 3.147,
}
ITEM.category = "Melee Weaponry"
