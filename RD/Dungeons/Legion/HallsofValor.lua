--local zone = "Halls of Valor"
local zoneid = 704

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

--M+
PlexusStatusRaidDebuff:DebuffId(zoneid, 240447, 1, 6, 6, true) --Quake
PlexusStatusRaidDebuff:DebuffId(zoneid, 240559, 1, 6, 6, true, true) --Grievous Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 209858, 1, 6, 6, true, true) --Necrotic Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 240443, 1, 6, 6, true, true) --Burst
PlexusStatusRaidDebuff:DebuffId(zoneid, 226512, 1, 6, 6, true) --Sanguine Ichor
PlexusStatusRaidDebuff:DebuffId(zoneid, 409492, 1, 6, 6, true, true) --Afflicted Cry
PlexusStatusRaidDebuff:DebuffId(zoneid, 408805, 1, 6, 6, true) --Destabilize
PlexusStatusRaidDebuff:DebuffId(zoneid, 408556, 1, 6, 6, true) --Entangled
PlexusStatusRaidDebuff:DebuffId(zoneid, 440313, 1, 6, 6, true) --Devouring Rift

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 199050, 1, 6, 6, true) --Mortal Hew
PlexusStatusRaidDebuff:DebuffId(zoneid, 199652, 1, 6, 6, true) --Sever
PlexusStatusRaidDebuff:DebuffId(zoneid, 198944, 1, 6, 6, true) --Breach Armor
PlexusStatusRaidDebuff:DebuffId(zoneid, 215430, 1, 6, 6, true) --Thunderstrike
PlexusStatusRaidDebuff:DebuffId(zoneid, 199674, 1, 6, 6, true) --Wicked Dagger
PlexusStatusRaidDebuff:DebuffId(zoneid, 199818, 1, 6, 6, true) --Crackle
PlexusStatusRaidDebuff:DebuffId(zoneid, 198959, 1, 6, 6, true) --Etch
PlexusStatusRaidDebuff:DebuffId(zoneid, 193702, 1, 6, 6, true) --Infernal Flames

--Hymdall
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Hymdall")
PlexusStatusRaidDebuff:DebuffId(zoneid, 193092, 11, 6, 6, true) --Bloodletting Sweep


--Hyrja
--PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Hyrja")
--PlexusStatusRaidDebuff:DebuffId(zoneid, 154415, 21, 6, 6, true)


--Fenryr
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Fenryr")
PlexusStatusRaidDebuff:DebuffId(zoneid, 196497, 31, 6, 6, true) --Ravenous Leap


--God-King Skovald
--PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "God-King Skovald")
--PlexusStatusRaidDebuff:DebuffId(zoneid, 156829, 41, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 193660, 41, 6, 6, true) --Felblaze Rush

--Odyn
--PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Odyn")
--PlexusStatusRaidDebuff:DebuffId(zoneid, 156829, 51, 6, 6, true)
end)