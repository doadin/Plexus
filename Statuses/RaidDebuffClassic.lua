
local LibStub = _G.LibStub

local L = LibStub("AceLocale-3.0"):GetLocale("PlexusStatusRaidDebuff")

local Plexus = _G.Plexus
if Plexus:IsRetailWow() then
    return
end
local realzone, detectStatus, zonetype
local db, myClass, myDispellable
local debuff_list = {}
local refreshEventScheduled = false

local GetSpecialization = _G.GetSpecialization
local UnitClass = _G.UnitClass
local C_Map = _G.C_Map
local GetInstanceInfo = _G.GetInstanceInfo
local UnitGUID = _G.UnitGUID
local CreateFrame = _G.CreateFrame
local UIParent = _G.UIParent
local ChatEdit_GetActiveWindow = _G.ChatEdit_GetActiveWindow
local GetSpellLink = _G.GetSpellLink
local InCombatLockdown = _G.InCombatLockdown
local ChatFrame1 = _G.ChatFrame1

local GetAuraDataByAuraInstanceID = _G.C_UnitAuras and _G.C_UnitAuras.GetAuraDataByAuraInstanceID
local ForEachAura = _G.AuraUtil and _G.AuraUtil.ForEachAura

local colorMap = {
    ["Curse"] = { r = .6, g =  0, b = 1},
    ["Magic"] = { r = .2, g = .6, b = 1},
    ["Poison"] = {r =  0, g = .6, b =  0},
    ["Disease"] = { r = .6, g = .4, b =  0},
}

if not _G.GetSpecialization then
    function GetSpecialization()
        return false
    end
end

local dispelMap = {
    ["PRIEST"] = {["Magic"] = true, ["Disease"] = ((GetSpecialization() == 1) or (GetSpecialization() == 2))},
    ["PALADIN"] = {["Disease"] = true, ["Poison"] = true, ["Magic"] = (GetSpecialization() == 1)},
    ["MAGE"] = {["Curse"] = true},
    ["DRUID"] = {["Curse"] = true, ["Poison"] = true, ["Magic"] = (GetSpecialization() == 4)},
    ["SHAMAN"] = {["Curse"] = true, ["Magic"] = (GetSpecialization() == 3)},
    ["MONK"] = {["Disease"] = true, ["Poison"] = true, ["Magic"] = (GetSpecialization() == 2)},
}

--if Plexus:IsRetailWow() then
--    dispelMap = {
--        ["PRIEST"] = {["Magic"] = IsPlayerSpell(527), ["Disease"] = (IsPlayerSpell(390632) or IsPlayerSpell(213634))},
--        ["PALADIN"] = {["Disease"] = (IsPlayerSpell(393024) or IsPlayerSpell(213644)), ["Poison"] = (IsPlayerSpell(393024) or IsPlayerSpell(213644)), ["Magic"] = IsPlayerSpell(4987)},
--        ["MAGE"] = {["Curse"] = IsPlayerSpell(475)},
--        ["DRUID"] = {["Curse"] = (IsPlayerSpell(392378) or IsPlayerSpell(2782)), ["Poison"] = (IsPlayerSpell(393024) or IsPlayerSpell(213644)), ["Magic"] = IsPlayerSpell(88423)},
--        ["SHAMAN"] = {["Curse"] = (IsPlayerSpell(383016) or IsPlayerSpell(51886)), ["Magic"] = IsPlayerSpell(77130), ["Poison"] = IsPlayerSpell(383013)},
--        ["MONK"] = {["Disease"] = (IsPlayerSpell(388874) or IsPlayerSpell(218164)), ["Poison"] = (IsPlayerSpell(388874) or IsPlayerSpell(218164)), ["Magic"] = IsPlayerSpell(115450)},
--        ["WARLOCK"] = {["Magic"] = IsSpellKnown(115276, true) or IsSpellKnown(89808, true)},
--        ["EVOKER"] = {["Curse"] = IsPlayerSpell(374251), ["Disease"] = IsPlayerSpell(374251), ["Magic"] = IsPlayerSpell(360823), ["Poison"] = IsPlayerSpell(360823) or IsPlayerSpell(365585) or IsPlayerSpell(374251)},
--    }
--else
--    dispelMap = {
--        ["PRIEST"] = {["Magic"] = true, ["Disease"] = ((GetSpecialization() == 1) or (GetSpecialization() == 2))},
--        ["PALADIN"] = {["Disease"] = true, ["Poison"] = true, ["Magic"] = (GetSpecialization() == 1)},
--        ["MAGE"] = {["Curse"] = true},
--        ["DRUID"] = {["Curse"] = true, ["Poison"] = true, ["Magic"] = (GetSpecialization() == 4)},
--        ["SHAMAN"] = {["Curse"] = true, ["Magic"] = (GetSpecialization() == 3)},
--        ["MONK"] = {["Disease"] = true, ["Poison"] = true, ["Magic"] = (GetSpecialization() == 2)},
--    }
--end

-- Spells to ignore detecting
-- Bug is causing Exhaustion to show up for some people in Blackrock Foundry (Ticket #6)
local ignore_ids = {
    [1604] = true, -- Dazed
    [6788] = true, -- Weakened Soul
    [57723] = true, -- Exhaustion
    [95809] = true, -- Insanity (hunter pet Ancient Hysteria debuff)
    [224127] = true, -- Crackling Surge Shammy Debuff
    [190185] = true, -- Feral Spirit Shammy Debuff
    [224126] = true, -- Icy Edge Shammy Debuff
    [197509] = true, -- Bloodworm DK Debuff
    [5215] = true, -- Prowl Druid Debuff
    [115191] = true, -- Stealth Rogue Debuff
}

---------------------------------------------------------
--	Core
---------------------------------------------------------

local PlexusStatusRaidDebuff = Plexus:NewStatusModule("PlexusStatusRaidDebuff")
PlexusStatusRaidDebuff.menuName = L["Raid Debuff"]

local PlexusFrame = Plexus:GetModule("PlexusFrame")
local PlexusRoster = Plexus:GetModule("PlexusRoster")

local GetSpellInfo = C_Spell and C_Spell.GetSpellInfo or _G.GetSpellInfo
local fmt = string.format

PlexusStatusRaidDebuff.defaultDB = {

    ["raid_debuff"] = {
        text = L["Raid Debuff"],
        desc = L["Raid Debuff"],
        enable = true,
        color = { r = .0, g = .0, b = .0, a=1.0 },
        priority = 98,
        range = false,
    },

    ignDis = false,
    ignUndis = false,
    detect = false,

    ["debuff_options"] = {},
    ["detected_debuff"] = {},
}

function PlexusStatusRaidDebuff:OnInitialize()
    self.super.OnInitialize(self)
    self:RegisterStatuses()
    db = self.db.profile.debuff_options
end

function PlexusStatusRaidDebuff:OnEnable()
    myClass = select(2, UnitClass("player"))
    myDispellable = dispelMap[myClass]

    -- For classes that don't have a dispelMap
    -- Create an empty array
    if (myDispellable == nil) then
        myDispellable = {}
    end

    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("ZONE_CHANGED_NEW_AREA", "ZoneCheck")
    if not Plexus:IsWrathWow() then
        self:RegisterEvent("UNIT_AURA", "ScanUnit")
    else
        self:RegisterEvent("UNIT_AURA", "ScanUnitClassic")
    end
    self:RegisterCustomDebuff()
end

function PlexusStatusRaidDebuff:Reset()
    self.super.Reset(self)
    self:UnregisterStatuses()
    self:RegisterStatuses()
end

function PlexusStatusRaidDebuff:PLAYER_ENTERING_WORLD()
    self:ZoneCheck()
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
end

function PlexusStatusRaidDebuff:CheckDetectZone()
    detectStatus = self.db.profile.detect and not (zonetype == "none" or zonetype == "pvp") --check db Enable
    self:Debug("CheckDetectZone", realzone, detectStatus and "Detector On")

    if detectStatus then
        self:CreateZoneMenu(realzone)
        if not debuff_list[realzone] then debuff_list[realzone] = {} end
        if Plexus:IsWrathWow() then
            self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", "ScanNewDebuff")
        end
    else
        if Plexus:IsWrathWow() then
            self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
        end
    end
end

function PlexusStatusRaidDebuff:ZoneCheck()
    -- localzone and realzone should be the same, but sometimes they are not
    -- For example, in German Throne of Thunders
    -- localzone = "Der Thron des Donners"
    -- instzone = "Thron des Donners"
    local instzone

    -- The mapid returned by UnitPosition is not the same used by GetMapNameByID
    -- local mapid = select(4, UnitPosition("player"))

    -- Force map to right zone
    --SetMapToCurrentZone()
    local mapid = C_Map.GetBestMapForUnit("player")
    if not mapid then
        return
    end
    local localzone = C_Map.GetMapInfo(mapid).name

    -- zonetype is a module variable
    instzone, zonetype = GetInstanceInfo()

    -- Preference is for localzone, but fall back to instzone if it is all that exists
    if debuff_list[instzone] and not debuff_list[localzone] then
        realzone = instzone
    else
        realzone = localzone
    end

    -- If loading the game in Proving Grounds this seems to be the case
    if not realzone then
        return
    end

    self:UpdateAllUnits()
    self:CheckDetectZone()

    if debuff_list[realzone] then
        if not refreshEventScheduled then
            self:RegisterMessage("Plexus_UnitJoined")
            refreshEventScheduled = true
        end
    else
        if refreshEventScheduled then
            self:UnregisterMessage("Plexus_UnitJoined")
            refreshEventScheduled = false
        end
    end
end

function PlexusStatusRaidDebuff:RegisterStatuses()
    self:RegisterStatus("raid_debuff", L["Raid Debuff"])
    self:CreateMainMenu()
end

function PlexusStatusRaidDebuff:UnregisterStatuses()
    self:UnregisterStatus("raid_debuff")
end

function PlexusStatusRaidDebuff:Plexus_UnitJoined(_, _, unitid) -- _, guid, unitid
    if not Plexus:IsWrathWow() then
        self:ScanUnit("UpdateAllUnits", unitid, {isFullUpdate = true})
    else
        self:ScanUnitClassic("UpdateAllUnits", unitid)
    end
end

function PlexusStatusRaidDebuff:PLAYER_TALENT_UPDATE() --luacheck: ignore 212
    --if Plexus:IsRetailWow() then
    --    if myClass == "PALADIN" then
    --        myDispellable["Disease"] = IsPlayerSpell(393024) or IsPlayerSpell(213644)
    --        myDispellable["Magic"] = IsPlayerSpell(4987)
    --        myDispellable["Poison"] = IsPlayerSpell(393024) or IsPlayerSpell(213644)
    --    elseif myClass == "DRUID" then
    --        myDispellable["Curse"] = IsPlayerSpell(392378) or IsPlayerSpell(2782)
    --        myDispellable["Magic"] = IsPlayerSpell(88423)
    --        myDispellable["Poison"] = IsPlayerSpell(392378) or IsPlayerSpell(2782)
    --    elseif myClass == "SHAMAN" then
    --        myDispellable["Curse"] = IsPlayerSpell(383016) or IsPlayerSpell(51886)
    --        myDispellable["Magic"] = IsPlayerSpell(77130)
    --        myDispellable["Poison"] = IsPlayerSpell(383013)
    --    elseif myClass == "PRIEST" then
    --        myDispellable["Disease"] = IsPlayerSpell(390632) or IsPlayerSpell(213634)
    --        myDispellable["Magic"] = IsPlayerSpell(527)
    --    elseif myClass == "MONK" then
    --        myDispellable["Disease"] = IsPlayerSpell(388874) or IsPlayerSpell(218164)
    --        myDispellable["Magic"] = IsPlayerSpell(115450)
    --        myDispellable["Poison"] = IsPlayerSpell(388874) or IsPlayerSpell(218164)
    --    elseif myClass == "WARLOCK" then
    --        myDispellable["Magic"] = IsSpellKnown(115276, true) or IsSpellKnown(89808, true)
    --    elseif myClass == "MAGE" then
    --        myDispellable["Curse"] = IsPlayerSpell(475)
    --    elseif myClass == "EVOKER" then
    --        myDispellable["Curse"] = IsPlayerSpell(374251)
    --        myDispellable["Disease"] = IsPlayerSpell(374251)
    --        myDispellable["Magic"] = IsPlayerSpell(360823)
    --        myDispellable["Poison"] = IsPlayerSpell(360823) or IsPlayerSpell(365585) or IsPlayerSpell(374251)
    --    end
    --else
    if myClass == "PALADIN" then
        myDispellable["Magic"] = (GetSpecialization() == 1)
    elseif myClass == "DRUID" then
        myDispellable["Magic"] = (GetSpecialization() == 4)
    elseif myClass == "SHAMAN" then
        myDispellable["Magic"] = (GetSpecialization() == 3)
    elseif myClass == "PRIEST" then
        myDispellable["Disease"] = ((GetSpecialization() == 1) or (GetSpecialization() == 2))
    elseif myClass == "MONK" then
        myDispellable["Magic"] = (GetSpecialization() == 2)
    end
    --end
end

function PlexusStatusRaidDebuff:UpdateAllUnits()
    for _, unitid in PlexusRoster:IterateRoster() do
        if not Plexus:IsWrathWow() then
            self:ScanUnit("UpdateAllUnits", unitid, {isFullUpdate = true})
        else
            self:ScanUnitClassic("UpdateAllUnits", unitid)
        end
    end
end

function PlexusStatusRaidDebuff:ScanNewDebuff(_, _)
    local _, event, _, sourceGUID, sourceName, _, _, destGUID, destName, _, _, spellId, name, _, auraType = CombatLogGetCurrentEventInfo()
    local settings = self.db.profile["raid_debuff"]
    if (settings.enable and debuff_list[realzone]) then
        if event == "SPELL_AURA_APPLIED" and sourceGUID and auraType == "DEBUFF" and not PlexusRoster:IsGUIDInGroup(sourceGUID) and PlexusRoster:IsGUIDInGroup(destGUID)
            and not debuff_list[realzone][name] then
            if ignore_ids[spellId] then return end --Ignore Dazed

            -- Filter out non-debuff effects, only debuff effects are shown
            -- No reason to detect buffs too
            local unitid, debuff
            unitid = PlexusRoster:GetUnitidByGUID(destGUID)
            debuff = false
            for i=1,40 do
                local spellname = UnitDebuff(unitid, i)
                if not spellname then break end
                if spellname == name then
                    debuff = true
                else
                    self:Debug("Debuff not found", name)
                end
                --if (UnitDebuff(unitid, i)) then
                --	debuff = true
                -- else
                -- 	self:Debug("Debuff not found", name)
                --end
            end
            if not debuff then return end

            self:Debug("New Debuff", sourceName, destName, name, unitid, tostring(debuff))

            self:DebuffLocale(realzone, name, spellId, 5, 5, true, true)
            if not self.db.profile.detected_debuff[realzone] then self.db.profile.detected_debuff[realzone] = {} end
            if not self.db.profile.detected_debuff[realzone][name] then self.db.profile.detected_debuff[realzone][name] = spellId end

            self:LoadZoneDebuff(realzone, name)

        end
    end
end

local unitAuras
function PlexusStatusRaidDebuff:ScanUnit(_, unit, updatedAuras) --event, unit, updatedAuras
    local settings = self.db.profile["raid_debuff"]
    local guid = UnitGUID(unit)
    if not PlexusRoster:IsGUIDInGroup(guid) then return end

    if (settings.enable and debuff_list[realzone]) then
        if not unit then
            return
        end

        if not guid then
            return
        end
        if not unitAuras then
            unitAuras = {}
        end

        -- Full Update
        if (updatedAuras and updatedAuras.isFullUpdate) then --or (not updatedAuras.isFullUpdate and (not updatedAuras.addedAuras and not updatedAuras.updatedAuraInstanceIDs and not updatedAuras.removedAuraInstanceIDs)) then
            local unitauraInfo = {}
            if (AuraUtil.ForEachAura) then
                --ForEachAura(unit, "HELPFUL", nil,
                --    function(aura)
                --        if aura and aura.auraInstanceID then
                --            unitauraInfo[aura.auraInstanceID] = aura
                --        end
                --    end,
                --true)
                ForEachAura(unit, "HARMFUL", nil,
                    function(aura)
                        if aura and aura.auraInstanceID then
                            unitauraInfo[aura.auraInstanceID] = aura
                        end
                    end,
                true)
            else
                --for i = 0, 40 do
                --    local auraData = C_UnitAuras.GetAuraDataByIndex(unit, i, "HELPFUL")
                --    if auraData then
                --        unitauraInfo[auraData.auraInstanceID] = auraData
                --    end
                --end
                for i = 0, 40 do
                    local auraData = C_UnitAuras.GetAuraDataByIndex(unit, i, "HARMFUL")
                    if auraData then
                        unitauraInfo[auraData.auraInstanceID] = auraData
                    end
                end
            end
            if unitAuras[guid] then
                self.core:SendStatusLost(guid, "raid_debuff")
                unitAuras[guid] = nil
            end
            for _, v in pairs(unitauraInfo) do
                if not unitAuras[guid] then
                    unitAuras[guid] = {}
                end
                if v.spellId == 367364 then
                    v.name = "Echo: Reversion"
                end
                if v.spellId == 376788 then
                    v.name = "Echo: Dream Breath"
                end
                --if buff_names[v.name] or player_buff_names[v.name] or debuff_names[v.name] or player_debuff_names[v.name] or debuff_types[v.dispelName] then
                    unitAuras[guid][v.auraInstanceID] = v
                --end
            end
        end

        if updatedAuras and updatedAuras.addedAuras then
            for _, aura in pairs(updatedAuras.addedAuras) do
                if aura.spellId == 367364 then
                    aura.name = "Echo: Reversion"
                end
                if aura.spellId == 376788 then
                    aura.name = "Echo: Dream Breath"
                end
                if aura.isHarmful then
                --if buff_names[aura.name] or player_buff_names[aura.name] or debuff_names[aura.name] or player_debuff_names[aura.name] or debuff_types[aura.dispelName] then
                    if not unitAuras[guid] then
                        unitAuras[guid] = {}
                    end
                    unitAuras[guid][aura.auraInstanceID] = aura
                --end
                end
           end
        end

        if updatedAuras and updatedAuras.updatedAuraInstanceIDs then
            for _, auraInstanceID in ipairs(updatedAuras.updatedAuraInstanceIDs) do
                local auraTable = GetAuraDataByAuraInstanceID(unit, auraInstanceID)
                if auraTable and auraTable.spellId == 367364 then
                    auraTable.name = "Echo: Reversion"
                end
                if auraTable and auraTable.spellId == 376788 then
                    auraTable.name = "Echo: Dream Breath"
                end
                if not unitAuras[guid] then
                    unitAuras[guid] = {}
                end
                if auraTable and auraTable.isHarmful then
                    unitAuras[guid][auraInstanceID] = auraTable
                end
                --if auraTable then
                --    --if buff_names[auraTable.name] or player_buff_names[auraTable.name] or debuff_names[auraTable.name] or player_debuff_names[auraTable.name] or debuff_types[auraTable.dispelName] then
                --        if not unitAuras[guid] then
                --            unitAuras[guid] = {}
                --        end
                --        unitAuras[guid][auraInstanceID] = auraTable
                --    --end
                --end
            end
        end

        if updatedAuras and updatedAuras.removedAuraInstanceIDs then
            for _, auraInstanceIDTable in ipairs(updatedAuras.removedAuraInstanceIDs) do
                if unitAuras[guid] and unitAuras[guid][auraInstanceIDTable] then
                    unitAuras[guid][auraInstanceIDTable] = nil
                    self.core:SendStatusLost(guid, "raid_debuff")
                end
            end
        end

        --for unitID,auraInstanceIDTable in pairs(unitAuras) do
        local d_name, di_prior, dc_prior, d_icon, d_color, d_startTime, d_durTime, d_count, data
        di_prior = 0
        dc_prior = 0
        if unitAuras[guid] then
            local numAuras = 0
            --id, info
            for id, info in pairs(unitAuras[guid]) do
                local auraTable = GetAuraDataByAuraInstanceID(unit, id)
                if not auraTable then
                    unitAuras[guid][id] = nil
                end
                if auraTable  then
                    numAuras = numAuras + 1
                    if debuff_list[realzone][info.name] then
                        data = debuff_list[realzone][info.name]
                        if not data.disable and
                           --not info.isFromPlayerOrPlayerPet and
                           not (self.db.profile.ignDis and myDispellable[info.dispelName]) and
                           not (self.db.profile.ignUndis and not myDispellable[info.dispelName]) then
                            if di_prior < data.i_prior then
                                di_prior = data.i_prior
                                d_name = info.name
                                d_icon = not data.noicon and info.icon
                                -- if data.timer and dt_prior < data.i_prior then
                                if data.timer then
                                    d_startTime = info.expirationTime - info.duration
                                    d_durTime = info.duration
                                end
                            end
                            --Stack
                            if info and info.applications > 0 then
                                d_count = info.applications --count
                            end
                            --Color Priority
                            if dc_prior < data.c_prior then
                                dc_prior = data.c_prior
                                d_color = (data.custom_color and data.color) or colorMap[info.dispelName] or settings.color
                            end
                        end
                    end
                end

                -- Detect New Debuffs
                if auraTable and detectStatus then
                    local name = info and info.name
                    local spellid = info and info.spellId
                    local sourceName = info and info.sourceUnit and UnitName(info.sourceUnit)
                    local destName = info and unit and UnitName(unit)
                    local sourceGUID = info and info.sourceUnit and UnitGUID(info.sourceUnit)
                    if name and spellid and sourceName and destName and sourceGUID then
                        if info.isHarmful and not PlexusRoster:IsGUIDInGroup(sourceGUID) and PlexusRoster:IsGUIDInGroup(guid)
                            and not debuff_list[realzone][name] then
                            if not ignore_ids[spellid] then
                                self:Debug("New Debuff", sourceName, destName, name, unit, tostring(info.isHarmful))
                                self:DebuffLocale(realzone, name, spellid, 5, 5, true, true)
                                if not self.db.profile.detected_debuff[realzone] then self.db.profile.detected_debuff[realzone] = {} end
                                if not self.db.profile.detected_debuff[realzone][name] then self.db.profile.detected_debuff[realzone][name] = spellid end
                                self:LoadZoneDebuff(realzone, name)
                            end
                        end
                    end
                end
            end

            if numAuras == 0 then
                unitAuras[guid] = nil
                self.core:SendStatusLost(guid, "raid_debuff")
            end
        else
            self.core:SendStatusLost(guid, "raid_debuff")
        end

        if d_color and not d_color.a then
            d_color.a = settings.color.a
        end

        if d_color and d_color.a == 0 then
            d_color.a = 1
        end

        if d_name then
            self.core:SendStatusGained(
            guid, "raid_debuff", settings.priority, (settings.range and 40),
            d_color, nil, nil, nil, d_icon, d_startTime, d_durTime, d_count)
        end
    else
        self.core:SendStatusLost(guid, "raid_debuff")
    end
end

function PlexusStatusRaidDebuff:ScanUnitClassic(_,unitid) -- event, unitid
    local guid = UnitGUID(unitid)
    --if not GridRoster:IsGUIDInGroup(guid) then	return end

    local name, icon, count, debuffType, duration, expirationTime, _, spellId
    local settings = self.db.profile["raid_debuff"]

    if (settings.enable and debuff_list[realzone]) then
        local d_name, di_prior, dc_prior, d_icon,d_color,d_startTime,d_durTime,d_count
        -- local dt_prior
        local data

        di_prior = 0
        dc_prior = 0
        -- dt_prior = 0

        local index = 0
        while true do
            index = index + 1

            -- name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable, shouldConsolidate, spellId, canApplyAura, isBuffDebuff, isCastByPlayer = UnitAura(unitid, index, "HARMFUL")
            name, icon, count, debuffType, duration, expirationTime, _, _, _, spellId = UnitAura(unitid, index, "HARMFUL")

            -- Check for end of loop
            if not name then
                break
            end

            if debuff_list[realzone][name] then
                data = debuff_list[realzone][name]

                -- The debuff from players should not be displayed
                -- Example: Ticket #6: Exhaustion from Blackrock Foundry
                -- Other method instead of ignore_ids is:
                -- not isCastByPlayer
                if not data.disable and
                   not ignore_ids[spellId] and
                   not (self.db.profile.ignDis and myDispellable[debuffType]) and
                   not (self.db.profile.ignUndis and debuffType and not myDispellable[debuffType]) then

                    if di_prior < data.i_prior then
                        di_prior = data.i_prior
                        d_name = name
                        d_icon = 	not data.noicon and icon
                        -- if data.timer and dt_prior < data.i_prior then
                        if data.timer then
                            d_startTime = expirationTime - duration
                            d_durTime = duration
                        end
                    end
                    --Stack
                    if data.stackable then
                        d_count = count
                    end
                    --Color Priority
                    if dc_prior < data.c_prior then
                        dc_prior = data.c_prior
                        d_color = (data.custom_color and data.color) or colorMap[debuffType] or settings.color
                    end
                end
            end
        end

        if d_color and not d_color.a then
            d_color.a = settings.color.a
        end

        if d_color and d_color.a == 0 then
            d_color.a = 1
        end

        if d_name then
            self.core:SendStatusGained(
            guid, "raid_debuff", settings.priority, (settings.range and 40),
            d_color, nil, nil, nil, d_icon, d_startTime, d_durTime, d_count)
        else
            self.core:SendStatusLost(guid, "raid_debuff")
        end
    else
        self.core:SendStatusLost(guid, "raid_debuff")
    end
end

---------------------------------------------------------
--	For External
---------------------------------------------------------
local function getDb(zone, name, arg, ret)
    if db[zone] and db[zone][name] and db[zone][name][arg] ~= nil then
        return db[zone][name][arg]
    end
    return ret
end

local function insertDb(zone, name, arg, value)
    if not db[zone] then db[zone] = {} end
    if not db[zone][name] then db[zone][name] = {} end

    if arg then
        db[zone][name][arg] = value
    end
end

function PlexusStatusRaidDebuff:DebuffLocale(zone, first, second, icon_priority, color_priority, timer, stackable, color, default_disable, noicon)
    local name, _, icon, id
    local data, order
    local detected

    self:CreateZoneMenu(zone)

    if type(first) == "number" then
        if _G.C_Spell and _G.C_Spell.GetSpellInfo  then
            local spellInfo = GetSpellInfo(first)
            name = spellInfo and spellInfo.name
            icon = spellInfo and spellInfo.iconID
        else
            name, _, icon = GetSpellInfo(first)
        end
        id = first
        order = second
    else
        if _G.C_Spell and _G.C_Spell.GetSpellInfo  then
            local spellInfo = GetSpellInfo(second)
            name = spellInfo and spellInfo.name
            icon = spellInfo and spellInfo.iconID
        else
            name, _, icon = GetSpellInfo(second)
        end
        id = second
        order = 9999
        detected = true
    end

    if name and not debuff_list[zone][name] then
        debuff_list[zone][name] = {}
        data = debuff_list[zone][name]

        data.debuffId = id
        data.icon = icon
        data.order = order
        data.disable = getDb(zone,name,"disable",default_disable)
        data.i_prior = getDb(zone,name,"i_prior",icon_priority)
        data.c_prior = getDb(zone,name,"c_prior",color_priority)
        data.custom_color = getDb(zone,name,"custom_color",color ~= nil)
        data.color = getDb(zone,name,"color",color)
        data.stackable = getDb(zone,name,"stackable",stackable)
        data.timer = getDb(zone,name,"timer",timer)
        data.noicon = getDb(zone,name,"noicon",noicon)
        data.detected = detected
    end
end

function PlexusStatusRaidDebuff:BossNameLocale(zone, order, en_boss)
    local boss = en_boss or order

    -- If both en_boss and order are defined, otherwise
    -- default to 9998 for order
    local ord = en_boss and order or 9998

    self:CreateZoneMenu(zone)

    local args = self.options.args

    args[zone].args[boss] = {
            type = "group",
            name = fmt("%s%s%s","   [ ", boss," ]"),
                        desc = L["Option for %s"]:format(boss),
            order = ord,
            guiHidden = true,
            args = {}
    }
end

function PlexusStatusRaidDebuff:LoadZoneMenu(zone)
    local args = self.options.args[zone].args
    --local settings = self.db.profile["raid_debuff"]

    for _,k in pairs(args) do
        if k.guiHidden then
            k.guiHidden = false
        end
    end

    for name,_ in pairs(debuff_list[zone]) do
        self:LoadZoneDebuff(zone, name)
    end
end

local tip = CreateFrame("GameTooltip", "PlexusStatusRaidDebuffTooltip", nil, "GameTooltipTemplate")
tip:SetOwner(UIParent, "ANCHOR_NONE")
for i = 1, 10 do
    tip[i] = _G["PlexusStatusRaidDebuffTooltipTextLeft"..i]
    if not tip[i] then
        tip[i] = tip:CreateFontString()
        tip:AddFontStrings(tip[i], tip:CreateFontString())
    end
end

function PlexusStatusRaidDebuff:LoadZoneDebuff(zone, name)
    local description, menuName, k
    local args = self.options.args[zone].args

    k = debuff_list[zone][name]


    local order = k.order

    -- Make it sorted by name. Values become 9999.0 -- 9999.99999999
    if order==9999 then
        local a,b,c = string.byte(name, 1, 3)
        order=9999 + ((a or 0)*65536 + (b or 0)*256 + (c or 0)) / 16777216
    end

    if not args[name] and k then
        description = L["Enable %s"]:format(name)

        tip:SetHyperlink("spell:"..k.debuffId)
        if tip:NumLines() > 1 then
            description = tip[tip:NumLines()]:GetText()
        end

        menuName = fmt("|T%s:0|t%s", k.icon, name)

        args[name] = {
            type = "group",
            name = menuName,
            desc = description,
            order = order,
            args = {
                ["enable"] = {
                    type = "toggle",
                    name = L["Enable"],
                    desc = L["Enable %s"]:format(name),
                    order = 1,
                    get = function()
                                return not k.disable
                            end,
                    set = function(_, v)
                                insertDb(zone,name,"disable",not v)
                                k.disable = not v
                                self:UpdateAllUnits()
                            end,
                },
                ["icon priority"] = {
                    type = "range",
                    name = L["Icon Priority"],
                    desc = L["Option for %s"]:format(L["Icon Priority"]),
                    order = 2,
                    min = 1,
                    max = 10,
                    step = 1,
                    get = function()
                                return k.i_prior
                            end,
                    set = function(_, v)
                                insertDb(zone,name,"i_prior",v)
                                k.i_prior = v
                                self:UpdateAllUnits()
                            end,
                },
                ["color priority"] = {
                    type = "range",
                    name = L["Color Priority"],
                    desc = L["Option for %s"]:format(L["Color Priority"]),
                    order = 3,
                    min = 1,
                    max = 10,
                    step = 1,
                    get = function()
                                return k.c_prior
                            end,
                    set = function(_, v)
                                insertDb(zone,name,"c_prior",v)
                                k.c_prior = v
                                self:UpdateAllUnits()
                            end,
                },
                ["Remained time"] = {
                    type = "toggle",
                    name = L["Remained time"],
                    desc = L["Enable %s"]:format(L["Remained time"]),
                    order = 4,
                    get = function()
                                return k.timer
                            end,
                    set = function(_, v)
                                insertDb(zone,name,"timer",v)
                                k.timer = v
                                self:UpdateAllUnits()
                            end,
                },
                ["Stackable debuff"] = {
                    type = "toggle",
                    name = L["Stackable debuff"],
                    desc = L["Enable %s"]:format(L["Stackable debuff"]),
                    order = 5,
                    get = function()
                                return k.stackable
                            end,
                    set = function(_, v)
                                insertDb(zone,name,"stackable",v)
                                k.stackable = v
                                self:UpdateAllUnits()
                            end,
                },
                ["only color"] = {
                    type = "toggle",
                    name = L["Only color"],
                    desc = L["Only color"],
                    order = 7,
                    get = function()
                                return k.noicon
                            end,
                    set = function(_, v)
                                insertDb(zone,name,"noicon",v)
                                k.noicon = v
                                self:UpdateAllUnits()
                            end,
                },
                ["custom color"] = {
                    type = "toggle",
                    name = L["Custom Color"],
                    desc = L["Enable %s"]:format(L["Custom Color"]),
                    order = 7,
                    get = function()
                                return k.custom_color
                            end,
                    set = function(_, v)
                                insertDb(zone,name,"custom_color",v)
                                k.custom_color = v
                                if v then
                                    insertDb(zone,name,"color", {r = 0, g = 0, b = 0})
                                    k.color = {r = 0, g = 0, b = 0}
                                end
                                self:UpdateAllUnits()
                            end,
                },
                ["color"] = {
                    type = "color",
                    name = L["Color"],
                    desc = L["Option for %s"]:format(L["Color"]),
                    order = 8,
                    disabled = function()
                                    return not k.custom_color
                                end,
                    hasAlpha = false,
                    get = function ()
                                local t = getDb(zone,name,"color", _G.color or {r = 1, g = 0, b = 0})
                                return t.r, t.g, t.b
                            end,
                    set = function (_, ir, ig, ib)
                                local t = {r = ir, g = ig, b = ib}
                                insertDb(zone,name,"color",t)
                                k.color = t
                                self:UpdateAllUnits()
                            end,
                },
                ["remove"] = {
                    type = "execute",
                    name = L["Remove"],
                    desc = L["Remove"],
                    order = 9,
                    disabled = not k.detected,
                    func = function()
                                self.db.profile.detected_debuff[zone][name] = nil
                                debuff_list[zone][name] = nil
                                args[name] = nil
                                self:UpdateAllUnits()
                            end,
                },
                ["link"] = {
                  type = "execute",
                    name = "Link",
                    desc = "Link",
                    order = 10,
                    func = function()
                                local chatWindow = ChatEdit_GetActiveWindow()
                                if chatWindow then
                                    chatWindow:Insert(GetSpellLink(k.debuffId))
                                end
                            end,
                },
            },
        }
    end
end


function PlexusStatusRaidDebuff:CreateZoneMenu(zone)
    local args
    if not debuff_list[zone] then
        debuff_list[zone] = {}

        args = self.options.args

        args[zone] = {
            type = "group",
            name = zone,
            desc = L["Option for %s"]:format(zone),
            args = {
                ["load zone"] = {
                    type = "execute",
                    name = L["Load"],
                    desc = L["Load"],
                    func = function()
                        self:LoadZoneMenu(zone)
                        if not args[zone].args["load zone"].disabled then args[zone].args["load zone"].disabled = true end
                    end,
                },
                ["remove all"] = {
                    type = "execute",
                    name = L["Remove detected debuff"],
                    desc = L["Remove detected debuff"],
                    func = function()
                                    if self.db.profile.detected_debuff[zone] then
                                        for name,_ in pairs(self.db.profile.detected_debuff[zone]) do
                                            self.db.profile.detected_debuff[zone][name] = nil
                                            debuff_list[zone][name] = nil
                                            args[zone].args[name] = nil
                                            self:UpdateAllUnits()
                                        end
                                    end
                    end,
                },
                ["import debuff"] = {
                    type = "input",
                    name = L["Import Debuff"],
                    desc = L["Import Debuff Desc"],
                    get = false,
                    usage = "SpellID",
                    set = function(_, v)
                        local name
                        if _G.C_Spell and _G.C_Spell.GetSpellInfo  then
                            local spellInfo = GetSpellInfo(v)
                            name = spellInfo and spellInfo.name
                        else
                            name = GetSpellInfo(v)
                        end
                        -- self:Debug("Import", zone, name, v)
                        if name then
                                self:DebuffLocale(zone, name, v, 5, 5, true, true)
                            if not self.db.profile.detected_debuff[zone] then
                                self.db.profile.detected_debuff[zone] = {}
                            end
                            if not self.db.profile.detected_debuff[zone][name] then
                                self.db.profile.detected_debuff[zone][name] = v
                                self:LoadZoneDebuff(zone, name)
                                self:UpdateAllUnits()
                            end
                        end
                    end,
                },
            },
        }
    end
end

function PlexusStatusRaidDebuff:CreateMainMenu()
    local args = self.options.args

    for i,k in pairs(args["raid_debuff"].args) do
        args[i] = k
    end

    args["raid_debuff"].hidden = true

    args["Border"] = {
            type = "toggle",
            name = L["Border"],
            desc = L["Enable %s"]:format(L["Border"]),
            order = 98,
            disabled = InCombatLockdown,
            get = function() return PlexusFrame.db.profile.statusmap["border"].raid_debuff end,
            set = function(_, v)
                            PlexusFrame.db.profile.statusmap["border"].raid_debuff  =  v
                            PlexusFrame:UpdateAllFrames()
                        end,
    }
    args["Icon"] = {
            type = "toggle",
            name = L["Center Icon"],
            desc = L["Enable %s"]:format(L["Center Icon"]),
            order = 99,
            disabled = InCombatLockdown,
            get = function() return PlexusFrame.db.profile.statusmap["icon"].raid_debuff end,
            set = function(_, v)
                            PlexusFrame.db.profile.statusmap["icon"].raid_debuff  =  v
                            PlexusFrame:UpdateAllFrames()
                        end,
    }
    args["Ignore dispellable"] = {
        type = "toggle",
        name = L["Ignore dispellable debuff"],
        desc = L["Ignore dispellable debuff"],
        order = 100,
        get = function() return self.db.profile.ignDis end,
        set = function(_, v)
                        self.db.profile.ignDis = v
                        self:UpdateAllUnits()
                    end,

    }
    args["Ignore undispellable"] = {
        type = "toggle",
        name = L["Ignore undispellable debuff"],
        desc = L["Ignore undispellable debuff"],
        order = 101,
        get = function() return self.db.profile.ignUndis end,
        set = function(_, v)
                        self.db.profile.ignUndis = v
                        self:UpdateAllUnits()
                    end,
    }
    args["Detect"] = {
        type = "toggle",
        name = L["detector"],
        desc = L["Enable %s"]:format(L["detector"]),
        order = 103,
        get = function() return self.db.profile.detect end,
        set = function()
                        self.db.profile.detect = not self.db.profile.detect
                local detectEnable = self.db.profile.detect
                        if detectEnable then
                            ChatFrame1:AddMessage(L.msgAct)
                        else
                            ChatFrame1:AddMessage(L.msgDeact)
                        end
                        self:ZoneCheck()
                    end,
    }
    args["Clear Detect"] = {
        type = "execute",
        name = L["Remove all auto detected debuffs"],
        desc = L["Remove all auto detected debuffs"],
        order = 104,
        func = function()
            self.db.profile.detected_debuff = nil
        end,
    }
end

function PlexusStatusRaidDebuff:RegisterCustomDebuff()
    for zone,j in pairs(self.db.profile.detected_debuff) do
        self:BossNameLocale(zone, L["Detected debuff"])

        for name,k in pairs(j) do
            self:DebuffLocale(zone, name, k, 5, 5, true, true)
        end
    end
end

