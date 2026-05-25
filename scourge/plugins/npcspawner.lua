local PLUGIN = PLUGIN
PLUGIN.name = "NPC Spawner"
PLUGIN.author = "Black Tea (NS 1.0), Neon (NS 1.1)"
PLUGIN.desc = "NPC Spawner."
PLUGIN.spawnpoints = PLUGIN.spawnpoints or {}

nut.config.add("spawner_enabled", true, "Whether NPC spawners are on or not.", nil, {
	category = "NPC Spawner"
})

nut.config.add("npc_spawnrate", 90, "How often an npc will be spawned at an npc spawn point.", nil, {
	data = {min = 1, max = 84600},
	category = "NPC Spawner"
})

PLUGIN.spawngroups = {
	["bear"] = {
		"npc_animal_bear",
		"npc_animal_cave_bear"
	},
	["deer"] = {
		"npc_animal_deer"
	},
	["zombie"] = {
		"npc_vj_zss_cpzombie",
		"npc_vj_zss_czombie",
		"npc_vj_zss_czombietors",
		"npc_vj_zss_zombie1",
		"npc_vj_zss_zombie10",
		"npc_vj_zss_zombie11",
		"npc_vj_zss_zombie12",
		"npc_vj_zss_zombie2",
		"npc_vj_zss_zombie3",
		"npc_vj_zss_zombie4",
		"npc_vj_zss_zombie5",
		"npc_vj_zss_zombie6",
		"npc_vj_zss_zombie7",
		"npc_vj_zss_zombie8",
		"npc_vj_zss_zombie9",
		"npc_vj_zss_zp1",
		"npc_vj_zss_zp2",
		"npc_vj_zss_zp3",
		"npc_vj_zss_zp4"
	},
	["zboss"] = {
		"npc_vj_zss_burnzie",
		"npc_vj_zss_zhulk",
		"npc_vj_zss_undeadstalker",
		"npc_vj_zss_zminiboss"
	},
	["wild"] = {
		"npc_vj_g_Dog",
		"npc_vj_g_Baby",
		"npc_vj_g_Babu",
		"npc_vj_g_Creepy",
		"npc_vj_g_Dog"
	},	
	["silent"] = {
		"npc_vj_cof_slowerstuck",
		"npc_vj_cof_taller",
		"npc_vj_cof_faceless2",
		"npc_vj_cof_citalopram",
		"npc_vj_cof_upper",
		"npc_vj_cof_faster"
	},
	["special"] = {
		"npc_vj_cof_mace",
		"npc_animal_lionm",
		"npc_animal_crocodile"
	},
}

PLUGIN.maxnpcs = 40
PLUGIN.spawnedNPCs = PLUGIN.spawnedNPCs or {}

if SERVER then
	local spawntime = 1
	
	function PLUGIN:Think()
		if spawntime > CurTime() then return end
		spawntime = CurTime() + nut.config.get("npc_spawnrate", 90)
		for k, v in ipairs(self.spawnedNPCs) do
			if (!v:IsValid()) then
				table.remove(self.spawnedNPCs, k)
			end
		end

		if #self.spawnedNPCs >= self.maxnpcs then return end

		local v = table.Random(self.spawnpoints)

		if(!nut.config.get("spawner_enabled", false)) then
			return
		end
		
		if (!v) then
			return
		end

		local data = {}
		data.start = v[1]
		data.endpos = data.start + Vector(0, 0, 1)
		data.filter = client
		data.mins = Vector(-16, -16, 0)
		data.maxs = Vector(16, 16, 16)

		local idat = table.Random(self.spawngroups[v[2]]) or self.spawngroup["default"]

		--nut.item.spawn(idat, v[1] + Vector( math.Rand(-8,8), math.Rand(-8,8), 20 ), nil, AngleRand())
			
		local trace = util.TraceHull(data)

		
		local nearby = false 
		local players = player.GetAll()
		
		--dont want to spawn them in too close to players
		if(players) then
			for k, v in pairs(players) do
				if(v:GetMoveType() == MOVETYPE_NOCLIP) then
					continue
				end
			
				if v:GetPos():DistToSqr(data.endpos) < 1000 * 1000 then --squared is more efficient
					nearby = true
					break
				end
			end
		end
		
		if (!nearby and !trace.Entity:IsValid()) then --dont want the npcs to stack on each other or spawn inside something.
			local ent = ents.Create(idat)
			
			table.insert(self.spawnedNPCs, ent)
				
			if (ent:IsValid()) then
				ent:SetPos(data.endpos + Vector(0,0,25))
				ent:Spawn()
			end
		end
	end

	function PLUGIN:LoadData()
		self.spawnpoints = self:getData() or {}
	end

	function PLUGIN:SaveData()
		self:setData(self.spawnpoints)
	end

else

	netstream.Hook("nut_DisplaySpawnPoints", function(data)
		for k, v in pairs(data) do
			local emitter = ParticleEmitter( v[1] )
			local smoke = emitter:Add( "sprites/glow04_noz", v[1] )
			smoke:SetVelocity( Vector( 0, 0, 1 ) )
			smoke:SetDieTime(10)
			smoke:SetStartAlpha(255)
			smoke:SetEndAlpha(255)
			smoke:SetStartSize(64)
			smoke:SetEndSize(64)
			smoke:SetColor(255,50,50)
			smoke:SetAirResistance(300)
		end
	end)

end

nut.command.add("npcspawnadd", {
	adminOnly = true,
	syntax = "<string npcgroup>",
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		local hitpos = trace.HitPos + trace.HitNormal*5
		local spawngroup = arguments[1] or "default"
		table.insert(PLUGIN.spawnpoints, { hitpos, spawngroup })
		client:notify("You added ".. spawngroup .. " npc spawner.")
	end
})

nut.command.add("npcspawnremove", {
	adminOnly = true,
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		local hitpos = trace.HitPos + trace.HitNormal*5
		local range = arguments[1] or 128
		local mt = 0
		for k, v in pairs( PLUGIN.spawnpoints ) do
			local distance = v[1]:DistToSqr(hitpos)
			if distance <= tonumber(range) * tonumber(range) then
				PLUGIN.spawnpoints[k] = nil
				mt = mt + 1
			end
		end
		client:notify(mt .. " npc spawners has been removed.")
	end
})

nut.command.add("npcspawndisplay", {
	adminOnly = true,
	onRun = function(client, arguments)
		if SERVER then
			netstream.Start(client, "nut_DisplaySpawnPoints", PLUGIN.spawnpoints)
			client:notify("Displayed All Points for 10 secs.")
		end
	end
})

nut.command.add("npcspawntoggle", {
	adminOnly = true,
	onRun = function(client, arguments)
		if(nut.config.get("spawner_enabled", false)) then
			nut.config.set("spawner_enabled", false)
			client:notify("NPC Spawners have been turned off.")
		else
			nut.config.set("spawner_enabled", true)
			client:notify("NPC Spawners have been turned on.")
		end
	end
})