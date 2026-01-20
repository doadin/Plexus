--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    Copyright (c) 2018-2025 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Range.lua
    Plexus status module for unit range.
    Created by neXter, modified by Pastamancer, modified by Phanx.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local GetSpellInfo = C_Spell and C_Spell.GetSpellInfo and C_Spell.GetSpellInfo or GetSpellInfo
local IsSpellInRange = C_Spell and C_Spell.IsSpellInRange and C_Spell.IsSpellInRange or IsSpellInRange
local UnitClass = UnitClass
local UnitInRange = UnitInRange
local UnitIsDead = UnitIsDead
local UnitIsUnit = UnitIsUnit

local PlexusRoster = Plexus:GetModule("PlexusRoster")

local PlexusStatusRange = Plexus:NewStatusModule("PlexusStatusRange", "AceTimer-3.0")
PlexusStatusRange.menuName = L["Out of Range"]

PlexusStatusRange.defaultDB = {
    alert_range = {
        enable = true,
        text = L["Range"],
        color = { r = 0.8, g = 0.2, b = 0.2, a = 0.5 },
        priority = 80,
        range = false,
        frequency = 0.2,
    }
}

local extraOptions = {
    frequency = {
        name = L["Range check frequency"],
        desc = L["Seconds between range checks"],
        order = -1,
        width = "double",
        type = "range", min = 0.1, max = 5, step = 0.1,
        get = function()
            return PlexusStatusRange.db.profile.alert_range.frequency
        end,
        set = function(_, v)
            PlexusStatusRange.db.profile.alert_range.frequency = v
            PlexusStatusRange:OnStatusDisable("alert_range")
            PlexusStatusRange:OnStatusEnable("alert_range")
        end,
    },
    text = {
        name = L["Text"],
        desc = L["Text to display on text indicators"],
        order = 113,
        type = "input",
        get = function()
            return PlexusStatusRange.db.profile.alert_range.text
        end,
        set = function(_, v)
            PlexusStatusRange.db.profile.alert_range.text = v
        end,
    },
    range = false,
}

function PlexusStatusRange:PostInitialize()
    self:RegisterStatus("alert_range", L["Out of Range"], extraOptions, true)
end

function PlexusStatusRange:OnStatusEnable()
    self:RegisterMessage("Plexus_PartyTransition", "PartyTransition")
    self:PartyTransition("OnStatusEnable", PlexusRoster:GetPartyState())
end

function PlexusStatusRange:OnStatusDisable()
    self:StopTimer("CheckRange")
    self:UnregisterMessage("Plexus_PartyTransition", "PartyTransition")
    self.core:SendStatusLostAllUnits("alert_range")
end

local function GetSpellName(spellid)
    local info = C_Spell.GetSpellName and C_Spell.GetSpellName(spellid) or GetSpellInfo(spellid)
    return info
end

local resSpell
local _, class = UnitClass("player")
do
    local _, class = UnitClass("player")
    if class == "DEATHKNIGHT" then
        resSpell = GetSpellName(61999)  -- Raise Ally
    elseif class == "DRUID" then
        resSpell = GetSpellName(50769)  -- Revive
    elseif class == "MONK" then
        resSpell = GetSpellName(115178) -- Resuscitate
    elseif class == "PALADIN" then
        resSpell = GetSpellName(7328)   -- Redemption
    elseif class == "PRIEST" then
        resSpell = GetSpellName(2006)   -- Resurrection
    elseif class == "SHAMAN" then
        resSpell = GetSpellName(2008)   -- Ancestral Spirit
    elseif class == "WARLOCK" then
        resSpell = GetSpellName(20707)  -- Soulstone
    elseif class == "EVOKER" then
        resSpell = GetSpellName(361227)  -- Return
    end
end

local getHostile, getFriendly
local function IVS(spellID)	return IsPlayerSpell(spellID) and spellID end
if Plexus:IsRetailWow() then -- retail
	if class == 'DRUID' then
		getHostile  = function() return 8921 end -- Moonfire
		getFriendly = function() return 8936 end -- Regrowth
	elseif class == 'PRIEST' then
		getHostile  = function() return 585  end  -- Smite
		getFriendly = function() return 2061 end  -- Flash Heal
	elseif class == 'SHAMAN' then
		getHostile  = function() return 188196  end -- Lightning Bolt
		getFriendly = function() return 8004 end    -- Healing Surge
	elseif class == 'PALADIN' then
		getHostile  = function() return 62124 end -- Hand of Reckoning
		getFriendly = function() return 19750 end -- Flash of light
	elseif class == 'MONK' then
		getHostile  = function() return 115546 end -- Provoke
		getFriendly = function() return 116670 end -- Vivify
	elseif class == 'EVOKER' then
		getHostile  = function() return 361469 end -- Living flame
		getFriendly = function() return 355913 end -- Emerald Blossom
	elseif class == 'WARLOCK' then
		getHostile  = function() return 686 end   -- Shadow Bolt
		getFriendly = function() return 20707 end -- Soulstone
	elseif class == 'WARRIOR' then
		getHostile  = function() return 355 end  -- Taunt
		getFriendly = function() return nil end  -- no avail
	elseif class == 'DEMONHUNTER' then
		getHostile  = function() return 185123 end -- Throw Glaive
		getFriendly = function() return nil    end -- no avail
	elseif class == 'HUNTER' then
		getHostile  = function() return IVS(193455) or IVS(19434) or IVS(132031) end -- Cobra Shot, Aimed Short, Steady shot
		getFriendly = function() return nil end -- no avail
	elseif class == 'ROGUE' then
		getHostile  = function() return IVS(36554) or IVS(6770) end -- Shadowstep, Sap
		getFriendly = function() return IVS(36554) end -- Shadowstep
	elseif class == 'DEATHKNIGHT' then
		getHostile  = function() return IVS(47541) or IVS(49576) end -- Death Coil, Death Grip
		getFriendly = function() return IVS(47541) end -- Death Coil
	elseif class == 'MAGE' then
		getHostile  = function() return IVS(116) or IVS(30451) or IVS(133) end -- Frostbolt, Arcane Blast, Fireball
		getFriendly = function() return 1459 end -- Arcane intellect
	end
else -- classic
	if class == 'DRUID' then
		getHostile  = function() return 5176 end -- Wrath
		getFriendly = function() return 5185 end -- Healing Touchaw
	elseif class == 'PRIEST' then
		getHostile  = function() return 585  end -- Smite
		getFriendly = function() return 2050 end -- Lesser Heal
	elseif class == 'SHAMAN' then
		getHostile  = function() return 403  end -- Lightning Bolt
		getFriendly = function() return 331  end -- Healing Wave
	elseif class == 'PALADIN' then
		getHostile  = function() return IVS(20271) end -- Judgement
		getFriendly = function() return 635 end -- Holy Light
	elseif class == 'WARLOCK' then
		getHostile  = function() return 686 end -- Shadow Bolt
		getFriendly = function() return IVS(20707) end -- Soulstone
	elseif class == 'WARRIOR' then
		getHostile  = function() return IVS(355) or IVS(772) end  -- Taunt, Rend
		getFriendly = function() return nil end  -- no avail
	elseif class == 'HUNTER' then
		getHostile  = function() return IVS(3044) or IVS(1978) end -- Arcane Shot, Serpent Sting
		getFriendly = function() return nil end -- no avail
	elseif class == 'ROGUE' then
		getHostile  = function() return IVS(1752) end -- Sinister Strike
		getFriendly = function() return nil end -- no avail
	elseif class == 'MAGE' then
		getHostile  = function() return IVS(116) or IVS(133)  end -- Frostbolt, Fireball
		getFriendly = function() return IVS(1459) end -- Arcane intellect
	elseif class == 'DEATHKNIGHT' then
		getHostile  = function() return IVS(47541) or IVS(49576) end -- Death Coil, Death Grip
		getFriendly = function() return IVS(47541) end -- Death Coil
	elseif class == 'MONK' then
		getHostile  = function() return 115546 end -- Provoke
		getFriendly = function() return 116670 end -- Vivify
	end
end


local function GroupRangeCheck(_, unit)
    --local _, class = UnitClass("player")
    if UnitIsUnit(unit, "player") then
        return true
    elseif resSpell and UnitIsDead(unit) and not UnitIsDead("player") then
        if Plexus:IsRetailWow() then
            return IsSpellInRange(resSpell, unit)
        else
            return IsSpellInRange(resSpell, unit) == 1
        end
    else
        local inRange, checkedRange = UnitInRange(unit)
        if not Plexus:issecretvalue(checkedRange) and checkedRange then
            return inRange
        elseif Plexus:issecretvalue(checkedRange) then
            inRange = getFriendly() and IsSpellInRange(getFriendly(), unit)
            if inRange == nil then
                inRange = true
            end
            return inRange
        else
            return true
        end
    end
end

PlexusStatusRange.UnitInRange = GroupRangeCheck

function PlexusStatusRange:CheckRange()
    local settings = self.db.profile.alert_range
    for guid, unit in PlexusRoster:IterateRoster() do
        if self:UnitInRange(unit) then
            self.core:SendStatusLost(guid, "alert_range")
        else
            self.core:SendStatusGained(guid, "alert_range",
                settings.priority,
                false,
                settings.color,
                settings.text)
        end
    end
end

function PlexusStatusRange:PartyTransition(message, state, oldstate)
    self:Debug("PartyTransition", message, state, oldstate)
    if state == "solo" then
        self:StopTimer("CheckRange")
        self.UnitInRange = "True"
        self.core:SendStatusLostAllUnits("alert_range")
    else
        self:StartTimer("CheckRange", self.db.profile.alert_range.frequency, true)
        self.UnitInRange = GroupRangeCheck
    end
end
