ITEM.name = "Equip Base"
ITEM.model = "models/props_junk/gnome.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.desc = ""
ITEM.category = "Augmentation"
ITEM.flag = "v"
ITEM.buffCategory = "gnome"
ITEM.multiChance = 10

-- Inventory drawing
if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		if (item:getData("equip")) then
			surface.SetDrawColor(255, 110, 110, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end

-- On item is dropped, Remove a weapon from the player and keep the ammo in the item.
ITEM:hook("drop", function(item)
	if (item:getData("equip")) then
		item:setData("equip", nil)
		
		if (item.attribBoosts or item:getData("attrib", nil)) then
			local temp = {}		
			--combines both boost lists
			local customBoosts = item:getData("attrib", {})
			for k, v in pairs(item.attribBoosts) do
				temp[k] = v
			end		
			for k, v in pairs(customBoosts) do
				temp[k] = (temp[k] or 0) + v
			end	
		
			for k, v in pairs(temp) do
				item.player:getChar():removeBoost(item.uniqueID, k)
			end
		end
	end
end)

-- On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.EquipUn = { -- sorry, for name order.
	name = "Unequip",
	icon = "icon16/cross.png",
	sound = "npc/roller/blade_in.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
	
		item:setData("equip", false)
		
		--removes the buffs
		if (item.attribBoosts or item:getData("attrib", nil)) then
			local temp = {}		
			--combines both boost lists
			local customBoosts = item:getData("attrib", {})
			for k, v in pairs(item.attribBoosts) do
				temp[k] = v
			end		
			for k, v in pairs(customBoosts) do
				temp[k] = (temp[k] or 0) + v
			end
			
			for k, v in pairs(temp) do
				char:removeBoost(item.uniqueID, k)
			end
		end

		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity) and item:getData("equip") == true)
	end
}

-- On player eqipped the item, Gives a weapon to player and load the ammo data from the item.
ITEM.functions.Equip = {
	name = "Equip",
	icon = "icon16/tick.png",
	sound = "npc/roller/blade_in.wav",
	onRun = function(item)		
		local client = item.player
		local char = client:getChar()
		
		local items = client:getChar():getInv():getItems()

		for k, v in pairs(items) do --checks if they have that slot filled already
			if (v.id != item.id) then
				local itemTable = nut.item.instances[v.id]
				
				if (!itemTable) then
					--client:notifyLocalized("tellAdmin", "wid!xt")

					return false
				else
					if ((itemTable:getData("equip") and itemTable.buffCategory) and (string.lower(itemTable:getData("customSlot", itemTable.buffCategory)) == string.lower(item:getData("customSlot", item.buffCategory)))) then
						client:notify("Your " .. item.buffCategory .. " slot is already filled.")

						return false
					end
				end
			end
		end
		
		item:setData("equip", true)
		--buffs the specified attributes.
		if (item.attribBoosts or item:getData("attrib", nil)) then
			local temp = {}		
			--combines both boost lists
			local customBoosts = item:getData("attrib", {})
			for k, v in pairs(item.attribBoosts) do
				temp[k] = v
			end		
			for k, v in pairs(customBoosts) do
				temp[k] = (temp[k] or 0) + v
			end		
		
			for k, v in pairs(temp) do
				char:addBoost(item.uniqueID, k, v)
			end
		end
		
		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity) and item:getData("equip") != true)
	end
}



ITEM.functions.CustomAtr = {
	name = "Customize Attributes",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	isMulti = true,
	multiOptions = function(item, client)
        local targets = {
            {name = "accuracy", data = "accuracy"},
            {name = "agility", data = "stm"},
            {name = "craftiness", data = "medical"},
            {name = "endurance", data = "end"},
            {name = "fortitude", data = "fortitude"},
            {name = "luck", data = "luck"},
            {name = "perception", data = "perception"},
            {name = "strength", data = "str"},
        }
       
        return targets
    end,
	onRun = function(item, data)
		local client = item.player
		local attribs = item:getData("attrib", {})
		
		client:requestString("Input Attribute", nut.attribs.list[data].name, function(text)
			attribs[data] = tonumber(text)
			item:setData("attrib", attribs)
		end, attribs[data] or 0)
	
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return client:getChar():hasFlags("1")
	end
}

function ITEM:onCanBeTransfered(oldInventory, newInventory)
	if (newInventory and self:getData("equip")) then
		return false
	end
	
	local client = self.player
	if(client and IsValid(client.nutRagdoll)) then
		return false
	end

	return true
end

local quality = {}
quality[0] = "Terrible"
quality[1] = "Awful"
quality[2] = "Bad"
quality[3] = "Poor"
quality[4] = "Normal"
quality[5] = "Decent"
quality[6] = "Good"
quality[7] = "Great"
quality[8] = "Excellent"
quality[9] = "Master"
quality[10] = "Perfect"

function ITEM:getName()
	local name = self.name
	
	if(self:getData("customName") != nil) then
		name = self:getData("customName")
	end
	
	return Format(name)
end

function ITEM:getDesc(partial)
	local desc = self.desc
	
	if(self:getData("customDesc") != nil) then
		desc = self:getData("customDesc")
	end	
	
	if(!partial) then
		if(self:getData("customSlot", self.buffCategory)) then
			desc = desc .. "\nSlot: " ..self:getData("customSlot", self.buffCategory).. "."
		end
			
		if(self:getData("quality") != nil) then
			desc = desc .. "\nQuality: " .. quality[math.Round(self:getData("quality"))]
		end
		
		if(self.attribBoosts) then
			desc = desc .. "\n\n<color=50,200,50>Bonuses</color>"
			
			local temp = {}		
			--combines both boost lists
			local customBoosts = self:getData("attrib", {})
			for k, v in pairs(self.attribBoosts) do
				temp[k] = v
			end		
			for k, v in pairs(customBoosts) do
				temp[k] = (temp[k] or 0) + v
			end
			
			for k, v in pairs(temp) do
				if(v != 0) then
					desc = desc .. "\n " .. nut.attribs.list[k].name .. ": " .. v
				end
			end
		end
	end
	
	return Format(desc)
end

function ITEM:getName()
	local name = self:getData("customName", self.name)
	
	return Format(name)
end
