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

ITEM.name = "Bone Mace [Heavy]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 13 to equip. This mace is in the HEAVY category of weaponry.</color> A large, heavy mace made out of bone."
ITEM.class = "f4_begotten_bone_mace"
ITEM.uniqueID = "f4_begotten_bone_mace"
ITEM.weaponCategory = "primary"
ITEM.model = "models/dawnguardd/weapon_dragonbone_mace.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 3
ITEM.height = 2
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 13
}


ITEM.iconCam = {
	pos = Vector(0, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 8.8235294117647,
}

ITEM.category = "Melee Weaponry"
