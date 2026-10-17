--local zone = "The Black Morass"
local zoneid = 273

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


PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Corruption"] = 32197,
PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Time Lapse"] = 31467,
PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Deadly Poison"] = 38520,
PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Frostbolt"] = 38534,
PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Polymorph"] = 13323,
PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Pyroblast"] = 38535,
PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Rupture"] = 15583,
PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Mortal Wound"] = 31464,
PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Fear"] = 12542,
PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Time Stop"] = 31422,
PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Hamstring"] = 9080,
PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Ebon Poison"] = 34366,
PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Crippling Poison"] = 30981,
PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Mortal Strike"] = 35054,
PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Curse of Vulnerability"] = 36276,
PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Knockdown"] = 11428,
PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Blast Wave"] = 38536,
PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Frost Nova"] = 15531,
PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Sunder Armor"] = 16145,
PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Sand Breath"] = 39049,
PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Kidney Shot"] = 30832,
end)