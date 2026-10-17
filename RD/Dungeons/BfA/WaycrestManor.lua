--local zone = "Waycrest Manor"
local zoneid = 1015
local Plexus = _G.Plexus
local PlexusStatus = Plexus:GetModule("PlexusStatus")
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
WhenRaidDebuffReady(function()

PlexusStatusRaidDebuff:DebuffId(zoneid, 264105, 1, 6, 6, true)  --Runic Mark
PlexusStatusRaidDebuff:DebuffId(zoneid, 271174, 1, 6, 6, true)  --Retch
PlexusStatusRaidDebuff:DebuffId(zoneid, 264040, 1, 6, 6, true)  --Uprooted Thorns
PlexusStatusRaidDebuff:DebuffId(zoneid, 260900, 1, 6, 6, true)  --Soul Manipulation
PlexusStatusRaidDebuff:DebuffId(zoneid, 264378, 1, 6, 6, true)  --Fragment Soul
PlexusStatusRaidDebuff:DebuffId(zoneid, 271178, 1, 6, 6, true)  --Ravaging Leap
PlexusStatusRaidDebuff:DebuffId(zoneid, 260569, 1, 6, 6, true)  --Wildfire
PlexusStatusRaidDebuff:DebuffId(zoneid, 264153, 1, 6, 6, true)  --Spit
PlexusStatusRaidDebuff:DebuffId(zoneid, 265391, 1, 6, 6, true)  --Meaty Rampage
PlexusStatusRaidDebuff:DebuffId(zoneid, 264531, 1, 6, 6, true)  --Shrapnel Trap
PlexusStatusRaidDebuff:DebuffId(zoneid, 265371, 1, 6, 6, true)  --Captain's Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 267824, 1, 6, 6, true)  --Scar Soul
PlexusStatusRaidDebuff:DebuffId(zoneid, 265337, 1, 6, 6, true)  --Snout Smack
PlexusStatusRaidDebuff:DebuffId(zoneid, 200010, 1, 6, 6, true)  --Power Leech
PlexusStatusRaidDebuff:DebuffId(zoneid, 266036, 1, 6, 6, true)  --Drain Essence
PlexusStatusRaidDebuff:DebuffId(zoneid, 265410, 1, 6, 6, true)  --Punch
PlexusStatusRaidDebuff:DebuffId(zoneid, 263943, 1, 6, 6, true)  --Etch
PlexusStatusRaidDebuff:DebuffId(zoneid, 268271, 1, 6, 6, true)  --Wracking Chord
PlexusStatusRaidDebuff:DebuffId(zoneid, 261438, 1, 6, 6, true)  --Wasting Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 264111, 1, 6, 6, true)  --Darkened Blade
PlexusStatusRaidDebuff:DebuffId(zoneid, 265757, 1, 6, 6, true)  --Splinter Spike
PlexusStatusRaidDebuff:DebuffId(zoneid, 265881, 1, 6, 6, true)  --Decaying Touch
PlexusStatusRaidDebuff:DebuffId(zoneid, 264556, 1, 6, 6, true)  --Tearing Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 264150, 1, 6, 6, true)  --Shatter
PlexusStatusRaidDebuff:DebuffId(zoneid, 264510, 1, 6, 6, true)  --Shoot
PlexusStatusRaidDebuff:DebuffId(zoneid, 264456, 1, 6, 6, true)  --Tracking Explosive
PlexusStatusRaidDebuff:DebuffId(zoneid, 260701, 1, 6, 6, true)  --Bramble Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 265882, 1, 6, 6, true)  --Lingering Dread
PlexusStatusRaidDebuff:DebuffId(zoneid, 265642, 1, 6, 6, true)  --Diseased Crunch
PlexusStatusRaidDebuff:DebuffId(zoneid, 260699, 1, 6, 6, true)  --Soul Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 264520, 1, 6, 6, true)  --Severing Serpent
PlexusStatusRaidDebuff:DebuffId(zoneid, 260700, 1, 6, 6, true)  --Ruinous Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 265407, 1, 6, 6, true)  --Dinner Bell
PlexusStatusRaidDebuff:DebuffId(zoneid, 260703, 1, 6, 6, true)  --Unstable Runic Mark
PlexusStatusRaidDebuff:DebuffId(zoneid, 266035, 1, 6, 6, true)  --Bone Splinter
PlexusStatusRaidDebuff:DebuffId(zoneid, 263959, 1, 6, 6, true)  --Soul Volley
PlexusStatusRaidDebuff:DebuffId(zoneid, 265352, 1, 6, 6, true)  --Toad Blight
PlexusStatusRaidDebuff:DebuffId(zoneid, 265880, 1, 6, 6, true)  --Dread Mark
PlexusStatusRaidDebuff:DebuffId(zoneid, 265372, 1, 6, 6, true)  --Shadow Cleave
PlexusStatusRaidDebuff:DebuffId(zoneid, 264390, 1, 6, 6, true)  --Spellbind
PlexusStatusRaidDebuff:DebuffId(zoneid, 278849, 1, 6, 6, true)  --Uproot
PlexusStatusRaidDebuff:DebuffId(zoneid, 265876, 1, 6, 6, true)  --Ruinous Volley
PlexusStatusRaidDebuff:DebuffId(zoneid, 264655, 1, 6, 6, true)  --Withering Glob
PlexusStatusRaidDebuff:DebuffId(zoneid, 265761, 1, 6, 6, true)  --Thorned Barrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 264140, 1, 6, 6, true)  --Thorned Claw
PlexusStatusRaidDebuff:DebuffId(zoneid, 263905, 1, 6, 6, true)  --Marking Cleave
PlexusStatusRaidDebuff:DebuffId(zoneid, 264050, 1, 6, 6, true)  --Infected Thorn

PlexusStatusRaidDebuff:DebuffId(zoneid, 263891, 1, 6, 6, true) --Grasping Thorns
PlexusStatusRaidDebuff:DebuffId(zoneid, 268080, 1, 6, 6, true) --Aura of Apathy
PlexusStatusRaidDebuff:DebuffId(zoneid, 264407, 1, 6, 6, true) --Horrific Visage
PlexusStatusRaidDebuff:DebuffId(zoneid, 259882, 1, 6, 6, true) --Raw Chicken
PlexusStatusRaidDebuff:DebuffId(zoneid, 265878, 1, 6, 6, true) --Weeping Soul
PlexusStatusRaidDebuff:DebuffId(zoneid, 118905, 1, 6, 6, true) --Static Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 278456, 1, 6, 6, true) --Infest
PlexusStatusRaidDebuff:DebuffId(zoneid, 265346, 1, 6, 6, true) --Pallid Glare
PlexusStatusRaidDebuff:DebuffId(zoneid, 113746, 1, 6, 6, true) --Mystic Touch
PlexusStatusRaidDebuff:DebuffId(zoneid, 268125, 1, 6, 6, true) --Aura of Thorns
PlexusStatusRaidDebuff:DebuffId(zoneid, 30213, 1, 6, 6, true) --Legion Strike

--M+
PlexusStatusRaidDebuff:DebuffId(zoneid, 240447, 1, 6, 6, true) --Quake
PlexusStatusRaidDebuff:DebuffId(zoneid, 240559, 1, 6, 6, true, true) --Grievous Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 209858, 1, 6, 6, true, true) --Necrotic Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 240443, 1, 6, 6, true, true) --Burst
PlexusStatusRaidDebuff:DebuffId(zoneid, 226512, 1, 6, 6, true) --Sanguine Ichor
PlexusStatusRaidDebuff:DebuffId(zoneid, 409492, 1, 6, 6, true, true) --Afflicted Cry
PlexusStatusRaidDebuff:DebuffId(zoneid, 408805, 1, 6, 6, true) --Destabilize
PlexusStatusRaidDebuff:DebuffId(zoneid, 408556, 1, 6, 6, true) --Entangled
PlexusStatusRaidDebuff:DebuffId(zoneid, 440313, 1, 6, 6, true) --Devouring Rift

-- 8.3
PlexusStatusRaidDebuff:DebuffId(zoneid, 314411, 1, 6, 6, true) --Lingering Doubt
PlexusStatusRaidDebuff:DebuffId(zoneid, 314392, 1, 6, 6, true) --Vile Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 314592, 1, 6, 6, true) --Mind Flay
PlexusStatusRaidDebuff:DebuffId(zoneid, 314406, 1, 6, 6, true) --Crippling Pestilence
PlexusStatusRaidDebuff:DebuffId(zoneid, 314308, 1, 6, 6, true) --Spirit Breaker
PlexusStatusRaidDebuff:DebuffId(zoneid, 314478, 1, 6, 6, true) --Cascading Terror
PlexusStatusRaidDebuff:DebuffId(zoneid, 314531, 1, 6, 6, true) --Tear Flesh
PlexusStatusRaidDebuff:DebuffId(zoneid, 313445, 1, 1, 1, true) --Ny'alotha Incursion

--Heartsbane Triad
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Heartsbane Triad")
PlexusStatusRaidDebuff:DebuffId(zoneid, 260741, 11, 7, 7, true)  --Jagged Nettles
PlexusStatusRaidDebuff:DebuffId(zoneid, 260805, 12, 6, 6, true)  --Focusing Iris
PlexusStatusRaidDebuff:DebuffId(zoneid, 268086, 13, 7, 7, true, true) --Aura of Dread
PlexusStatusRaidDebuff:DebuffId(zoneid, 268125, 14, 7, 7, true, true) -- Aura of Thorns
PlexusStatusRaidDebuff:DebuffId(zoneid, 268080, 15, 7, 7, true, true) -- Aura of Apathy
--Soulbound Goliath
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Soulbound Goliath")
PlexusStatusRaidDebuff:DebuffId(zoneid, 260512, 21, 6, 6, true)  --Soul Harvest
PlexusStatusRaidDebuff:DebuffId(zoneid, 260551, 22, 6, 6, true)  --Soul Thorns
PlexusStatusRaidDebuff:DebuffId(zoneid, 260508, 23, 6, 6, true)  --Crush
PlexusStatusRaidDebuff:DebuffId(zoneid, 260547, 24, 6, 6, true)  --Burning Brush
--Raal the Glutonous
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Raal the Glutonous")
PlexusStatusRaidDebuff:DebuffId(zoneid, 264923, 31, 6, 6, true)  --Tenderize
PlexusStatusRaidDebuff:DebuffId(zoneid, 264694, 32, 6, 6, true)  --Rotten Expulsion
PlexusStatusRaidDebuff:DebuffId(zoneid, 426590, 33, 6, 6, true)--Gluttonous Bile
--Lord and Lady Waycrest
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Lord and Lady Waycrest")
PlexusStatusRaidDebuff:DebuffId(zoneid, 261439, 41, 6, 6, true)  --Virulent Pathogen
PlexusStatusRaidDebuff:DebuffId(zoneid, 268306, 42, 6, 6, true)  --Discordant Cadenza
--Gorak Tul
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Gorak Tul")
PlexusStatusRaidDebuff:DebuffId(zoneid, 266225, 51, 6, 6, true)  --Darkened Lightning
PlexusStatusRaidDebuff:DebuffId(zoneid, 266198, 52, 6, 6, true)  --Alchemical Fire
PlexusStatusRaidDebuff:DebuffId(zoneid, 268202, 53, 6, 6, true)  --Death Lens
end)