--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    Copyright (c) 2018-2026 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Auras.lua
    Plexus status module for tracking buffs/debuffs.
----------------------------------------------------------------------]]

local version = GetBuildInfo()

if version == "12.0.7" then
    return
end

local _, Plexus = ...
local L = Plexus.L

local strutf8sub = string.utf8sub --luacheck: ignore 143
local format, GetTime, gmatch, gsub, pairs, strfind, strlen, strmatch, tostring, type, wipe
    = format, GetTime, gmatch, gsub, pairs, strfind, strlen, strmatch, tostring, type, wipe
local GetSpellInfo = C_Spell and C_Spell.GetSpellInfo and C_Spell.GetSpellInfo or GetSpellInfo
local IsPlayerSpell, IsSpellKnown, UnitAura, UnitClass, UnitGUID, UnitIsVisible
    = IsPlayerSpell, IsSpellKnown, UnitAura, UnitClass, UnitGUID, UnitIsVisible

local PlexusFrame = Plexus:GetModule("PlexusFrame")
local PlexusRoster = Plexus:GetModule("PlexusRoster")

local PlexusStatusAuras = Plexus:NewStatusModule("PlexusStatusAuras", "AceTimer-3.0")
PlexusStatusAuras.menuName = L["Auras"]

local _, PLAYER_CLASS = UnitClass("player")
local PlayerCanDispel = {}
local spell_names
local spell_ids

local function GetSpellName(spellid)
    local info = C_Spell.GetSpellName and C_Spell.GetSpellName(spellid) or GetSpellInfo(spellid)
    return info
end

local LibDispel
local BleedSupported
if Plexus:IsRetailWow() then
    LibDispel = LibStub("LibDispel-1.0", true)
    if LibDispel and LibDispel.BleedList then
        BleedSupported = true
    end
end

if Plexus:IsRetailWow() then
spell_names = {
-- All
    --["Ghost"] = GetSpellName(8326),
    --["Insurance!"] = GetSpellName(1215503),
    --["Oath-Bound"] = GetSpellName(1239997),
    --["Boon of the Oathsworn"] = GetSpellName(1240000),
    --["Ethereal Guard"] = GetSpellName(1223453),
    --["Ethereal Reconstitution"] = GetSpellName(1223446),
-- Druid
    ["Rejuvenation"] = GetSpellName(774),
    ["Regrowth"] = GetSpellName(8936),
    ["Lifebloom"] = GetSpellName(33763),
    ["Wild Growth"] = GetSpellName(48438),
    ["Germination"] = GetSpellName(155777),
    ["Rejuvenation (Germination)"] = GetSpellName(155777),
    ["Symbiotic Relationship"] = GetSpellName(474754),
-- Evoker
    ["Dream Breath"] = GetSpellName(355941),
    ["Dream Flight"] = GetSpellName(363502),
    ["Echo"] = GetSpellName(364343),
    ["Reversion"] = GetSpellName(366155),
    ["Echo: Reversion"] = "Echo: Reversion",
    ["Lifebind"] = GetSpellName(373267),
    ["Echo: Dream Breath"] = GetSpellName(376788),
    ["Blistering Scales"] = GetSpellName(360827),
    ["Ebon Might"] = GetSpellName(395152),
    ["Prescience"] = GetSpellName(409311),
    ["Inferno's Blessing"] = GetSpellName(410263),
    ["Symbiotic Bloom"] = GetSpellName(410686),
    ["Shifting Sands"] = GetSpellName(413984),
    ["Source of Magic"] = GetSpellName(1289630),
    ["Sense Power"] = GetSpellName(361022),
    ["Blessing of the Bronze"] = GetSpellName(381732),
-- Monk
    ["Soothing Mist"] = GetSpellName(115175),
    ["Renewing Mist"] = GetSpellName(119611),
    ["Enveloping Mist"] = GetSpellName(124682),
    ["Aspect of Harmony"] = GetSpellName(450769),
    ["Stagger"] = GetSpellName(124255),
-- Paladin
    ["Beacon of Light"] = GetSpellName(53563),
    ["Beacon of Faith"] = GetSpellName(156910),
    ["Beacon of the Savior"] = GetSpellName(1244893),
    ["Beacon of Virtue"] = GetSpellName(200025),
    ["Eternal Flame"] = GetSpellName(156322),
    ["Forbearance"] = GetSpellName(25771),
-- Priest
    ["Power Word: Shield"] = GetSpellName(17),
    ["Atonement"] = GetSpellName(194384),
    ["Void Shield"] = GetSpellName(1253593),
    ["Renew"] = GetSpellName(139),
    ["Prayer of Mending"] = GetSpellName(41635),
    ["Echo of Light"] = GetSpellName(77489),
-- Shaman
    ["Ancestral Vigor"] = GetSpellName(207400),
    ["Earth Shield"] = GetSpellName(974),
    ["Hydrobubble"] = GetSpellName(444490),
    ["Riptide"] = GetSpellName(61295),
    ["Earthliving Weapon"] = GetSpellName(382021),
}
spell_ids = {
-- All
    --["Ghost"] = 8326,
    --["Insurance!"] = 1215503,
    --["Oath-Bound"] = 1239997,
    --["Boon of the Oathsworn"] = 1240000,
    --["Ethereal Guard"] = 1223453,
    --["Ethereal Reconstitution"] = 1223446,
-- Druid
    ["Rejuvenation"] = {[774] = true},
    ["Regrowth"] = {[8936] = true},
    ["Lifebloom"] = {[33763] = true},
    ["Wild Growth"] = {[48438] = true},
    ["Germination"] = {[155777] = true},
    ["Rejuvenation (Germination)"] = {[155777] = true},
    ["Symbiotic Relationship"] = {[474754] = true},
-- Evoker
    ["Dream Breath"] = {[355941] = true},
    ["Dream Flight"] = {[363502] = true},
    ["Echo"] = {[364343] = true},
    ["Reversion"] = {[366155] = true},
    ["Echo: Reversion"] = {[367364] = true},
    ["Lifebind"] = {[373267] = true},
    ["Echo: Dream Breath"] = {[376788] = true},
    ["Blistering Scales"] = {[360827] = true},
    ["Ebon Might"] = {[395152] = true, [395296] = true},
    ["Prescience"] = {[409311] = true},
    ["Inferno's Blessing"] = {[410263] = true},
    ["Symbiotic Bloom"] = {[410686] = true},
    ["Shifting Sands"] = {[413984] = true},
    ["Source of Magic"] = {[369459] = true},
    ["Sense Power"] = {[361022] = true},
    ["Blessing of the Bronze"] = {
        [381732] = true, -- Death Knight
		[381741] = true, -- Demon Hunter
		[381746] = true, -- Druid
		[381748] = true, -- Evoker
		[381749] = true, -- Hunter
		[381750] = true, -- Mage
		[381751] = true, -- Monk
		[381752] = true, -- Paladin
		[381753] = true, -- Priest
		[381754] = true, -- Rogue
		[381756] = true, -- Shaman
		[381757] = true, -- Warlock
		[381758] = true, -- Warrior
    },
-- Monk
    ["Soothing Mist"] = {[115175] = true},
    ["Renewing Mist"] = {[119611] = true},
    ["Enveloping Mist"] = {[124682] = true},
    ["Aspect of Harmony"] = {[450769] = true},
    ["Stagger"] = {[124255] = true},
-- Paladin
    ["Beacon of Light"] = {[53563] = true},
    ["Beacon of Faith"] = {[156910] = true},
    ["Beacon of the Savior"] = {[1244893] = true},
    ["Beacon of Virtue"] = {[200025] = true},
    ["Eternal Flame"] = {[156322] = true},
    ["Forbearance"] = {[25771] = true},
-- Priest
    ["Power Word: Shield"] = {[17] = true},
    ["Atonement"] = {[194384] = true},
    ["Void Shield"] = {[1253593] = true},
    ["Renew"] = {[139] = true},
    ["Prayer of Mending"] = {[41635] = true},
    ["Echo of Light"] = {[77489] = true},
-- Shaman
    ["Ancestral Vigor"] = {[207400] = true},
    ["Earth Shield"] = {[974] = true},
    ["Hydrobubble"] = {[444490] = true},
    ["Riptide"] = {[61295] = true},
    ["Earthliving Weapon"] = {[382021] = true, [382022] = true, [382024] = true},
}
end

local debuff_types = {
    ["Curse"] = "dispel_curse",
    ["Disease"] = "dispel_disease",
    ["Magic"] = "dispel_magic",
    ["Poison"] = "dispel_poison",
    ["Bleed"] = "dispel_bleed",
}

function PlexusStatusAuras:StatusForSpell(spell, isBuff) --luacheck: ignore 212
    return format(isBuff and "buff_%s" or "debuff_%s", gsub(spell, " ", ""))
end

function PlexusStatusAuras:TextForSpell(spell) --luacheck: ignore 212
    if strfind(spell, "%s") then
        local str = ""
        for word in gmatch(spell, "%S+") do
            str = str .. strutf8sub(word, 1, 1)
        end
        return str
    else
        return strutf8sub(spell, 1, 3)
    end
end

local statusDefaultDB = {
    enable = true,
    priority = 90,
    duration = false,
    color = { r = 0.5, g = 0.5, b = 0.5, a = 1 },
    statusText = "name",
    statusColor = "present",
    refresh = 0.3,
    durationTenths = false,
    durationColorLow = { r = 0.15, g = 0.15, b = 0.15, a = 1 },
    durationColorMiddle = { r = 0.35, g = 0.35, b = 0.35, a = 1 },
    durationColorHigh = { r = 0.5, g = 0.5, b = 0.5, a = 1 },
    durationLow = 2,
    durationHigh = 4,
    countColorLow = { r = 1, g = 0, b = 0, a = 1 },
    countColorMiddle = { r = 1, g = 1, b = 0, a = 1 },
    countColorHigh = { r = 0, g = 1, b = 0, a = 1 },
    countLow = 1,
    countHigh = 2,
}

-- Perform a deep copy of defaultDB into the given settings table except into the slots
-- where the value is non-nil (non-default setting).
function PlexusStatusAuras:CopyDefaults(settings, defaults)
    if type(defaults) ~= "table" then return {} end
    if type(settings) ~= "table" then settings = {} end
    for k, v in pairs(defaults) do
        if type(v) == "table" then
            settings[k] = self:CopyDefaults(settings[k], v)
        elseif type(v) ~= type(settings[k]) then
            settings[k] = v
        end
    end
    return settings
end


if Plexus:IsRetailWow() then
PlexusStatusAuras.defaultDB = {
    advancedOptions = false,
--[[
    ["boss_aura"] = {
        desc = L["Boss Aura"],
        color = { r = 1, g = 0, b = 0, a = 1 },
        priority = 90,
        order = 20,
    },
]]
    ---------------------
    -- Debuff Types
    ---------------------
    --["dispel_curse"] = {
    --    desc = format(L["Debuff type: %s"], L["Curse"]),
    --    text = DEBUFF_SYMBOL_CURSE,
    --    color = { r = 0.6, g = 0, b = 1, a = 1 },
    --    durationColorLow = { r = 0.18, g = 0, b = 0.3, a = 1 },
    --    durationColorMiddle = { r = 0.42, g = 0, b = 0.7, a = 1 },
    --    durationColorHigh = { r = 0.6, g = 0, b = 1, a = 1 },
    --    dispellable = true,
    --    order = 25,
    --},
    --["dispel_disease"] = {
    --    desc = format(L["Debuff type: %s"], L["Disease"]),
    --    text = DEBUFF_SYMBOL_DISEASE,
    --    color = { r = 0.6, g = 0.4, b = 0, a = 1 },
    --    durationColorLow = { r = 0.18, g = 0.12, b = 0, a = 1 },
    --    durationColorMiddle = { r = 0.42, g = 0.28, b = 0, a = 1 },
    --    durationColorHigh = { r = 0.6, g = 0.4, b = 0, a = 1 },
    --    dispellable = true,
    --    order = 25,
    --},
    --["dispel_magic"] = {
    --    desc = format(L["Debuff type: %s"], L["Magic"]),
    --    text = DEBUFF_SYMBOL_MAGIC,
    --    color = { r = 0.2, g = 0.6, b = 1, a = 1 },
    --    durationColorLow = { r = 0.06, g = 0.18, b = 0.3, a = 1 },
    --    durationColorMiddle = { r = 0.14, g = 0.42, b = 0.7, a = 1 },
    --    durationColorHigh = { r = 0.2, g = 0.6, b = 1, a = 1 },
    --    dispellable = true,
    --    order = 25,
    --},
    --["dispel_poison"] = {
    --    desc = format(L["Debuff type: %s"], L["Poison"]),
    --    text = DEBUFF_SYMBOL_POISON,
    --    color = { r = 0, g = 0.6, b = 0, a = 1 },
    --    durationColorLow = { r = 0, g = 0.18, b = 0, a = 1 },
    --    durationColorMiddle = { r = 0, g = 0.42, b = 0, a = 1 },
    --    durationColorHigh = { r = 0, g = 0.6, b = 0, a = 1 },
    --    dispellable = true,
    --    order = 25,
    --},
    --["dispel_bleed"] = {
    --    desc = format(L["Debuff type: %s"], L["Bleed"]),
    --    text = "Bl",
    --    color = { r = 1, g = 0, b = 0, a = 1 },
    --    durationColorLow = { r = 0, g = 0.18, b = 0, a = 1 },
    --    durationColorMiddle = { r = 0, g = 0.42, b = 0, a = 1 },
    --    durationColorHigh = { r = 0, g = 0.6, b = 0, a = 1 },
    --    dispellable = true,
    --    order = 25,
    --},

    ---------------------
    -- General Debuffs
    ---------------------
    --[PlexusStatusAuras:StatusForSpell("Ghost")] = {
    --    -- 8326
    --    desc = format(L["Debuff: %s"], spell_names["Ghost"]),
    --    debuff = spell_names["Ghost"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Ghost"]),
    --    color = { r = 0.5, g = 0.5, b = 0.5, a = 1 },
    --},
    --[PlexusStatusAuras:StatusForSpell("Insurance!")] = {
    --    -- 1215503
    --    desc = format(L["Buff: %s"], spell_names["Insurance!"]),
    --    buff = spell_names["Insurance!"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Insurance!"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
    --    durationColorMiddle = { r = 0.21, g = 0.49, b = 0, a = 1 },
    --    durationColorHigh = { r = 0.3, g = 0.7, b = 0, a = 1 },
    --    countColorLow = { r = 1, g = 0, b = 0, a = 1 },
    --    countColorMiddle = { r = 1, g = 1, b = 0, a = 1 },
    --    countColorHigh = { r = 0, g = 1, b = 0, a = 1 },
    --    countLow = 1,
    --    countHigh = 2,
    --    mine = true,
    --},
    --[PlexusStatusAuras:StatusForSpell("Oath-Bound")] = {
    --    -- 1239997
    --    desc = format(L["Debuff: %s"], spell_names["Oath-Bound"]),
    --    debuff = spell_names["Oath-Bound"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Oath-Bound"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    mine = true,
    --},
    --[PlexusStatusAuras:StatusForSpell("Boon of the Oathsworn")] = {
    --    -- 1240000
    --    desc = format(L["Buff: %s"], spell_names["Boon of the Oathsworn"]),
    --    buff = spell_names["Boon of the Oathsworn"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Boon of the Oathsworn"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
    --    durationColorMiddle = { r = 0.21, g = 0.49, b = 0, a = 1 },
    --    durationColorHigh = { r = 0.3, g = 0.7, b = 0, a = 1 },
    --    countColorLow = { r = 1, g = 0, b = 0, a = 1 },
    --    countColorMiddle = { r = 1, g = 1, b = 0, a = 1 },
    --    countColorHigh = { r = 0, g = 1, b = 0, a = 1 },
    --    countLow = 1,
    --    countHigh = 2,
    --    mine = true,
    --},
    --[PlexusStatusAuras:StatusForSpell("Ethereal Guard")] = {
    --    -- 1223453
    --    desc = format(L["Buff: %s"], spell_names["Ethereal Guard"]),
    --    buff = spell_names["Ethereal Guard"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Ethereal Guard"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
    --    durationColorMiddle = { r = 0.21, g = 0.49, b = 0, a = 1 },
    --    durationColorHigh = { r = 0.3, g = 0.7, b = 0, a = 1 },
    --    countColorLow = { r = 1, g = 0, b = 0, a = 1 },
    --    countColorMiddle = { r = 1, g = 1, b = 0, a = 1 },
    --    countColorHigh = { r = 0, g = 1, b = 0, a = 1 },
    --    countLow = 1,
    --    countHigh = 2,
    --    mine = true,
    --},
    --[PlexusStatusAuras:StatusForSpell("Ethereal Reconstitution")] = {
    --    -- 1223446
    --    desc = format(L["Buff: %s"], spell_names["Ethereal Reconstitution"]),
    --    buff = spell_names["Ethereal Reconstitution"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Ethereal Reconstitution"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
    --    durationColorMiddle = { r = 0.21, g = 0.49, b = 0, a = 1 },
    --    durationColorHigh = { r = 0.3, g = 0.7, b = 0, a = 1 },
    --    countColorLow = { r = 1, g = 0, b = 0, a = 1 },
    --    countColorMiddle = { r = 1, g = 1, b = 0, a = 1 },
    --    countColorHigh = { r = 0, g = 1, b = 0, a = 1 },
    --    countLow = 1,
    --    countHigh = 2,
    --    mine = true,
    --},
    ---------------------
    -- Druid
    ---------------------
    --[PlexusStatusAuras:StatusForSpell("Cenarion Ward", true)] = {
    --    -- 33763
    --    desc = format(L["Buff: %s"], spell_names["Cenarion Ward"]),
    --    buff = spell_names["Cenarion Ward"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Cenarion Ward"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
    --    durationColorMiddle = { r = 0.21, g = 0.49, b = 0, a = 1 },
    --    durationColorHigh = { r = 0.3, g = 0.7, b = 0, a = 1 },
    --    countColorLow = { r = 1, g = 0, b = 0, a = 1 },
    --    countColorMiddle = { r = 1, g = 1, b = 0, a = 1 },
    --    countColorHigh = { r = 0, g = 1, b = 0, a = 1 },
    --    countLow = 1,
    --    countHigh = 2,
    --    mine = true,
    --},
    [PlexusStatusAuras:StatusForSpell("Lifebloom", true)] = {
        -- 33763
        desc = format(L["Buff: %s"], spell_names["Lifebloom"]),
        buff = spell_names["Lifebloom"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Lifebloom"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.21, g = 0.49, b = 0, a = 1 },
        durationColorHigh = { r = 0.3, g = 0.7, b = 0, a = 1 },
        countColorLow = { r = 1, g = 0, b = 0, a = 1 },
        countColorMiddle = { r = 1, g = 1, b = 0, a = 1 },
        countColorHigh = { r = 0, g = 1, b = 0, a = 1 },
        countLow = 1,
        countHigh = 2,
        mine = true,
        id = spell_ids["Lifebloom"],
    },
    [PlexusStatusAuras:StatusForSpell("Regrowth", true)] = {
        -- 8936
        desc = format(L["Buff: %s"], spell_names["Regrowth"]),
        buff = spell_names["Regrowth"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Regrowth"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.7, g = 0.49, b = 0.07, a = 1 },
        durationColorHigh = { r = 1, g = 0.7, b = 0.1, a = 1 },
        mine = true,
        id = spell_ids["Regrowth"],
    },
    [PlexusStatusAuras:StatusForSpell("Rejuvenation", true)] = {
        -- 774
        desc = format(L["Buff: %s"], spell_names["Rejuvenation"]),
        buff = spell_names["Rejuvenation"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Rejuvenation"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0, g = 0.21, b = 0.49, a = 1 },
        durationColorHigh = { r = 0, g = 0.3, b = 0.7, a = 1 },
        mine = true,
        id = spell_ids["Rejuvenation"],
    },
    [PlexusStatusAuras:StatusForSpell("Germination", true)] = {
        -- 155777
        desc = format(L["Buff: %s"], spell_names["Germination"]),
        buff = spell_names["Germination"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Germination"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 0.66, g = 0.55, b = 1, a = 1 },
        durationColorMiddle = { r = 0.46, g = 0.38, b = 0.7, a = 1 },
        durationColorHigh = { r = 0.33, g = 0.27, b = 0.5, a = 1 },
        mine = true,
        id = spell_ids["Germination"],
    },
    [PlexusStatusAuras:StatusForSpell("Wild Growth", true)] = {
        -- 48438
        desc = format(L["Buff: %s"], spell_names["Wild Growth"]),
        buff = spell_names["Wild Growth"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Wild Growth"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 0.56, g = 0.85, b = 0.62, a = 1 },
        durationColorMiddle = { r = 0.39, g = 0.55, b = 0.42, a = 1 },
        durationColorHigh = { r = 0.27, g = 0.37, b = 0.29, a = 1 },
        mine = true,
        id = spell_ids["Wild Growth"],
    },
    [PlexusStatusAuras:StatusForSpell("Symbiotic Relationship", true)] = {
        -- 48438
        desc = format(L["Buff: %s"], spell_names["Symbiotic Relationship"]),
        buff = spell_names["Symbiotic Relationship"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Symbiotic Relationship"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 0.56, g = 0.85, b = 0.62, a = 1 },
        durationColorMiddle = { r = 0.39, g = 0.55, b = 0.42, a = 1 },
        durationColorHigh = { r = 0.27, g = 0.37, b = 0.29, a = 1 },
        mine = true,
        id = spell_ids["Symbiotic Relationship"],
    },

    ---------------------
    -- Evoker
    ---------------------
    [PlexusStatusAuras:StatusForSpell("Reversion", true)] = {
        -- 366155
        desc = format(L["Buff: %s"], spell_names["Reversion"]),
        buff = spell_names["Reversion"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Reversion"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
        durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
        mine = true,
        id = spell_ids["Reversion"],
    },
    [PlexusStatusAuras:StatusForSpell("Echo: Reversion", true)] = {
        -- 367364
        desc = format(L["Buff: %s"], spell_names["Echo: Reversion"]),
        buff = spell_names["Echo: Reversion"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Echo: Reversion"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
        durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
        mine = true,
        id = spell_ids["Echo: Reversion"],
    },
    [PlexusStatusAuras:StatusForSpell("Dream Breath", true)] = {
        -- 367364
        desc = format(L["Buff: %s"], spell_names["Dream Breath"]),
        buff = spell_names["Dream Breath"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Dream Breath"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
        durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
        mine = true,
        id = spell_ids["Dream Breath"],
    },
    [PlexusStatusAuras:StatusForSpell("Echo: Dream Breath", true)] = {
        -- 367364
        desc = format(L["Buff: %s"], spell_names["Echo: Dream Breath"]),
        buff = spell_names["Echo: Dream Breath"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Echo: Dream Breath"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
        durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
        mine = true,
        id = spell_ids["Echo: Dream Breath"],
    },
    [PlexusStatusAuras:StatusForSpell("Echo", true)] = {
        -- 364343
        desc = format(L["Buff: %s"], spell_names["Echo"]),
        buff = spell_names["Echo"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Echo"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
        durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
        mine = true,
        id = spell_ids["Echo"],
    },
    --[PlexusStatusAuras:StatusForSpell("Temporal Anomaly", true)] = {
    --    -- 373862
    --    desc = format(L["Buff: %s"], spell_names["Temporal Anomaly"]),
    --    buff = spell_names["Temporal Anomaly"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Temporal Anomaly"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
    --    durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
    --    durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
    --    mine = true,
    --},
    --[PlexusStatusAuras:StatusForSpell("Rewind", true)] = {
    --    -- 363534
    --    desc = format(L["Buff: %s"], spell_names["Rewind"]),
    --    buff = spell_names["Rewind"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Rewind"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
    --    durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
    --    durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
    --    mine = true,
    --},
    [PlexusStatusAuras:StatusForSpell("Blistering Scales", true)] = {
        -- 360827
        desc = format(L["Buff: %s"], spell_names["Blistering Scales"]),
        buff = spell_names["Blistering Scales"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Blistering Scales"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
        durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
        mine = true,
        id = spell_ids["Blistering Scales"],
    },
    [PlexusStatusAuras:StatusForSpell("Ebon Might", true)] = {
        -- 395152
        desc = format(L["Buff: %s"], spell_names["Ebon Might"]),
        buff = spell_names["Ebon Might"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Ebon Might"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
        durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
        mine = true,
        id = spell_ids["Ebon Might"],
    },
    [PlexusStatusAuras:StatusForSpell("Prescience", true)] = {
        -- 409311
        desc = format(L["Buff: %s"], spell_names["Prescience"]),
        buff = spell_names["Prescience"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Prescience"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
        durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
        mine = true,
        id = spell_ids["Prescience"],
    },
    [PlexusStatusAuras:StatusForSpell("Dream Flight", true)] = {
        -- 363502
        desc = format(L["Buff: %s"], spell_names["Dream Flight"]),
        buff = spell_names["Dream Flight"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Dream Flight"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
        durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
        mine = true,
        id = spell_ids["Dream Flight"],
    },
    [PlexusStatusAuras:StatusForSpell("Lifebind", true)] = {
        -- 373267
        desc = format(L["Buff: %s"], spell_names["Lifebind"]),
        buff = spell_names["Lifebind"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Lifebind"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
        durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
        mine = true,
        id = spell_ids["Lifebind"],
    },
    [PlexusStatusAuras:StatusForSpell("Inferno's Blessing", true)] = {
        -- 410263
        desc = format(L["Buff: %s"], spell_names["Inferno's Blessing"]),
        buff = spell_names["Inferno's Blessing"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Inferno's Blessing"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
        durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
        mine = true,
        id = spell_ids["Inferno's Blessing"],
    },
    [PlexusStatusAuras:StatusForSpell("Symbiotic Bloom", true)] = {
        -- 410686
        desc = format(L["Buff: %s"], spell_names["Symbiotic Bloom"]),
        buff = spell_names["Symbiotic Bloom"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Symbiotic Bloom"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
        durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
        mine = true,
        id = spell_ids["Symbiotic Bloom"],
    },
    [PlexusStatusAuras:StatusForSpell("Shifting Sands", true)] = {
        -- 413984
        desc = format(L["Buff: %s"], spell_names["Shifting Sands"]),
        buff = spell_names["Shifting Sands"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Shifting Sands"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
        durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
        mine = true,
        id = spell_ids["Shifting Sands"],
    },
    [PlexusStatusAuras:StatusForSpell("Source of Magic", true)] = {
        -- 413984
        desc = format(L["Buff: %s"], spell_names["Source of Magic"]),
        buff = spell_names["Source of Magic"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Source of Magic"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
        durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
        mine = true,
        id = spell_ids["Source of Magic"],
    },
    [PlexusStatusAuras:StatusForSpell("Sense Power", true)] = {
        -- 361022
        desc = format(L["Buff: %s"], spell_names["Sense Power"]),
        buff = spell_names["Sense Power"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Sense Power"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
        durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
        mine = true,
        id = spell_ids["Sense Power"],
    },
    [PlexusStatusAuras:StatusForSpell("Blessing of the Bronze", true)] = {
        -- 361022
        desc = format(L["Buff: %s"], spell_names["Blessing of the Bronze"]),
        buff = spell_names["Blessing of the Bronze"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Blessing of the Bronze"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
        durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
        mine = true,
        id = spell_ids["Blessing of the Bronze"],
    },

    ---------------------
    -- Monk
    ---------------------
    --[PlexusStatusAuras:StatusForSpell("Enveloping Breath", true)] = {
    --    -- 325209
    --    buff = spell_names["Enveloping Breath"],
    --    desc = format(L["Buff: %s"], spell_names["Enveloping Breath"]),
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Enveloping Breath"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    mine = true,
    --},
    [PlexusStatusAuras:StatusForSpell("Enveloping Mist", true)] = {
        -- 124682
        buff = spell_names["Enveloping Mist"],
        desc = format(L["Buff: %s"], spell_names["Enveloping Mist"]),
        text = PlexusStatusAuras:TextForSpell(spell_names["Enveloping Mist"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        mine = true,
        id = spell_ids["Enveloping Mist"],
    },
    --[PlexusStatusAuras:StatusForSpell("Life Cocoon", true)] = {
    --    -- 116849
    --    buff = spell_names["Life Cocoon"],
    --    desc = format(L["Buff: %s"], spell_names["Life Cocoon"]),
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Life Cocoon"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --},
    [PlexusStatusAuras:StatusForSpell("Renewing Mist", true)] = {
        -- 115151
        buff = spell_names["Renewing Mist"],
        desc = format(L["Buff: %s"], spell_names["Renewing Mist"]),
        text = PlexusStatusAuras:TextForSpell(spell_names["Renewing Mist"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        mine = true,
        id = spell_ids["Renewing Mist"],
    },
    [PlexusStatusAuras:StatusForSpell("Soothing Mist", true)] = {
        -- 115175
        buff = spell_names["Soothing Mist"],
        desc = format(L["Buff: %s"], spell_names["Soothing Mist"]),
        text = PlexusStatusAuras:TextForSpell(spell_names["Soothing Mist"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        mine = true,
        id = spell_ids["Soothing Mist"],
    },
    [PlexusStatusAuras:StatusForSpell("Aspect of Harmony", true)] = {
        -- 450769
        buff = spell_names["Aspect of Harmony"],
        desc = format(L["Buff: %s"], spell_names["Aspect of Harmony"]),
        text = PlexusStatusAuras:TextForSpell(spell_names["Aspect of Harmony"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        mine = true,
        id = spell_ids["Aspect of Harmony"],
    },
    [PlexusStatusAuras:StatusForSpell("Stagger", true)] = {
        -- 450769
        buff = spell_names["Stagger"],
        desc = format(L["Buff: %s"], spell_names["Stagger"]),
        text = PlexusStatusAuras:TextForSpell(spell_names["Stagger"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        mine = true,
        id = spell_ids["Stagger"],
    },

    ---------------------
    -- Paladin
    ---------------------
    --[PlexusStatusAuras:StatusForSpell("Barrier of Faith", true)] = {
    --    -- 156910
    --    desc = format(L["Buff: %s"], spell_names["Barrier of Faith"]),
    --    buff = spell_names["Barrier of Faith"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Barrier of Faith"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
    --    durationColorMiddle = { r = 0.49, g = 0.49, b = 0, a = 1 },
    --    durationColorHigh = { r = 0.7, g = 0.7, b = 0, a = 1 },
    --    durationLow = 5,
    --    durationHigh = 10,
    --    mine = true,
    --},
    [PlexusStatusAuras:StatusForSpell("Beacon of Faith", true)] = {
        -- 156910
        desc = format(L["Buff: %s"], spell_names["Beacon of Faith"]),
        buff = spell_names["Beacon of Faith"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Beacon of Faith"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.49, g = 0.49, b = 0, a = 1 },
        durationColorHigh = { r = 0.7, g = 0.7, b = 0, a = 1 },
        durationLow = 5,
        durationHigh = 10,
        mine = true,
        id = spell_ids["Beacon of Faith"],
    },
    [PlexusStatusAuras:StatusForSpell("Beacon of Light", true)] = {
        -- 53563
        desc = format(L["Buff: %s"], spell_names["Beacon of Light"]),
        buff = spell_names["Beacon of Light"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Beacon of Light"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.49, g = 0.49, b = 0, a = 1 },
        durationColorHigh = { r = 0.7, g = 0.7, b = 0, a = 1 },
        durationLow = 5,
        durationHigh = 10,
        mine = true,
        id = spell_ids["Beacon of Light"],
    },
    [PlexusStatusAuras:StatusForSpell("Beacon of the Savior", true)] = {
        -- 1244893
        desc = format(L["Buff: %s"], spell_names["Beacon of the Savior"]),
        buff = spell_names["Beacon of the Savior"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Beacon of the Savior"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.49, g = 0.49, b = 0, a = 1 },
        durationColorHigh = { r = 0.7, g = 0.7, b = 0, a = 1 },
        durationLow = 5,
        durationHigh = 10,
        mine = true,
        id = spell_ids["Beacon of the Savior"],
    },
    [PlexusStatusAuras:StatusForSpell("Beacon of Virtue", true)] = {
        -- 200025
        desc = format(L["Buff: %s"], spell_names["Beacon of Virtue"]),
        buff = spell_names["Beacon of Virtue"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Beacon of Virtue"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 0.95, g = 0.47, b = 0.66, a = 1 },
        durationColorMiddle = { r = 0.7, g = 0.35, b = 0.49, a = 1 },
        durationColorHigh = { r = 0.5, g = 0.25, b = 0.35, a = 1 },
        mine = true,
        id = spell_ids["Beacon of Virtue"],
    },
    --[PlexusStatusAuras:StatusForSpell("Bestow Faith", true)] = {
    --    -- 223306
    --    desc = format(L["Buff: %s"], spell_names["Bestow Faith"]),
    --    buff = spell_names["Bestow Faith"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Bestow Faith"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    durationColorLow = { r = 0.95, g = 0.47, b = 0.66, a = 1 },
    --    durationColorMiddle = { r = 0.7, g = 0.35, b = 0.49, a = 1 },
    --    durationColorHigh = { r = 0.5, g = 0.25, b = 0.35, a = 1 },
    --    mine = true,
    --},
    --[PlexusStatusAuras:StatusForSpell("Dawnlight", true)] = {
    --    -- 431382
    --    desc = format(L["Buff: %s"], spell_names["Dawnlight"]),
    --    buff = spell_names["Dawnlight"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Dawnlight"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    durationColorLow = { r = 0.95, g = 0.47, b = 0.66, a = 1 },
    --    durationColorMiddle = { r = 0.7, g = 0.35, b = 0.49, a = 1 },
    --    durationColorHigh = { r = 0.5, g = 0.25, b = 0.35, a = 1 },
    --    mine = true,
    --},
    --[PlexusStatusAuras:StatusForSpell("Glimmer of Light", true)] = {
    --    -- 287286
    --    desc = format(L["Buff: %s"], spell_names["Glimmer of Light"]),
    --    buff = spell_names["Glimmer of Light"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Glimmer of Light"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    durationColorLow = { r = 0.95, g = 0.47, b = 0.66, a = 1 },
    --    durationColorMiddle = { r = 0.7, g = 0.35, b = 0.49, a = 1 },
    --    durationColorHigh = { r = 0.5, g = 0.25, b = 0.35, a = 1 },
    --    mine = true,
    --},
    [PlexusStatusAuras:StatusForSpell("Eternal Flame", true)] = {
        -- 156322
        desc = format(L["Buff: %s"], spell_names["Eternal Flame"]),
        buff = spell_names["Eternal Flame"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Eternal Flame"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 0.95, g = 0.47, b = 0.66, a = 1 },
        durationColorMiddle = { r = 0.7, g = 0.35, b = 0.49, a = 1 },
        durationColorHigh = { r = 0.5, g = 0.25, b = 0.35, a = 1 },
        mine = true,
        id = spell_ids["Eternal Flame"],
    },
    --[PlexusStatusAuras:StatusForSpell("Sacred Dawn")] = {
    --    -- 243174
    --    desc = format(L["Buff: %s"], spell_names["Sacred Dawn"]),
    --    buff = spell_names["Sacred Dawn"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Sacred Dawn"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    durationColorLow = { r = 0.95, g = 1, b = 0.7, a = 1 },
    --    durationColorMiddle = { r = 0.66, g = 0.7, b = 0.49, a = 1 },
    --    durationColorHigh = { r = 0.43, g = 0.45, b = 0.32, a = 1 },
    --    mine = true,
    --},
    --[PlexusStatusAuras:StatusForSpell("Sun Sear", true)] = {
    --    -- 431382
    --    desc = format(L["Buff: %s"], spell_names["Sun Sear"]),
    --    buff = spell_names["Sun Sear"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Sun Sear"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    durationColorLow = { r = 0.95, g = 0.47, b = 0.66, a = 1 },
    --    durationColorMiddle = { r = 0.7, g = 0.35, b = 0.49, a = 1 },
    --    durationColorHigh = { r = 0.5, g = 0.25, b = 0.35, a = 1 },
    --    mine = true,
    --},
    --[PlexusStatusAuras:StatusForSpell("Tyr's Deliverance")] = {
    --    -- 200652
    --    desc = format(L["Buff: %s"], spell_names["Tyr's Deliverance"]),
    --    buff = spell_names["Tyr's Deliverance"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Tyr's Deliverance"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    durationColorLow = { r = 0.95, g = 0.82, b = 0.33, a = 1 },
    --    durationColorMiddle = { r = 0.65, g = 0.56, b = 0.23, a = 1 },
    --    durationColorHigh = { r = 0.45, g = 0.38, b = 0.16, a = 1 },
    --    mine = true,
    --},
    [PlexusStatusAuras:StatusForSpell("Forbearance")] = {
        -- 25771
        desc = format(L["Debuff: %s"], spell_names["Forbearance"]),
        debuff = spell_names["Forbearance"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Forbearance"]),
        color = { r = 252, g = 0, b = 0, a = 1 },
        durationColorLow = { r = 0.15, g = 0.15, b = 0.15, a = 1 },
        durationColorMiddle = { r = 0.35, g = 0.35, b = 0.35, a = 1 },
        durationColorHigh = { r = 0.5, g = 0.5, b = 0.5, a = 1 },
        id = spell_ids["Forbearance"],
    },

    ---------------------
    -- Priest
    ---------------------
    [PlexusStatusAuras:StatusForSpell("Atonement", true)] = {
        -- 194384
        buff = spell_names["Atonement"],
        desc = format(L["Buff: %s"], spell_names["Atonement"]),
        text = PlexusStatusAuras:TextForSpell(spell_names["Atonement"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        mine = true,
        id = spell_ids["Atonement"],
    },
    --[PlexusStatusAuras:StatusForSpell("Clarity of Will", true)] = {
    --    -- 152118
    --    desc = format(L["Buff: %s"], spell_names["Clarity of Will"]),
    --    buff = spell_names["Clarity of Will"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Clarity of Will"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
    --    durationColorMiddle = { r = 0.56, g = 0.56, b = 0, a = 1 },
    --    durationColorHigh = { r = 0.8, g = 0.8, b = 0, a = 1 },
    --},
    --[PlexusStatusAuras:StatusForSpell("Divine Aegis", true)] = {
    --    -- 47753
    --    buff = spell_names["Divine Aegis"],
    --    desc = format(L["Buff: %s"], spell_names["Divine Aegis"]),
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Divine Aegis"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    mine = true,
    --},
    [PlexusStatusAuras:StatusForSpell("Echo of Light", true)] = {
        -- 77489
        buff = spell_names["Echo of Light"],
        desc = format(L["Buff: %s"], spell_names["Echo of Light"]),
        text = PlexusStatusAuras:TextForSpell(spell_names["Echo of Light"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        mine = true,
        id = spell_ids["Echo of Light"],
    },
    --[PlexusStatusAuras:StatusForSpell("Guardian Spirit", true)] = {
    --    -- 47788
    --    desc = format(L["Buff: %s"], spell_names["Guardian Spirit"]),
    --    buff = spell_names["Guardian Spirit"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Guardian Spirit"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    durationColorLow = { r = 0.4, g = 0.73, b = 1, a = 1 },
    --    durationColorMiddle = { r = 0.24, g = 0.54, b = 0.8, a = 1 },
    --    durationColorHigh = { r = 0.13, g = 0.41, b = 0.65, a = 1 },
    --    mine = true,
    --},
    --[PlexusStatusAuras:StatusForSpell("Light of T'uure", true)] = {
    --    -- 208065
    --    desc = format(L["Buff: %s"], spell_names["Light of T'uure"]),
    --    buff = spell_names["Light of T'uure"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Light of T'uure"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    durationColorLow = { r = 0.33, g = 0.46, b = 1, a = 1 },
    --    durationColorMiddle = { r = 0.24, g = 0.33, b = 0.7, a = 1 },
    --    durationColorHigh = { r = 0.17, g = 0.23, b = 0.5, a = 1 },
    --    mine = true,
    --},
    --[PlexusStatusAuras:StatusForSpell("Power Word: Fortitude", true)] = {
    --    -- 21562
    --    desc = format(L["Buff: %s"], spell_names["Power Word: Fortitude"]),
    --    buff = spell_names["Power Word: Fortitude"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Power Word: Fortitude"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    missing = true,
    --},
    [PlexusStatusAuras:StatusForSpell("Power Word: Shield", true)] = {
        -- 17
        desc = format(L["Buff: %s"], spell_names["Power Word: Shield"]),
        buff = spell_names["Power Word: Shield"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Power Word: Shield"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.56, g = 0.56, b = 0, a = 1 },
        durationColorHigh = { r = 0.8, g = 0.8, b = 0, a = 1 },
        id = spell_ids["Power Word: Shield"],
    },
    [PlexusStatusAuras:StatusForSpell("Void Shield", true)] = {
        -- 1253593
        desc = format(L["Buff: %s"], spell_names["Void Shield"]),
        buff = spell_names["Void Shield"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Void Shield"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.56, g = 0.56, b = 0, a = 1 },
        durationColorHigh = { r = 0.8, g = 0.8, b = 0, a = 1 },
        id = spell_ids["Void Shield"],
    },
    [PlexusStatusAuras:StatusForSpell("Prayer of Mending", true)] = {
        -- 33076, 41635
        buff = spell_names["Prayer of Mending"],
        desc = format(L["Buff: %s"], spell_names["Prayer of Mending"]),
        text = PlexusStatusAuras:TextForSpell(spell_names["Prayer of Mending"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        mine = true,
        id = spell_ids["Prayer of Mending"],
    },
    --[PlexusStatusAuras:StatusForSpell("Premonition of Solace", true)] = {
    --    -- 428934
    --    buff = spell_names["Premonition of Solace"],
    --    desc = format(L["Buff: %s"], spell_names["Premonition of Solace"]),
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Premonition of Solace"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    mine = true,
    --},
    --[PlexusStatusAuras:StatusForSpell("Premonition of Solace Absorb", true)] = {
    --    -- 443526
    --    buff = spell_names["Premonition of Solace Absorb"],
    --    desc = format(L["Buff: %s"], spell_names["Premonition of Solace Absorb"]),
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Premonition of Solace Absorb"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    mine = true,
    --},
    --[PlexusStatusAuras:StatusForSpell("Protective Light", true)] = {
    --    -- 193065
    --    buff = spell_names["Protective Light"],
    --    desc = format(L["Buff: %s"], spell_names["Protective Light"]),
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Protective Light"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --    mine = true,
    --},
    [PlexusStatusAuras:StatusForSpell("Renew", true)] = {
        -- 139
        desc = format(L["Buff: %s"], spell_names["Renew"]),
        buff = spell_names["Renew"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Renew"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0, g = 0.49, b = 0.21, a = 1 },
        durationColorHigh = { r = 0, g = 0.7, b = 0.3, a = 1 },
        mine = true,
        id = spell_ids["Renew"],
    },
    --[PlexusStatusAuras:StatusForSpell("Weakened Soul")] = {
    --    -- 6788
    --    desc = format(L["Debuff: %s"], spell_names["Weakened Soul"]),
    --    debuff = spell_names["Weakened Soul"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Weakened Soul"]),
    --    color = { r = 1, g = 0, b = 0, a = 1 },
    --    mine = true,
    --},

    ---------------------
    -- Shaman
    ---------------------
    [PlexusStatusAuras:StatusForSpell("Ancestral Vigor", true)] = {
        -- 207400
        desc = format(L["Buff: %s"], spell_names["Ancestral Vigor"]),
        buff = spell_names["Ancestral Vigor"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Ancestral Vigor"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
        durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
        mine = true,
        id = spell_ids["Ancestral Vigor"],
    },
    [PlexusStatusAuras:StatusForSpell("Earth Shield", true)] = {
        -- 204288
        desc = format(L["Buff: %s"], spell_names["Earth Shield"]),
        buff = spell_names["Earth Shield"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Earth Shield"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        id = spell_ids["Earth Shield"],
    },
    [PlexusStatusAuras:StatusForSpell("Hydrobubble", true)] = {
        -- 444490
        desc = format(L["Buff: %s"], spell_names["Hydrobubble"]),
        buff = spell_names["Hydrobubble"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Hydrobubble"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
        durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
        mine = true,
        id = spell_ids["Hydrobubble"],
    },
    --[PlexusStatusAuras:StatusForSpell("Water Shield", true)] = {
    --    -- 52127
    --    desc = format(L["Buff: %s"], spell_names["Water Shield"]),
    --    buff = spell_names["Water Shield"],
    --    text = PlexusStatusAuras:TextForSpell(spell_names["Water Shield"]),
    --    color = { r = 0, g = 252, b = 0, a = 1 },
    --},
    [PlexusStatusAuras:StatusForSpell("Riptide", true)] = {
        -- 61295
        desc = format(L["Buff: %s"], spell_names["Riptide"]),
        buff = spell_names["Riptide"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Riptide"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
        durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
        mine = true,
        id = spell_ids["Riptide"],
    },
    [PlexusStatusAuras:StatusForSpell("Earthliving Weapon", true)] = {
        -- 382021
        desc = format(L["Buff: %s"], spell_names["Earthliving Weapon"]),
        buff = spell_names["Earthliving Weapon"],
        text = PlexusStatusAuras:TextForSpell(spell_names["Earthliving Weapon"]),
        color = { r = 0, g = 252, b = 0, a = 1 },
        durationColorLow = { r = 1, g = 0, b = 0, a = 1 },
        durationColorMiddle = { r = 0.28, g = 0, b = 0.56, a = 1 },
        durationColorHigh = { r = 0.4, g = 0, b = 0.8, a = 1 },
        mine = true,
        id = spell_ids["Earthliving Weapon"],
    },
}
end

local default_auras = {}
do
    for status, settings in pairs(PlexusStatusAuras.defaultDB) do
        if type(settings) == "table" and settings.text then
            PlexusStatusAuras:CopyDefaults(settings, statusDefaultDB)
            default_auras[status] = true
        end
    end
end

PlexusStatusAuras.extraOptions = {}

function PlexusStatusAuras:PostInitialize()
    self:RegisterStatuses()

    if Plexus:IsRetailWow() then
        self.options.args["add_buff"] = {
            name = L["Add Buff"],
            desc = L["Create a new buff status."],
            order = 11,
            width = "double",
            type = "input",
            usage = L["<buff name>"],
            get = false,
            set = function(_, v)
                self:AddAura(v, true)
            end,
        }
        self.options.args["add_debuff"] = {
            name = L["Add Debuff"],
            desc = L["Create a new debuff status."],
            order = 31,
            width = "double",
            type = "input",
            usage = L["<debuff name>"],
            get = false,
            set = function(_, v)
                self:AddAura(v, false)
            end,
        }
        self.options.args["delete_aura"] = {
            name = L["Remove Aura"],
            desc = L["Remove an existing buff or debuff status."],
            order = -2,
            type = "group",
            dialogInline = true,
            args = {},
        }
    end
    self.options.args["advancedOptions"] = {
        name = L["Show advanced options"],
        desc = L["Show advanced options for buff and debuff statuses.\n\nBeginning users may wish to leave this disabled until you are more familiar with Plexus, to avoid being overwhelmed by complicated options menus."],
        order = -1,
        width = "full",
        type = "toggle",
        get = function()
            return self.db.profile.advancedOptions
        end,
        set = function(_, v)
            self.db.profile.advancedOptions = v
        end,
    }
end

function PlexusStatusAuras:PostEnable()
    self:CreateRemoveOptions()
    self:UpdateDispellable()
    --self:UpdateAllUnitAuras()
end

function PlexusStatusAuras:PostReset()
    self:UnregisterStatuses()
    self:RegisterStatuses()
    self:CreateRemoveOptions()
    self:ResetDurationStatuses()
    self:UpdateAuraScanList()
end

function PlexusStatusAuras:EnabledStatusCount()
    local enable_count = 0

    for _, settings in pairs(self.db.profile) do
        if type(settings) == "table" and settings.enable then
            enable_count = enable_count + 1
        end
    end

    return enable_count
end

function PlexusStatusAuras:OnStatusEnable(status)
    self:RegisterMessage("UpdateFrameUnits", "MakeContainers")
    self:RegisterEvent("SPELLS_CHANGED", "UpdateDispellable")
    self:RegisterEvent("LOADING_SCREEN_DISABLED", "MakeContainers")
    --self:UpdateAllUnitAuras()

    self:UpdateDispellable()
    --print("PlexusStatusAuras:OnStatusEnable", status, self:EnabledStatusCount())
end

function PlexusStatusAuras:OnStatusDisable(status)
    if self:EnabledStatusCount() == 0 then
        self:UnRegisterMessage("UpdateFrameUnits")
        self:UnregisterEvent("SPELLS_CHANGED")
        self:UnregisterEvent("LOADING_SCREEN_DISABLED")
    end
end

function PlexusStatusAuras:RegisterStatuses()
    local profile = self.db.profile

    for status, settings in pairs(profile) do
        if type(settings) == "table" then
            if settings.desc then
                --self:Debug("Registering status:", status)
                if settings.buff == nil and settings.debuff == nil and not self.defaultDB[status] then
                    self:Debug("Upgrading old aura:", settings.desc)
                    local aura = strmatch(settings.desc, gsub(L["Buff: %s"], "%%s", "(.+)"))
                    if aura then
                        settings.aura = aura
                        if settings.text == aura then
                            settings.text = self:TextForSpell(aura)
                        end
                        --self:Debug("Upgraded buff:", aura)
                    else
                        aura = strmatch(settings.desc, gsub(L["Debuff: %s"], "%%s", "(.+)"))
                        if aura then
                            settings.debuff = aura
                            if settings.text == aura then
                                settings.text = self:TextForSpell(aura)
                            end
                            --self:Debug("Upgraded debuff:", aura)
                        else
                            self:Debug("Upgrade failed!")
                        end
                    end
                end
                --[[if status == "boss_aura" then
                    self:RegisterStatus(status, settings.desc, { text = false }, false, settings.order)

                else]] if settings.buff or settings.debuff or self.defaultDB[status] then
                    local name = settings.text
                    local desc = settings.desc or name
                    local isBuff = not not settings.buff
                    local order = settings.order or (isBuff and 15 or 35)

                    self:Debug("Registering", status, desc)
                    if not self.defaultDB[status] then
                        self.defaultDB[status] = {}
                        self:CopyDefaults(self.defaultDB[status], statusDefaultDB)
                    end
                    self:CopyDefaults(settings, self.defaultDB[status])
                    self:RegisterStatus(status, desc, self:OptionsForStatus(status, isBuff), false, order)
                end
            end
        end
    end
    self.db:RegisterDefaults({ profile = self.defaultDB or {} })
end

function PlexusStatusAuras:UnregisterStatuses()
    for status, moduleName in self.core:RegisteredStatusIterator() do
        if moduleName == self.name then
            self:UnregisterStatus(status)
            self.options.args[status] = nil
        end
    end
end

function PlexusStatusAuras:OptionsForStatus(status, isBuff)
    local auraOptions = {
        text = {
            name = L["Text"],
            desc = L["Text to display on text indicators"],
            order = 50,
            type = "input",
            get = function()
                return PlexusStatusAuras.db.profile[status].text
            end,
            set = function(_, v)
                PlexusStatusAuras.db.profile[status].text = v
            end,
        },
--[[ -- ##DELETE
        class = {
            name = L["Class Filter"],
            desc = L["Show status for the selected classes."],
            order = 200,
            type = "group",
            dialogInline = true,
            hidden = function()
                return not self.db.profile.advancedOptions
            end,
            args = {
                pet = {
                    name = L["Pet"],
                    desc = L["Show on pets and vehicles."],
                    order = -1,
                    width = "double",
                    type = "toggle",
                    get = function()
                        return PlexusStatusAuras.db.profile[status].pet ~= false
                    end,
                    set = function(_, v)
                        PlexusStatusAuras.db.profile[status].pet = v
                        PlexusStatusAuras:UpdateAllUnitAuras()
                    end,
                },
            },
        },
]]
        statusInfo = {
            name = L["Status Information"],
            desc = L["Change what information is displayed using the status color and text."],
            order = 300,
            type = "group",
            dialogInline = true,
            hidden = function()
                    return not self.db.profile.advancedOptions
                end,
            args = {
                colorInfo = {
                    name = L["Color"],
                    desc = L["Change which information is shown by the status color."],
                    order = 310,
                    width = "double",
                    type = "select",
                    values = {
                        ["present"] = L["Present or missing"],
                        ["duration"] = L["Time left"],
                        ["count"] = L["Stack count"],
                    },
                    get = function()
                        return self.db.profile[status].statusColor
                    end,
                    set = function(_, v)
                        self.db.profile[status].statusColor = v
                    end,
                },
                textInfo = {
                    name = L["Text"],
                    desc = L["Change which information is shown by the status text."],
                    order = 320,
                    width = "double",
                    type = "select",
                    values = {
                        ["name"] = L["Buff name"],
                        ["duration"] = L["Time left"],
                        ["count"] = L["Stack count"],
                    },
                    get = function()
                        return self.db.profile[status].statusText
                    end,
                    set = function(_, v)
                        self.db.profile[status].statusText = v
                    end,
                    hidden = function()
                        return not self.db.profile.advancedOptions
                    end,
                },
                durationTenths = {
                    name = L["Show time left to tenths"],
                    desc = L["Show the time left to tenths of a second, instead of only whole seconds."],
                    order = 330,
                    width = "double",
                    type = "toggle",
                    get = function()
                        return self.db.profile[status].durationTenths
                    end,
                    set = function(_, v)
                        self.db.profile[status].durationTenths = v
                    end,
                    hidden = function()
                        return not self.db.profile.advancedOptions or self.db.profile[status].statusText ~= "duration"
                    end,
                },
                countSettings = {
                    name = format(L["%s colors"], L["Stack count"]),
                    desc = format(L["%s colors and threshold values."], L["Stack count"]),
                    order = 350,
                    type = "group",
                    dialogInline = true,
                    get = function(info)
                        local optionName = info[#info]
                        if (info.type == "color") then
                            local color = self.db.profile[status][optionName]
                            return color.r, color.g, color.b, color.a
                        elseif (info.type == "range") then
                            return self.db.profile[status][optionName]
                        end
                    end,
                    set = function(info, r, g, b, a)
                        local optionName = info[#info]
                        if (info.type == "color") then
                            local color = self.db.profile[status][optionName]
                            color.r = r
                            color.g = g
                            color.b = b
                            color.a = a or 1
                        elseif (info.type == "range") then
                            self.db.profile[status][optionName] = r
                        end
                    end,
                    hidden = function()
                        return not self.db.profile.advancedOptions or self.db.profile[status].statusColor ~= "count"
                    end,
                    args = {
                        countColorLow = {
                            name = L["Low color"],
                            desc = format(L["Color when %s is below the low threshold value."], L["Stack count"]),
                            order = 351,
                            type = "color",
                        },
                        countLow = {
                            name = L["Low threshold"],
                            desc = format(L["%s is low below this value."], L["Stack count"]),
                            order = 352,
                            type = "range",
                            min = 0, softMin = 0, max = 99, softMax = 10, step = 1,
                        },
                        countColorMiddle = {
                            name = L["Middle color"],
                            desc = format(L["Color when %s is between the low and high threshold values."], L["Stack count"]),
                            order = 353,
                            width = "full",
                            type = "color",
                        },
                        countColorHigh = {
                            name = L["High color"],
                            desc = format(L["Color when %s is above the high threshold value."], L["Stack count"]),
                            order = 354,
                            type = "color",
                        },
                        countHigh = {
                            name = L["High threshold"],
                            desc = format(L["%s is high above this value."], L["Stack count"]),
                            order = 355,
                            type = "range",
                            min = 0, softMin = 0, max = 99, softMax = 10, step = 1,
                        },
                    },
                },
                durationSettings = {
                    name = format(L["%s colors"], L["Duration"]),
                    desc = format(L["%s colors and threshold values."], L["Duration"]),
                    order = 360,
                    type = "group",
                    dialogInline = true,
                    get = function(info)
                        local optionName = info[#info]
                        if (info.type == "color") then
                            local color = self.db.profile[status][optionName]
                            return color.r, color.g, color.b, color.a
                        elseif (info.type == "range") then
                            return self.db.profile[status][optionName]
                        end
                    end,
                    set = function(info, r, g, b, a)
                        local optionName = info[#info]
                        if (info.type == "color") then
                            local color = self.db.profile[status][optionName]
                            color.r = r
                            color.g = g
                            color.b = b
                            color.a = a or 1
                        elseif (info.type == "range") then
                            self.db.profile[status][optionName] = r
                        end
                    end,
                    hidden = function()
                        return not self.db.profile.advancedOptions or self.db.profile[status].statusColor ~= "duration"
                    end,
                    args = {
                        durationColorLow = {
                            name = L["Low color"],
                            desc = format(L["Color when %s is below the low threshold value."], L["Duration"]),
                            order = 361,
                            type = "color",
                        },
                        durationLow = {
                            name = L["Low threshold"],
                            desc = format(L["%s is low below this value."], L["Duration"]),
                            order = 362,
                            type = "range",
                            min = 0, softMin = 0, max = 99, softMax = 10, step = 1,
                        },
                        durationColorMiddle = {
                            name = L["Middle color"],
                            desc = format(L["Color when %s is between the low and high threshold values."], L["Duration"]),
                            order = 363,
                            width = "full",
                            type = "color",
                        },
                        durationColorHigh = {
                            name = L["High color"],
                            desc = format(L["Color when %s is above the high threshold value."], L["Duration"]),
                            order = 364,
                            type = "color",
                        },
                        durationHigh = {
                            name = L["High threshold"],
                            desc = format(L["%s is high above this value."], L["Duration"]),
                            order = 365,
                            type = "range",
                            min = 0, softMin = 0, max = 99, softMax = 10, step = 1,
                        },
                    },
                },
                refresh = {
                    name = L["Refresh interval"],
                    desc = L["Time in seconds between each refresh of the duration status."],
                    order = 390,
                    width = "double",
                    type = "range",
                    min = 0.1,
                    max = 0.5,
                    step = 0.1,
                    get = function()
                        return self.db.profile[status].refresh
                    end,
                    set = function(_, v)
                        self.db.profile[status].refresh = v
                    end,
                    hidden = function()
                        return not self.db.profile.advancedOptions or self.db.profile[status].statusColor ~= "duration"
                    end,
                },
            },
        },
    }

    if isBuff then
        auraOptions.statusInfo.args.textInfo.values["name"] = L["Buff name"]
        auraOptions.mine = {
            name = L["Show if mine"],
            desc = L["Display status only if the buff was cast by you."],
            order = 60,
            width = "double",
            type = "toggle",
            get = function()
                return PlexusStatusAuras.db.profile[status].mine
            end,
            set = function(_, v)
                PlexusStatusAuras.db.profile[status].mine = v
            end,
        }
        auraOptions.missing = {
            name = L["Show if missing"],
            desc = L["Display status only if the buff is not active."],
            order = 70,
            width = "double",
            type = "toggle",
            get = function()
                return PlexusStatusAuras.db.profile[status].missing
            end,
            set = function(_, v)
                PlexusStatusAuras.db.profile[status].missing = v
            end,
        }
    end

    if not isBuff then
        auraOptions.statusInfo.args.textInfo.values["name"] = L["Debuff name"]
        auraOptions.mine = {
            name = L["Show if mine"],
            desc = L["Display status only if the debuff was cast by you."],
            order = 60,
            width = "double",
            type = "toggle",
            get = function()
                return PlexusStatusAuras.db.profile[status].mine
            end,
            set = function(_, v)
                PlexusStatusAuras.db.profile[status].mine = v
            end,
        }
    end

    -- super inefficient...
    for name, found in pairs(debuff_types) do
        if status == found then
            auraOptions.dispellable = {
                name = L["Show only dispellable"],
                desc = format(L["Show %s debuffs only if you can dispel them."], name),
                order = 60,
                width = "double",
                type = "toggle",
                get = function()
                    return PlexusStatusAuras.db.profile[status].dispellable
                end,
                set = function(_, v)
                    PlexusStatusAuras.db.profile[status].dispellable = v
                end,
            }
            break
        end
    end

    return auraOptions
end

function PlexusStatusAuras:CreateRemoveOptions()
    for status, settings in pairs(self.db.profile) do
        if type(settings) == "table" and settings.text and not default_auras[status] then
            local debuffName = settings.desc or settings.text
            if Plexus:IsRetailWow() then
                self.options.args.delete_aura.args[status] = {
                    name = debuffName,
                    desc = format(L["Remove %s from the menu"], debuffName),
                    width = "double",
                    type = "execute",
                    func = function() return
                        self:DeleteAura(status)
                    end,
                }
            end
        end
    end
end

function PlexusStatusAuras:AddAura(nameorid, isBuff)
    local name
    if strlen(nameorid) < 1 then
        return self:Debug("AddAura failed, no name entered!")
    end
    local id = tonumber(nameorid)
    if not id and nameorid then
        id = GetSpellInfo(nameorid) and GetSpellInfo(nameorid).spellID
        name = nameorid
    end
    if id and nameorid then
        name = GetSpellName(id)
    end
    if not id then
        return self:Debug("AddAura failed")
    end

    local status = PlexusStatusAuras:StatusForSpell(name, isBuff)

    -- status already exists
    if self.db.profile[status] then
        return self:Debug("AddAura failed, status exists!", name, status)
    end

    local desc = isBuff and format(L["Buff: %s"], name) or format(L["Debuff: %s"], name)

    if not self.defaultDB[status] then
        self.defaultDB[status] = {}
        self:CopyDefaults(self.defaultDB[status], statusDefaultDB)
        self.db:RegisterDefaults({ profile = self.defaultDB or {} })
    end

    local settings = {
        text = self:TextForSpell(name),
        desc = desc,
    }
    if isBuff then
        settings.buff = name
    else
        settings.debuff = name
    end
    settings.id = {[id] = true}
    self:CopyDefaults(settings, self.defaultDB[status])
    self.db.profile[status] = settings

    self.options.args.delete_aura.args[status] = {
        name = desc,
        desc = format(L["Remove %s from the menu"], desc),
        width = "double",
        type = "execute",
        func = function()
            return self:DeleteAura(status)
        end,
    }

    local order = isBuff and 15 or 35

    self:RegisterStatus(status, desc, self:OptionsForStatus(status, isBuff), false, order)
    self:OnStatusEnable(status)
end

function PlexusStatusAuras:DeleteAura(status)
    self:UnregisterStatus(status)
    self.options.args[status] = nil
    self.options.args.delete_aura.args[status] = nil
    self.db.profile[status] = nil
    for _, indicatorTbl in pairs(PlexusFrame.db.profile.statusmap) do
        indicatorTbl[status] = nil
    end
end

function PlexusStatusAuras:Plexus_UnitJoined(event, guid, unitid)
    print("PlexusStatusAuras:Plexus_UnitJoined", event, guid, unitid)
    --self:MakeContainers(unitid)
end

function PlexusStatusAuras:UpdateAllUnitAuras()
    --guid, unitid
    --for _, unitid in PlexusRoster:IterateRoster() do
    --    self:MakeContainers(unitid)
    --end
end

function PlexusStatusAuras:UpdateDispellable() --luacheck: ignore 212
    if Plexus:IsRetailWow() then
        if PLAYER_CLASS == "DRUID" then
            --  88423   Nature's Cure                Restoration                Magic
            --  392378  Improved Nature's Cure       Restoration                Curse, Poison, Magic
            --  2782    Remove Corruption            Balance, Feral, Guardian   Curse, Poison
            PlayerCanDispel.Curse   = IsPlayerSpell(392378) or IsPlayerSpell(2782)
            PlayerCanDispel.Magic   = IsPlayerSpell(88423)
            PlayerCanDispel.Poison  = IsPlayerSpell(392378) or IsPlayerSpell(2782)

        elseif PLAYER_CLASS == "MONK" then
            -- 115450   Detox             Mistweaver                  Magic
            -- 388874   Improved Detox    Mistweaver                  Disease, Poison, Magic
            -- 218164   Detox             Brewmaster, Windwalker      Disease, Poison
            PlayerCanDispel.Disease = IsPlayerSpell(388874) or IsPlayerSpell(218164)
            PlayerCanDispel.Magic   = IsPlayerSpell(115450)
            PlayerCanDispel.Poison  = IsPlayerSpell(388874) or IsPlayerSpell(218164)

        elseif PLAYER_CLASS == "PALADIN" then
            --   4987     Cleanse           Holy                        Magic
            --   393024   Improved Cleanse  Holy                        Disease, Poison, Magic
            --   213644   Cleanse Toxins    Protection, Retribution     Disease, Poison
            PlayerCanDispel.Disease = IsPlayerSpell(393024) or IsPlayerSpell(213644)
            PlayerCanDispel.Magic   = IsPlayerSpell(4987)
            PlayerCanDispel.Poison  = IsPlayerSpell(393024) or IsPlayerSpell(213644)

        elseif PLAYER_CLASS == "PRIEST" then
            -- 527       Purify            Discipline, Holy            Magic
            -- 390632    Improved Purify   Discipline, Holy            Disease, Magic
            -- 213634    Purify Disease    Shadow                      Disease
            PlayerCanDispel.Disease = IsPlayerSpell(390632) or IsPlayerSpell(213634)
            PlayerCanDispel.Magic   = IsPlayerSpell(527)

        elseif PLAYER_CLASS == "SHAMAN" then
            --  77130   Purify Spirit           Restoration                            Magic
            --  383016  Improved Purify Spirit  Restoration                            Curse, Magic
            --  51886   Cleanse Spirit          Elemental, Enhancement                 Curse
            --  383013  Poison Cleansing Totem  Restoration, Elemental, Enhancement    Poison
            PlayerCanDispel.Curse   = IsPlayerSpell(383016) or IsPlayerSpell(51886)
            PlayerCanDispel.Magic   = IsPlayerSpell(77130)
            PlayerCanDispel.Poison  = IsPlayerSpell(383013)

        elseif PLAYER_CLASS == "WARLOCK" then
            -- 115276   Sear Magic (Fel Imp)
            --  89808   Singe Magic (Imp)
            PlayerCanDispel.Magic   = IsSpellKnown(115276, true) or IsSpellKnown(89808, true)

        elseif PLAYER_CLASS == "MAGE" then
            -- 475   Remove Curse       Fire, Arcane, Frost        Curse
            PlayerCanDispel.Curse   = IsPlayerSpell(475)

        elseif PLAYER_CLASS == "EVOKER" then
            --	360823	Maturalize			Preservation					Poison, Magic
            --	365585	Expunge				Devastation						Poison
            --	374251	Cauterizing Flame	Devastation, Preservation		Curse, Disease, Poison
            PlayerCanDispel.Curse   = IsPlayerSpell(374251)
            PlayerCanDispel.Disease = IsPlayerSpell(374251)
            PlayerCanDispel.Magic   = IsPlayerSpell(360823) or IsPlayerSpell(378438)
            PlayerCanDispel.Poison  = IsPlayerSpell(360823) or IsPlayerSpell(365585) or IsPlayerSpell(374251)
            PlayerCanDispel.Bleed   = IsPlayerSpell(374251)
        end
    end
    if Plexus:IsClassicWow() or Plexus:IsTBCWow() then
        if PLAYER_CLASS == "DRUID" then
            --  2782    Remove Curse        Balance, Feral, Guardian, Restoration    Curse
            --  2893    Abolish Poison      Balance, Feral, Guardian, Restoration    Poison
            --  8946    Cure Poison         Balance, Feral, Guardian, Restoration    Poison
            PlayerCanDispel.Curse   = IsPlayerSpell(2782)
            PlayerCanDispel.Poison  = IsPlayerSpell(2893) or IsPlayerSpell(8946)

        elseif PLAYER_CLASS == "PALADIN" then
            --   4987   Cleanse           Holy                        Disease, Poison, Magic
            --   1152   Purify            Protection, Retribution     Disease, Poison
            PlayerCanDispel.Disease = IsPlayerSpell(4987) or IsPlayerSpell(1152)
            PlayerCanDispel.Magic   = IsPlayerSpell(4987)
            PlayerCanDispel.Poison  = IsPlayerSpell(4987) or IsPlayerSpell(1152)

        elseif PLAYER_CLASS == "PRIEST" then
            --    552   Abolish Disease   Shadow                      Disease
            --    528   Cure Disease      Shadow                      Disease
            --    527   Dispel Magic      Shadow                      Magic
            PlayerCanDispel.Disease = IsPlayerSpell(552) or IsPlayerSpell(528)
            PlayerCanDispel.Magic   = IsPlayerSpell(527)

        elseif PLAYER_CLASS == "SHAMAN" then
            --  8166    Poison Cleansing Totem      Restoration                 Poison
            --  8170    Disease Cleansing Totem     Restoration                 Disease
            --  526     Cure Poison                 Restoration                 Poison
            --  2870    Cure Disease                Restoration                 Disease
            PlayerCanDispel.Disease = IsPlayerSpell(2870)
            PlayerCanDispel.Poison  = IsPlayerSpell(526)

        elseif PLAYER_CLASS == "WARLOCK" then
            --  19505   Devour Magic (Felhunter)
            PlayerCanDispel.Magic   = IsSpellKnown(19505, true)

        elseif PLAYER_CLASS == "MAGE" then
            -- 475   Remove Curse       Fire, Arcane, Frost        Curse
            PlayerCanDispel.Curse   = IsPlayerSpell(475)
        end
    end
    if Plexus:IsWrathWow() then
        if PLAYER_CLASS == "DRUID" then
            --  2782    Remove Curse        Balance, Feral, Guardian, Restoration    Curse
            --  2893    Abolish Poison      Balance, Feral, Guardian, Restoration    Poison
            --  8946    Cure Poison         Balance, Feral, Guardian, Restoration    Poison
            PlayerCanDispel.Curse   = IsPlayerSpell(2782)
            PlayerCanDispel.Poison  = IsPlayerSpell(2893) or IsPlayerSpell(8946)

        elseif PLAYER_CLASS == "PALADIN" then
            --   4987   Cleanse           Holy                        Disease, Poison, Magic
            --   1152   Purify            Protection, Retribution     Disease, Poison
            PlayerCanDispel.Disease = IsPlayerSpell(4987) or IsPlayerSpell(1152)
            PlayerCanDispel.Magic   = IsPlayerSpell(4987)
            PlayerCanDispel.Poison  = IsPlayerSpell(4987) or IsPlayerSpell(1152)

        elseif PLAYER_CLASS == "PRIEST" then
            --    552   Abolish Disease   Shadow                      Disease
            --    528   Cure Disease      Shadow                      Disease
            --    527   Dispel Magic      Shadow                      Magic
            PlayerCanDispel.Disease = IsPlayerSpell(552) or IsPlayerSpell(528)
            PlayerCanDispel.Magic   = IsPlayerSpell(527)

        elseif PLAYER_CLASS == "SHAMAN" then
            --  8166    Poison Cleansing Totem      Restoration                 Poison
            --  8170    Disease Cleansing Totem     Restoration                 Disease
            --  526     Cure Poison                 Restoration                 Poison
            --  2870    Cure Disease                Restoration                 Disease
            PlayerCanDispel.Disease = IsPlayerSpell(2870) or IsPlayerSpell(526) or IsPlayerSpell(51886)
            PlayerCanDispel.Poison  = IsPlayerSpell(526) or IsPlayerSpell(51886)
            PlayerCanDispel.Curse   = IsPlayerSpell(51886)

        elseif PLAYER_CLASS == "WARLOCK" then
            --  19505   Devour Magic (Felhunter)
            PlayerCanDispel.Magic   = IsSpellKnown(19505, true)

        elseif PLAYER_CLASS == "MAGE" then
            -- 475   Remove Curse       Fire, Arcane, Frost        Curse
            PlayerCanDispel.Curse   = IsPlayerSpell(475)
        end
    end
    if Plexus:IsCataWow() or Plexus:IsMistWow() then
        if PLAYER_CLASS == "DRUID" then
            --  2782    Remove Curse        Balance, Feral, Guardian, Restoration    Curse
            --  2893    Abolish Poison      Balance, Feral, Guardian, Restoration    Poison
            --  8946    Cure Poison         Balance, Feral, Guardian, Restoration    Poison
            PlayerCanDispel.Curse   = IsPlayerSpell(2782)
            PlayerCanDispel.Magic   = IsPlayerSpell(88423)
            PlayerCanDispel.Poison  = IsPlayerSpell(2782)

        elseif PLAYER_CLASS == "PALADIN" then
            --   4987   Cleanse           Holy                        Disease, Poison, Magic
            --   1152   Purify            Protection, Retribution     Disease, Poison
            PlayerCanDispel.Disease = IsPlayerSpell(4987)
            PlayerCanDispel.Magic   = IsPlayerSpell(53551)
            PlayerCanDispel.Poison  = IsPlayerSpell(4987)

        elseif PLAYER_CLASS == "PRIEST" then
            --    552   Abolish Disease   Shadow                      Disease
            --    528   Cure Disease      Shadow                      Disease
            --    527   Dispel Magic      Shadow                      Magic
            PlayerCanDispel.Disease = IsPlayerSpell(528)
            PlayerCanDispel.Magic   = IsPlayerSpell(527) or IsPlayerSpell(33167)

        elseif PLAYER_CLASS == "SHAMAN" then
            --  8166    Poison Cleansing Totem      Restoration                 Poison
            --  8170    Disease Cleansing Totem     Restoration                 Disease
            --  526     Cure Poison                 Restoration                 Poison
            --  2870    Cure Disease                Restoration                 Disease
            --  51886   Cleanse Spirit                                          Poison, Disease, Curse
            PlayerCanDispel.Curse   = IsPlayerSpell(51886)
            PlayerCanDispel.Magic   = IsPlayerSpell(77130)

        elseif PLAYER_CLASS == "WARLOCK" then
            --  19505   Devour Magic (Felhunter)
            PlayerCanDispel.Magic   = IsSpellKnown(19505, true)

        elseif PLAYER_CLASS == "MAGE" then
            -- 475   Remove Curse       Fire, Arcane, Frost        Curse
            PlayerCanDispel.Curse   = IsPlayerSpell(475)
        end
    end
end

local function createButton(status, name)
    local frameSettings = PlexusFrame.db.profile
    return function(button)
        if name == "icon" then
            button:SetSize(frameSettings.centerIconSize, frameSettings.centerIconSize)
        else
            button:SetSize(frameSettings.iconSize, frameSettings.iconSize)
        end
        button:SetCancelAuraButtons('RightButtonUp')
        local Icon = button:CreateTexture(nil, 'ARTWORK')
        Icon:SetAllPoints()
        button:SetIcon(Icon)
        local Time = button:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
        Time:SetPoint('TOPLEFT', 1, -1)
        Time:SetJustifyH('LEFT')
        Time:SetSize(8,8)
        button:SetDurationText(Time)
        local cooldown = button.cooldown or CreateFrame("Cooldown", nil, button, "CooldownFrameTemplate")
        cooldown:SetAllPoints()
        cooldown:SetAlpha(1)
        cooldown:SetHideCountdownNumbers(true)
        cooldown:SetDrawEdge(false)
        cooldown:SetDrawSwipe(true)
        cooldown:SetReverse(true)
        cooldown:Show()
        button.cooldown = cooldown
        button:SetDurationCooldown(cooldown)
        --local fontSize = self.fontSize<1 and self.fontSize*iconSize or self.fontSize
        local text = button.text
        if not text then
            local tframe = CreateFrame("frame", nil, button)
            text = tframe:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            button.text = text
            text.tframe = tframe
            tframe:SetAllPoints()
        end
        local level = button:GetFrameLevel()
        text.tframe:SetFrameLevel(level+2)
        --text:SetFont(self.font, fontSize, self.fontFlags)
        --text:SetTextColor(UnpackColor(self.colorStack))
        text:ClearAllPoints()
        text:SetPoint("BOTTOMRIGHT", 0, 0)
        text:Show()
        button:SetApplicationCount(text, {})
        --local borderOptions = {
        --    showAlways = false,
        --    showIcon = true,
        --    showWhenHarmful = true,
        --    showWhenHelpful = true,
        --    showWithoutDispelType = false,
        --    style = Enum.CustomAuraButtonDispelTypeTextureStyle.Icon,
        --}
	    ----local borderSize = self.borderSize
	    ----if borderSize>0 then
	    --	local border = button.border
	    --	if not border then
	    --		border = button:CreateTexture(nil, "BACKGROUND")
	    --		border:ClearAllPoints()
	    --		border:SetAllPoints()
	    --		border:SetColorTexture(0,0,0,0)
	    --		button.border = border
	    --	end
	    --	--if self.useStatusColor then -- dispel border
	    --		button:SetAuraBorder(border, borderOptions)
	    --	--else -- fixed border
	    --	--	button:ClearAuraBorder()
	    --	--	border:SetColorTexture(UnpackColor(self.colorBorder))
	    --	--end
        --    --border:SetColorTexture
	    --	border:Show()
	    ----elseif button.border then
	    ----	button:ClearAuraBorder(button.border)
	    ----	button.border:Hide()
        ----end
        local Overlay = CreateFrame("Frame", nil, button)
        Overlay:SetFrameLevel(button:GetFrameLevel() + 10)
        --Overlay:SetInside()
        local DispelIndicator = Overlay:CreateTexture(nil, "OVERLAY")
        DispelIndicator:SetSize(8, 8)
        DispelIndicator:SetPoint("TOPRIGHT", button, 0, 0)
        button:AddDispelTypeTexture(DispelIndicator, {
            style = Enum.CustomAuraButtonDispelTypeTextureStyle.Icon,
            showWhenHarmful = true,
            showWhenHelpful = false,
        })
    end
end

local function createFrame(status, name)
    local frameSettings = PlexusFrame.db.profile
    return function(button)
        button:SetSize(frameSettings.cornerSize, frameSettings.cornerSize)

        local Icon = button.icon or button:CreateTexture(nil, "ARTWORK")
        button.icon = Icon
        Icon:SetAllPoints()
        Icon:SetColorTexture(0, 0, 0, 0)

        local Time = button.durationText or button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        button.durationText = Time
        Time:SetText("")
        Time:Hide()

        local cooldown = button.cooldown or CreateFrame("Cooldown", nil, button, "CooldownFrameTemplate")
        button.cooldown = cooldown
        cooldown:SetAllPoints()
        cooldown:Hide()

        local text = button.text or button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        button.text = text
        text:SetText("")
        text:Hide()

        local colorTex = button.colorTex or button:CreateTexture(nil, "ARTWORK")
        button.colorTex = colorTex
        colorTex:SetAllPoints()
        local color = status.color
        colorTex:SetColorTexture(color.r, color.g, color.b, 1)
    end
end


local anchor = {
    -- left/right up/down
    corner3 = { "TOPLEFT", -1, 1 },
    topleft2 = { "TOPLEFT", 10, 1 },
    topleft3 = { "TOPLEFT", -1, -10 },
    -- left/right up/down
    corner4 = { "TOPRIGHT", 1, 1 },
    topright2 = { "TOPRIGHT", 1, -10 },
    topright3 = { "TOPRIGHT", -10, 1 },
    -- left/right up/down
    corner1 = { "BOTTOMLEFT", -1, -1 },
    bottomleft2 = { "BOTTOMLEFT", -1, 10 },
    bottomleft3 = { "BOTTOMLEFT", 10, -1 },
    -- left/right up/down
    corner2 = { "BOTTOMRIGHT", 1, -1 },
    bottomright2 = { "BOTTOMRIGHT", -10, -1 },
    bottomright3 = { "BOTTOMRIGHT", 1, 10 },
    -- left/right up/down
    Top = { "TOP", 0, 1 },
    Top2 = { "TOP", 10, 1 },
    Top3 = { "TOP", 0, -10 },
    Top4 = { "TOP", -10, 1 },
    -- left/right up/down
    Bottom = { "BOTTOM", 0, -1 },
    Bottom2 = { "BOTTOM", -10, -1 },
    Bottom3 = { "BOTTOM", 0, 10 },
    Bottom4 = { "BOTTOM", 10, -1 },
    -- left/right up/down
    Left = { "LEFT", -1, 0 },
    Left2 = { "LEFT", -1, 10 },
    Left3 = { "LEFT", 10, 0 },
    Left4 = { "LEFT", -1, -10 },
    -- left/right up/down
    Right = { "RIGHT", 1, 0 },
    Right2 = { "RIGHT", 1, -10 },
    Right3 = { "RIGHT", -10, 0 },
    Right4 = { "RIGHT", 1, 10 },

    -- left/right up/down
    icon = { "CENTER", 0, 0},
    ei_icon_topleft = { "TOPLEFT", 1, -1 },
    ei_icon_topleft2 = { "TOPLEFT", 10, -1 },
    ei_icon_topleft3 = { "TOPLEFT", 1, -10 },
    ei_icon_topleft4 = { "TOPLEFT", 10, -10 },
    -- left/right up/down
    ei_icon_topright = { "TOPRIGHT", -1, -1 },
    ei_icon_topright2 = { "TOPRIGHT", -10, -1 },
    ei_icon_topright3 = { "TOPRIGHT", -1, -10 },
    ei_icon_topright4 = { "TOPRIGHT", -10, -10 },
    -- left/right up/down
    ei_icon_botleft = { "BOTTOMLEFT", 1, 1 },
    ei_icon_botleft2 = { "BOTTOMLEFT", 10, 1 },
    ei_icon_botleft3 = { "BOTTOMLEFT", 1, 10 },
    ei_icon_botleft4 = { "BOTTOMLEFT", 10, 10 },
    -- left/right up/down
    ei_icon_botright = { "BOTTOMRIGHT", -1, 1 },
    ei_icon_botright2 = { "BOTTOMRIGHT", -10, 1 },
    ei_icon_botright3 = { "BOTTOMRIGHT", -1, 10 },
    ei_icon_botright4 = { "BOTTOMRIGHT", -10, 10 },
    -- left/right up/down
    ei_icon_top = { "TOP", 0, -1 },
    ei_icon_top2 = { "TOP", 0, -10 },
    ei_icon_top3 = { "TOP", -10, -1 },
    ei_icon_top4 = { "TOP", 10, -1 },
    -- left/right up/down
    ei_icon_bottom = { "BOTTOM", 0, 1 },
    ei_icon_bottom2 = { "BOTTOM", 0, 10 },
    ei_icon_bottom3 = { "BOTTOM", -10, 1 },
    ei_icon_bottom4 = { "BOTTOM", 10, 1 },
    -- left/right up/down
    ei_icon_left = { "LEFT", 1, 0 },
    ei_icon_left2 = { "LEFT", 10, 0 },
    ei_icon_left3 = { "LEFT", 1, 10 },
    ei_icon_left4 = { "LEFT", 1, -10 },
    -- left/right up/down
    ei_icon_right = { "RIGHT", -1, 0 },
    ei_icon_right2 = { "RIGHT", -10, 0 },
    ei_icon_right3 = { "RIGHT", -1, 10 },
    ei_icon_right4 = { "RIGHT", -1, -10 },
}

function PlexusStatusAuras:MakeContainers()
    local registeredFrames = PlexusFrame.registeredFrames
    local i = 1
    local id
    local filter
    --C_Timer.After(1, function()
    --    for frameName, frameTable in pairs(registeredFrames) do
    --      print(frameTable.unit)
    --    end
    --end)
    --C_Timer.After(10, function()
    local count = 0
    for _, frameTable  in pairs(registeredFrames) do
        if frameTable.unit then
            count = count + 1
        end
    end
    if count == 0 then
        C_Timer.After(1, function() PlexusStatusAuras:MakeContainers() end)
        return
    end
        for frameName, frameTable in pairs(registeredFrames) do
            if frameTable.unit then
                --local unit = frameTable.unit
                for name, indicator in pairs(frameTable.indicators) do
                    if type(indicator) == "table" and indicator.GetObjectType and (indicator:GetObjectType() == "Button" or indicator:GetObjectType() == "Frame") then
                        if not frameTable.container then
                            frameTable.container = {}
                        end
                        if not frameTable.container[name] then
                            --print("creating container for " .. name, "for unit " .. unit)
                            frameTable.container[name] = CreateFrame('AuraContainer', nil, frameTable, 'CustomAuraContainerTemplate')
                            frameTable.container[name]:SetUnit(frameTable.unit)
                            --print(unit)
                            --frameTable.container[name]:SetPoint('TOP', 0, 0)
                            local point, x, y = unpack(anchor[name])
                            frameTable.container[name]:SetPoint(point, x, y)
                        end
                        for status, statusEnabled in pairs(PlexusFrame.db.profile.statusmap[name]) do
                            if not frameTable.container[name]:HasAuraGroup(frameName .. ":" .. name .. ":" .. status) then
                                if self.db.profile[status] and self.db.profile[status].enable and statusEnabled then
                                    if self.db.profile[status] and self.db.profile[status].buff then
                                        filter = self.db.profile[status].mine and "PLAYER|HELPFUL" or "HELPFUL"
                                        id = spell_ids[self.db.profile[status].buff]
                                        --print(self.db.profile[status].buff)
                                    else
                                        filter = self.db.profile[status].mine and "PLAYER|HARMFUL" or "HARMFUL"
                                        id = spell_ids[self.db.profile[status].debuff]
                                    end

                                    if id then
                                        if frameTable.unit then
                                            --if unit == "player" then
                                            --print(unit)
                                            --end
                                            --print(type(unit))
                                            --frameTable.container[name]:SetUnit("player")
                                            --else
                                            --    frameTable.container[name]:SetUnit("player")
                                            local candidateFilters = {
                                                includeSpellIDs = {
                                                --    53563,  -- Beacon of Light
                                                },
                                                excludeSpellIDs = {
                                                --    53563,  -- Beacon of Light
                                                },
                                            }
                                            candidateFilters.includeSpellIDs = id
                                            local init
                                            if indicator:GetObjectType() == "Button" then
                                                init = createButton(self.db.profile[status], name)
                                            elseif indicator:GetObjectType() == "Frame" then
                                                init = createFrame(self.db.profile[status], name)
                                            else
                                                init = createButton(self.db.profile[status], name)
                                            end
                                            frameTable.container[name]:AddAuraGroup(frameName .. ":" .. name .. ":" .. status, filter, {
                                                  initializeFrame = init,
                                                  sortMethod = AuraContainerSortMethod.ExpirationOnly,
                                                  sortDirection = AuraContainerSortDirection.Reverse,
                                                  layout = {
                                                     elementSpacing = 5,
                                                     lineSpacing = 5,
                                                  },
                                                  maxFrameCount = 1,
                                                  candidateFilters = candidateFilters
                                                }
                                            )
                                            i = i + 1
                                            frameTable.container[name]:UpdateAllAuras()
                                        end
                                    end
                                end
                            else
                                frameTable.container[name]:SetUnit(frameTable.unit)
                                frameTable.container[name]:UpdateAllAuras()
                            end
                        end
                    end
                end
            end
        end
    --end)
end

--frame.indicators[INDICATORNAME]
--frame.container = {}
--frame.container[id] = CreateFrame('AuraContainer', nil, frame, 'CustomAuraContainerTemplate')
--frame.container[id]:SetPoint('TOP', 0, 0)
--local function createButton(button)
--   button:SetSize(36, 36)
--   button:SetCancelAuraButtons('RightButtonUp')
--   local Icon = button:CreateTexture(nil, 'ARTWORK')
--   Icon:SetAllPoints()
--   button:SetIcon(Icon)
--   local Time = button:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
--   Time:SetPoint('TOPLEFT', 1, -1)
--   Time:SetJustifyH('LEFT')
--   button:SetDurationText(Time)
--end
--frame.icon.container:SetUnit('target')
--frame.icon.container:AddAuraGroup(frame.icon.container:GetDebugName(), 'HELPFUL', {
--      initializeFrame = createButton,
--      sortMethod = AuraContainerSortMethod.ExpirationOnly,
--      sortDirection = AuraContainerSortDirection.Reverse,
--      layout = {
--         elementSpacing = 5,
--         lineSpacing = 5,
--      },
--})
--frame.icon.container:UpdateAllAuras()