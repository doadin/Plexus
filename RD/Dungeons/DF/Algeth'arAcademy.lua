-- local zone = "Algeth'ar Academy"
local zoneid = 2097
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

--"Trash"
PlexusStatusRaidDebuff:DebuffId(zoneid, 390918, 1, 5, 5, true) -- Seed Detonation
PlexusStatusRaidDebuff:DebuffId(zoneid, 377344, 1, 5, 5, true) -- Peck
PlexusStatusRaidDebuff:DebuffId(zoneid, 388912, 1, 5, 5, true) -- Severing Slash
PlexusStatusRaidDebuff:DebuffId(zoneid, 388866, 1, 5, 5, true) -- Mana Void
PlexusStatusRaidDebuff:DebuffId(zoneid, 388984, 1, 5, 5, true) -- Vicious Ambush
PlexusStatusRaidDebuff:DebuffId(zoneid, 388392, 1, 5, 5, true) -- Monotonous Lecture
PlexusStatusRaidDebuff:DebuffId(zoneid, 387932, 1, 5, 5, true) -- Astral Whirlwind
PlexusStatusRaidDebuff:DebuffId(zoneid, 378011, 1, 5, 5, true) -- Deadly Winds
PlexusStatusRaidDebuff:DebuffId(zoneid, 387843, 1, 5, 5, true) -- Astral Bomb

PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Vexamus")
PlexusStatusRaidDebuff:DebuffId(zoneid, 391977, 101, 5, 5, true) -- Oversurge
PlexusStatusRaidDebuff:DebuffId(zoneid, 386181, 102, 5, 5, true) -- Mana Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 386201, 103, 5, 5, true) -- Corrupted Mana

PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Overgrown Ancient")
PlexusStatusRaidDebuff:DebuffId(zoneid, 388544, 201, 5, 5, true) -- Barkbreaker
PlexusStatusRaidDebuff:DebuffId(zoneid, 396716, 202, 5, 5, true) -- Splinterbark
PlexusStatusRaidDebuff:DebuffId(zoneid, 389033, 203, 5, 5, true) -- Lasher Toxin

PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Crawth")
PlexusStatusRaidDebuff:DebuffId(zoneid, 397210, 301, 5, 5, true) -- Sonic Vulnerability
PlexusStatusRaidDebuff:DebuffId(zoneid, 376449, 302, 5, 5, true) -- Firestorm
PlexusStatusRaidDebuff:DebuffId(zoneid, 376997, 303, 5, 5, true) -- Savage Peck

PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Echo of Doragosa")
PlexusStatusRaidDebuff:DebuffId(zoneid, 374350, 401, 5, 5, true) -- Energy Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 389011, 402, 6, 6, true, true) -- Overwhelming Power
end)
