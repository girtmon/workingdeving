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

ITEM.name = "Industrial Sledge [Heavy]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 50 to equip. This item is a HEAVY weapon class.</color> An industrial grade sledgehammer fit with hydraulics. Used for crushing heavy objects."
ITEM.class = "f4_begotten_twohanded_supersledge"
ITEM.uniqueID = "f4_begotten_twohanded_supersledge"
ITEM.weaponCategory = "primary"
ITEM.model = "models/mosi/fallout4/props/weapons/melee/rockethammer.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 2
ITEM.height = 3
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 50
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(-3.7060000896454, -0, 0),
	fov = 7.6470588235294,
}

ITEM.category = "Melee Weaponry"

