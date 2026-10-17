-- local zone = "Dawn of the Infinite"
local zoneid = 2198
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

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 412044, 1, 6, 6, true, true) -- Temposlice
PlexusStatusRaidDebuff:DebuffId(zoneid, 411994, 1, 6, 6, true, true) -- Chronomelt
PlexusStatusRaidDebuff:DebuffId(zoneid, 415436, 1, 6, 6, true, true) -- Tainted Sands
PlexusStatusRaidDebuff:DebuffId(zoneid, 415554, 1, 6, 6, true, true) -- Chronoburst
PlexusStatusRaidDebuff:DebuffId(zoneid, 415437, 1, 6, 6, true, true) -- Enervate
PlexusStatusRaidDebuff:DebuffId(zoneid, 413547, 1, 6, 6, true, true) -- Bloom
PlexusStatusRaidDebuff:DebuffId(zoneid, 413529, 1, 6, 6, true, true) -- Untwist
PlexusStatusRaidDebuff:DebuffId(zoneid, 412810, 1, 6, 6, true, true) -- Blight Spew
PlexusStatusRaidDebuff:DebuffId(zoneid, 412285, 1, 6, 6, true, true) -- Stonebolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 412505, 1, 6, 6, true, true) -- Rending Cleave
PlexusStatusRaidDebuff:DebuffId(zoneid, 413606, 1, 6, 6, true, true) -- Corroding Volley
PlexusStatusRaidDebuff:DebuffId(zoneid, 414922, 1, 6, 6, true, true) -- Shrouding Sandstorm
PlexusStatusRaidDebuff:DebuffId(zoneid, 412922, 1, 6, 6, true, true) -- Binding Grasp
PlexusStatusRaidDebuff:DebuffId(zoneid, 412131, 1, 6, 6, true, true) -- Orb of Contemplation
PlexusStatusRaidDebuff:DebuffId(zoneid, 413027, 1, 6, 6, true, true) -- Titanic Bulwark
PlexusStatusRaidDebuff:DebuffId(zoneid, 413618, 1, 6, 6, true, true) -- Timeless Curse
PlexusStatusRaidDebuff:DebuffId(zoneid, 419351, 1, 6, 6, true, true) -- Bronze Exhalation
PlexusStatusRaidDebuff:DebuffId(zoneid, 418092, 1, 6, 6, true, true) -- Twisted Timeways
PlexusStatusRaidDebuff:DebuffId(zoneid, 418200, 1, 6, 6, true, true) -- Infinite Burn
PlexusStatusRaidDebuff:DebuffId(zoneid, 413427, 1, 6, 6, true, true) -- Time Beam
PlexusStatusRaidDebuff:DebuffId(zoneid, 419511, 1, 6, 6, true, true) -- Temporal Link
PlexusStatusRaidDebuff:DebuffId(zoneid, 419517, 1, 6, 6, true, true) -- Chronal Eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 407125, 1, 6, 6, true, true) -- Sundering Slam
PlexusStatusRaidDebuff:DebuffId(zoneid, 407651, 1, 6, 6, true, true) -- Sapper’s Perogative
PlexusStatusRaidDebuff:DebuffId(zoneid, 407715, 1, 6, 6, true, true) -- Kaboom!
PlexusStatusRaidDebuff:DebuffId(zoneid, 407906, 1, 6, 6, true, true) -- Earthquake
PlexusStatusRaidDebuff:DebuffId(zoneid, 407123, 1, 6, 6, true, true) -- Rain of Fire
PlexusStatusRaidDebuff:DebuffId(zoneid, 411700, 1, 6, 6, true, true) -- Slobbering Bite
PlexusStatusRaidDebuff:DebuffId(zoneid, 411644, 1, 6, 6, true, true) -- Soggy Bonk
PlexusStatusRaidDebuff:DebuffId(zoneid, 412262, 1, 6, 6, true, true) -- Staticky Punch
PlexusStatusRaidDebuff:DebuffId(zoneid, 408084, 1, 6, 6, true, true) -- Necrofrost
PlexusStatusRaidDebuff:DebuffId(zoneid, 413332, 1, 6, 6, true, true) -- Sand Zone
PlexusStatusRaidDebuff:DebuffId(zoneid, 414496, 1, 6, 6, true, true) -- Timeline Acceleration
PlexusStatusRaidDebuff:DebuffId(zoneid, 414333, 1, 6, 6, true, true) -- Timeline Protection
PlexusStatusRaidDebuff:DebuffId(zoneid, 408177, 1, 6, 6, true, true) -- Incinerating Blightbreath
PlexusStatusRaidDebuff:DebuffId(zoneid, 414178, 1, 6, 6, true, true) -- Timeline Transcendence
PlexusStatusRaidDebuff:DebuffId(zoneid, 417030, 1, 6, 6, true, true) --Fireball
PlexusStatusRaidDebuff:DebuffId(zoneid, 407315, 1, 6, 6, true, true) --Embers
PlexusStatusRaidDebuff:DebuffId(zoneid, 412378, 1, 6, 6, true, true) --Dizzying Sands
PlexusStatusRaidDebuff:DebuffId(zoneid, 407205, 1, 6, 6, true, true) --Volatile Mortar
PlexusStatusRaidDebuff:DebuffId(zoneid, 417002, 1, 6, 6, true, true) --Consecration
PlexusStatusRaidDebuff:DebuffId(zoneid, 407313, 1, 6, 6, true, true) --Shrapnel
PlexusStatusRaidDebuff:DebuffId(zoneid, 418009, 1, 6, 6, true, true) --Serrated Arrows
PlexusStatusRaidDebuff:DebuffId(zoneid, 417026, 1, 6, 6, true, true) --Blizzard

PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Chronikar")
PlexusStatusRaidDebuff:DebuffId(zoneid, 413142, 101, 5, 5, true) --Eon Shatter
PlexusStatusRaidDebuff:DebuffId(zoneid, 403486, 102, 5, 5, true) --Eon Residue
PlexusStatusRaidDebuff:DebuffId(zoneid, 403259, 103, 5, 5, true) --Residue Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 405970, 104, 5, 5, true) --Eon Fragments
PlexusStatusRaidDebuff:DebuffId(zoneid, 413013, 105, 5, 5, true) --Chronoshear
PlexusStatusRaidDebuff:DebuffId(zoneid, 413041, 106, 5, 5, true) --Sheared Lifespan
PlexusStatusRaidDebuff:DebuffId(zoneid, 401420, 107, 5, 5, true) --Sand Stomp
PlexusStatusRaidDebuff:DebuffId(zoneid, 401794, 108, 5, 5, true) --Withering Sandpool

PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Manifested Timeways")
PlexusStatusRaidDebuff:DebuffId(zoneid, 403910, 201, 5, 5, true) --Decaying Time
PlexusStatusRaidDebuff:DebuffId(zoneid, 403912, 202, 5, 5, true) --Accelerating Time
PlexusStatusRaidDebuff:DebuffId(zoneid, 404141, 203, 5, 5, true) --Chrono-faded
PlexusStatusRaidDebuff:DebuffId(zoneid, 405448, 204, 5, 5, true) --Chronofade
PlexusStatusRaidDebuff:DebuffId(zoneid, 404650, 205, 5, 5, true) --Fragments of Time
PlexusStatusRaidDebuff:DebuffId(zoneid, 414303, 206, 5, 5, true) --Unwind
PlexusStatusRaidDebuff:DebuffId(zoneid, 414307, 207, 5, 5, true) --Radiant

PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Blight of Galakrond")
PlexusStatusRaidDebuff:DebuffId(zoneid, 406886, 301, 5, 5, true) --Corrosive Infusion
PlexusStatusRaidDebuff:DebuffId(zoneid, 407406, 302, 5, 5, true) --Corrosion
PlexusStatusRaidDebuff:DebuffId(zoneid, 418346, 303, 5, 5, true) --Corrupted Mind
PlexusStatusRaidDebuff:DebuffId(zoneid, 407027, 304, 5, 5, true) --Corrosive Expulsion
PlexusStatusRaidDebuff:DebuffId(zoneid, 407159, 305, 5, 5, true) --Blight Reclamation
PlexusStatusRaidDebuff:DebuffId(zoneid, 407147, 306, 5, 5, true) --Blight Seep
PlexusStatusRaidDebuff:DebuffId(zoneid, 407978, 307, 5, 5, true) --Necrotic Winds
PlexusStatusRaidDebuff:DebuffId(zoneid, 413608, 308, 5, 5, true) --Essence Connection
PlexusStatusRaidDebuff:DebuffId(zoneid, 408029, 309, 5, 5, true) --Necrofrost
PlexusStatusRaidDebuff:DebuffId(zoneid, 408141, 310, 5, 5, true) --Incinerating Blightbreath
PlexusStatusRaidDebuff:DebuffId(zoneid, 413590, 311, 5, 5, true) --Noxious Ejection

PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Iridikron the Stonescaled")
PlexusStatusRaidDebuff:DebuffId(zoneid, 409266, 401, 5, 5, true) --Extinction Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 414330, 402, 5, 5, true) --Timeline Protection
PlexusStatusRaidDebuff:DebuffId(zoneid, 414353, 403, 5, 5, true) --Exhausted
PlexusStatusRaidDebuff:DebuffId(zoneid, 414496, 404, 5, 5, true) --Timeline Acceleration
PlexusStatusRaidDebuff:DebuffId(zoneid, 414535, 405, 5, 5, true) --Stonecracker Barrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 414552, 406, 5, 5, true) --Stonecrack
PlexusStatusRaidDebuff:DebuffId(zoneid, 409456, 407, 5, 5, true) --Earthsurge
PlexusStatusRaidDebuff:DebuffId(zoneid, 409287, 408, 5, 5, true) --Rending Earthspikes
PlexusStatusRaidDebuff:DebuffId(zoneid, 414376, 409, 5, 5, true) --Punctured Ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 409635, 410, 5, 5, true) --Pulverizing Exhalation
PlexusStatusRaidDebuff:DebuffId(zoneid, 409879, 411, 5, 5, true) --Pulverizing Creations
PlexusStatusRaidDebuff:DebuffId(zoneid, 416256, 412, 5, 5, true) --Stonebolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 409692, 413, 5, 5, true) --Patient Tactician
PlexusStatusRaidDebuff:DebuffId(zoneid, 414184, 414, 5, 5, true) --Cataclysmic Obliteration
PlexusStatusRaidDebuff:DebuffId(zoneid, 414293, 415, 5, 5, true) --Timeline Transcendence
PlexusStatusRaidDebuff:DebuffId(zoneid, 409558, 416, 5, 5, true) --Crushing Onslaught

PlexusStatusRaidDebuff:BossNameId(zoneid, 500, "Tyr, the Infinite Keeper")
PlexusStatusRaidDebuff:DebuffId(zoneid, 404296, 501, 5, 5, true) --Infinite Hand Technique
PlexusStatusRaidDebuff:DebuffId(zoneid, 410240, 502, 5, 5, true) --Titanic Blow
PlexusStatusRaidDebuff:DebuffId(zoneid, 403724, 503, 5, 5, true) --Consecrated Ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 401463, 504, 5, 5, true) --Infinite Annihilation
PlexusStatusRaidDebuff:DebuffId(zoneid, 400641, 505, 5, 5, true) --Dividing Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 408183, 506, 5, 5, true) --Titanic Empowerment
PlexusStatusRaidDebuff:DebuffId(zoneid, 400649, 507, 5, 5, true) --Spark of Tyr
PlexusStatusRaidDebuff:DebuffId(zoneid, 408768, 508, 5, 5, true) --Siphon Oathstone
PlexusStatusRaidDebuff:DebuffId(zoneid, 410249, 509, 5, 5, true) --Radiant Barrier
PlexusStatusRaidDebuff:DebuffId(zoneid, 404315, 510, 5, 5, true) --Temporal Essence
PlexusStatusRaidDebuff:DebuffId(zoneid, 406543, 511, 5, 5, true) --Stolen Time

PlexusStatusRaidDebuff:BossNameId(zoneid, 600, "Morchie")
PlexusStatusRaidDebuff:DebuffId(zoneid, 404916, 601, 5, 5, true) --Sand Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 403891, 602, 5, 5, true) --More Problems!
PlexusStatusRaidDebuff:DebuffId(zoneid, 404365, 603, 5, 5, true) --Dragon's Breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 413208, 604, 5, 5, true) --Sand Buffeted
PlexusStatusRaidDebuff:DebuffId(zoneid, 405279, 605, 5, 5, true) --Familiar Faces
PlexusStatusRaidDebuff:DebuffId(zoneid, 401197, 606, 5, 5, true) --Fixate
PlexusStatusRaidDebuff:DebuffId(zoneid, 412768, 607, 5, 5, true) --Anachronistic Decay
PlexusStatusRaidDebuff:DebuffId(zoneid, 406481, 608, 5, 5, true) --Time Traps
PlexusStatusRaidDebuff:DebuffId(zoneid, 401667, 609, 5, 5, true) --Time Stasis
PlexusStatusRaidDebuff:DebuffId(zoneid, 406100, 610, 5, 5, true) --Temporal Backlash

PlexusStatusRaidDebuff:BossNameId(zoneid, 700, "Time-Lost Battlefield")
PlexusStatusRaidDebuff:DebuffId(zoneid, 407120, 701, 5, 5, true) --Serrated Axe
PlexusStatusRaidDebuff:DebuffId(zoneid, 406962, 702, 5, 5, true) --Axe Throw
PlexusStatusRaidDebuff:DebuffId(zoneid, 407122, 703, 5, 5, true) --Rain of Fire
PlexusStatusRaidDebuff:DebuffId(zoneid, 407121, 704, 5, 5, true) --Immolate
PlexusStatusRaidDebuff:DebuffId(zoneid, 410234, 705, 5, 5, true) --Bladestorm
PlexusStatusRaidDebuff:DebuffId(zoneid, 410254, 706, 5, 5, true) --Decapitate
PlexusStatusRaidDebuff:DebuffId(zoneid, 410497, 707, 5, 5, true) --Mortal Wounds
PlexusStatusRaidDebuff:DebuffId(zoneid, 419602, 708, 5, 5, true) --Thirst for Battle
PlexusStatusRaidDebuff:DebuffId(zoneid, 408227, 709, 5, 5, true) --Shockwave
PlexusStatusRaidDebuff:DebuffId(zoneid, 418046, 710, 5, 5, true) --FOR THE HORDE!
PlexusStatusRaidDebuff:DebuffId(zoneid, 410496, 711, 5, 5, true) --War Cry

PlexusStatusRaidDebuff:BossNameId(zoneid, 800, "Chrono-Lord Deios")
PlexusStatusRaidDebuff:DebuffId(zoneid, 416152, 801, 5, 5, true) --Summon Infinite Keeper
PlexusStatusRaidDebuff:DebuffId(zoneid, 416261, 802, 5, 5, true) --Collapsing Time Rift
PlexusStatusRaidDebuff:DebuffId(zoneid, 412027, 803, 5, 5, true) --Chronal Burn
PlexusStatusRaidDebuff:DebuffId(zoneid, 411763, 804, 5, 5, true) --Infinite Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 410911, 805, 5, 5, true) --Time-Displaced Trooper
PlexusStatusRaidDebuff:DebuffId(zoneid, 411023, 806, 5, 5, true) --Time-Displacement
PlexusStatusRaidDebuff:DebuffId(zoneid, 410904, 807, 5, 5, true) --Infinity Orb
PlexusStatusRaidDebuff:DebuffId(zoneid, 410908, 808, 5, 5, true) --Infinity Nova
PlexusStatusRaidDebuff:DebuffId(zoneid, 416139, 809, 5, 5, true) --Temporal Breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 416264, 810, 5, 5, true) --Infinite Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 417413, 811, 5, 5, true) --Temporal Scar
end)
