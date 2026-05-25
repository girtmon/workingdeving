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

ITEM.name = "Crescent Axe [Heavy]"
ITEM.desc = "<color=0,255,0>Requires a Strength level of 20 to equip. This axe is in the HEAVY class of weaponry.</color> A very large two handed axe with a crescent head."
ITEM.class = "f4_begotten_twohanded_warriors_axe"
ITEM.uniqueID = "f4_begotten_twohanded_warriors_axe"
ITEM.weaponCategory = "primary"
ITEM.model = "models/demonssouls/weapons/crescent axe.mdl"
ITEM.flag = "1"
ITEM.price = 200
ITEM.width = 2
ITEM.height = 6
ITEM.color = Color(29, 32, 0)

ITEM.minimumStats = {
    ["str"] = 20
}


ITEM.iconCam = {
	pos = Vector(25, 2, 200),
	ang = Angle(90, 0, 0),
	fov = 7.824,
}
ITEM.category = "Melee Weaponry"
