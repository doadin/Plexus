local _, Plexus = ...

local UnitAura, UnitGUID, pairs = _G.UnitAura, _G.UnitGUID, _G.pairs

local L = setmetatable(PlexusDeDeBuffIconsLocale or {}, {__index = function(t, k) t[k] = k return k end})

local PlexusRoster = _G.Plexus:GetModule("PlexusRoster")
local PlexusFrame = Plexus:GetModule("PlexusFrame")

local PlexusStatusDispelByMe = _G.Plexus:NewStatusModule("PlexusStatusDispelByMe", "AceTimer-3.0")
PlexusStatusDispelByMe.menuName = L["Dispelable By Me"]

PlexusStatusDispelByMe.defaultDB = {
    dispelable_by_me = {
        enable = true,
        priority = 70,
        range = false,
        color = { r = 0, g = 0, b = 1.0, a = 1.0 },
    },
}

function PlexusStatusDispelByMe:PostInitialize()
    self:RegisterStatus("dispelable_by_me", L["Dispelable By Me"], nil, true)
end

function PlexusStatusDispelByMe:OnEnable()
    --self:RegisterEvent("UNIT_AURA")
    --self:RegisterEvent("UNIT_FLAGS")
    --self:RegisterEvent("LOADING_SCREEN_DISABLED", "MakeContainers")
    --self:RegisterMessage("Plexus_RosterUpdated", "MakeContainers")
    self:RegisterMessage("UpdateFrameUnits", "MakeContainers")
    --self:UpdateAllUnitsBuffs()
end

function PlexusStatusDispelByMe:OnDisable()
    --self:UnregisterEvent("UNIT_AURA")
    --self:UnregisterEvent("UNIT_FLAGS")
    --self:UnregisterEvent("LOADING_SCREEN_DISABLED")
    self:UnRegisterMessage("UpdateFrameUnits")
end

--function PlexusStatusDispelByMe:UNIT_FLAGS(_,unit)
--    --local hostile = UnitCanAttack("player", unit) or UnitIsCharmed(unitid)
--    --if hostile then
--    --    self:UNIT_AURA("UpdateAllUnitsBuffs", unit, {isFullUpdate = true} )
--    --end
--end

--function PlexusStatusDispelByMe:LOADING_SCREEN_DISABLED()
--    PlexusStatusDispelByMe:UpdateAllUnitsBuffs()
--end

--function PlexusStatusDispelByMe:UpdateAllUnitsBuffs()
--    for _, unitid in PlexusRoster:IterateRoster() do
--        self:UNIT_AURA("UpdateAllUnitsBuffs", unitid)
--    end
--end

local function createButton(button)
   button:SetSize(12, 12)
   button:SetCancelAuraButtons('RightButtonUp')
   local Icon = button:CreateTexture(nil, 'ARTWORK')
   Icon:SetAllPoints()
   button:SetIcon(Icon)
   local Time = button:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
   Time:SetPoint('TOPLEFT', 1, -1)
   Time:SetJustifyH('LEFT')
   Time:SetSize(8,8)
   button:SetDurationText(Time)
end

local anchor = {
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

function PlexusStatusDispelByMe:MakeContainers()
    local settings = PlexusStatusDispelByMe.db.profile.dispelable_by_me
    if not settings.enable then
        return
    end
    local registeredFrames = PlexusFrame.registeredFrames
    for frameName, frameTable in pairs(registeredFrames) do
        if frameTable.unit then
            --print("frameTable.unit", frameTable.unit)
            for name, indicator in pairs(frameTable.indicators) do
                if type(indicator) == "table" and indicator.GetObjectType and indicator:GetObjectType() == "Button" then
                    if not frameTable.container then
                        frameTable.container = {}
                    end
                    if not frameTable.container[name] then
                        frameTable.container[name] = CreateFrame('AuraContainer', nil, frameTable, 'CustomAuraContainerTemplate')
                        frameTable.container[name]:SetUnit(frameTable.unit)
                        local point, x, y = unpack(anchor[name])
                        frameTable.container[name]:SetPoint(point, x, y)
                    end
                    if not frameTable.container[name]:HasAuraGroup(frameName .. ":" .. name .. ":" .. "PlexusDispelByMe") then
                        for status, statusEnabled in pairs(PlexusFrame.db.profile.statusmap[name]) do
                            if status == "dispelable_by_me" and statusEnabled then
                                --local candidateFilters = {
                                --    includeSpellIDs = {
                                --    --    53563,  -- Beacon of Light
                                --    },
                                --    excludeSpellIDs = {
                                --    --    53563,  -- Beacon of Light
                                --    },
                                --}
                                --candidateFilters.includeSpellIDs[id] = true
                                frameTable.container[name]:AddAuraGroup(frameName .. ":" .. name .. ":" .. "PlexusDispelByMe", "HARMFUL|RAID_PLAYER_DISPELLABLE", {
                                      initializeFrame = createButton,
                                      sortMethod = AuraContainerSortMethod.ExpirationOnly,
                                      sortDirection = AuraContainerSortDirection.Reverse,
                                      layout = {
                                         elementSpacing = 5,
                                         lineSpacing = 5,
                                      },
                                      maxFrameCount = 1,
                                      --candidateFilters = candidateFilters
                                    }
                                )
                                frameTable.container[name]:UpdateAllAuras()
                            end
                        end
                    else
                        frameTable.container[name]:SetUnit(frameTable.unit)
                    end
                end
            end
        end
    end
end
