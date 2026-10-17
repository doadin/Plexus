--local zone_G.PlexusStatusRaidDebuff:DebuffId(zoneid, "Tazavesh, the Veiled Market"
local zoneid = 1989

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

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

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

PlexusStatusRaidDebuff:DebuffId(zoneid, 373552, 1, 6, 6, true) --Hypnosis Bat
PlexusStatusRaidDebuff:DebuffId(zoneid, 373429, 1, 6, 6, true, true) --Carrion Swarm
PlexusStatusRaidDebuff:DebuffId(zoneid, 373391, 1, 6, 6, true) --Nightmare
PlexusStatusRaidDebuff:DebuffId(zoneid, 373744, 1, 6, 6, true) --Blood Siphon

-- Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 357512, 1, 5, 5, true) --Frenzied Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 351960, 1, 5, 5, true) --Static Cling
PlexusStatusRaidDebuff:DebuffId(zoneid, 357190, 1, 5, 5, true) --Star Vulnerability
PlexusStatusRaidDebuff:DebuffId(zoneid, 358168, 1, 5, 5, true) --Shocked
PlexusStatusRaidDebuff:DebuffId(zoneid, 345990, 1, 5, 5, true) --Containment Cell
PlexusStatusRaidDebuff:DebuffId(zoneid, 352134, 1, 5, 5, true) --Dusty Skull
PlexusStatusRaidDebuff:DebuffId(zoneid, 355915, 1, 5, 5, true) --Glyph of Restraint
PlexusStatusRaidDebuff:DebuffId(zoneid, 347716, 1, 5, 5, true) --Letter Opener
PlexusStatusRaidDebuff:DebuffId(zoneid, 357281, 1, 5, 5, true) --Energy Slash
PlexusStatusRaidDebuff:DebuffId(zoneid, 352127, 1, 5, 5, true) --Threadbare Cloth
PlexusStatusRaidDebuff:DebuffId(zoneid, 349999, 1, 5, 5, true) --Anima Detonation
PlexusStatusRaidDebuff:DebuffId(zoneid, 350045, 1, 5, 5, true) --Corrosive Anima
PlexusStatusRaidDebuff:DebuffId(zoneid, 358947, 1, 5, 5, true) --Burning Tar
PlexusStatusRaidDebuff:DebuffId(zoneid, 355641, 1, 5, 5, true) --Scintillate
PlexusStatusRaidDebuff:DebuffId(zoneid, 348450, 1, 5, 5, true) --Bypass Code: Fryse
PlexusStatusRaidDebuff:DebuffId(zoneid, 356324, 1, 5, 5, true) --Empowered Glyph of Restraint
PlexusStatusRaidDebuff:DebuffId(zoneid, 347728, 1, 5, 5, true) --Flock!
PlexusStatusRaidDebuff:DebuffId(zoneid, 358131, 1, 5, 5, true) --Lightning Nova
PlexusStatusRaidDebuff:DebuffId(zoneid, 348451, 1, 5, 5, true) --Bypass Code: Morke
PlexusStatusRaidDebuff:DebuffId(zoneid, 357019, 1, 5, 5, true) --Lightshard Retreat
PlexusStatusRaidDebuff:DebuffId(zoneid, 357452, 1, 5, 5, true) --Dancing
PlexusStatusRaidDebuff:DebuffId(zoneid, 356031, 1, 5, 5, true) --Stasis Beam
PlexusStatusRaidDebuff:DebuffId(zoneid, 356548, 1, 5, 5, true) --Radiant Pulse
PlexusStatusRaidDebuff:DebuffId(zoneid, 357485, 1, 5, 5, true) --Musical Fixation
PlexusStatusRaidDebuff:DebuffId(zoneid, 355476, 1, 5, 5, true) --Shock Mines
PlexusStatusRaidDebuff:DebuffId(zoneid, 352125, 1, 5, 5, true) --Dull Opal
PlexusStatusRaidDebuff:DebuffId(zoneid, 347850, 1, 5, 5, true) --Slowed Time
PlexusStatusRaidDebuff:DebuffId(zoneid, 347771, 1, 5, 5, true) --Expedited
PlexusStatusRaidDebuff:DebuffId(zoneid, 356943, 1, 5, 5, true) --Lockdown
PlexusStatusRaidDebuff:DebuffId(zoneid, 356930, 1, 5, 5, true) --Chain of Custody
PlexusStatusRaidDebuff:DebuffId(zoneid, 348437, 1, 5, 5, true) --Bypass Code: Helvete
PlexusStatusRaidDebuff:DebuffId(zoneid, 351119, 1, 5, 5, true) --Shuriken Blitz
PlexusStatusRaidDebuff:DebuffId(zoneid, 350013, 1, 5, 5, true) --Gluttonous Feast
PlexusStatusRaidDebuff:DebuffId(zoneid, 355451, 1, 5, 5, true) --Undertow
PlexusStatusRaidDebuff:DebuffId(zoneid, 356408, 1, 5, 5, true) --Ground Stomp
PlexusStatusRaidDebuff:DebuffId(zoneid, 355480, 1, 5, 5, true) --Lethal Force
PlexusStatusRaidDebuff:DebuffId(zoneid, 355502, 1, 5, 5, true) --Shocklight Barrier
PlexusStatusRaidDebuff:DebuffId(zoneid, 356407, 1, 5, 5, true) --Ancient Dread
PlexusStatusRaidDebuff:DebuffId(zoneid, 355581, 1, 5, 5, true) --Crackle
PlexusStatusRaidDebuff:DebuffId(zoneid, 357029, 1, 5, 5, true) --Hyperlight Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 356011, 1, 5, 5, true) --Beam Splicer
PlexusStatusRaidDebuff:DebuffId(zoneid, 352129, 1, 5, 5, true) --Cheap Spices
PlexusStatusRaidDebuff:DebuffId(zoneid, 348447, 1, 5, 5, true) --Bypass Code: Lys
PlexusStatusRaidDebuff:DebuffId(zoneid, 357827, 1, 5, 5, true) --Frantic Rip
PlexusStatusRaidDebuff:DebuffId(zoneid, 351956, 1, 5, 5, true) --High-Value Target
PlexusStatusRaidDebuff:DebuffId(zoneid, 346961, 1, 5, 5, true) --Purging Field

-- Zo'phex the Sentinel
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Shade of Medivh")
PlexusStatusRaidDebuff:DebuffId(zoneid, 345770, 10, 5, 5, true) --Impound Contraband
PlexusStatusRaidDebuff:DebuffId(zoneid, 347949, 11, 5, 5, true) --Interrogation
PlexusStatusRaidDebuff:DebuffId(zoneid, 348366, 12, 5, 5, true) --Armed Security

-- The Grand Menagerie
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Shade of Medivh")
PlexusStatusRaidDebuff:DebuffId(zoneid, 350101, 21, 5, 5, true) --Chains of Damnation
PlexusStatusRaidDebuff:DebuffId(zoneid, 349627, 22, 5, 5, true) --Gluttony
PlexusStatusRaidDebuff:DebuffId(zoneid, 349954, 23, 5, 5, true) --Purification Protocol

-- Mailroom Mayhem
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Shade of Medivh")
PlexusStatusRaidDebuff:DebuffId(zoneid, 356374, 31, 5, 5, true) --Unstable Goods
PlexusStatusRaidDebuff:DebuffId(zoneid, 346297, 32, 5, 5, true) --Unstable Explosion
PlexusStatusRaidDebuff:DebuffId(zoneid, 346844, 33, 5, 5, true) --Alchemical Residue
PlexusStatusRaidDebuff:DebuffId(zoneid, 346329, 34, 5, 5, true) --Spilled Liquids
PlexusStatusRaidDebuff:DebuffId(zoneid, 346962, 35, 5, 5, true) --Money Order

-- Myza's Oasis
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Shade of Medivh")
PlexusStatusRaidDebuff:DebuffId(zoneid, 353835, 41, 5, 5, true) --Suppression
PlexusStatusRaidDebuff:DebuffId(zoneid, 355439, 42, 5, 5, true) --Suppression Spark

-- So'azmi
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Shade of Medivh")
PlexusStatusRaidDebuff:DebuffId(zoneid, 347481, 51, 5, 5, true) --Shuri
PlexusStatusRaidDebuff:DebuffId(zoneid, 347744, 52, 5, 5, true) --Quickblade
PlexusStatusRaidDebuff:DebuffId(zoneid, 347150, 53, 5, 5, true) --Triple Technique

-- Hylbrande
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Shade of Medivh")
PlexusStatusRaidDebuff:DebuffId(zoneid, 347094, 61, 5, 5, true) --Titanic Crash
PlexusStatusRaidDebuff:DebuffId(zoneid, 346828, 62, 5, 5, true) --Sanitizing Field
PlexusStatusRaidDebuff:DebuffId(zoneid, 355360, 63, 5, 5, true) --Runic Feedback

-- Timecap'n Hooktail
PlexusStatusRaidDebuff:BossNameId(zoneid, 70, "Shade of Medivh")
PlexusStatusRaidDebuff:DebuffId(zoneid, 350134, 71, 5, 5, true) --Infinite Breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 354334, 72, 5, 5, true) --Hook'd!
PlexusStatusRaidDebuff:DebuffId(zoneid, 354497, 73, 5, 5, true) --Deadly Seas
PlexusStatusRaidDebuff:DebuffId(zoneid, 352345, 74, 5, 5, true) --Anchor Shot

-- So'leah
PlexusStatusRaidDebuff:BossNameId(zoneid, 80, "Shade of Medivh")
PlexusStatusRaidDebuff:DebuffId(zoneid, 350804, 81, 5, 5, true) --Collapsing Energy
PlexusStatusRaidDebuff:DebuffId(zoneid, 350885, 82, 5, 5, true) --Hyperlight Jolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 351101, 83, 5, 5, true) --Energy Fragmentation
end)