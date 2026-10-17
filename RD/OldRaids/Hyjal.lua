-- local zone = "Hyjal Summit"
local zoneid = 329
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

--Winterchill
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Rage Winterchill")
PlexusStatusRaidDebuff:DebuffId(zoneid, 31249, 11, 5, 5, true) --Ice Bolt

--Aneteron
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Anetheron")
PlexusStatusRaidDebuff:DebuffId(zoneid, 31306, 21, 5, 5) --Carrion Swarm
PlexusStatusRaidDebuff:DebuffId(zoneid, 31298, 22, 5, 5, true) --Sleep

--Azgalor
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Azgalor")
PlexusStatusRaidDebuff:DebuffId(zoneid, 31347, 31, 5, 5, true) --Doom
PlexusStatusRaidDebuff:DebuffId(zoneid, 31341, 32, 5, 5, true) --Unquenchable Flames
PlexusStatusRaidDebuff:DebuffId(zoneid, 31344, 33, 5, 5, true) --Howl of Azgalor

--Achimonde
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Archimonde")
PlexusStatusRaidDebuff:DebuffId(zoneid, 31944, 41, 5, 5, true) --Doomfire
PlexusStatusRaidDebuff:DebuffId(zoneid, 31972, 42, 5, 5) --Grip
end)
