-- local zone = "Baradin Hold"
local zoneid = 282
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

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

--Trash
-- Demon Containment Unit
PlexusStatusRaidDebuff:DebuffId(zoneid, 89354, 1, 6, 5) --Arcane Amplifier
-- Disciple of Hate
PlexusStatusRaidDebuff:DebuffId(zoneid, 105859, 1, 5, 5) --Run Through

--Argaloth
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Argaloth")
PlexusStatusRaidDebuff:DebuffId(zoneid, 88942, 11, 5, 5, true, true) --Meteor Slash
PlexusStatusRaidDebuff:DebuffId(zoneid, 88954, 12, 6, 6) --Consuming Darkness

--Occu'thar
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Occu'thar")
PlexusStatusRaidDebuff:DebuffId(zoneid, 96913, 21, 5, 5, true, true) --Searing Shadows
-- Eye of Occu'thar
PlexusStatusRaidDebuff:DebuffId(zoneid, 97028, 22, 6, 6) --Gaze of Occu'thar

--Alizabal
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Alizabal")
PlexusStatusRaidDebuff:DebuffId(zoneid, 104936, 31, 4, 4) --Skewer
PlexusStatusRaidDebuff:DebuffId(zoneid, 105067, 32, 6, 6) --Seething Hate
end)
