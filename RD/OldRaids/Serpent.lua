-- local zone = "Serpentshrine Cavern"
local zoneid = 332
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

--zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 39042, 1, 5, 5) --Rampent Infection
PlexusStatusRaidDebuff:DebuffId(zoneid, 39044, 2, 5, 5, true) --Serpentshrine Parasite

--Hydross
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Hydross the Unstable")
PlexusStatusRaidDebuff:DebuffId(zoneid, 38235, 11, 5, 5, true) --Water Tomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 38246, 12, 5, 5) --Vile Sludge

--Morogrim
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Morogrim Tidewalker")
PlexusStatusRaidDebuff:DebuffId(zoneid, 37850, 21, 5, 5, true) --Watery Grave

--Leotheras
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Leotheras the Blind")
PlexusStatusRaidDebuff:DebuffId(zoneid, 37676, 31, 5, 5) --insidious whisper
PlexusStatusRaidDebuff:DebuffId(zoneid, 37641, 32, 5, 5, true) --Whirl wind
PlexusStatusRaidDebuff:DebuffId(zoneid, 37749, 33, 5, 5) --Madness

--Vashj
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Lady Vashj")
PlexusStatusRaidDebuff:DebuffId(zoneid, 38280, 34, 5, 5, true) --Static Charge
end)
