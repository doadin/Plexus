-- local zone = "Sepulcher of the First Ones"
local zoneid = 2047
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
--zoneid, first, second, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

-- Trash


-- Vigilant Guardian
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Vigilant Guardian")
PlexusStatusRaidDebuff:DebuffId(zoneid, 364447, 101, 5, 5, true, true) -- Dissonance
PlexusStatusRaidDebuff:DebuffId(zoneid, 360202, 102, 5, 5, false, true) -- Spike of Creation
PlexusStatusRaidDebuff:DebuffId(zoneid, 367571, 103, 5, 5, true) -- Sear
PlexusStatusRaidDebuff:DebuffId(zoneid, 360458, 104, 5, 5) -- Unstable Core
PlexusStatusRaidDebuff:DebuffId(zoneid, 364881, 105, 5, 5, true) -- Matter Dissolution
PlexusStatusRaidDebuff:DebuffId(zoneid, 364904, 106, 5, 5, true, true) -- Anti-Matter
PlexusStatusRaidDebuff:DebuffId(zoneid, 360414, 107, 5, 5, true) -- Pneumatic Impact
PlexusStatusRaidDebuff:DebuffId(zoneid, 364843, 108, 4, 4) -- Fractured Core
PlexusStatusRaidDebuff:DebuffId(zoneid, 364962, 109, 5, 5) -- Core Overload

-- Skolex, the Insatiable Ravener
PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Skolex, the Insatiable Ravener")
PlexusStatusRaidDebuff:DebuffId(zoneid, 359778, 201, 5, 5, true, true) -- Ephemera Dust
PlexusStatusRaidDebuff:DebuffId(zoneid, 360098, 202, 5, 5, true) -- Warp Sickness
PlexusStatusRaidDebuff:DebuffId(zoneid, 366070, 203, 5, 5) -- Volatile Residue
PlexusStatusRaidDebuff:DebuffId(zoneid, 364522, 204, 5, 5, true, true) -- Devouring Blood
PlexusStatusRaidDebuff:DebuffId(zoneid, 359976, 205, 5, 5, true) -- Riftmaw

-- Artificer Xy'mox
PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Artificer Xy'mox")
PlexusStatusRaidDebuff:DebuffId(zoneid, 363413, 301, 5, 5, true) -- Genesis Rings
PlexusStatusRaidDebuff:DebuffId(zoneid, 365752, 302, 5, 5) -- Ancient Exhaust
PlexusStatusRaidDebuff:DebuffId(zoneid, 365801, 303, 5, 5) -- Relic Collapse
PlexusStatusRaidDebuff:DebuffId(zoneid, 363114, 304, 5, 5, true) -- Genesis Supernova
PlexusStatusRaidDebuff:DebuffId(zoneid, 365682, 305, 5, 5, true, true) -- Massive Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 364030, 306, 5, 5, true) -- Debilitating Ray

-- Dausegne, the Fallen Oracle
PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Dausegne, the Fallen Oracle")
PlexusStatusRaidDebuff:DebuffId(zoneid, 361966, 401, 5, 5, true, true) -- Infused Strikes
PlexusStatusRaidDebuff:DebuffId(zoneid, 361751, 402, 5, 5, true, true) -- Disintegration Halo
PlexusStatusRaidDebuff:DebuffId(zoneid, 364289, 402, 4, 4, true, true) -- Staggering Barrage

-- Prototype Pantheon
PlexusStatusRaidDebuff:BossNameId(zoneid, 500, "Prototype Pantheon")
PlexusStatusRaidDebuff:DebuffId(zoneid, 360687, 501, 5, 5, true) -- Runecarvers Deathtouch
PlexusStatusRaidDebuff:DebuffId(zoneid, 360259, 502, 5, 5) -- Gloom Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 365041, 503, 5, 5, true) -- Windswept  Wings
PlexusStatusRaidDebuff:DebuffId(zoneid, 362352, 504, 5, 5) -- Pinned
PlexusStatusRaidDebuff:DebuffId(zoneid, 361784, 505, 4, 4, true) -- Touch of the Night
PlexusStatusRaidDebuff:DebuffId(zoneid, 362383, 506, 5, 5, true) -- Anima Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 361689, 507, 5, 5, true, true) -- Wracking Pain
PlexusStatusRaidDebuff:DebuffId(zoneid, 361608, 508, 5, 5, false, true) -- Burden of Sin
PlexusStatusRaidDebuff:DebuffId(zoneid, 364867, 509, 5, 5, true) -- Sinful Projection

-- Lihuvim, Principal Architect
PlexusStatusRaidDebuff:BossNameId(zoneid, 600, "Lihuvim, Principal Architect")
PlexusStatusRaidDebuff:DebuffId(zoneid, 360159, 601, 5, 5) -- Unstable Mote
PlexusStatusRaidDebuff:DebuffId(zoneid, 363681, 602, 5, 5, true) -- Deconstructing Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 368024, 603, 5, 5, true) -- Kinetic Resonance
PlexusStatusRaidDebuff:DebuffId(zoneid, 368025, 604, 5, 5, true) -- Sundering Resonance
PlexusStatusRaidDebuff:DebuffId(zoneid, 364092, 605, 5, 5) -- Degenerate
PlexusStatusRaidDebuff:DebuffId(zoneid, 366012, 606, 5, 5, true) -- Terminal Mote
PlexusStatusRaidDebuff:DebuffId(zoneid, 362447, 607, 4, 4) -- Instability

-- Halondrus the Reclaimer
PlexusStatusRaidDebuff:BossNameId(zoneid, 700, "Halondrus the Reclaimer")
PlexusStatusRaidDebuff:DebuffId(zoneid, 368961, 701, 5, 5, true) -- Charge Exposure
PlexusStatusRaidDebuff:DebuffId(zoneid, 360114, 702, 5, 5) -- Ephemeral Fissure
PlexusStatusRaidDebuff:DebuffId(zoneid, 361597, 703, 5, 5, true, true) -- Ephemeral Eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 368529, 704, 5, 5) -- Eternity Overdrive

-- Anduin Wrynn
PlexusStatusRaidDebuff:BossNameId(zoneid, 800, "Anduin Wrynn")
PlexusStatusRaidDebuff:DebuffId(zoneid, 368913, 801, 4, 4) -- Force of Will
PlexusStatusRaidDebuff:DebuffId(zoneid, 362055, 802, 5, 5) -- Lost Soul
PlexusStatusRaidDebuff:DebuffId(zoneid, 365445, 803, 5, 5) -- Scarred Soul
PlexusStatusRaidDebuff:DebuffId(zoneid, 364031, 804, 6, 6) -- Gloom
PlexusStatusRaidDebuff:DebuffId(zoneid, 365293, 805, 6, 6) -- Befouled Barrier
PlexusStatusRaidDebuff:DebuffId(zoneid, 366849, 806, 5, 5, true) -- Domination Word Pain
PlexusStatusRaidDebuff:DebuffId(zoneid, 363024, 807, 6, 6, true) -- Necrotic Detonation
PlexusStatusRaidDebuff:DebuffId(zoneid, 363020, 808, 5, 5) -- Necrotic Claws
PlexusStatusRaidDebuff:DebuffId(zoneid, 364020, 809, 5, 5, true) -- March of the Damned
PlexusStatusRaidDebuff:DebuffId(zoneid, 362543, 810, 5, 5, false, true) -- Remorseless Winter
PlexusStatusRaidDebuff:DebuffId(zoneid, 363028, 811, 5, 5) -- Unraveling Frenzy
PlexusStatusRaidDebuff:DebuffId(zoneid, 368428, 812, 5, 5, true, true) -- Purging Light

-- Lords of Dread
PlexusStatusRaidDebuff:BossNameId(zoneid, 900, "Lords of Dread")
PlexusStatusRaidDebuff:DebuffId(zoneid, 360300, 901, 5, 5, true) -- Swarm of Decay
PlexusStatusRaidDebuff:DebuffId(zoneid, 360304, 902, 5, 5, true) -- Swarm of Darkness
PlexusStatusRaidDebuff:DebuffId(zoneid, 362158, 903, 5, 5, false, true) -- Decay Mastery
PlexusStatusRaidDebuff:DebuffId(zoneid, 364985, 904, 5, 5, true, true) -- Biting Wounds
PlexusStatusRaidDebuff:DebuffId(zoneid, 360008, 905, 5, 5) -- Cloud of Carrion
PlexusStatusRaidDebuff:DebuffId(zoneid, 359963, 906, 5, 5, true) -- Opened Veins
PlexusStatusRaidDebuff:DebuffId(zoneid, 360418, 907, 5, 5) -- Paranoia
PlexusStatusRaidDebuff:DebuffId(zoneid, 360420, 908, 5, 5) -- Shatter Mind
PlexusStatusRaidDebuff:DebuffId(zoneid, 362152, 909, 5, 5, false, true) -- Shadow Mastery
PlexusStatusRaidDebuff:DebuffId(zoneid, 360148, 910, 5, 5, true) -- Bursting Dread
PlexusStatusRaidDebuff:DebuffId(zoneid, 360241, 911, 5, 5, true) -- Unsettling Dreams

-- Rygelon
PlexusStatusRaidDebuff:BossNameId(zoneid, 1000, "Rygelon")
PlexusStatusRaidDebuff:DebuffId(zoneid, 361548, 1001, 5, 5, true) -- Dark Eclipse
PlexusStatusRaidDebuff:DebuffId(zoneid, 362273, 1002, 5, 5, true, true) -- Quasar Radiation
PlexusStatusRaidDebuff:DebuffId(zoneid, 362206, 1003, 5, 5, true) -- Event Horizon
PlexusStatusRaidDebuff:DebuffId(zoneid, 362081, 1004, 5, 5, true, true) -- Cosmic Ejection
PlexusStatusRaidDebuff:DebuffId(zoneid, 362088, 1005, 5, 5, true, true) -- Cosmic Irregularity
PlexusStatusRaidDebuff:DebuffId(zoneid, 366379, 1006, 6, 6) -- Stellar Shroud
PlexusStatusRaidDebuff:DebuffId(zoneid, 362172, 1007, 5, 5, true, true) -- Corrupted Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 363598, 1008, 5, 5, false, true) -- Unstable Antimatter
PlexusStatusRaidDebuff:DebuffId(zoneid, 364386, 1009, 5, 5, true, true) -- Gravitational Collapse

-- The Jailer
PlexusStatusRaidDebuff:BossNameId(zoneid, 1100, "The Jailer")
PlexusStatusRaidDebuff:DebuffId(zoneid, 366381, 1101, 5, 5, true) -- Arcane Vulnerability
PlexusStatusRaidDebuff:DebuffId(zoneid, 366703, 1102, 5, 5, true, true) -- Azerite Radiation
PlexusStatusRaidDebuff:DebuffId(zoneid, 362075, 1103, 6, 6) -- Domination
PlexusStatusRaidDebuff:DebuffId(zoneid, 362631, 1104, 5, 5, true) -- Chains of Oppression
PlexusStatusRaidDebuff:DebuffId(zoneid, 363893, 1105, 5, 5, true) -- Martyrdom
PlexusStatusRaidDebuff:DebuffId(zoneid, 363886, 1106, 5, 5, true) -- Imprisonment
PlexusStatusRaidDebuff:DebuffId(zoneid, 362194, 1107, 5, 5, true) -- Suffering
PlexusStatusRaidDebuff:DebuffId(zoneid, 362192, 1108, 4, 4, true) -- Relentless Misery
PlexusStatusRaidDebuff:DebuffId(zoneid, 366665, 1109, 5, 5, true) -- Unholy Eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 359868, 1110, 5, 5, true) -- Shattering Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 366777, 1111, 5, 5, true, true) -- Consumed Azerite
PlexusStatusRaidDebuff:DebuffId(zoneid, 360425, 1112, 5, 5) -- Unholy Ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 366285, 1113, 5, 5, true) -- Rune of Compulsion
PlexusStatusRaidDebuff:DebuffId(zoneid, 365153, 1114, 5, 5) -- Dominating Will
PlexusStatusRaidDebuff:DebuffId(zoneid, 365219, 1115, 5, 5, true) -- Chains of Anguish
PlexusStatusRaidDebuff:DebuffId(zoneid, 365385, 1116, 6, 6, true, true) -- Cry of Loathing
PlexusStatusRaidDebuff:DebuffId(zoneid, 365174, 1117, 5, 5) -- Defile
PlexusStatusRaidDebuff:DebuffId(zoneid, 360281, 1118, 6, 6) -- Rune of Damnation
end)