--local zone = "Gate of the Setting Sun"
local zoneid = 297

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

--Temple Guardian Anhuur
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Temple Guardian Anhuur")
--Burning Light
PlexusStatusRaidDebuff:DebuffId(zoneid, 75592, 11, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 75322, 12, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 75323, 13, 6, 6, true)
--Poison-tipped Fangs
--Earthrager Ptah
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Earthrager Ptah")
PlexusStatusRaidDebuff:DebuffId(zoneid, 77370, 21, 6, 6, true)
--Quicksand
--Sand Vortex
--Anraphet
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Anraphet")
PlexusStatusRaidDebuff:DebuffId(zoneid, 75603, 31, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 75604, 32, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 76184, 33, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 75622, 34, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 75623, 35, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 75609, 36, 6, 6, true)
--Isiset, Construct of Magic
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Isiset, Construct of Magic")
PlexusStatusRaidDebuff:DebuffId(zoneid, 74136, 41, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 74137, 42, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 74134, 43, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 74365, 44, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 74371, 45, 6, 6, true)
--Ammunae, Construct of Life
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Ammunae, Construct of Life")
PlexusStatusRaidDebuff:DebuffId(zoneid, 76043, 51, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 75718, 52, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 79766, 53, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 79767, 54, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 79768, 55, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 80968, 56, 6, 6, true)
--Thorn Slash
--Noxious Spores
--Setesh, Construct of Destruction
--Reign of Chaos
--Chaos Blast
--Seed of Chaos
--Rajh, Construct of Sun
PlexusStatusRaidDebuff:BossNameId(zoneid, 70, "Rajh, Construct of Sun")
PlexusStatusRaidDebuff:DebuffId(zoneid, 73872, 71, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 73874, 72, 6, 6, true)
--Solar Fire
PlexusStatusRaidDebuff:DebuffId(zoneid, 76355, 73, 6, 6, true)
end)