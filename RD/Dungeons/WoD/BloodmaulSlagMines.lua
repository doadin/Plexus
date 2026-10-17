--local zone = "Bloodmaul Slag Mines"
local zoneid = 573

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

--Magmolatus
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Magmolatus")
PlexusStatusRaidDebuff:DebuffId(zoneid, 150011, 11, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 150344, 12, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 149941, 13, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 149975, 14, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 149997, 15, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 150290, 16, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 150032, 17, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 150034, 18, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 150023, 19, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 150045, 20, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 150011, 21, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 150055, 22, 6, 6, true)

--Slave Watcher Crushto
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Slave Watcher Crushto")
PlexusStatusRaidDebuff:DebuffId(zoneid, 153679, 31, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 150759, 32, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 150753, 33, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 150745, 34, 6, 6, true)
--Raise the Miners
PlexusStatusRaidDebuff:DebuffId(zoneid, 150807, 35, 6, 6, true)

--Roltall
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Roltall")
PlexusStatusRaidDebuff:DebuffId(zoneid, 153247, 41, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 152897, 42, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 153227, 43, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 167739, 44, 6, 6, true)

--Gug'rokk
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Gug'rokk")
PlexusStatusRaidDebuff:DebuffId(zoneid, 150677, 51, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 150682, 52, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 150784, 53, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 150734, 54, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 152091, 55, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 163802, 56, 6, 6, true)
end)