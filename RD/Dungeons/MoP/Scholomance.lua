--local zone = "Scholomance"
local zoneid = 476

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

--Instructor Chillheart
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Instructor Chillheart")
PlexusStatusRaidDebuff:DebuffId(zoneid, 111631, 11, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 111610, 12, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 51498, 13, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 32860, 14, 6, 6, true)
--Jandice Barov
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Jandice Barov")
PlexusStatusRaidDebuff:DebuffId(zoneid, 114035, 21, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 113775, 22, 6, 6, true)
--Rattlegore
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Rattlegore")
PlexusStatusRaidDebuff:DebuffId(zoneid, 114007, 31, 6, 6, true)
--Lilian Voss
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Lilian Voss")
PlexusStatusRaidDebuff:DebuffId(zoneid, 111585, 41, 6, 6, true)
--Darkmaster Gandling
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Darkmaster Gandling")
PlexusStatusRaidDebuff:DebuffId(zoneid, 348, 51, 6, 6, true)
end)