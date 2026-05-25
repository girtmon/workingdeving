PLUGIN.name = "Horror Commands"
PLUGIN.author = "Freelok"
PLUGIN.desc = "Commands for horror and related topics."

--this is global and that's annoying
function flashlightFlicker(target, times)
	if(times > 0) then
		timer.Simple(math.random(1, 3), function()
			if (target:FlashlightIsOn()) then
				target:Flashlight(false)
			else
				target:Flashlight(true)
			end
			flashlightFlicker(target, times-1)
		end)
	end
end

function screenShake(target, position, amplitude, frequency, duration, radius)
	util.screenShake( Vector(0,0,0), 0, 0, 0, 0 )
end


nut.command.add("fflicker", {
	adminOnly = true,
	syntax = "<string name> [num times]",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		local times = tonumber(arguments[2]) or 10
		if(target:getChar() and !target:getChar():getInv():hasItem("flashlight_shard")) then
			client:notify("Flickering.")
			flashlightFlicker(target, times)
		else
			client:notify("Not flickering.")
		end
	end
})

nut.command.add("screenshake", {
	adminOnly = true,
	syntax = "<string name> <number position> <number amplitude> <number frequency> <number duration> <number radius>",
	onRun = function(client, arguments)
			local target = nut.command.findPlayer(client, arguments[1]) or client
			local position = nut.command.findPlayer(client, arguments[1]) or client
			local amplitude = nut.command.findPlayer(client, arguments[1]) or client
			local frequency = nut.command.findPlayer(client, arguments[1]) or client
			local duration = nut.command.findPlayer(client, arguments[1]) or client
			local radius = nut.command.findPlayer(client, arguments[1]) or client
			function screenShake (target, position, amplitude, frequency, duration, radius)
		end
	end
})

nut.command.add("bruteplayer", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client
		--local times = tonumber(arguments[2]) or 10
		local whispers = {}
		whispers[0] = "respite/brute/brute1.wav"
		whispers[1] = "respite/brute/brute2.wav"
		whispers[2] = "respite/brute/brute3.wav"
		whispers[3] = "respite/brute/brute4.wav"
		whispers[4] = "respite/brute/brute5.wav"
		whispers[5] = "respite/brute/brute6.wav"
		
		target:ConCommand( "play " .. whispers[math.random(0,5)] )
	end
})

nut.command.add("beautifultune", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client
		--local times = tonumber(arguments[2]) or 10
		local whispers = {}
		whispers[0] = "scarlet/scarlet.mp3"
		whispers[1] = "scarlet/scarlet.mp3"
		whispers[2] = "scarlet/scarlet.mp3"
		whispers[3] = "scarlet/scarlet.mp3"
		whispers[4] = "scarlet/scarlet.mp3"
		whispers[5] = "scarlet/scarlet.mp3"
		
		target:ConCommand( "play " .. whispers[math.random(0,5)] )
	end
})

nut.command.add("fakefootstep", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client
		--local times = tonumber(arguments[2]) or 10
		local whispers = {}
		whispers[0] = "player/footsteps/dirt1.wav"
		whispers[1] = "player/footsteps/metal1.wav"
		whispers[2] = "player/footsteps/wood2.wav"
		whispers[3] = "player/footsteps/concrete3.wav"
		whispers[4] = "player/footsteps/ladder1.wav"
		whispers[5] = "player/footsteps/sand4.wav"
		
		target:ConCommand( "play " .. whispers[math.random(0,5)] )
	end
})


nut.command.add("scareshitless", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client
		--local times = tonumber(arguments[2]) or 10
		local whispers = {}
		whispers[0] = "baby/babydie.wav"
		whispers[1] = "cof/crazyrumpel/b_screamclose1.wav"
		whispers[2] = "deadzone/lepotitsa/alert4.wav"
		whispers[3] = "deadzone/lepotitsa/alert3.wav"
		whispers[4] = "ambience/ambience_voice_6.mp3"
		whispers[5] = "dalrp/npc/baby/babyalert.wav"
		
		target:ConCommand( "play " .. whispers[math.random(0,5)] )
	end
})

nut.command.add("psst", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client
		--local times = tonumber(arguments[2]) or 10
		local whispers = {}
		whispers[0] = "chorror/psstleft.wav"
		whispers[1] = "chorror/psstright.wav"
		whispers[2] = "chorror/psstleft.wav"
		whispers[3] = "chorror/psstright.wav"
		whispers[4] = "chorror/psstleft.wav"
		whispers[5] = "chorror/psstright.wav"
		
		target:ConCommand( "play " .. whispers[math.random(0,5)] )
	end
})

nut.command.add("emitsound", {
	adminOnly = true,
	syntax = "<string soundpath> <int soundlevel=70 (50-100)> <int pitch=100 (30-255)>",
	onRun = function(client, arguments)
	local soundLevel = tonumber(arguments[2] or 70)	
	local pitch = tonumber(arguments[3] or 100)
	if( pitch > 29 and pitch < 256  ) then
		client:EmitSound(arguments[1], soundLevel, pitch);
		client:notifyLocalized("Emitting a sound: " .. arguments[1] )
	else
		client:notifyLocalized("The pitch needs to be between 30 and 255!")
	end
	end
})

nut.command.add("playsound", {
	adminOnly = true,
	syntax = "<string name> <string soundpath>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client	
		target:ConCommand( "play " .. arguments[2] )		
	end
})

nut.command.add("statueplayer", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
	
		local target = nut.command.findPlayer(client, arguments[1]) or client		
		local dummyPos, dummyDirection = target:GetPos() + target:GetForward() * 60 + Vector(0, 0, 40), target:GetForward() * -1
		local dummy = ents.Create("prop_physics")
		dummy:SetModel("models/horror/blackscary.mdl")
		dummy:SetAngles(dummyDirection:Angle() + Angle(0, 90, 0))
		dummy:SetPos(dummyPos)
		dummy:SetSkin(2)
		dummy:Spawn()
		dummy:EmitSound("horror/leap2.wav", 100, 100)
		ParticleEffectAttach("Advisor_Pod_Explosion_Smoke", 1, dummy, 1)
       
		local phys = dummy:GetPhysicsObject()
 
	    if phys and phys:IsValid() then
		phys:EnableMotion(false) -- Freezes the object in place.
	    end
		
		target:Freeze( true )
		target:SetFOV( 50, 0.2 )
		
		timer.Simple(1.6, function()
			dummy:Remove()
			target:SetFOV( 0, 1 )
			target:Freeze( false )
		end)
   end
})


