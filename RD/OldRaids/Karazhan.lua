-- local zone = "Karazhan"
local zoneid = 350
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

--zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

--Moroes
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Moroes")
PlexusStatusRaidDebuff:DebuffId(zoneid, 37066, 11, 5, 5) --Garrote

--Maiden
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Maiden of Virtue")
PlexusStatusRaidDebuff:DebuffId(zoneid, 29522, 21, 5, 5) --Holy Fire
PlexusStatusRaidDebuff:DebuffId(zoneid, 29511, 22, 5, 5) --Repentance

--Opera : Bigbad wolf
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "The Big Bad Wolf")
PlexusStatusRaidDebuff:DebuffId(zoneid, 30753, 31, 5, 5, true) --Red riding hood

--Illhoof
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Terestian Illhoof")
PlexusStatusRaidDebuff:DebuffId(zoneid, 30115, 41, 5, 5) --Sacrifice

--Malche
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Prince Malchezaar")
PlexusStatusRaidDebuff:DebuffId(zoneid, 30843, 51, 5, 5) --Enfeeble
end)
