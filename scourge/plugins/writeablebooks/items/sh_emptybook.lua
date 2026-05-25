ITEM.name = "Blank Book"
ITEM.model = "models/props_lab/binderblue.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.desc = "A book containing only blank pages."
ITEM.category = "Literature"
ITEM.iconCam = {
	pos = Vector(0, 200, 6),
	ang = Angle(0, 270, 0),
	fov = 4.294,
}

function ITEM:getName()
	return self:getData("booktitle", "Blank Book")
end

function ITEM:getDesc()
	return self:getData("booktitle") == nil and "A book containing only blank pages." or "A book containing some writing."
end

// On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.write = { -- sorry, for name order.
	name = "Write",
	tip = "Write a book.",
	icon = "icon16/book_open.png",
	onRun = function(item)
		netstream.Start(client, "EditBook", item:getID())
		
		return false
	end,
	onCanRun = function(item)
		return item:getData("booktitle") == nil
	end,
}

ITEM.functions.read = { -- sorry, for name order.
	name = "Read",
	tip = "Read the book.",
	icon = "icon16/book_open.png",
	onRun = function(item)
		netstream.Start(client, "EditBook", item:getID())
		
		return false
	end,
	onCanRun = function(item)
		return item:getData("booktitle") ~= nil
	end,
}
