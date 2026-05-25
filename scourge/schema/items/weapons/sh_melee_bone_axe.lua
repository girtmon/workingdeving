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

ITEM.name = "Bone Hand Axe [Light]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 5 to equip. This axe is in the LIGHT category of weaponry.</color> A hand axe made out of bone."
ITEM.class = "f4_begotten_bone_axe"
ITEM.uniqueID = "f4_begotten_bone_axe"
ITEM.weaponCategory = "secondary"
ITEM.flag = "1"
ITEM.price = 200
ITEM.model = "models/dawnguardd/weapon_dragonbone_waraxe.mdl"
ITEM.width = 2
ITEM.height = 3
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 5
}

ITEM.iconCam = {
	pos = Vector(2, 0, 26.14379119873),
	ang = Angle(87.058822631836, 180, 0),
	fov = 45,
}

ITEM.category = "Melee Weaponry"
