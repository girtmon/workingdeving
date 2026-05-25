local PLUGIN = PLUGIN

--melee commands
//
local COMMAND = {}
COMMAND.uid = "mediummelee"
COMMAND.name = "Medium Melee"
COMMAND.desc = "For basic melee attacks with medium weapons."
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.4,
	["dexterity"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "a medium weapon melee attack"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "lightmelee"
COMMAND.name = "Light Melee"
COMMAND.desc = "For basic melee attacks with light weaponry."
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.2,
	["dexterity"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "a light weapon melee attack"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "evokemana"
COMMAND.name = "Evoke Mana"
COMMAND.desc = "For evoking ones mana."
COMMAND.category = "special"
COMMAND.stats = {
	["arcane"] = 0.4,
	["luck"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "to evoke their own mana"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "streamsense"
COMMAND.name = "Stream Sense"
COMMAND.desc = "For sensing around themselves"
COMMAND.category = "special"
COMMAND.stats = {
	["arcane"] = 0.2,
	["luck"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "a streamsense"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "guardanima"
COMMAND.name = "Guard Anima"
COMMAND.desc = "For guarding your own anima"
COMMAND.category = "special"
COMMAND.stats = {
	["arcane"] = 0.2,
	["luck"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "guarding their anima"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "compositemagick"
COMMAND.name = "Composite Magick"
COMMAND.desc = "For composite magick abilities"
COMMAND.category = "special"
COMMAND.stats = {
	["arcane"] = 0.2,
	["luck"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "composite magick"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "beg"
COMMAND.name = "Beg"
COMMAND.desc = "For last resorts"
COMMAND.category = "special"
COMMAND.stats = {
	["fortitude"] = 0.6,
	["luck"] = 0.4
}
COMMAND.mult = 1
COMMAND.attackString = "begging"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )


//
local COMMAND = {}
COMMAND.uid = "aberrantmagick"
COMMAND.name = "Aberrant Magick"
COMMAND.desc = "For aberrant magick abilities"
COMMAND.category = "special"
COMMAND.stats = {
	["arcane"] = 0.2,
	["luck"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "aberrant magick"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "pithicmagick"
COMMAND.name = "Pithic Magick"
COMMAND.desc = "For pithich magick abilities"
COMMAND.category = "special"
COMMAND.stats = {
	["arcane"] = 0.2,
	["luck"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "pithic magick"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "heavymelee"
COMMAND.name = "Heavy Melee"
COMMAND.desc = "For basic melee attacks with heavy weaponry."
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.6,
	["dexterity"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "a heavy weapon melee attack"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )


//
local COMMAND = {}
COMMAND.uid = "grapple"
COMMAND.name = "Grapple"
COMMAND.desc = "Used to grab a target, preventing them from escaping or properly using weapons in most cases (situational). They use their turn to try and break free (/grapple vs /grapple)."
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.4,
	["dexterity"] = 0.2,
	["stm"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "a grappling maneuver"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "meleedual"
COMMAND.name = "Dual Melee"
COMMAND.desc = "Two melee attacks at the same time on the same target."
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.7,
	["dexterity"] = 0.3
}
COMMAND.mult = 0.6
COMMAND.attackString = "a dual melee attack"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10)),
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "flail"
COMMAND.name = "Flailing Melee"
COMMAND.desc = "A flailing melee attack, typically not the best choice."
COMMAND.category = "melee"
COMMAND.stats = {
	["luck"] = 0.5
}
COMMAND.mult = 0.35
COMMAND.attackString = "a flailing melee attack"
COMMAND.rolls = function(base)
	local rolls = {}
	
	for i=0, math.random(1,3) do
		table.insert(rolls, math.abs(base + math.random(-10,10)))
	end
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "disarm"
COMMAND.name = "Disarm"
COMMAND.desc = "Melee attack used to disarm a target. Cannot be used if target's weapon is not easily removed (attached to body, claws, etc.)"
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.4,
	["stm"] = 0.2
}
COMMAND.mult = 0.8
COMMAND.attackString = "a disarming maneuver"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )


//
local COMMAND = {}
COMMAND.uid = "throw"
COMMAND.name = "Throw"
COMMAND.desc = "Ranged roll for throwing an object of any kind. Can be blocked like a melee attack."
COMMAND.category = "firearms"
COMMAND.stats = {
	["str"] = 0.2,
	["dexterity"] = 0.3
}
COMMAND.mult = 1
COMMAND.attackString = "a thrown object"
COMMAND.parts = true
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )



--reaction/resist commands
//
local COMMAND = {}
COMMAND.uid = "sneak"
COMMAND.name = "Sneak"
COMMAND.desc = "Used for sneaking by a target. Rolled against /perception. Only works if it makes sense in the situation. No sneak attack bonus is provided, but you can use it to get to a better position. If sneaking by multiple targets, all applicable targets should roll /perception."
COMMAND.category = "react"
COMMAND.stats = {
	["stm"] = 0.5
}
COMMAND.mult = 0.8
COMMAND.attackString = "sneaking"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "endure"
COMMAND.name = "Endure"
COMMAND.desc = "Used to roll resistance against physical effects like flashbangs, tear gas, fire, poison, etc."
COMMAND.category = "resist"
COMMAND.stats = {
	["end"] = 0.4,
	["fortitude"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "endurance"
COMMAND.noCrit = true
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "will"
COMMAND.name = "Will"
COMMAND.desc = "Used to control aberration items, limbs, or other constructs."
COMMAND.category = "resist"
COMMAND.stats = {
	["end"] = 0.25,
	["fortitude"] = 0.25
}
COMMAND.mult = 1
COMMAND.attackString = "willpower"
COMMAND.noCrit = true
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "fortitude"
COMMAND.name = "Fortitude"
COMMAND.desc = "Used to roll resistance against mental and hallucination based effects like blue haze grenades, hallucinogens, fortitude based attacks, etc."
COMMAND.category = "resist"
COMMAND.stats = {
	["end"] = 0.1,
	["fortitude"] = 0.4
}
COMMAND.mult = 1
COMMAND.attackString = "fortitude"
COMMAND.noCrit = true
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "dodge"
COMMAND.name = "Dodge"
COMMAND.desc = "Determines if an attack is dodged, or if the projectile fired at you will miss. Can also be used to avoid /grapple. Has a chance to turn into a 'graze', which only partially dodges an attack. If the spot being grazed is an organ, or is mostly inside of the body, you will be simply hit in the body nearby that part. Grazes are counted as full dodges if you are protected by cover at all in the direction of your attacker."
COMMAND.category = "react"
COMMAND.stats = {
	["stm"] = 0.35,
	["str"] = 0.2
}
COMMAND.mult = 1
COMMAND.attackString = "a dodge/miss"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end
COMMAND.print = function(client, roll, part, critmsg)
	local name
	if(client:IsPlayer()) then
		name = client:Name()
	else
		name = client:getNetVar("name", "ENT")
	end

	
	if(math.random(1,10) <= 7) then --normal dodge
		nut.log.addRaw(name.." rolled \"" ..roll.. "\" for a dodge.", 2)
		if(client:IsPlayer()) then
			nut.chat.send(client, COMMAND.category, "has rolled " ..roll..critmsg.. " for " ..COMMAND.attackString.. ".")
		else
			nut.chat.send(client, COMMAND.category.."_npc", name.. " has rolled " ..roll..critmsg.. " for " ..COMMAND.attackString.. ".")	
		end
	else --grazes
		nut.log.addRaw(name.." rolled \"" ..roll.. "\" for a graze.", 2)
		if(client:IsPlayer()) then
			nut.chat.send(client, "graze", "has rolled " ..roll..critmsg.. " for a graze.")
		else
			nut.chat.send(client, "graze_npc", name.. " has rolled " ..roll..critmsg.. " for a graze.")
		end
	end
end

CMBT:Register(COMMAND)

//
local COMMAND = {}
COMMAND.uid = "block"
COMMAND.name = "Block"
COMMAND.desc = "Determines if an attack is blocked. Cannot be used against bullets. If a thrown object is blocked, it is mostly stopped or deflected."
COMMAND.category = "react"
COMMAND.stats = {
	["end"] = 0.3,
	["str"] = 0.2
}
COMMAND.mult = 0.85
COMMAND.attackString = "a block"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "parry"
COMMAND.name = "Parry"
COMMAND.desc = "Determines if an attack is blocked, and allows for a counter attack. Cannot be used against bullets. If a thrown object is blocked, it can be reflected (be reasonable). If the parry succeeds against an applicable attack, attacker must roll a defensive roll (block, dodge, parry) against the previous parry roll. If the defensive roll succeeds, the attack is only blocked and the counter attack is avoided."
COMMAND.category = "react"
COMMAND.stats = {
	["str"] = 0.1,
	["dexterity"] = 0.1,
	["stm"] = 0.1,
	["end"] = 0.1
}
COMMAND.mult = 0.8
COMMAND.attackString = "parrying"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "flee"
COMMAND.name = "Flee"
COMMAND.desc = "Used to attempt flight from the current combat. Enemies are allowed to counter your roll with anything that would reasonably stop you from getting away. If you beat all of their rolls, you can leave the area (unless prevented by present circumstances.) This command is likely to be reworked soon."
COMMAND.category = "react"
COMMAND.stats = {
	["stm"] = 0.5
}
COMMAND.mult = 1
COMMAND.attackString = "a flee attempt"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "reflexes"
COMMAND.name = "Reflexes"
COMMAND.desc = "Used at the beginning of the fight to determine turn order. Some events may not require this command at all, and some may use it for different purposes."
COMMAND.category = "react"
COMMAND.stats = {
	["stm"] = 0.5
}
COMMAND.mult = 1
COMMAND.attackString = "reflexes"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

--special
//
local COMMAND = {}
COMMAND.uid = "backstab"
COMMAND.name = "Backstab"
COMMAND.desc = "Used when behind a target that is not aware of you (is engaged with something else, can't react to you, or doesn't know you're there.) Can be used with any melee weapon that has a blade."
COMMAND.category = "special"
COMMAND.stats = {
	["str"] = 0.1,
	["dexterity"] = 0.15,
	["stm"] = 0.25
}
COMMAND.mult = 1.5
COMMAND.attackString = "a backstab"
COMMAND.rolls = function(base, attribs)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "rapidstab"
COMMAND.name = "Rapid Stabbing"
COMMAND.desc = "A flurry of stabs, can only be used with one handed stabbing weapons (knives, shivs, etc)."
COMMAND.category = "special"
COMMAND.stats = {
	["str"] = 0.2,
	["dexterity"] = 0.1,
	["stm"] = 0.2
}
COMMAND.mult = 1
COMMAND.attackString = "a rapid stab"
COMMAND.rolls = function(base, attribs)
	local roll = math.abs(base + math.random(-10,10))
	local rolls = { 
		roll, 
		roll * 0.8, 
		roll * 0.6, 
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "defend"
COMMAND.name = "Defend"
COMMAND.desc = "Allows you to block an incoming attack on an alley, either with a weapon or your body. You must be near the target you wish to defend. A failure of this roll means that you will be hit instead, but your target will be protected. This roll can be used against bullets, but you must be able to see the enemy firing at the person you are defending. In that case, you are getting hit by the bullets in place of the one you're defending. This ability requires the Defender trait."
COMMAND.category = "special"
COMMAND.stats = {
	["str"] = 0.1,
	["end"] = 0.2,
	["stm"] = 0.2
}
COMMAND.mult = 0.8
COMMAND.attackString = "defending a target"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )
//
local COMMAND = {}
COMMAND.uid = "interact"
COMMAND.name = "Interact"
COMMAND.desc = "An extra command that has no direct use unless the person running the event has assigned it one. This will typically be used for interacting with objects such as computers, machines, etc."
COMMAND.category = "special"
COMMAND.stats = {
	["luck"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "interacting with something"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )
//
local COMMAND = {}
COMMAND.uid = "shank"
COMMAND.name = "Shank"
COMMAND.desc = "A quick stab to the lower region of a person body."
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.2,
	["dexterity"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "a shank with a light melee weapon"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )
//
local COMMAND = {}
COMMAND.uid = "backkick"
COMMAND.name = "Back Kick"
COMMAND.desc = "A kick thrown behind you."
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.3,
	["dexterity"] = 0.1,
	["stm"] = 0.2
}
COMMAND.mult = 1
COMMAND.attackString = "a back kick"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )
//
local COMMAND = {}
COMMAND.uid = "frontkick"
COMMAND.name = "Front Kick"
COMMAND.desc = "A kick thrown at a target infront of you."
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.3,
	["dexterity"] = 0.1,
	["stm"] = 0.2
}
COMMAND.mult = 1
COMMAND.attackString = "a front kick"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )
//
local COMMAND = {}
COMMAND.uid = "sidekick"
COMMAND.name = "Side Kick"
COMMAND.desc = "A kick utilizing your entire leg as well as the foot sword."
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.3,
	["dexterity"] = 0.1,
	["stm"] = 0.2
}
COMMAND.mult = 1
COMMAND.attackString = "a side kick"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )
//
local COMMAND = {}
COMMAND.uid = "flyingsidekick"
COMMAND.name = "Flying Side Kick"
COMMAND.desc = "A kick utilizing your entire leg as well as the foot sword. Instead of being grounded, you ran up and did this mid air."
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.3,
	["dexterity"] = 0.1,
	["stm"] = 0.2
}
COMMAND.mult = 1
COMMAND.attackString = "a flying side kick"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )
//
local COMMAND = {}
COMMAND.uid = "uppercut"
COMMAND.name = "Uppercut"
COMMAND.desc = "A punch thrown upwards."
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.4,
	["dexterity"] = 0.3,
	["stm"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "an uppercut"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )
//
local COMMAND = {}
COMMAND.uid = "haymaker"
COMMAND.name = "Haymaker"
COMMAND.desc = "A devestating punch."
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.4,
	["dexterity"] = 0.1,
	["stm"] = 0.2
}
COMMAND.mult = 1
COMMAND.attackString = "a haymaker"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )
//
local COMMAND = {}
COMMAND.uid = "hook"
COMMAND.name = "Hook"
COMMAND.desc = "A punch thrown."
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.5,
	["dexterity"] = 0.1,
	["stm"] = 0.3
}
COMMAND.mult = 1
COMMAND.attackString = "a hook"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )
//
local COMMAND = {}
COMMAND.uid = "overhead"
COMMAND.name = "Overhead Swing"
COMMAND.desc = "A swing that involves going over a person head and down on them- hard."
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.3,
	["dexterity"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "a overhead swing"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )