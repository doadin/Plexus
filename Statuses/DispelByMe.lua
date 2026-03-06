local _, Plexus = ...

local function IsRetailWow()
    return WOW_PROJECT_ID == WOW_PROJECT_MAINLINE
end

local UnitAura, UnitGUID, pairs = _G.UnitAura, _G.UnitGUID, _G.pairs

local L = setmetatable(PlexusDeDeBuffIconsLocale or {}, {__index = function(t, k) t[k] = k return k end})

local PlexusRoster = _G.Plexus:GetModule("PlexusRoster")

local PlexusStatusAuras = _G.Plexus:NewStatusModule("PlexusStatusDispelByMe", "AceTimer-3.0")
PlexusStatusAuras.menuName = L["Dispelable By Me"]

PlexusStatusAuras.defaultDB = {
    dispelable_by_me = {
        enable = true,
        priority = 70,
        range = false,
        color = { r = 0, g = 0, b = 1.0, a = 1.0 },
    },
}

function PlexusStatusAuras:PostInitialize()
    self:RegisterStatus("dispelable_by_me", L["Dispelable By Me"], nil, true)
end

function PlexusStatusAuras:OnEnable()
    self:RegisterEvent("UNIT_AURA")
    self:RegisterEvent("UNIT_FLAGS")
    self:RegisterEvent("LOADING_SCREEN_DISABLED")
    self:UpdateAllUnitsBuffs()
end

function PlexusStatusAuras:OnDisable()
    self:UnregisterEvent("UNIT_AURA")
    self:UnregisterEvent("UNIT_FLAGS")
    self:UnregisterEvent("LOADING_SCREEN_DISABLED")
end

function PlexusStatusAuras:UNIT_FLAGS(_,unit)
    local hostile = UnitCanAttack("player", unit) or UnitIsCharmed(unitid)
    if hostile then
        self:UNIT_AURA("UpdateAllUnitsBuffs", unit, {isFullUpdate = true} )
    end
end

function PlexusStatusAuras:LOADING_SCREEN_DISABLED()
    PlexusStatusAuras:UpdateAllUnitsBuffs()
end

local UnitAuraInstanceID
function PlexusStatusAuras:UNIT_AURA(_, unitid, updatedAuras)
    local settings = PlexusStatusAuras.db.profile.dispelable_by_me
    if not unitid then return end
    local guid = not Plexus.IsSpecialUnit[unitid] and UnitGUID(unitid) or unitid
    if not guid then return end

    if not UnitAuraInstanceID then
        UnitAuraInstanceID = {}
    end
    if issecretvalue(guid) then
        return
    end
    if type(UnitAuraInstanceID[guid]) ~= "table" then
        UnitAuraInstanceID[guid] = {}
    end

    if not Plexus.IsSpecialUnit[unitid] and not PlexusRoster:IsGUIDInRaid(guid) then return end
    local DEBUFF_DISPLAY_COLOR_INFO = {
        [0] = DEBUFF_TYPE_NONE_COLOR,
        [1] = DEBUFF_TYPE_MAGIC_COLOR,
        [2] = DEBUFF_TYPE_CURSE_COLOR,
        [3] = DEBUFF_TYPE_DISEASE_COLOR,
        [4] = DEBUFF_TYPE_POISON_COLOR,
        [9] = DEBUFF_TYPE_BLEED_COLOR, -- enrage
        [11] = DEBUFF_TYPE_BLEED_COLOR,
    }
    local curve = C_CurveUtil.CreateColorCurve()
    if curve then
        curve:SetType(Enum.LuaCurveType.Step)
        for i, c in pairs(DEBUFF_DISPLAY_COLOR_INFO) do
            curve:AddPoint(i, c)
        end
    end
    local filter = "HARMFUL|RAID_PLAYER_DISPELLABLE"
    local auradata = C_UnitAuras.GetUnitAuras(unitid, filter)
    UnitAuraInstanceID[guid] = {}
    for _,aura in pairs(auradata) do
        UnitAuraInstanceID[guid][aura.auraInstanceID] = aura
    end
    local ok, filtered = true, true
    local dispelTypeColor
    PlexusStatusAuras.core:SendStatusLost(guid, "dispelable_by_me")
    for instanceID in pairs(UnitAuraInstanceID[guid]) do
        ok, filtered = xpcall(function() return C_UnitAuras.IsAuraFilteredOutByInstanceID(unitid, instanceID, filter) end, geterrorhandler())
        if ok and not filtered then
            dispelTypeColor = C_UnitAuras.GetAuraDispelTypeColor(unitid, instanceID, curve)
            --if dispelTypeColor then
                if ok and not filtered then
                    PlexusStatusAuras.core:SendStatusGained(guid,
                        "dispelable_by_me",
                        settings.priority,
                        nil,
                        dispelTypeColor or settings.color,
                        nil,
                        nil,
                        nil,
                        nil,
                        nil,
                        nil,
                        nil,
                        nil)
                end
            --end
            break
        end
    end
end

function PlexusStatusAuras:UpdateAllUnitsBuffs()
    for _, unitid in PlexusRoster:IterateRoster() do
        self:UNIT_AURA("UpdateAllUnitsBuffs", unitid)
    end
end
