--local zone = "Karazhan"
local zoneid = 812

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
PlexusStatusRaidDebuff:DebuffId(zoneid, 373552, 1, 6, 6, true) --Hypnosis Bat
PlexusStatusRaidDebuff:DebuffId(zoneid, 373429, 1, 6, 6, true, true) --Carrion Swarm
PlexusStatusRaidDebuff:DebuffId(zoneid, 373391, 1, 6, 6, true) --Nightmare
PlexusStatusRaidDebuff:DebuffId(zoneid, 373744, 1, 6, 6, true) --Blood Siphon

--Shade of Medivh
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Shade of Medivh")
PlexusStatusRaidDebuff:DebuffId(zoneid, 227779, 11, 6, 6, false, true)  --Ceaseless Winter
PlexusStatusRaidDebuff:DebuffId(zoneid, 228261, 12, 6, 6, true)  --Flame Wreath
PlexusStatusRaidDebuff:DebuffId(zoneid, 227592, 13, 6, 6, true)  --Frostbite
PlexusStatusRaidDebuff:DebuffId(zoneid, 228249, 14, 6, 6, true)  --Inferno Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 227644, 15, 6, 6, true)  --Piercing Missiles


--Mana Devourer
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Mana Devourer ")
PlexusStatusRaidDebuff:DebuffId(zoneid, 227502, 21, 6, 6, true) --Unstable Mana


--Opera Hall: Wikket
--PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Opera Hall: Wikket")
--PlexusStatusRaidDebuff:DebuffId(zoneid, 244916, 31, 6, 6, false, true) --Void Lashing


--Opera Hall: Westfall Story
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Opera Hall: Westfall Story")
PlexusStatusRaidDebuff:DebuffId(zoneid, 227568, 41, 6, 6, true) --Burning Leg Sweep
PlexusStatusRaidDebuff:DebuffId(zoneid, 227567, 42, 6, 6, true) --Knocked Down

--Opera Hall: Beautiful Beast
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Opera Hall: Beautiful Beast")
PlexusStatusRaidDebuff:DebuffId(zoneid, 227985, 51, 6, 6, true) --Dent Armor

--Maiden of Virtue
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Maiden of Virtue")
PlexusStatusRaidDebuff:DebuffId(zoneid, 227800, 61, 6, 6, false, true) --Holy Shock
PlexusStatusRaidDebuff:DebuffId(zoneid, 227823, 62, 6, 6, false, true) --Holy Wrath
PlexusStatusRaidDebuff:DebuffId(zoneid, 227789, 63, 6, 6, false, true) --Sacred Ground

--Attumen the Huntsman
PlexusStatusRaidDebuff:BossNameId(zoneid, 70, "Attumen the Huntsman")
PlexusStatusRaidDebuff:DebuffId(zoneid, 227493, 71, 6, 6, true) --Mortal Strike

--The Curator
PlexusStatusRaidDebuff:BossNameId(zoneid, 80, "The Curator")
PlexusStatusRaidDebuff:DebuffId(zoneid, 227279, 81, 6, 6, true) --Power Discharge

--Moroes
PlexusStatusRaidDebuff:BossNameId(zoneid, 90, "Moroes")
PlexusStatusRaidDebuff:DebuffId(zoneid, 227832, 91, 6, 6, true) --Coat Check
PlexusStatusRaidDebuff:DebuffId(zoneid, 227742, 92, 6, 6, true) --Garrote

--Viz'aduum the Watcher
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Viz'aduum the Watcher")
PlexusStatusRaidDebuff:DebuffId(zoneid, 229083, 101, 6, 6, false, true) --Burning Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 229159, 102, 6, 6, true) --Chaotic Shadows
end)
