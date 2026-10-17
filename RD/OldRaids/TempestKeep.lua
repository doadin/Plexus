-- local zone = "Tempest Keep"
-- AKA, "The Eye"
local zoneid = 334
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
-- Note: updated spell IDs as of WoD 6.1 3/7/2015

--zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

--Trash
-- Crystalcore Mechanic
PlexusStatusRaidDebuff:DebuffId(zoneid, 37123, 1, 3, 3) --Saw Blade (dot)

-- Tempest-Smith
PlexusStatusRaidDebuff:DebuffId(zoneid, 37120, 1, 3, 3) --Fragmentation Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 37118, 1, 2, 2, true) --Shell Shock (stun)

-- Crimson Hand Blood Knight, Bloodwarder Vindicator, Bloodwarder Squire
PlexusStatusRaidDebuff:DebuffId(zoneid, 39077, 1, 4, 4, true) --Hammer of Justice Shock (stun, magic)

-- Crimson Hand Battle Mage
PlexusStatusRaidDebuff:DebuffId(zoneid, 39087, 1, 1, 1, true) -- Frost Attack (slow)
PlexusStatusRaidDebuff:DebuffId(zoneid, 37262, 1, 2, 2, true) -- Frostbolt Volley (slow, magic)

-- Crimson Hand Inquisitor
PlexusStatusRaidDebuff:DebuffId(zoneid, 37275, 1, 4, 4, true) --Shadow Word: Pain (dot, magic)

-- Star Scryer, Nether Scryer
PlexusStatusRaidDebuff:DebuffId(zoneid, 37122, 1, 4, 4, true) --Domination (charm)

-- Apprentice Star Scryer
PlexusStatusRaidDebuff:DebuffId(zoneid, 37132, 1, 4, 4, true) --Arcane Shock (dot, magic)

-- Novice Astromancer
PlexusStatusRaidDebuff:DebuffId(zoneid, 37279, 1, 3, 3) --Rain of Fire (dot)

-- Tempest Falconer
PlexusStatusRaidDebuff:DebuffId(zoneid, 37155, 1, 3, 3, true) --Immolation (dot)

-- Void Reaver
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Void Reaver")

-- Al'ar
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Al'ar")
PlexusStatusRaidDebuff:DebuffId(zoneid, 34121, 21, 2, 2, true, true) --Flame Buffet
PlexusStatusRaidDebuff:DebuffId(zoneid, 35410, 22, 3, 3, true) --Melt Armor

--Solarian
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "High Astromancer Solarian")
PlexusStatusRaidDebuff:DebuffId(zoneid, 42783, 31, 5, 5, true) --Wrath of the Astromancer
PlexusStatusRaidDebuff:DebuffId(zoneid, 34322, 32, 5, 5, true) --Psychic Scream (fear, magic)

--Kaeltahas
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Kael'thas Sunstrider")
PlexusStatusRaidDebuff:DebuffId(zoneid, 36798, 41, 5, 5) --Mind Control
PlexusStatusRaidDebuff:DebuffId(zoneid, 36834, 42, 5, 5, true) --Arcane Disruption (disorient)
-- Thaladred the Darkener
PlexusStatusRaidDebuff:DebuffId(zoneid, 36965, 43, 3, 3, true) --Rend (dot)
PlexusStatusRaidDebuff:DebuffId(zoneid, 30225, 44, 1, 1, true) --Silence
-- Load Sanguinar
PlexusStatusRaidDebuff:DebuffId(zoneid, 44863, 45, 2, 2, true) --Bellowing Roar (fear)
-- Grand Astromancer Capernian
PlexusStatusRaidDebuff:DebuffId(zoneid, 37018, 46, 3, 3, true) --Conflagration (dot)
PlexusStatusRaidDebuff:DebuffId(zoneid, 36970, 47, 1, 1, true) --Arane Burst (movement)
-- Master Engineer Telonicus
PlexusStatusRaidDebuff:DebuffId(zoneid, 37027, 48, 2, 2) --Remote Toy (periodic stun)
end)
