-- local zone = "The Eye of Eternity"
local zoneid = 141
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
-- Note: confirmed spell IDs as of WoD 6.1 3/8/2015

--zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

--Malygos
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Malygos")
PlexusStatusRaidDebuff:DebuffId(zoneid, 57407, 11, 5, 5) --Surge of Power
PlexusStatusRaidDebuff:DebuffId(zoneid, 56272, 12, 5, 5, true ) --Arcane Breath
end)
