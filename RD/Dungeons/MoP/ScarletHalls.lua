--local zone = "Scarlet Halls"
local zoneid = 431

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

--Houndmaster Braun
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Houndmaster Braun")
PlexusStatusRaidDebuff:DebuffId(zoneid, 114056, 11, 6, 6, true)
--Armsmaster Harlan
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Armsmaster Harlan")
PlexusStatusRaidDebuff:DebuffId(zoneid, 111216, 21, 6, 6, true)
--Flameweaver Kogler
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Flameweaver Kogler")
PlexusStatusRaidDebuff:DebuffId(zoneid, 113364, 31, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 113616, 32, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 113653, 33, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 11366, 34, 6, 6, true)
end)