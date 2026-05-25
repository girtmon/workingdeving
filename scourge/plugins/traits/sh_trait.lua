local PLUGIN = PLUGIN
//
local TRAIT = {}
TRAIT.uid = "fin"
TRAIT.name = "Finnish Language"
TRAIT.desc = "You can speak Finnish. What, is your name Logon or something?.\nCommand: /fin"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "pol"
TRAIT.name = "Polish Language"
TRAIT.desc = "You can speak Polish. Not to alarm you or anything but there's something coming over the border.\nCommand: /pol"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "sign_a"
TRAIT.name = "American Sign Language"
TRAIT.desc = "You can use American Sign Language. Those afterschool high school classes really came in handy.\nCommand: /sign"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "kor"
TRAIT.name = "Korean Language"
TRAIT.desc = "You can speak Korean. Now, is it NEW Korean or OLD Korean?\nCommand: /kor"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "afr"
TRAIT.name = "Afrikaans Language"
TRAIT.desc = "You can speak Afrikaans. A certain Mr. Musk would be proud.\nCommand: /afr"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "khm"
TRAIT.name = "Khmer Language"
TRAIT.desc = "You can speak Khmer. Did YOU take part in the genocide?\nCommand: /khm"
TRAIT.category = "Language"


TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "fre"
TRAIT.name = "French Language"
TRAIT.desc = "You can speak French. Do you know all the words for surrender, too?\nCommand: /fre"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "ara"
TRAIT.name = "Arabic Language"
TRAIT.desc = "You can speak Arabic. Don't blow everyone up now.\nCommand: /ara"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "spa"
TRAIT.name = "Spanish Language"
TRAIT.desc = "You can speak Spanish. ¿Como estas senior?\nCommand: /spa"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "ger"
TRAIT.name = "German Language"
TRAIT.desc = "You can speak German. You sided with the Nazis, huh? Disgusting.\nCommand: /ger"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "rus"
TRAIT.name = "Russian Language"
TRAIT.desc = "You can speak Russian. You can speak the language, but don't even think of reinstating Communism.\nCommand: /rus"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "chi"
TRAIT.name = "Chinese Language"
TRAIT.desc = "You can speak Chinese. Insert racist joke here.\nCommand: /chi"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "ita"
TRAIT.name = "Italian Language"
TRAIT.desc = "You can speak Italian. Maybe your last name is Lamborghini?\nCommand: /ita"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "jap"
TRAIT.name = "Japanese Language"
TRAIT.desc = "You can speak Japanese. I hope you didn't masturbate to hentai.\nCommand: /jap"
TRAIT.category = "Language"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "meleespecialist" 
TRAIT.name = "Melee Weapon Specialist"
TRAIT.desc = "You have experience with weapons of all weight classes and can use them effectively. In your study of weaponry, however, you failed to focus on your acrobatic ability."
TRAIT.category = "Character"
TRAIT.blacklist = { "martialarts", "lightcombat", "dualist" }

TRAIT.modifier = {
	["lightmelee"] = 1.2,
	["mediummelee"] = 1.2,
	["heavymelee"] = 1.2,
	["reflxes"] = 0.8
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "brawler" 
TRAIT.name = "Street Brawler"
TRAIT.desc = "Be it through training or living in a rough area, you're well aware of how to effectively use your hands in combat."
TRAIT.category = "Character"
TRAIT.blacklist = { "heavycombat", "lightcombat", "dualist" }

TRAIT.modifier = {
	["lightmelee"] = 1.2,
	["mediummelee"] = 0.9,
	["heavymelee"] = 0.9,
	["meleedual"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "dualist" 
TRAIT.name = "Dualist"
TRAIT.desc = "You excel when using multiple melee weapons at once. As a trade off, you lack skill when using a single weapon."
TRAIT.category = "Character"
TRAIT.blacklist = { "martialarts", "lightcombat", "meleespecialist" }

TRAIT.modifier = {
	["mediummelee"] = 0.8,
	["lightmelee"] = 0.9,
	["meleedual"] = 1.3,
	["heavymelee"] = 0.7
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "martialartist" 
TRAIT.name = "Martial Artist"
TRAIT.desc = "You're an experienced martial artist, the type is up to you. This unlocks a new moveset at the tradeoff of crippling your characters ability to attack with medium or heavy weaponry."
TRAIT.category = "Character"
TRAIT.blacklist = { "meleespecialist", "lightcombat", "meleespecialist", "heavycombat", "dualist" }

TRAIT.modifier = {
	["mediummelee"] = 0.4,
	["lightmelee"] = 1.2,
	["meleedual"] = 1.2,
	["heavymelee"] = 0.4
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "lightcombat" 
TRAIT.name = "Light Weapons Specialist"
TRAIT.desc = "You have a great deal of experience when it comes to using weapons of a light weight. This unlocks a new moveset at the tradeoff of crippling your characters ability to attack with medium or heavy weaponry."
TRAIT.category = "Character"
TRAIT.blacklist =  { "meleespecialist", "lightcombat", "dualist", "martialartist", "heavycombat" }

TRAIT.modifier = {
	["mediummelee"] = 0.4,
	["lightmelee"] = 1.2,
	["meleedual"] = 1.2,
	["heavymelee"] = 0.4
}

TRAITS:Register( TRAIT )

//

local TRAIT = {}
TRAIT.uid = "heavycombat" 
TRAIT.name = "Heavy Weapons Specialist"
TRAIT.desc = "You are very experienced when using weapons of a heavier weight. This unlocks a new moveset at the tradeoff of crippling your characters ability to attack with medium and lightweight weaponry."
TRAIT.category = "Character"
TRAIT.blacklist =  { "meleespecialist", "lightcombat", "dualist", "martialartist", "lightcombat", }

TRAIT.modifier = {
	["mediummelee"] = 0.4,
	["lightmelee"] = 0.4,
	["meleedual"] = 0.3,
	["heavymelee"] = 1.2
}

TRAITS:Register( TRAIT )
//

local TRAIT = {}
TRAIT.uid = "fast" 
TRAIT.name = "Speed Racer"
TRAIT.desc = "You move faster then the average person yet you don't hit quite as hard."
TRAIT.category = "Character"
TRAIT.modifier = {
	["reflxes"] = 1.1,
	["dodge"] = 1.1,
	["lightmelee"] = 0.9,
	["mediummelee"] = 0.9,
	["heavymelee"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "wrestler"
TRAIT.name = "Highschool Wrestler"
TRAIT.desc = "You wrestled at the JV level in highschool. You don't remember all too much asides from a few moves. You're a great grappler but you struggle to get out of the way."
TRAIT.category = "Character"

TRAIT.modifier = {
	["grapple"] = 1.4,
	["dodge"] = 0.6
}

//
local TRAIT = {}
TRAIT.uid = "lucky" 
TRAIT.name = "Lucky Son of a Bitch"
TRAIT.desc = "You're extremely lucky in just about everything you do. I'd stay out of combat, though."
TRAIT.category = "Character"
TRAIT.modifier = {
	["luck"] = 3.0,
	["lightmelee"] = 0.5,
	["grapple"] = 0.5,
	["meleedual"] = 0.5,
	["flail"] = 0.5,
	["mediummelee"] = 0.5,
	["heavymelee"] = 0.5,
	["throw"] = 0.5,
	["block"] = 0.5
}

//
local TRAIT = {}
TRAIT.uid = "slow" 
TRAIT.name = "Slow Mover, Hard Hitter"
TRAIT.desc = "You're incredibly lethargic, though you hit incredibly hard. Melee rolls are buffed, though agility rolls are debuffed."
TRAIT.category = "Character"

TRAIT.modifier = {
	["melee"] = 1.2,
	["meleedual"] = 1.2,
	["flail"] = 1.2,
	["grapple"] = 1.2,
	["parry"] = 0.8,
	["dodge"] = 0.8,
	["reflexes"] = 0.8,
	["flee"] = 0.8
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "defender_fort" 
TRAIT.name = "Strong Flesh, Weak Will"
TRAIT.desc = "You're absolutely awful with mental defense, though your skill in physical defense is to be covetted."
TRAIT.category = "Character"

TRAIT.modifier = {
	["dodge"] = 1.3,
	["block"] = 1.3,
	["defend"] = 1.3,
	["fortitude"] = 0.6,
	["will"] = 0.6,
	["fortattack"] = 0.6
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "reflex" 
TRAIT.name = "Enhanced Reflexes"
TRAIT.desc = "Through personal experiences you have higher reflexes then the average person."
TRAIT.category = "Character"

TRAIT.modifier = {
	["reflexes"] = 1.2
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "bigbrain" 
TRAIT.name = "Intelligent"
TRAIT.desc = "You're more intelligent then the average person. Good on you."
TRAIT.category = "Character"

TRAIT.modifier = {
	["arcane"] = 1.2
}

TRAITS:Register( TRAIT )

local TRAIT = {}
TRAIT.uid = "fleshy" 
TRAIT.name = "Flesh Grower"
TRAIT.desc = "A tumorous mass grows on your body in a spot each day. It must be removed. (/removeflesh)"
TRAIT.category = "Character"

TRAITS:Register( TRAIT )
//

local PLUGIN = PLUGIN
//
local TRAIT = {}
TRAIT.uid = "werewolf" 
TRAIT.name = "Lycanism"
TRAIT.desc = "You lack memory of how, yet you feel as if you are unhuman, more beast then anything else. You are marked. (Please see forum post for: Lycans)"
TRAIT.category = "Character"
TRAIT.blacklist = "vampire"

TRAIT.func = function(client, character)
	character:setData("trait_lycanism", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "vampire" 
TRAIT.name = "Vampirism"
TRAIT.desc = "Your memory is hazy. You have fangs where your Canine teeth should be, and you have a lust to feast on blood. (Please see forum post for: Vampires)"
TRAIT.category = "Character"
TRAIT.blacklist = "werewolf"

TRAIT.func = function(client, character)
	character:setData("trait_vampirism", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "cannibal" 
TRAIT.name = "Cannibal"
TRAIT.desc = "You hunger for the taste of human flesh."
TRAIT.category = "Character"

TRAIT.func = function(client, character)
	character:setData("trait_cannibal", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "black_spot" 
TRAIT.name = "Marked Chest"
TRAIT.desc = "A large marking is visible on your chest. It's black and hard to the touch. You've had it since birth, though it's recently begun to act strangely."
TRAIT.category = "Character"

TRAIT.func = function(client, character)
	character:setData("trait_blackspot", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "red_spot" 
TRAIT.name = "Marked Leg"
TRAIT.desc = "You have a large red marking on a leg of your choice. It's hot when you touch it. At some point in the past you received it, but you don't quite recall how."
TRAIT.category = "Character"

TRAIT.func = function(client, character)
	character:setData("trait_redspot", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "preacher" 
TRAIT.name = "Religious Preacher"
TRAIT.desc = "You're a religious preacher- maybe you're an Imam, or a Preist, or potentially a Rabbi. Regardless, your mission in life is to spread the word of your god to the masses."
TRAIT.category = "Character"

TRAIT.func = function(client, character)
	character:setData("trait_zealot", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "tired" 
TRAIT.name = "Etenerally Tired"
TRAIT.desc = "You find yourself unusually tired at all times."
TRAIT.category = "Character"

TRAIT.modifier = {
	["dodge"] = 0.8,
	["block"] = 0.8
}

TRAIT.func = function(client, character)
	character:setData("trait_tired", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "headache" 
TRAIT.name = "Severe Migraine"
TRAIT.desc = "You have a migraine that just wont go away."
TRAIT.category = "Character"

TRAIT.func = function(client, character)
	character:setData("trait_headache", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "addict" 
TRAIT.name = "Addicted"
TRAIT.desc = "You bear an addiction to a drug of your choice. This addiction began at some point in the past, when is up to you."
TRAIT.category = "Character"

TRAIT.func = function(client, character)
	character:setData("trait_addict", CurTime())
end


TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "confused" 
TRAIT.name = "Extreme Confusion"
TRAIT.desc = "What the hell is going on here? Who am I? Why am I?"
TRAIT.category = "Character"

TRAIT.func = function(client, character)
	character:setData("trait_confused", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "insane" 
TRAIT.name = "Insanity"
TRAIT.desc = "You are completely insane. The degree is up to you, but you remember nothing of the past. All you know now is that your head isn't screwed on just right."
TRAIT.category = "Character"

TRAIT.modifier = {
	["arcane"] = 1.1,
	["fortitude"] = 0.9
}

TRAIT.func = function(client, character)
	character:setData("trait_insane", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "sensitive" 
TRAIT.name = "Sensitive Soul"
TRAIT.desc = "You're an overly sensitive person."
TRAIT.category = "Character"

TRAIT.func = function(client, character)
	character:setData("trait_sensitive", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "blind" 
TRAIT.name = "Lack of Eyes"
TRAIT.desc = "You have no eyes, yet you still see."
TRAIT.category = "Character"
TRAIT.modifier = {
	["fortitude"] = 2
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "deaf" 
TRAIT.name = "Lack of Ears"
TRAIT.desc = "You have no ears, and you hear not."
TRAIT.category = "Character"
TRAIT.modifier = {
	["fortitude"] = 1.2
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "mute" 
TRAIT.name = "Lack of Tongue"
TRAIT.desc = "You speak but nothing comes out. Your tongue has been removed."
TRAIT.category = "Character"
TRAIT.modifier = {
	["fortitude"] = 0.9
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "blessed" 
TRAIT.name = "Blessed"
TRAIT.desc = "You feel blessed in some way."
TRAIT.category = "Character"
TRAIT.items = {
	"j_scrap_holywater"
}

TRAITS:Register(TRAIT)
//
local TRAIT = {}
TRAIT.uid = "heartless" 
TRAIT.name = "Lack of Heart"
TRAIT.desc = "You place your hand to your heart, and yet no movement is felt. Your chest feels hollow. Are you dreaming?"
TRAIT.category = "Character"
TRAIT.modifier = {
	["str"] = 0.5
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "retarded" 
TRAIT.name = "Lack of Brain"
TRAIT.desc = "Your head is hollow. You are a blank slate of lower intelligence."
TRAIT.category = "Character"
TRAIT.modifier = {
	["arcane"] = 0
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "superretarded" 
TRAIT.name = "Mentally Retarded"
TRAIT.desc = "You function on a lower level then most others. You're an outcast, with sub par intelligence."
TRAIT.category = "Character"
TRAIT.modifier = {
	["arcane"] = 0
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "pegleg" 
TRAIT.name = "Peg Limb (Leg)"
TRAIT.desc = "One or both of your legs have been replaced with wooden or metallic pegs. You can't use them very affectively."
TRAIT.category = "Character"
TRAIT.modifier = {
	["stm"] = 0.1
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "pegarm" 
TRAIT.name = "Peg Limb (Arm)"
TRAIT.desc = "One or both of your arms have been replaced with wooden or metallic pegs. You can't use them very affectively."
TRAIT.category = "Character"
TRAIT.modifier = {
	["str"] = 0.1
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "strongmind" 
TRAIT.name = "Mental Fortitude"
TRAIT.desc = "You consider yourself adjusted to the dark side of humanity. The horrors that await you affect you far less then they would a typical person."
TRAIT.category = "Character"
TRAIT.modifier = {
	["fortitude"] = 1.1
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "murderous" 
TRAIT.name = "Murderer"
TRAIT.desc = "You must kill."
TRAIT.category = "Character"

TRAIT.func = function(client, character)
	character:setData("trait_murderous", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "necrophiliac" 
TRAIT.name = "Necrophiliac"
TRAIT.desc = "You sure do you love you some corpses."
TRAIT.category = "Character"
TRAIT.items = {
	"j_skull"
}

TRAIT.func = function(client, character)
	character:setData("trait_necrophiliac", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "mother" 
TRAIT.name = "Mother"
TRAIT.desc = "A caring mother tasked with taking care of her child. You must protect your son/daughter."
TRAIT.category = "Character"
TRAIT.items = {
	"food_baby"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "father" 
TRAIT.name = "Father"
TRAIT.desc = "A caring father tasked with taking care of his child. You must protect your son/daughter."
TRAIT.category = "Character"
TRAIT.items = {
	"food_baby"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "psychic" 
TRAIT.name = "Psychic Doctor"
TRAIT.desc = "You have a natural talent for diagnosing peoples illnesses. You can /diagnose to diagnose an ailment."
TRAIT.category = "Character"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "etherwise" 
TRAIT.name = "Etherwise Individual"
TRAIT.desc = "A person of true raw talent- you have basic knowledge and ability in magicka."
TRAIT.category = "Character"

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "pithic_school" 
TRAIT.name = "Pithic School"
TRAIT.desc = "You are an indvidual with deep knowledge of the Pithic arts."
TRAIT.category = "Character"
TRAIT.blacklist = { "composite_school", "abberant_school" }

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "composite_school" 
TRAIT.name = "Composite School"
TRAIT.desc = "You are an indvidual with deep knowledge of the Composite arts."
TRAIT.category = "Character"
TRAIT.blacklist = { "abberant_school", "pithic_school" }

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "abberant_school" 
TRAIT.name = "Abberant School"
TRAIT.desc = "You are an indvidual with deep knowledge of the Abberant arts."
TRAIT.category = "Character"
TRAIT.blacklist = { "composite_school", "pithic_school" }

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "gaunt" 
TRAIT.name = "Gaunt"
TRAIT.desc = "You're all skin and bones."
TRAIT.category = "Character"

TRAIT.modifier = {
	["fortitude"] = 0.8,
	["dexterity"] = 1.1
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "disease" 
TRAIT.name = "Survivor"
TRAIT.desc = "You've been through something like this before."
TRAIT.category = "Character"
TRAIT.items = {
	"j_dust_mask"
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "hair" 
TRAIT.name = "Trichotillomaniac"
TRAIT.desc = "You have the urge to rip your hair out of your skin no matter what. It itches, it must go."
TRAIT.category = "Character"

TRAIT.func = function(client, character)
	character:setData("trait_trich", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "amputee" 
TRAIT.name = "Apotemnophiliac"
TRAIT.desc = "Your limbs just gotta go."
TRAIT.category = "Character"

TRAIT.func = function(client, character)
	character:setData("trait_apote", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "cotard" 
TRAIT.name = "Cotards Delusion"
TRAIT.desc = "Are you even alive?"
TRAIT.category = "Character"

TRAIT.func = function(client, character)
	character:setData("trait_cotard", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "alienhand" 
TRAIT.name = "Alien Hand Syndrome"
TRAIT.desc = "Your left hand seems to have a mind of it's own."
TRAIT.category = "Character"

TRAIT.func = function(client, character)
	character:setData("trait_lefty", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "dermatillomania" 
TRAIT.name = "Dermatillomaniac"
TRAIT.desc = "You have an urge to pick at your skin."
TRAIT.category = "Character"

TRAIT.func = function(client, character)
	character:setData("trait_derma", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "algolagniac" 
TRAIT.name = "Algolagniac"
TRAIT.desc = "You have a desire for pain and injury."
TRAIT.category = "Character"

TRAIT.func = function(client, character)
	character:setData("trait_algo", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "piquerism" 
TRAIT.name = "Piquerism"
TRAIT.desc = "You have the innate desire to pierce anothers skin with sharp objects."
TRAIT.category = "Character"

TRAIT.func = function(client, character)
	character:setData("trait_piqu", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "twitchy" 
TRAIT.name = "Twitchy"
TRAIT.desc = "You twitch way more then is healthy."
TRAIT.category = "Character"

TRAIT.func = function(client, character)
	character:setData("trait_twitch", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "panphobia" 
TRAIT.name = "Panphobic"
TRAIT.desc = "You fear unlike others."
TRAIT.category = "Character"

TRAIT.func = function(client, character)
	character:setData("trait_panph", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "hexakosioihexekontahexaphobia" 
TRAIT.name = "Hexakosioihexekontahexaphobiac"
TRAIT.desc = "You fear the beasts mark."
TRAIT.category = "Character"

TRAIT.func = function(client, character)
	character:setData("trait_hexa", CurTime())
end

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "couch_potato" 
TRAIT.name = "Couch Potato"
TRAIT.desc = "You're a worthless fat sack of shit who sits on the couch all day."
TRAIT.category = "Character"

TRAIT.modifier = {
	["stm"] = 0.5,
	["str"] = 0.5
}

TRAITS:Register( TRAIT )
//
local TRAIT = {}
TRAIT.uid = "medication_dependant" 
TRAIT.name = "Un-Medicated"
TRAIT.desc = "You've been deprived of your medication for a long time. The symptoms of withdrawl have set in permanently."
TRAIT.category = "Character"

TRAIT.modifier = {
	["stm"] = 0.8
}

TRAITS:Register( TRAIT )