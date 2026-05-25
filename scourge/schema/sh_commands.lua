nut.command.add("charselectskin", {
	syntax = "[number skin]",
	onRun = function(client, arguments)
		local skin = tonumber(arguments[1])
		local target = client

		if (IsValid(target) and target:getChar()) then
			target:getChar():setData("skin", skin)
			target:SetSkin(skin or 0)

			--nut.util.notifyLocalized("cChangeSkin", nil, client:Name(), target:Name(), skin or 0)
		end
	end
})

nut.command.add("charselectbodygroup", {
	syntax = "<string bodyGroup> [number value]",
	onRun = function(client, arguments)
		local value = tonumber(arguments[2])
		local target = client

		if (IsValid(target) and target:getChar()) then
			local index = target:FindBodygroupByName(arguments[1])

			if (index > -1) then
				if (value and value < 1) then
					value = nil
				end

				local groups = target:getChar():getData("groups", {})
					groups[index] = value
				target:getChar():setData("groups", groups)
				target:SetBodygroup(index, value or 0)

				--nut.util.notifyLocalized("cChangeGroups", nil, client:Name(), target:Name(), arguments[2], value or 0)
			else
				return "@invalidArg", 2
			end
		end
	end
})

nut.command.add("roll", {
	syntax = "[number maximum]",
	onRun = function(client, arguments)
		local rolled = math.random(0, math.min(tonumber(arguments[1]) or 100, 100))
		nut.log.add(client:Name().." rolled \""..rolled.."\"")	
		nut.chat.send(client, "roll", rolled)
	end
})

nut.command.add("ammoeject", {
	syntax = "[num amount]",
	onRun = function(client, arguments)
	
		local char = client:getChar()
		local inv = char:getInv()
		local wep = client:GetActiveWeapon()
		local ammoType = wep:GetPrimaryAmmoType()
		local ammo = client:GetAmmoCount( ammoType )
		if (arguments[1] and tonumber(arguments[1]) < ammo) then
			ammo = tonumber(arguments[1])
		end
		ammoType = game.GetAmmoName(ammoType)

		if (ammo > 0) then
			client:SetAmmo(client:GetAmmoCount( ammoType ) - ammo, ammoType)
			if(!inv:add("ammo_generic", 1, { am = ammoType, amt = ammo, customName = ammoType .. " Box"})) then
				nut.item.spawn("ammo_generic", position,
					function(item2)
						item2:setData("am", ammoType)
						item2:setData("amt", ammo)
						item2:setData("customName", ammoType .. " Box")
					end
				)
			end
			
			local plugin = nut.plugin.list["ammosave"]
			if(client and client:getChar()) then
				local ammoTable = {}
				
				for k, v in ipairs(plugin.ammoList) do
					local ammo = client:GetAmmoCount(v)
					--print(v .. ammo)
					
					if (ammo > 0) then
						ammoTable[v] = ammo
					end
				end
				client:getChar():setData("ammo", ammoTable)
			end
			
		else
			client:notify("You don't have any ammo to eject!")
			return false
		end
	end
})

--model print
nut.command.add("chargetmodel", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			client:notifyLocalized(target:GetModel())
		else
			client:notifyLocalized("Invalid Target")
		end
	end
})

--model print
nut.command.add("syncinv", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
		
			target:getChar():getInv():sync(target, true)
			client:notifyLocalized("Inventory has been synchronized.")
		else
			client:notifyLocalized("Invalid Target")
		end
	end
})