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

ITEM.name = "Spiked Walking Cane [Light]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 5 to equip. This item is a LIGHT weapon class.</color> An old wooden walking cane fitted with a few long nails, easily considered spikes."
ITEM.class = "f4_begotten_walkingcane_spiked"
ITEM.uniqueID = "f4_begotten_walkingcane_spiked"
ITEM.weaponCategory = "primary"
ITEM.model = "models/mosi/fallout4/props/weapons/melee/walkingcane.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 1
ITEM.height = 3
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 5
}

ITEM.iconCam = {
	pos = Vector(387.11880493164, 325.79251098633, 247.03421020508),
	ang = Angle(25, 220, 0),
	fov = 1.2,
}
ITEM.category = "Melee Weaponry"
