--local zone = "Shado-Pan Monastery"
local zoneid = 443

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

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

--Saboteur Kip'tilak
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Saboteur Kip'tilak")
PlexusStatusRaidDebuff:DebuffId(zoneid, 107268, 11, 6, 6, true)

--Gu Cloudstrike
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Gu Cloudstrike")
PlexusStatusRaidDebuff:DebuffId(zoneid, 106984, 21, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 106941, 22, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 107140, 23, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 102573, 24, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 110852, 25, 6, 6, true)
--Master Snowdrift
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Master Snowdrift")
PlexusStatusRaidDebuff:DebuffId(zoneid, 106853, 31, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 106434, 32, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 106352, 33, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 106422, 34, 6, 6, true)
--Sha of Violence
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Sha of Violence")
PlexusStatusRaidDebuff:DebuffId(zoneid, 106872, 41, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 106827, 42, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 127576, 43, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 106871, 44, 6, 6, true)
--Taran Zhu
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Taran Zhu")
PlexusStatusRaidDebuff:DebuffId(zoneid, 107087, 51, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 107357, 52, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 112933, 53, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 112918, 54, 6, 6, true)
end)