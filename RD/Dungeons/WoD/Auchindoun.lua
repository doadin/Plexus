--local zone = "Auchindoun"
local zoneid = 593

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

--Vigilant Kaathar
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Vigilant Kaathar")
PlexusStatusRaidDebuff:DebuffId(zoneid, 153480, 11, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 153006, 12, 5, 5)
PlexusStatusRaidDebuff:DebuffId(zoneid, 152954, 13, 4, 4)
PlexusStatusRaidDebuff:DebuffId(zoneid, 154526, 14, 3, 3)
PlexusStatusRaidDebuff:DebuffId(zoneid, 157465, 15, 1, 1)

--Soulbinder Nyami
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Soulbinder Nyami")
PlexusStatusRaidDebuff:DebuffId(zoneid, 154415, 21, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 154477, 22, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 153477, 23, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 154218, 24, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 154261, 25, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 154241, 26, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 154173, 27, 6, 6, true)

--Azzakel
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Azzakel")
PlexusStatusRaidDebuff:DebuffId(zoneid, 153234, 31, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 153396, 32, 6, 6, true)
--Claws of Argus
PlexusStatusRaidDebuff:DebuffId(zoneid, 154221, 33, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 154018, 34, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 157173, 35, 6, 6, true)
--Malevolent Crash
PlexusStatusRaidDebuff:DebuffId(zoneid, 153500, 36, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 153725, 37, 6, 6, true)

--Teron'gor
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Teron'gor")
PlexusStatusRaidDebuff:DebuffId(zoneid, 156829, 41, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156842, 42, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156854, 43, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156974, 44, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156829, 45, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 164841, 46, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156921, 47, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156925, 48, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156854, 49, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156954, 50, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 164846, 51, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156964, 52, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156960, 53, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156974, 54, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156963, 55, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 164841, 56, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 157041, 57, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156965, 58, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156842, 59, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 157001, 60, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156968, 61, 6, 6, true)
end)