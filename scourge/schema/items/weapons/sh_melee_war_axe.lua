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

ITEM.name = "War Axe [Heavy]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 30 to equip. This item is a HEAVY weapon class.</color> A large double edged axe. Two hands required."
ITEM.class = "f4_begotten_twohanded_grognakaxe"
ITEM.uniqueID = "f4_begotten_twohanded_grognakaxe"
ITEM.weaponCategory = "primary"
ITEM.model = "models/mosi/fallout4/props/weapons/melee/grognakaxe.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 2
ITEM.height = 3
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 30
}

ITEM.iconCam = {
	pos = Vector(-52.287582397461, 0, 13.071895599365),
	ang = Angle(0, -0, 0),
	fov = 28.294,
}

ITEM.category = "Melee Weaponry"

