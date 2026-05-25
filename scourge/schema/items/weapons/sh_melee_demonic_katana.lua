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

ITEM.name = "Vampiric Katana [Light]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 9 to equip. This katana is in the LIGHT category of weaponry.</color> A Demonic seeming katana stolen from a high level vampire."
ITEM.class = "f4_begotten_vamp_sword"
ITEM.uniqueID = "f4_begotten_vamp_sword"
ITEM.weaponCategory = "primary"
ITEM.model = "models/dawnguardd/weapon_vampire_sword.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 1
ITEM.height = 4
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 9
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 180, 0),
	fov = 4.1176470588235,
}

ITEM.category = "Melee Weaponry"
