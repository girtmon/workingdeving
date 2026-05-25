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

ITEM.name = "War Scythe [Medium]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 10 to equip. This scythe is apart of the MEDIUM category of weaponry.</color> A large scythe with a steel head. It's made for combat, and stands at about six or so feet tall."
ITEM.class = "f4_begotten_twohanded_war_scythe"
ITEM.uniqueID = "f4_begotten_twohanded_war_scythe"
ITEM.weaponCategory = "primary"
ITEM.model = "models/demonssouls/weapons/war scythe.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 2
ITEM.height = 7
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 10
}

ITEM.iconCam = {
	pos = Vector(10, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 10.15,
}
ITEM.category = "Melee Weaponry"
