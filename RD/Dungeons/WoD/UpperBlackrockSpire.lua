--local zone = "Upper Blackrock Spire"
local zoneid = 617

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

--Orebender Gor'ashan
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Orebender Gor'ashan")
PlexusStatusRaidDebuff:DebuffId(zoneid, 166168, 11, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 154417, 12, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 154448, 13, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 154435, 14, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 154899, 15, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 154335, 16, 6, 6, true)

--Kyrak
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Kyrak")
PlexusStatusRaidDebuff:DebuffId(zoneid, 161199, 21, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 161203, 22, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 161288, 23, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 162644, 24, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 155033, 25, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 155037, 26, 6, 6, true)

--Commander Tharbek
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Commander Tharbek")
PlexusStatusRaidDebuff:DebuffId(zoneid, 161765, 31, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 162000, 32, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 162097, 33, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 161985, 34, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 161772, 35, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 161833, 36, 6, 6, true)

--Ragewing the Untamed
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Ragewing the Untamed")
PlexusStatusRaidDebuff:DebuffId(zoneid, 155031, 41, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 155051, 42, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 155065, 43, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 155081, 44, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 155620, 45, 6, 6, true)

--Warlord Zaela
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Warlord Zaela")
PlexusStatusRaidDebuff:DebuffId(zoneid, 155673, 51, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169158, 52, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 155705, 53, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 155720, 54, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 166041, 55, 6, 6, true)
end)