-- local zone = "The Ruby Sanctum"
local zoneid = 200
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
PlexusStatusRaidDebuff:DebuffId(zoneid, 13737, 1, 5, 5, true) --Mortal Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 15621, 2, 5, 5) --Skull Crack
PlexusStatusRaidDebuff:DebuffId(zoneid, 75413, 3, 5, 5, true) --Flame Wave
PlexusStatusRaidDebuff:DebuffId(zoneid, 75418, 4, 5, 5) --Shockwave

--Saviana Ragefire
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Saviana Ragefire")
PlexusStatusRaidDebuff:DebuffId(zoneid, 74453, 11, 5, 5, true) --Flame Beacon
PlexusStatusRaidDebuff:DebuffId(zoneid, 74456, 12, 5, 5, true) --Conflagration

--Baltharus the Warborn
PlexusStatusRaidDebuff:BossNameId(zoneid, 15, "Baltharus the Warborn")
PlexusStatusRaidDebuff:DebuffId(zoneid, 74505, 16, 5, 5, false, true) --Enervating Brand
PlexusStatusRaidDebuff:DebuffId(zoneid, 74509, 17, 5, 5) --Repelling Wave

--General Zarithrian
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "General Zarithrian")
PlexusStatusRaidDebuff:DebuffId(zoneid, 74384, 21, 5, 5, true) --Intimidating Roar
PlexusStatusRaidDebuff:DebuffId(zoneid, 74367, 22, 5, 5, false, true) --Cleave Armor

--Halion
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Halion")
PlexusStatusRaidDebuff:DebuffId(zoneid, 74567, 31, 5, 5, true, true) --Mark of Combustion
PlexusStatusRaidDebuff:DebuffId(zoneid, 74795, 32, 5, 5, true, true) --Mark of Consumption
end)
