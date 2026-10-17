-- local zone = "Battle of Dazar'alor"
local zoneid = 1358
local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = PlexusStatus:GetModule("PlexusStatusRaidDebuff", true)
local function WhenRaidDebuffReady(callback)
    if PlexusStatusRaidDebuff and PlexusStatusRaidDebuff.options then
        callback(PlexusStatusRaidDebuff)
        return
    end
    C_Timer.After(1, function()
        if PlexusStatusRaidDebuff and PlexusStatusRaidDebuff.options then
            callback(PlexusStatusRaidDebuff)
        end
    end)
end
WhenRaidDebuffReady(function(PlexusStatusRaidDebuff)
-- Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 289384, 1, 5, 5, true) --Savage Swipe
PlexusStatusRaidDebuff:DebuffId(zoneid, 287437, 1, 5, 5, true) --Frozen Beam
PlexusStatusRaidDebuff:DebuffId(zoneid, 287294, 1, 5, 5, true) --Blizzard
PlexusStatusRaidDebuff:DebuffId(zoneid, 286740, 1, 5, 5, true) --Light's Fury
PlexusStatusRaidDebuff:DebuffId(zoneid, 285250, 1, 5, 5, true) --Sundering Slam
PlexusStatusRaidDebuff:DebuffId(zoneid, 289645, 1, 5, 5, true) --Polymorph
PlexusStatusRaidDebuff:DebuffId(zoneid, 289578, 1, 5, 5, true) --Lit Torch
PlexusStatusRaidDebuff:DebuffId(zoneid, 287325, 1, 5, 5, true) --Comet Storm
PlexusStatusRaidDebuff:DebuffId(zoneid, 289772, 1, 5, 5, true) --Impale
PlexusStatusRaidDebuff:DebuffId(zoneid, 285292, 1, 5, 5, true) --Frozen Tides
PlexusStatusRaidDebuff:DebuffId(zoneid, 285280, 1, 5, 5, true) --Searing Waves
PlexusStatusRaidDebuff:DebuffId(zoneid, 287147, 1, 5, 5, true) --Dread Reaping
PlexusStatusRaidDebuff:DebuffId(zoneid, 284573, 1, 5, 5, true) --Tailwinds
PlexusStatusRaidDebuff:DebuffId(zoneid, 253562, 1, 5, 5, true) --Wildfire
PlexusStatusRaidDebuff:DebuffId(zoneid, 289917, 1, 5, 5, true) --Bwonsamdi's Pact
PlexusStatusRaidDebuff:DebuffId(zoneid, 289418, 1, 5, 5, true) --Predator's Gaze
PlexusStatusRaidDebuff:DebuffId(zoneid, 287295, 1, 5, 5, true) --Chilled
PlexusStatusRaidDebuff:DebuffId(zoneid, 289937, 1, 5, 5, true) --Thundering Slam
PlexusStatusRaidDebuff:DebuffId(zoneid, 289514, 1, 5, 5, true) --Molten Ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 289512, 1, 5, 5, true) --Molten Punch
PlexusStatusRaidDebuff:DebuffId(zoneid, 289373, 1, 5, 5, true) --Lacerating Pounce
PlexusStatusRaidDebuff:DebuffId(zoneid, 287456, 1, 5, 5, true) --Frost Nova
PlexusStatusRaidDebuff:DebuffId(zoneid, 287556, 1, 5, 5, true) --Soul Barrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 289484, 1, 5, 5, true) --Burning Bite
PlexusStatusRaidDebuff:DebuffId(zoneid, 289918, 1, 5, 5, true) --Bwonsamdi's Bargain

-- Champion of the Light
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Champion of the Light")
PlexusStatusRaidDebuff:DebuffId(zoneid, 283573, 11, 5, 5, true) --Sacred Blade
PlexusStatusRaidDebuff:DebuffId(zoneid, 284595, 12, 5, 5, true) --Penance
PlexusStatusRaidDebuff:DebuffId(zoneid, 283617, 13, 5, 5, true) --Wave of Light
PlexusStatusRaidDebuff:DebuffId(zoneid, 283651, 14, 5, 5, true) --Blinding Faith
PlexusStatusRaidDebuff:DebuffId(zoneid, 283582, 15, 5, 5, true) --Consecration

-- Grong
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Grong")
PlexusStatusRaidDebuff:DebuffId(zoneid, 282010, 21, 5, 5, true) --Shattered
PlexusStatusRaidDebuff:DebuffId(zoneid, 285875, 22, 5, 5, true) --Rending Bite
PlexusStatusRaidDebuff:DebuffId(zoneid, 289307, 23, 5, 5, true) --Bestial Throw Target
PlexusStatusRaidDebuff:DebuffId(zoneid, 283069, 24, 5, 5, true) --Megatomic Fire
PlexusStatusRaidDebuff:DebuffId(zoneid, 289292, 25, 5, 5, true) --Bestial Throw
PlexusStatusRaidDebuff:DebuffId(zoneid, 285998, 26, 5, 5, true) --Ferocious Roar
PlexusStatusRaidDebuff:DebuffId(zoneid, 285671, 27, 5, 5, true) --Crushed
PlexusStatusRaidDebuff:DebuffId(zoneid, 285659, 28, 5, 5, true) --Apetagonizer Core
PlexusStatusRaidDebuff:DebuffId(zoneid, 289412, 29, 5, 5, true) --Bestial Impact

-- Jadefire Masters
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Jadefire Masters")
PlexusStatusRaidDebuff:DebuffId(zoneid, 284374, 41, 5, 5, true) --Magma Trap
PlexusStatusRaidDebuff:DebuffId(zoneid, 282037, 42, 5, 5, true) --Rising Flames
PlexusStatusRaidDebuff:DebuffId(zoneid, 286503, 43, 5, 5, true) --Beam
PlexusStatusRaidDebuff:DebuffId(zoneid, 288151, 44, 5, 5, true) --Tested
PlexusStatusRaidDebuff:DebuffId(zoneid, 284089, 45, 5, 5, true) --Successful Defense
PlexusStatusRaidDebuff:DebuffId(zoneid, 285632, 46, 5, 5, true) --Stalking
PlexusStatusRaidDebuff:DebuffId(zoneid, 286369, 47, 5, 5, true) --Chi-Ji's Song
PlexusStatusRaidDebuff:DebuffId(zoneid, 287747, 48, 5, 5, true) --Force Orb
PlexusStatusRaidDebuff:DebuffId(zoneid, 286988, 49, 7, 7, true, true) --Searing Embers
PlexusStatusRaidDebuff:DebuffId(zoneid, 284453, 50, 5, 5, true) --Chi-Ji's Song
PlexusStatusRaidDebuff:DebuffId(zoneid, 288051, 51, 5, 5, true) --Dragon's Breath

-- Opulence
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Opulence")
PlexusStatusRaidDebuff:DebuffId(zoneid, 284881, 61, 5, 5, true) --Opal of Unleashed Rage
PlexusStatusRaidDebuff:DebuffId(zoneid, 284611, 62, 5, 5, true) --Ruby of Focused Animus
PlexusStatusRaidDebuff:DebuffId(zoneid, 284883, 63, 5, 5, true) --Unleashed Rage
PlexusStatusRaidDebuff:DebuffId(zoneid, 284567, 64, 5, 5, true) --Tailwind Sapphire
PlexusStatusRaidDebuff:DebuffId(zoneid, 284558, 65, 5, 5, true) --Amethyst of the Shadow King
PlexusStatusRaidDebuff:DebuffId(zoneid, 284537, 66, 5, 5, true) --Tailwinds
PlexusStatusRaidDebuff:DebuffId(zoneid, 284556, 67, 5, 5, true) --Shadow-Touched
PlexusStatusRaidDebuff:DebuffId(zoneid, 284814, 68, 5, 5, true) --Emerald of Earthen Roots
PlexusStatusRaidDebuff:DebuffId(zoneid, 284527, 69, 5, 5, true) --Diamond of the Unshakeable Protector
PlexusStatusRaidDebuff:DebuffId(zoneid, 284645, 70, 5, 5, true) --Topaz of Brilliant Sunlight
PlexusStatusRaidDebuff:DebuffId(zoneid, 284664, 71, 5, 5, true) --Incandescence
PlexusStatusRaidDebuff:DebuffId(zoneid, 284817, 72, 5, 5, true) --Earthen Roots
PlexusStatusRaidDebuff:DebuffId(zoneid, 283507, 73, 5, 5, true) --Volatile Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 284546, 74, 5, 5, true) --Depleted Diamond
PlexusStatusRaidDebuff:DebuffId(zoneid, 290654, 75, 5, 5, true) --Soothing Breeze
PlexusStatusRaidDebuff:DebuffId(zoneid, 287072, 76, 5, 5, true) --Liquid Gold
PlexusStatusRaidDebuff:DebuffId(zoneid, 284798, 77, 5, 5, true) --Grossly Incandescent!
PlexusStatusRaidDebuff:DebuffId(zoneid, 284802, 78, 5, 5, true) --Brilliant Aura
PlexusStatusRaidDebuff:DebuffId(zoneid, 284493, 79, 5, 5, true) --Pulse-quickening Toxin
PlexusStatusRaidDebuff:DebuffId(zoneid, 287424, 80, 5, 5, true) --Thief's Bane
PlexusStatusRaidDebuff:DebuffId(zoneid, 285014, 81, 5, 5, true) --Coin Shower
PlexusStatusRaidDebuff:DebuffId(zoneid, 284519, 82, 5, 5, true) --Quickened Pulse
PlexusStatusRaidDebuff:DebuffId(zoneid, 287648, 83, 5, 5, true) --Volatile Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 283610, 84, 5, 5, true) --Crush
PlexusStatusRaidDebuff:DebuffId(zoneid, 284424, 85, 5, 5, true) --Scorching Ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 284470, 86, 5, 5, true) --Hex of Lethargy
PlexusStatusRaidDebuff:DebuffId(zoneid, 284472, 87, 5, 5, true) --Deadly Hex
PlexusStatusRaidDebuff:DebuffId(zoneid, 286501, 88, 5, 5, true) --Creeping Blaze
PlexusStatusRaidDebuff:DebuffId(zoneid, 285479, 89, 5, 5, true) --Flame Jet
PlexusStatusRaidDebuff:DebuffId(zoneid, 287074, 90, 5, 5, true) --Molten Gold
PlexusStatusRaidDebuff:DebuffId(zoneid, 283063, 91, 5, 5, true) --Flames of Punishment

-- Conclave of the Chosen
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Conclave of the Chosen")
PlexusStatusRaidDebuff:DebuffId(zoneid, 282592, 101, 5, 5, true) --Bleeding Wounds
PlexusStatusRaidDebuff:DebuffId(zoneid, 282444, 102, 5, 5, true) --Lacerating Claws
PlexusStatusRaidDebuff:DebuffId(zoneid, 71909, 103, 5, 5, true) --Heartbroken
PlexusStatusRaidDebuff:DebuffId(zoneid, 282209, 104, 5, 5, true) --Mark of Prey
PlexusStatusRaidDebuff:DebuffId(zoneid, 285879, 105, 5, 5, true) --Mind Wipe
PlexusStatusRaidDebuff:DebuffId(zoneid, 282135, 106, 5, 5, true) --Crawling Hex
PlexusStatusRaidDebuff:DebuffId(zoneid, 282834, 107, 5, 5, true) --Kimbul's Wrath
PlexusStatusRaidDebuff:DebuffId(zoneid, 286060, 108, 5, 5, true) --Cry of the Fallen
PlexusStatusRaidDebuff:DebuffId(zoneid, 286811, 109, 5, 5, true) --Akunda's Wrath
PlexusStatusRaidDebuff:DebuffId(zoneid, 286838, 111, 5, 5, true) --Static Orb

-- King Rastakhan
PlexusStatusRaidDebuff:BossNameId(zoneid, 120, "King Rastakhan")
PlexusStatusRaidDebuff:DebuffId(zoneid, 285195, 121, 5, 5, true) --Deathly Withering
PlexusStatusRaidDebuff:DebuffId(zoneid, 286742, 122, 5, 5, true) --Necrotic Smash
PlexusStatusRaidDebuff:DebuffId(zoneid, 288449, 123, 5, 5, true) --Death's Door
PlexusStatusRaidDebuff:DebuffId(zoneid, 284455, 124, 5, 5, true) --Realm of Death
PlexusStatusRaidDebuff:DebuffId(zoneid, 285044, 125, 5, 5, true) --Toad Toxin
PlexusStatusRaidDebuff:DebuffId(zoneid, 284831, 126, 5, 5, true) --Scorching Detonation
PlexusStatusRaidDebuff:DebuffId(zoneid, 288415, 127, 5, 5, true) --Caress of Death
PlexusStatusRaidDebuff:DebuffId(zoneid, 285349, 128, 5, 5, true) --Plague of Fire
PlexusStatusRaidDebuff:DebuffId(zoneid, 289858, 129, 5, 5, true) --Crushed
PlexusStatusRaidDebuff:DebuffId(zoneid, 284995, 130, 5, 5, true) --Zombie Dust
PlexusStatusRaidDebuff:DebuffId(zoneid, 286779, 131, 5, 5, true) --Focused Demise
PlexusStatusRaidDebuff:DebuffId(zoneid, 285213, 132, 5, 5, true) --Caress of Death
PlexusStatusRaidDebuff:DebuffId(zoneid, 284376, 133, 5, 5, true) --Death's Presence
PlexusStatusRaidDebuff:DebuffId(zoneid, 290450, 134, 5, 5, true) --Seal of Purification
PlexusStatusRaidDebuff:DebuffId(zoneid, 285178, 135, 5, 5, true) --Serpent's Breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 285010, 136, 5, 5, true) --Poison Toad Slime
PlexusStatusRaidDebuff:DebuffId(zoneid, 284781, 127, 5, 5, true) --Grievous Axe
PlexusStatusRaidDebuff:DebuffId(zoneid, 290448, 138, 5, 5, true) --Seal of Purification

-- Mekkatorque
PlexusStatusRaidDebuff:BossNameId(zoneid, 150, "Mekkatorque")
PlexusStatusRaidDebuff:DebuffId(zoneid, 288806, 151, 5, 5, true) --Gigavolt Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 286646, 152, 5, 5, true) --Gigavolt Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 286105, 153, 5, 5, true) --Tampering!
PlexusStatusRaidDebuff:DebuffId(zoneid, 284168, 154, 5, 5, true) --Shrunk
PlexusStatusRaidDebuff:DebuffId(zoneid, 287891, 155, 5, 5, true) --Sheep Shrapnel
PlexusStatusRaidDebuff:DebuffId(zoneid, 282182, 156, 5, 5, true) --Buster Cannon
PlexusStatusRaidDebuff:DebuffId(zoneid, 282408, 157, 5, 5, true) --Spark Pulse
PlexusStatusRaidDebuff:DebuffId(zoneid, 284214, 158, 5, 5, true) --Trample

-- Stormwall Blockade
PlexusStatusRaidDebuff:BossNameId(zoneid, 170, "Stormwall Blockade")
PlexusStatusRaidDebuff:DebuffId(zoneid, 285000, 171, 5, 5, true) --Kelp-Wrapped
PlexusStatusRaidDebuff:DebuffId(zoneid, 285075, 172, 5, 5, true) --Freezing Tidepool
PlexusStatusRaidDebuff:DebuffId(zoneid, 285382, 173, 5, 5, true) --Kelp Wrapping
PlexusStatusRaidDebuff:DebuffId(zoneid, 285426, 174, 5, 5, true) --Storm's Wail
PlexusStatusRaidDebuff:DebuffId(zoneid, 285420, 175, 5, 5, true) --Unbound Energy
PlexusStatusRaidDebuff:DebuffId(zoneid, 285350, 176, 5, 5, true) --Storm's Wail
PlexusStatusRaidDebuff:DebuffId(zoneid, 284369, 177, 5, 5, true) --Sea Storm
PlexusStatusRaidDebuff:DebuffId(zoneid, 284405, 178, 5, 5, true) --Tempting Song
PlexusStatusRaidDebuff:DebuffId(zoneid, 284121, 179, 5, 5, true) --Thunderous Boom
PlexusStatusRaidDebuff:DebuffId(zoneid, 290437, 180, 5, 5, true) --Reaching Attack
PlexusStatusRaidDebuff:DebuffId(zoneid, 286680, 181, 5, 5, true) --Roiling Tides

-- Lady Jaina Proudmoore
PlexusStatusRaidDebuff:BossNameId(zoneid, 190, "Lady Jaina Proudmoore")
PlexusStatusRaidDebuff:DebuffId(zoneid, 287993, 191, 5, 5, true) --Chilling Touch
PlexusStatusRaidDebuff:DebuffId(zoneid, 285253, 192, 5, 5, true) --Ice Shard
PlexusStatusRaidDebuff:DebuffId(zoneid, 288169, 193, 5, 5, true) --Howling Winds
PlexusStatusRaidDebuff:DebuffId(zoneid, 287490, 194, 5, 5, true) --Frozen Solid
PlexusStatusRaidDebuff:DebuffId(zoneid, 288297, 195, 5, 5, true) --Arctic Ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 287365, 196, 5, 5, true) --Searing Pitch
PlexusStatusRaidDebuff:DebuffId(zoneid, 288394, 197, 5, 5, true) --Warmth
PlexusStatusRaidDebuff:DebuffId(zoneid, 287626, 198, 5, 5, true) --Grasp of Frost
PlexusStatusRaidDebuff:DebuffId(zoneid, 289220, 199, 5, 5, true) --Heart of Frost
PlexusStatusRaidDebuff:DebuffId(zoneid, 288212, 200, 5, 5, true) --Broadside
PlexusStatusRaidDebuff:DebuffId(zoneid, 285254, 201, 5, 5, true) --Avalanche
PlexusStatusRaidDebuff:DebuffId(zoneid, 288374, 202, 5, 5, true) --Siegebreaker Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 288038, 203, 5, 5, true) --Marked Target
PlexusStatusRaidDebuff:DebuffId(zoneid, 288434, 204, 5, 5, true) --Hand of Frost
PlexusStatusRaidDebuff:DebuffId(zoneid, 287199, 205, 5, 5, true) --Ring of Ice
end)