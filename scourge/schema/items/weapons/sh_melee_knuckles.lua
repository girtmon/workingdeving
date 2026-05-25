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

ITEM.name = "Brass Knuckles [Light]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 1 to equip. These fists are apart of the LIGHT weaponry class.</color> A fairly old fair of brass knuckles, pretty basic stuff."
ITEM.class = "f4_begotten_fists_knuckles"
ITEM.uniqueID = "f4_begotten_fists_knuckles"
ITEM.weaponCategory = "secondary"
ITEM.model = "models/mosi/fallout4/props/weapons/melee/knuckles.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 1
ITEM.height = 1
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 1
}

ITEM.data = { scrapamount = 1 }
ITEM.salvItem = "j_scrap_metal"



ITEM.iconCam = {
	pos = Vector(94.676849365234, 79.444458007813, 60.188262939453),
	ang = Angle(25, 220, 0),
	fov = 4.3637178329673,
}

ITEM.category = "Melee Weaponry"

