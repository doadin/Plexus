-- local zone = "Castle Nathria"
local zoneid = 1735
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


-- Shriekwing
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Shriekwing")
PlexusStatusRaidDebuff:DebuffId(zoneid, 328897, 101, 6, 6) -- Exsanguinated
PlexusStatusRaidDebuff:DebuffId(zoneid, 340324, 102, 6, 6) -- Sanguine Ichor
PlexusStatusRaidDebuff:DebuffId(zoneid, 329370, 103, 6, 6) -- Deadly Descent
PlexusStatusRaidDebuff:DebuffId(zoneid, 342077, 104, 6, 6) -- Scent of Blood

-- Huntsman Altimor
PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Huntsman Altimor")
PlexusStatusRaidDebuff:DebuffId(zoneid, 335304, 201, 6, 6) -- Sinseeker
PlexusStatusRaidDebuff:DebuffId(zoneid, 334852, 202, 6, 6) -- Petrifying Howl
PlexusStatusRaidDebuff:DebuffId(zoneid, 334971, 203, 6, 6) -- Jagged Claws
PlexusStatusRaidDebuff:DebuffId(zoneid, 335113, 204, 6, 6) -- Huntsman's Mark
PlexusStatusRaidDebuff:DebuffId(zoneid, 334893, 205, 6, 6) -- Stone Shards
PlexusStatusRaidDebuff:DebuffId(zoneid, 334708, 206, 6, 6) -- Deathly Roar
PlexusStatusRaidDebuff:DebuffId(zoneid, 334945, 207, 6, 6) -- Vicious Lunge
PlexusStatusRaidDebuff:DebuffId(zoneid, 334960, 208, 6, 6) -- Vicious Wound

-- Sun King's Salvation Satiated
PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Sun King's Salvation")
PlexusStatusRaidDebuff:DebuffId(zoneid, 339251, 301, 6, 6) -- Drained Soul
PlexusStatusRaidDebuff:DebuffId(zoneid, 325442, 302, 6, 6) -- Vanquished
PlexusStatusRaidDebuff:DebuffId(zoneid, 326456, 303, 6, 6) -- Burning Remnants
PlexusStatusRaidDebuff:DebuffId(zoneid, 326430, 304, 6, 6) -- Lingering Embers
PlexusStatusRaidDebuff:DebuffId(zoneid, 341475, 305, 6, 6) -- Crimson Flurry
PlexusStatusRaidDebuff:DebuffId(zoneid, 328479, 306, 6, 6) -- Eyes on Target
PlexusStatusRaidDebuff:DebuffId(zoneid, 341473, 307, 6, 6) -- Crimson Flurry
PlexusStatusRaidDebuff:DebuffId(zoneid, 328579, 308, 6, 6) -- Smoldering Remnants
PlexusStatusRaidDebuff:DebuffId(zoneid, 333002, 309, 6, 6) -- Vulgar Brand
PlexusStatusRaidDebuff:DebuffId(zoneid, 328889, 310, 6, 6) -- Greater Castigation

-- Artificer Xy'mox
PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Artificer Xy'mox")
PlexusStatusRaidDebuff:DebuffId(zoneid, 340533, 401, 6, 6) -- Arcane Vulnerability
PlexusStatusRaidDebuff:DebuffId(zoneid, 340870, 402, 6, 6) -- Aura of Dread
PlexusStatusRaidDebuff:DebuffId(zoneid, 340860, 403, 6, 6) -- Withering Touch
PlexusStatusRaidDebuff:DebuffId(zoneid, 325236, 404, 6, 6) -- Glyph of Destruction
PlexusStatusRaidDebuff:DebuffId(zoneid, 328468, 405, 6, 6) -- Dimensional Tear
PlexusStatusRaidDebuff:DebuffId(zoneid, 327902, 406, 6, 6) -- Fixate

-- Hungering Destroyer
PlexusStatusRaidDebuff:BossNameId(zoneid, 500, "Hungering Destroyer")
PlexusStatusRaidDebuff:DebuffId(zoneid, 329298, 511, 6, 6) -- Gluttonous Miasma
PlexusStatusRaidDebuff:DebuffId(zoneid, 334228, 512, 6, 6) -- Volatile Ejection

-- Lady Inerva Darkvein
PlexusStatusRaidDebuff:BossNameId(zoneid, 600, "Lady Inerva Darkvein")
PlexusStatusRaidDebuff:DebuffId(zoneid, 331573, 601, 6, 6) -- Unconscionable Guilt
PlexusStatusRaidDebuff:DebuffId(zoneid, 340477, 602, 6, 6) -- Concentrate Anima
PlexusStatusRaidDebuff:DebuffId(zoneid, 324982, 603, 6, 6) -- Shared Suffering
PlexusStatusRaidDebuff:DebuffId(zoneid, 325713, 604, 6, 6) -- Lingering Anima

-- The Council of Blood
PlexusStatusRaidDebuff:BossNameId(zoneid, 700, "The Council of Blood")
PlexusStatusRaidDebuff:DebuffId(zoneid, 327610, 701, 6, 6) -- Evasive Lunge
PlexusStatusRaidDebuff:DebuffId(zoneid, 334909, 702, 5, 5, nil, true) -- Oppressive Atmosphere
PlexusStatusRaidDebuff:DebuffId(zoneid, 346690, 703, 6, 6) -- Duelist's Riposte
PlexusStatusRaidDebuff:DebuffId(zoneid, 331636, 704, 6, 6) -- Dark Recital
PlexusStatusRaidDebuff:DebuffId(zoneid, 346651, 705, 6, 6) -- Drain Essence
PlexusStatusRaidDebuff:DebuffId(zoneid, 330848, 706, 6, 6) -- Wrong Moves
PlexusStatusRaidDebuff:DebuffId(zoneid, 327619, 707, 6, 6) -- Waltz of Blood

-- Sludgefist
PlexusStatusRaidDebuff:BossNameId(zoneid, 800, "Sludgefist")
PlexusStatusRaidDebuff:DebuffId(zoneid, 332443, 801, 6, 6) -- Crumbling Foundation
PlexusStatusRaidDebuff:DebuffId(zoneid, 335293, 802, 6, 6) -- Chain Link
PlexusStatusRaidDebuff:DebuffId(zoneid, 342419, 803, 6, 6) -- Chain Them!
PlexusStatusRaidDebuff:DebuffId(zoneid, 335361, 804, 6, 6) -- Stonequake
PlexusStatusRaidDebuff:DebuffId(zoneid, 331209, 805, 6, 6) -- Hateful Gaze
PlexusStatusRaidDebuff:DebuffId(zoneid, 332572, 806, 6, 6) -- Falling Rubble
PlexusStatusRaidDebuff:DebuffId(zoneid, 335295, 807, 6, 6) -- Shattering Chain

-- Stone Legion Generals
PlexusStatusRaidDebuff:BossNameId(zoneid, 900, "Stone Legion Generals")
PlexusStatusRaidDebuff:DebuffId(zoneid, 333913, 901, 6, 6) -- Wicked Laceration
PlexusStatusRaidDebuff:DebuffId(zoneid, 342425, 902, 6, 6, nil, true) -- Stone Fist
PlexusStatusRaidDebuff:DebuffId(zoneid, 344655, 903, 6, 6, true) -- Reverberating Vulnerability
PlexusStatusRaidDebuff:DebuffId(zoneid, 343881, 904, 6, 6, nil, true) -- Serrated Tear
PlexusStatusRaidDebuff:DebuffId(zoneid, 343063, 905, 6, 6, true) -- Stone Spike
PlexusStatusRaidDebuff:DebuffId(zoneid, 334771, 906, 6, 6, true) -- Heart Hemorrhage
PlexusStatusRaidDebuff:DebuffId(zoneid, 333377, 907, 6, 6) -- Wicked Mark
PlexusStatusRaidDebuff:DebuffId(zoneid, 334765, 908, 6, 6, true) -- Heart Rend
PlexusStatusRaidDebuff:DebuffId(zoneid, 344502, 909, 6, 6) -- Unstable Footing
PlexusStatusRaidDebuff:DebuffId(zoneid, 332406, 910, 5, 5) -- Anima Infusion
PlexusStatusRaidDebuff:DebuffId(zoneid, 339690, 911, 6, 6, true) -- Crystalize
PlexusStatusRaidDebuff:DebuffId(zoneid, 343895, 912, 6, 6, nil, true) -- Soultaint
PlexusStatusRaidDebuff:DebuffId(zoneid, 339693, 913, 5, 5, true) -- Crystalline Burst
PlexusStatusRaidDebuff:DebuffId(zoneid, 334498, 914, 6, 6) -- Seismic Upheaval
PlexusStatusRaidDebuff:DebuffId(zoneid, 342735, 915, 6, 6) -- Ravenous Feast

-- Sire Denathrius
PlexusStatusRaidDebuff:BossNameId(zoneid, 1000, "Sire Denathrius")
PlexusStatusRaidDebuff:DebuffId(zoneid, 329181, 1001, 6, 6) -- Wracking Pain
PlexusStatusRaidDebuff:DebuffId(zoneid, 329906, 1002, 6, 6) -- Carnage
PlexusStatusRaidDebuff:DebuffId(zoneid, 326699, 1003, 6, 6, nil, true) -- Burden of Sin
PlexusStatusRaidDebuff:DebuffId(zoneid, 332585, 1004, 6, 6, nil, true) -- Scorn
PlexusStatusRaidDebuff:DebuffId(zoneid, 329785, 1005, 6, 6) -- Crimson Chorus
PlexusStatusRaidDebuff:DebuffId(zoneid, 332797, 1006, 6, 6, true) -- Fatal Finesse
PlexusStatusRaidDebuff:DebuffId(zoneid, 329951, 1007, 6, 6) -- Impale
PlexusStatusRaidDebuff:DebuffId(zoneid, 327796, 1008, 6, 6) -- Night Hunter
PlexusStatusRaidDebuff:DebuffId(zoneid, 332619, 1009, 6, 6) -- Shattering Pain
PlexusStatusRaidDebuff:DebuffId(zoneid, 335873, 1010, 6, 6) -- Rancor
PlexusStatusRaidDebuff:DebuffId(zoneid, 327842, 1011, 6, 6) -- Touch of the Night
PlexusStatusRaidDebuff:DebuffId(zoneid, 326851, 1012, 6, 6, true) -- Blood Price
PlexusStatusRaidDebuff:DebuffId(zoneid, 328276, 1013, 5, 5) -- March of the Penitent
PlexusStatusRaidDebuff:DebuffId(zoneid, 327992, 1014, 6, 6) -- Desolation
end)