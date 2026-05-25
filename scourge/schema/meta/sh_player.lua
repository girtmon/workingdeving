local PLAYER = FindMetaTable("Player")


function PLAYER:isProtected()
	local char = self:getChar()

	if (char) then
		local inv = char:getInv():getItems()

		if (inv) then
			for k, v in pairs(inv) do
				if (v:getData("equip")) then
					if (v.uniqueID == "advest") then
						return 0.35, "advest"
					end

					if (v.uniqueID == "balivest") then
						return 0.2, "balivest"
					end

					if (v.uniqueID == "polivest") then
						return 0.25, "polivest"
					end
				end
			end

		 	local class = char:getClass()
		 	local classData = nut.class.list[class]
		 	
		 	if (classData) then
		 		if (classData.law) then
		 			return 0.1, "class"
		 		end
		 	end
		 end
 	end

 	return 0
end



if (SERVER) then
    function PLAYER:breakLegs(time)
        self:setNetVar("legBroken", true)
        
        local char = self:getChar()
        local charID = char:getID()

        timer.Create("breakLeg" .. self:SteamID(), time or 300, 1, function()
            if (IsValid(self)) then
                if (char) then
                    self:setNetVar("legBroken", nil)
                end
            end
        end)
    end
    function PLAYER:healLegs()
        self:setNetVar("legBroken", nil)
        timer.Remove("breakLeg" .. self:SteamID())
    end
end

function PLAYER:isLegBroken()
    return self:getNetVar("legBroken", false)
end
