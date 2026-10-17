-- local zone = "Sunwell Plateau"
local zoneid = 335
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

--zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 46561, 1, 5, 5) --Fear
PlexusStatusRaidDebuff:DebuffId(zoneid, 46562, 2, 5, 5) --Mind Flay
PlexusStatusRaidDebuff:DebuffId(zoneid, 46266, 3, 5, 5) --Burn Mana
PlexusStatusRaidDebuff:DebuffId(zoneid, 46557, 4, 5, 5) --Slaying Shot
PlexusStatusRaidDebuff:DebuffId(zoneid, 46560, 5, 5, 5) --Shadow Word: Pain
PlexusStatusRaidDebuff:DebuffId(zoneid, 46543, 6, 5, 5) --Ignite Mana
PlexusStatusRaidDebuff:DebuffId(zoneid, 46427, 7, 5, 5) --Domination

--Kalecgos
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Kalecgos")
PlexusStatusRaidDebuff:DebuffId(zoneid, 45032, 11, 5, 5, true) --Curse of Boundless Agony
PlexusStatusRaidDebuff:DebuffId(zoneid, 45018, 12, 5, 5) --Arcane Buffet

--Brutallus
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Brutallus")
PlexusStatusRaidDebuff:DebuffId(zoneid, 46394, 21, 5, 5, true) --Burn
PlexusStatusRaidDebuff:DebuffId(zoneid, 45150, 22, 5, 5, false, true) --Meteor Slash

--Felmyst
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Felmyst")
PlexusStatusRaidDebuff:DebuffId(zoneid, 45855, 31, 5, 5) --Gas Nova
PlexusStatusRaidDebuff:DebuffId(zoneid, 45662, 32, 5, 5, true) --Encapsulate(dosen't have Combat Log)
PlexusStatusRaidDebuff:DebuffId(zoneid, 45402, 33, 5, 5) --Demonic Vapor
PlexusStatusRaidDebuff:DebuffId(zoneid, 45717, 34, 5, 5) --Fog of Corruption*unit is hostile in comabtlog event)

--Twins
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "The Eredar Twins")
PlexusStatusRaidDebuff:DebuffId(zoneid, 45256, 41, 5, 5) --Confounding Blow
PlexusStatusRaidDebuff:DebuffId(zoneid, 45333, 42, 5, 5) --Conflagration
PlexusStatusRaidDebuff:DebuffId(zoneid, 46771, 43, 5, 5) --Flame Sear
PlexusStatusRaidDebuff:DebuffId(zoneid, 45270, 44, 5, 5) --Shadowfury
PlexusStatusRaidDebuff:DebuffId(zoneid, 45347, 45, 5, 5, false, false, {r = 1, g = 0, b = 0}, true) --Dark Touched
PlexusStatusRaidDebuff:DebuffId(zoneid, 45348, 46, 5, 5, false, false, {r = 0, g = 0, b = 1}, true) --Fire Touched

--Muru
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "M'uru")
PlexusStatusRaidDebuff:DebuffId(zoneid, 45996, 51, 5, 5) --Darkness

--Kiljaeden
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Kil'jaeden")
PlexusStatusRaidDebuff:DebuffId(zoneid, 45442, 61, 5, 5) --Soul Flay
PlexusStatusRaidDebuff:DebuffId(zoneid, 45641, 62, 5, 5, true) --Fire Bloom
PlexusStatusRaidDebuff:DebuffId(zoneid, 45885, 63, 5, 5, true) --Shadow Spike
PlexusStatusRaidDebuff:DebuffId(zoneid, 45737, 64, 5, 5, true) --Flame Dart
end)
