-- local zone = "Tempest Keep"
local zoneid = 334
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
PlexusStatusRaidDebuff:DebuffId(zoneid, 37123, 1, 5, 5) --Saw Blade
PlexusStatusRaidDebuff:DebuffId(zoneid, 37120, 2, 5, 5) --Fragmentation Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 37118, 3, 5, 5) --Shell Shock

--Solarian
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "High Astromancer Solarian")
PlexusStatusRaidDebuff:DebuffId(zoneid, 42783, 31, 5, 5, true) --Wrath of the Astromancer

--Kaeltahas
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Kael'thas Sunstrider")
PlexusStatusRaidDebuff:DebuffId(zoneid, 37027, 41, 5, 5) --Remote Toy
PlexusStatusRaidDebuff:DebuffId(zoneid, 36798, 42, 5, 5) --Mind Control
end)
