-- local zone = "The Bastion of Twilight"
local zoneid = 294
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

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

-- Trash
--Magma (falling off)
--PlexusStatusRaidDebuff:DebuffId(zoneid, 81114, 1, 6, 5) --Magma
PlexusStatusRaidDebuff:DebuffId(zoneid, 81118, 1, 6, 5, true, true) --Magma
--Tremors
PlexusStatusRaidDebuff:DebuffId(zoneid, 87931, 1, 6, 5) --Tremors
--Phased Burn
PlexusStatusRaidDebuff:DebuffId(zoneid, 85799, 1, 6, 5) --Phased Burn
--Crimson Flames
PlexusStatusRaidDebuff:DebuffId(zoneid, 88232, 1, 6, 5) --Crimson Flames
--Twilight Soulblade
PlexusStatusRaidDebuff:DebuffId(zoneid, 84850, 1, 6, 5) --Soul Blade
PlexusStatusRaidDebuff:DebuffId(zoneid, 84853, 1, 6, 5) --Dark Pool
--Crimsonborne Firestarter
PlexusStatusRaidDebuff:DebuffId(zoneid, 88219, 1, 6, 5) --Burning Twilight
--Twilight Elementalist
PlexusStatusRaidDebuff:DebuffId(zoneid, 88079, 1, 6, 5) --Frostfire Bolt
--Twilight Shadow Knight
PlexusStatusRaidDebuff:DebuffId(zoneid, 76622, 1, 4, 4, true, true) --Sunder Armor
PlexusStatusRaidDebuff:DebuffId(zoneid, 84832, 1, 5, 5) --Dismantle
--Twilight Dark Mender
PlexusStatusRaidDebuff:DebuffId(zoneid, 84856, 1, 6, 5) --Hungering Shadows
--Twilight Shadow Mender
PlexusStatusRaidDebuff:DebuffId(zoneid, 85643, 1, 6, 5) --Mind Sear
--Twilight-shifter
PlexusStatusRaidDebuff:DebuffId(zoneid, 85564, 1, 5, 5, true, true) --Shifted Reality
--Bound Zephyr
PlexusStatusRaidDebuff:DebuffId(zoneid, 93277, 1, 6, 5, true, true) --Rending Gale
-- More important to show Rending Gale stack imo, but user can adjust priority
-- if they feel differently
PlexusStatusRaidDebuff:DebuffId(zoneid, 93306, 1, 4, 4) --Vaporize
--Bound Rumbler
PlexusStatusRaidDebuff:DebuffId(zoneid, 93327, 1, 6, 5, true, true) --Entomb
-- More important to show Entomb stack imo, but user can adjust priority
-- if they feel differently
PlexusStatusRaidDebuff:DebuffId(zoneid, 93325, 1, 4, 4) --Shockwave
--Faceless Guardian
PlexusStatusRaidDebuff:DebuffId(zoneid, 85482, 1, 6, 5, true, true) --Shadow Volley
--Shadow Lord
PlexusStatusRaidDebuff:DebuffId(zoneid, 87629, 1, 6, 5) --Gripping Shadows

--Bound Deluge
--Everyone should get Cold-Touched
--Frost Whirl is magic

--Azureborne Destroyer
-- Statis Strike is magic
--PlexusStatusRaidDebuff:DebuffId(zoneid, 88178, 1, 6, 5) --Stasis Strike

--Earth Ravager
-- Petrify Skin is magic
-- PlexusStatusRaidDebuff:DebuffId(zoneid, 87917, 1, 6, 5) --Petrify Skin

--Twist Phase-Twister
-- Twist Phase is magic
-- PlexusStatusRaidDebuff:DebuffId(zoneid, 84838, 1, 6, 5) --Twist Phase

--Twilight Crossfire
-- Wyvern Sting is a poison and shows up as one

--Shadow Lord
-- Gripping Shadows is magic
--PlexusStatusRaidDebuff:DebuffId(zoneid, 87629, 1, 6, 5) --Gripping Shadows

--Chosen Seer
-- Flame Shock is Magic

--Halfus Wyrmbreaker
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Halfus Wyrmbreaker")
PlexusStatusRaidDebuff:DebuffId(zoneid, 83710, 11, 5, 5) --Furious Roar
PlexusStatusRaidDebuff:DebuffId(zoneid, 83908, 12, 5, 5, true, true) --Malevolent Strikes
PlexusStatusRaidDebuff:DebuffId(zoneid, 83603, 13, 5, 5) --Stone Touch

-- Valiona and Theralion
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Valiona and Theralion")
PlexusStatusRaidDebuff:DebuffId(zoneid, 86788, 21, 5, 5) --Blackout 10-normal
PlexusStatusRaidDebuff:DebuffId(zoneid, 86622, 22, 5, 5) --Engulfing Magic 10-normal
PlexusStatusRaidDebuff:DebuffId(zoneid, 86202, 23, 5, 5, true, true) --Twilight Shift 10-normal
PlexusStatusRaidDebuff:DebuffId(zoneid, 86014, 24, 5, 5) --Twilight Meteorite
PlexusStatusRaidDebuff:DebuffId(zoneid, 92886, 25, 6, 6, true, true) --Twilight Zone

-- Twilight Ascendant Council
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Ascendant Council")
PlexusStatusRaidDebuff:DebuffId(zoneid, 82762, 31, 5, 5) --Waterlogged
PlexusStatusRaidDebuff:DebuffId(zoneid, 83099, 32, 7, 7) --Lightning Rod
PlexusStatusRaidDebuff:DebuffId(zoneid, 82285, 33, 6, 6) --Elemental Stasis
PlexusStatusRaidDebuff:DebuffId(zoneid, 82660, 34, 6, 6) --Burning Blood
PlexusStatusRaidDebuff:DebuffId(zoneid, 82665, 35, 6, 6) --Heart of Ice
PlexusStatusRaidDebuff:DebuffId(zoneid, 82772, 36, 7, 7) --Frozen
PlexusStatusRaidDebuff:DebuffId(zoneid, 84948, 37, 6, 6) --Gravity Crush
PlexusStatusRaidDebuff:DebuffId(zoneid, 83500, 38, 4, 4) --Swirling Winds
PlexusStatusRaidDebuff:DebuffId(zoneid, 83581, 38, 4, 4) --Grounded
PlexusStatusRaidDebuff:DebuffId(zoneid, 82285, 38, 4, 4) --Elemental Stasis
-- Debuffs we don't care about seeing:
-- PlexusStatusRaidDebuff:DebuffId(zoneid, 83587, 39, 4, 4) --Magnetic Pull
-- Heroic
PlexusStatusRaidDebuff:DebuffId(zoneid, 92307, 39, 7, 7) --Frost Beacon
PlexusStatusRaidDebuff:DebuffId(zoneid, 92467, 39, 7, 7) --Static Overload
PlexusStatusRaidDebuff:DebuffId(zoneid, 92538, 39, 7, 7) --Gravity Core

-- Cho'gall
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Cho'gall")
PlexusStatusRaidDebuff:DebuffId(zoneid, 81701, 41, 4, 4, true, true) --Corrupted Blood
-- Corruption: Accelerated is lower priority than the stacks so it won't overwrite
PlexusStatusRaidDebuff:DebuffId(zoneid, 81836, 42, 3, 3) --Corruption: Accelerated
PlexusStatusRaidDebuff:DebuffId(zoneid, 82125, 43, 3, 3) --Corruption: Malformation
PlexusStatusRaidDebuff:DebuffId(zoneid, 82170, 44, 5, 5) --Corruption: Absolute
PlexusStatusRaidDebuff:DebuffId(zoneid, 82523, 45, 6, 6) --Gall's Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 82518, 46, 6, 6) --Cho's Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 82411, 47, 7, 7) --Debilitating Beam

-- Sinestra
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Sinestra")
PlexusStatusRaidDebuff:DebuffId(zoneid, 89299, 51, 4, 4, true, true) --Twilight Spit
-- Wrack is dispellable
-- GridStatusSinestra handles this better
-- PlexusStatusRaidDebuff:DebuffId(zoneid, 92955, 51, 4, 4) --Wrack
end)
