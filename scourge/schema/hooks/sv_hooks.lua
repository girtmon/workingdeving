local workshopIDs = { 

--[[
other
--]]

207739713, --nutscript content
104691717, --pac3
685130934, --serverguard content


--[[
Temporary Things (Like Maps)
--]]

}

for k, v in pairs(workshopIDs) do

	resource.AddWorkshop(v)

end



function SCHEMA:OnCharCreated(client, character)
    local inventory = character:getInv()

    if (inventory) then        
        if (character:getFaction() == FACTION_PONK) then
            inventory:add("book_credits", 1)
            inventory:add("book_combat", 1)
            inventory:add("transportee_ticket", 1)
        end
    end
end 

function SCHEMA:PlayerSpawnEffect(client, weapon, info)
	return client:IsAdmin() or client:getChar():hasFlags("E")
end

function SCHEMA:PlayerSpray(client)
    return true
end

function SCHEMA:Initialize()
	game.ConsoleCommand("net_maxfilesize 64\n");
	game.ConsoleCommand("sv_kickerrornum 0\n");

	game.ConsoleCommand("sv_allowupload 0\n");
	game.ConsoleCommand("sv_allowdownload 1\n");
	game.ConsoleCommand("sv_allowcslua 0\n");
end

function SCHEMA:ScalePlayerDamage(client, hitGroup, dmgInfo)
	local attacker = dmgInfo:GetAttacker()
	if(attacker and attacker:IsPlayer()) then
		if(dmgInfo:GetDamageType() == DMG_SLASH) then
			dmgInfo:ScaleDamage(.1)
		else
			dmgInfo:ScaleDamage(.5)
		end
	else
		dmgInfo:ScaleDamage(1.5)

		if (hitGroup == HITGROUP_HEAD) then
			dmgInfo:ScaleDamage(7)
		elseif (LIMB_GROUPS[hitGroup]) then
			dmgInfo:ScaleDamage(0.5)
		end
	end
end

function SCHEMA:PlayerFootstep(client, position, foot, soundName, volume)

	if (client:isRunning()) then
		
		if (client:Team() == FACTION_ENFORCER) then
			
		client:EmitSound("npc/metropolice/gear"..math.random(1, 6)..".wav", volume * 130)

			
		return true
		
		end
	
	end

end


function SCHEMA:OnCharCreated(client, character)
	local inventory = character:getInv()

	if (inventory) then		
		local items = {}
	
		if (character:getFaction() == FACTION_HUMAN) then
			items = {
				"book_newchar"
			}		

			local traitData = character:getData("traits", {})
			traitData["pla"] = 1
			character:setData("traits", traitData, false, player.GetAll())
		local i = 20
		for k, v in pairs(items) do
			timer.Simple(i + k, function()
				inventory:add(v)
			end)
		end
	end
end 

--Causes pain noises for the Enforcer faction to be heard.
function SCHEMA:GetPlayerPainSound(client)
	if (client:Team() == FACTION_ENFORCER) then
		local sounds = self.config.painSounds[client:Team()] or self.config.painSounds[FACTION_ENFORCER]

		return table.Random(sounds)
	end
end

function SCHEMA:PrePlayerLoadedChar(client, character, currentChar)
	if (character:getFaction() == FACTION_SCOURGE) then --material for scourge faction
		client:SetMaterial("models/flesh")
	else
		client:SetMaterial("") --necessary for char swapping from scourge to anything else
	end
end


function SCHEMA:PlayerUseDoor(client, entity)
    local isEnforcerFaction = client:Team() == FACTION_ENFORCER
    if (isEnforcerFaction) then
        local lock = entity.lock or (IsValid(entity:getDoorPartner()) and entity:getDoorPartner().lock)
 
        if (IsValid(lock)) then
            if (client:KeyDown(IN_SPEED)) then
                lock:toggle()
                return false
            elseif (client:KeyDown(IN_WALK) and not isEnforcerFaction) then
                lock:detonate(client)
                return false
            end
        elseif (!entity:HasSpawnFlags(256) and !entity:HasSpawnFlags(1024)) then
            entity:Fire("open", "", 0)
        end
    end
end
end

hook.Add( "PlayerSpray", "DisablePlayerSpray", function( ply )
	return !ply:IsOwner()
end )