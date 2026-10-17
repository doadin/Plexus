--local zone = "Skyreach"
local zoneid = 601

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

--Ranjit
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Ranjit")
PlexusStatusRaidDebuff:DebuffId(zoneid, 156793, 11, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 153544, 12, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 153757, 13, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 153315, 14, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 158085, 15, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 154043, 16, 6, 6, true)

--Araknath
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Araknath")
PlexusStatusRaidDebuff:DebuffId(zoneid, 165985, 21, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 154135, 22, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 157304, 23, 6, 6, true)

--Rukhran
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Rukhran")
PlexusStatusRaidDebuff:DebuffId(zoneid, 153794, 31, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 153795, 32, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 153827, 33, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 153828, 34, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169810, 35, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 159381, 36, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 153898, 37, 6, 6, true)

--High Sage Viryx --Unknown
--Cast Down --Unknown
--Lens Flare --Unknown
--Solar Burst --Unknown
--Shielding --Unknown
end)