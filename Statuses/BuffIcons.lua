local function IsRetailWow()
    return WOW_PROJECT_ID == WOW_PROJECT_MAINLINE
end

local UnitAura, UnitGUID, pairs = _G.UnitAura, _G.UnitGUID, _G.pairs

local MAX_BUFFS = 6

local L = setmetatable(PlexusBuffIconsLocale or {}, {__index = function(t, k) t[k] = k return k end})

local PlexusRoster = _G.Plexus:GetModule("PlexusRoster")
local PlexusFrame = _G.Plexus:GetModule("PlexusFrame")
local PlexusBuffIcons = _G.Plexus:NewModule("PlexusBuffIcons", "AceBucket-3.0")

local function WithAllPlexusFrames(func)
    for _, frame in pairs(PlexusFrame.registeredFrames) do
        func(frame)
    end
end

local GetAuraDataByAuraInstanceID
local ForEachAura

if IsRetailWow() then
    GetAuraDataByAuraInstanceID = _G.C_UnitAuras.GetAuraDataByAuraInstanceID
    ForEachAura = _G.AuraUtil.ForEachAura
end

PlexusBuffIcons.menuName = L["Buff Icons"]

PlexusBuffIcons.defaultDB = {
    enabled = true,
    iconsize = 9,
    offsetx = -1,
    offsety = -1,
    alpha = 0.9,
    iconnum = 4,
    iconperrow = 2,
    orientation = "VERTICAL",
    anchor = "TOPRIGHT",
    color = { r = 0, g = 0.5, b = 1.0, a = 1.0 },
    ecolor = { r = 1, g = 1, b = 0, a = 1.0 },
    rcolor = { r = 1, g = 0, b = 0, a = 1.0 },
    unit_buff_icons = {
        color = { r=1, g=1, b=1, a=1 },
        text = "BuffIcons",
        enable = true,
        priority = 30,
        range = false
    }
}

local options = {
    type = "group",
    inline = PlexusFrame.options.args.bar.inline,
    name = L["Buff Icons"],
    desc = L["Buff Icons"],
    order = 1200,
    get = function(info)
        local k = info[#info]
        return PlexusBuffIcons.db.profile[k]
    end,
    set = function(info, v)
        local k = info[#info]
        PlexusBuffIcons.db.profile[k] = v
        PlexusBuffIcons:UpdateAllUnitsBuffs()
    end,
    args = {
        enabled = {
            order = 40, width = "double",
            type = "toggle",
            name = L["Enable"],
            desc = L["Enabling/disabling the module will display all buff or debuff icons."],
            get = function()
                return PlexusBuffIcons.db.profile.enabled
            end,
            set = function(_, v)
                PlexusBuffIcons.db.profile.enabled = v
                if v and not PlexusBuffIcons.enabled then
                    PlexusBuffIcons:OnEnable()
                elseif not v and PlexusBuffIcons.enabled then
                    PlexusBuffIcons:OnDisable()
                end
            end,
        },
        iconsize = {
            order = 55, width = "double",
            type = "range",
            name = L["Icons Size"],
            desc = L["Size for each buff icon"],
            max = 16,
            min = 5,
            step = 1,
            get = function () return PlexusBuffIcons.db.profile.iconsize end,
            set = function(_, v)
                PlexusBuffIcons.db.profile.iconsize = v
                WithAllPlexusFrames(function (f) PlexusBuffIcons.ResetBuffIconSize(f) end)
            end
        },
        alpha = {
            order = 70, width = "double",
            type = "range",
            name = L["Alpha"],
            desc = L["Alpha value for each buff icon"],
            max = 1,
            min = 0.1,
            step = 0.1,
            get = function () return PlexusBuffIcons.db.profile.alpha end,
            set = function(_, v)
                PlexusBuffIcons.db.profile.alpha = v
                WithAllPlexusFrames(function (f) PlexusBuffIcons.ResetBuffIconAlpha(f) end)
            end
        },
        offsetx = {
            order = 60, width = "double",
            type = "range",
            name = L["Offset X"],
            desc = L["X-axis offset from the selected anchor point, minus value to move inside."],
            max = 20,
            min = -20,
            step = 1,
            get = function () return PlexusBuffIcons.db.profile.offsetx end,
            set = function(_, v)
                PlexusBuffIcons.db.profile.offsetx = v
                WithAllPlexusFrames(function (f) PlexusBuffIcons.ResetBuffIconPos(f) end)
            end
        },
        offsety = {
            order = 65, width = "double",
            type = "range",
            name = L["Offset Y"],
            desc = L["Y-axis offset from the selected anchor point, minus value to move inside."],
            max = 20,
            min = -20,
            step = 1,
            get = function () return PlexusBuffIcons.db.profile.offsety end,
            set = function(_, v)
                PlexusBuffIcons.db.profile.offsety = v
                WithAllPlexusFrames(function (f) PlexusBuffIcons.ResetBuffIconPos(f) end)
            end
        },
        iconnum = {
            order = 75, width = "double",
            type = "range",
            name = L["Icon Numbers"],
            desc = L["Max icons to show."],
            max = MAX_BUFFS,
            min = 1,
            step = 1,
        },
        iconperrow = {
            order = 76, width = "double",
            type = "range",
            name = L["Icons Per Row"],
            desc = L["Sperate icons in several rows."],
            max = MAX_BUFFS,
            min = 0,
            step = 1,
            get = function()
                return PlexusBuffIcons.db.profile.iconperrow
            end,
            set = function(_, v)
                PlexusBuffIcons.db.profile.iconperrow = v
                WithAllPlexusFrames(function (f) PlexusBuffIcons.ResetBuffIconPos(f) end)
            end,
        },
        orientation = {
            order = 80,  width = "double",
            type = "select",
            name = L["Orientation of Icon"],
            desc = L["Set icons list orientation."],
            get = function ()
                return PlexusBuffIcons.db.profile.orientation
            end,
            set = function(_, v)
                PlexusBuffIcons.db.profile.orientation = v
                WithAllPlexusFrames(function (f) PlexusBuffIcons.ResetBuffIconPos(f) end)
            end,
            values ={["HORIZONTAL"] = L["HORIZONTAL"], ["VERTICAL"] = L["VERTICAL"]}
        },
        anchor = {
            order = 90,  width = "double",
            type = "select",
            name = L["Anchor Point"],
            desc = L["Anchor point of the first icon."],
            get = function ()
                return PlexusBuffIcons.db.profile.anchor
            end,
            set = function(_, v)
                PlexusBuffIcons.db.profile.anchor = v
                WithAllPlexusFrames(function (f) PlexusBuffIcons.ResetBuffIconPos(f) end)
            end,
            values ={["TOPRIGHT"] = L["TOPRIGHT"], ["TOPLEFT"] = L["TOPLEFT"], ["BOTTOMLEFT"] = L["BOTTOMLEFT"], ["BOTTOMRIGHT"] = L["BOTTOMRIGHT"]}
        },
    }
}

_G.Plexus.options.args.PlexusBuffIcons = options

function PlexusBuffIcons.InitializeFrame(_, f) --luacheck: ignore 212
    if not f.BuffIcons then
        f.BuffIcons = {}
        for i=1, MAX_BUFFS do
            local bar = f.Bar or f.indicators.bar
            local bg = CreateFrame("Frame", "$parentPlexusBuffIcon"..i, bar, "BackdropTemplate")
            bg:SetBackdrop({
                bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
                edgeSize = 8,
                insets = { left = 4, right = 4, top = 4, bottom = 4 },
            })

            bg:SetFrameLevel(bar:GetFrameLevel() + 3)
            bg.icon = bg:CreateTexture("$parentTex", "OVERLAY")
            bg.icon:SetTexCoord(0.04, 0.96, 0.04, 0.96)
            bg.icon:SetAllPoints(bg)
            bg.cd = CreateFrame("Cooldown", "$parentCD", bg, "CooldownFrameTemplate")
            --bg.cd:SetAllPoints(bg.icon)
            bg.icon:ClearAllPoints()
            bg.icon:SetPoint("TOPLEFT", 2, -2)
            bg.icon:SetPoint("BOTTOMRIGHT", -2, 2)
            bg.cd:SetReverse(true)
            bg.cd:SetDrawBling(false)
            bg.cd:SetDrawEdge(false)
            bg.cd:SetSwipeColor(0, 0, 0, 0.6)  --will be overrided by omnicc
            bg.cd:SetHideCountdownNumbers(true)  --will be overrided by omnicc
            bg.cd:SetUseAuraDisplayTime(true)
            bg.cdtext = bg:CreateFontString("Cdtext", "OVERLAY")
            bg.cdtext:SetFont(STANDARD_TEXT_FONT, 10, "OUTLINE")
            bg.cdtext:ClearAllPoints()
            bg.cdtext:SetPoint("TOPRIGHT", bg.icon, 1, 1)
            bg.stack = bg:CreateFontString("Stack", "OVERLAY")
            bg.stack:SetFont(STANDARD_TEXT_FONT, 9, "OUTLINE")
            bg.stack:ClearAllPoints()
            bg.stack:SetPoint("BOTTOMRIGHT", bg.icon, 1, -1)
            bg:SetFrameStrata("HIGH")
            bg:SetFrameLevel(100)

            f.BuffIcons[i] = bg
        end

        PlexusBuffIcons.ResetBuffIconSize(f)
        PlexusBuffIcons.ResetBuffIconPos(f)
        PlexusBuffIcons.ResetBuffIconAlpha(f)
    end
end

function PlexusBuffIcons.ResetBuffIconSize(f)
    if(f.BuffIcons) then
        for _,v in pairs(f.BuffIcons) do
            v:SetWidth(PlexusBuffIcons.db.profile.iconsize)
            v:SetHeight(PlexusBuffIcons.db.profile.iconsize)
        end
    end
end

function PlexusBuffIcons.ResetBuffIconPos(f)
    local icons = f.BuffIcons
    local xadjust = 1
    local yadjust = 1
    local p = PlexusBuffIcons.db.profile
    if(string.find(p.anchor, "BOTTOM")) then yadjust = -1 end
    if(string.find(p.anchor, "LEFT")) then xadjust = -1 end
    if(icons) then
        for k,v in pairs(icons) do
            v:ClearAllPoints()
            if(k==1) then
                v:SetPoint(p.anchor, f, p.anchor, xadjust * p.offsetx, yadjust * p.offsety)
            elseif(p.iconperrow and p.iconperrow>0 and (k-1)%p.iconperrow==0) then
                if(p.orientation == "VERTICAL") then
                    if(string.find(p.anchor, "RIGHT")) then
                        if(p.offsetx<=0) then
                            v:SetPoint("RIGHT", icons[k-p.iconperrow], "LEFT", -1, 0)
                        else
                            v:SetPoint("LEFT", icons[k-p.iconperrow], "RIGHT", 1, 0)
                        end
                    elseif(string.find(p.anchor, "LEFT")) then
                        if(p.offsetx<=0) then
                            v:SetPoint("LEFT", icons[k-p.iconperrow], "RIGHT", 1, 0)
                        else
                            v:SetPoint("RIGHT", icons[k-p.iconperrow], "LEFT", -1, 0)
                        end
                    end
                else
                    if(string.find(p.anchor, "TOP")) then
                        if(p.offsety<=0) then
                            v:SetPoint("TOP", icons[k-p.iconperrow], "BOTTOM", 0, -1)
                        else
                            v:SetPoint("BOTTOM", icons[k-p.iconperrow], "TOP", 0, 1)
                        end
                    elseif(string.find(p.anchor, "BOTTOM")) then
                        if(p.offsety<=0) then
                            v:SetPoint("BOTTOM", icons[k-p.iconperrow], "TOP", 0, 1)
                        else
                            v:SetPoint("TOP", icons[k-p.iconperrow], "BOTTOM", 0, -1)
                        end
                    end
                end
            else
                if(p.orientation == "VERTICAL") then
                    if(string.find(p.anchor, "BOTTOM")) then
                        v:SetPoint("BOTTOM", icons[k-1], "TOP", 0, 1)
                    else
                        v:SetPoint("TOP", icons[k-1], "BOTTOM", 0, -1)
                    end
                else
                    if(string.find(p.anchor, "LEFT")) then
                        v:SetPoint("LEFT", icons[k-1], "RIGHT", 1, 0)
                    else
                        v:SetPoint("RIGHT", icons[k-1], "LEFT", -1, 0)
                    end
                end
            end
        end
    end
end

function PlexusBuffIcons.ResetBuffIconAlpha(f)
    if(f.BuffIcons) then
        for _,v in pairs(f.BuffIcons) do
            v:SetAlpha( PlexusBuffIcons.db.profile.alpha )
        end
    end
end

function PlexusBuffIcons:OnInitialize()
    self.super.OnInitialize(self)
    WithAllPlexusFrames(function(f) PlexusBuffIcons.InitializeFrame(nil, f) end)
    hooksecurefunc(PlexusFrame, "InitializeFrame", self.InitializeFrame)
end

function PlexusBuffIcons:OnEnable()
    if not PlexusBuffIcons.db.profile.enabled then return end
    self.enabled = true
    self:RegisterEvent("UNIT_AURA")
    if(not self.bucket) then
        self:Debug("registering bucket")
        self.bucket = self:RegisterBucketMessage("Plexus_UpdateLayoutSize", 1, "UpdateAllUnitsBuffs")
    end

    self:UpdateAllUnitsBuffs()
end

function PlexusBuffIcons:OnDisable()
    self.enabled = nil
    self:UnregisterEvent("UNIT_AURA")
    if(self.bucket) then
        self:Debug("unregistering bucket")
        self:UnregisterBucket(self.bucket)
        self.bucket = nil
    end
    for _,v in pairs(PlexusFrame.registeredFrames) do
        if(v.BuffIcons) then
            for i=1, MAX_BUFFS do v.BuffIcons[i]:Hide() end
        end
    end
end

function PlexusBuffIcons:Reset()
    self.super.Reset(self)
end

local function showBuffIcon(v, n, setting, icon, count, unit, instanceid)
    local dur = C_UnitAuras.GetAuraDuration(unit, instanceid) or 0
    v.BuffIcons[n]:Show()
    v.BuffIcons[n].icon:SetTexture(icon)
    v.BuffIcons[n].auraid = instanceid
    --count = C_StringUtil.TruncateWhenZero(count)
    count = C_UnitAuras.GetAuraApplicationDisplayCount(unit, instanceid , 2 , 100)
    v.BuffIcons[n].stack:SetText(count)
    v.BuffIcons[n].stack:Show()
    v.BuffIcons[n].cd:SetCooldownFromDurationObject(dur, true)
    --local DEBUFF_DISPLAY_COLOR_INFO = {
    --    [0] = DEBUFF_TYPE_NONE_COLOR,
    --    [1] = DEBUFF_TYPE_MAGIC_COLOR,
    --    [2] = DEBUFF_TYPE_CURSE_COLOR,
    --    [3] = DEBUFF_TYPE_DISEASE_COLOR,
    --    [4] = DEBUFF_TYPE_POISON_COLOR,
    --    [9] = DEBUFF_TYPE_BLEED_COLOR, -- enrage
    --    [11] = DEBUFF_TYPE_BLEED_COLOR,
    --}
    --local curve = C_CurveUtil.CreateColorCurve()
    --if curve then
    --    curve:SetType(Enum.LuaCurveType.Step)
    --    for i, c in pairs(DEBUFF_DISPLAY_COLOR_INFO) do
    --        curve:AddPoint(i, c)
    --    end
    --end
    --local dispelTypeColor = C_UnitAuras.GetAuraDispelTypeColor(unit, instanceid, curve)
    v.BuffIcons[n]:SetBackdropBorderColor(1, 1, 1, 1)

    --if not v.BuffIcons[n].hooked then
    --    v.BuffIcons[n]:HookScript("OnUpdate", function(self, elapsed)
    --        if v.BuffIcons[n].auraid then
    --            local dur = C_UnitAuras.GetAuraDuration(v.unit, v.BuffIcons[n].auraid)
    --            local remains = dur:GetRemainingDuration()
    --            --local remains = dur:GetRemainingPercent()
    --            v.BuffIcons[n].cdtext:SetText(AbbreviateNumbers(remains))
    --            --print(v.BuffIcons[n].auraid)
    --        end
    --    end)
    --    v.BuffIcons[n].hooked = true
    --end
end

local UnitAuraInstanceID
local function updateFrame_df(v)
    local n = 1
    local setting = PlexusBuffIcons.db.profile

    for i=n, MAX_BUFFS do --luacheck: ignore
        v.BuffIcons[i]:Hide()
    end

    if v.unit and UnitAuraInstanceID[v.unitGUID] then
        local numAuras = 0
        for instanceID, aura in pairs(UnitAuraInstanceID[v.unitGUID]) do
            if n > setting.iconnum then
                break
            end
            if aura then
                numAuras = numAuras + 1
                local icon, count = aura.icon, aura.applications
                showBuffIcon(v, n, setting, icon, count, v.unit, instanceID)
                n=n+1
            end
            if numAuras == 0 then
                UnitAuraInstanceID[v.unitGUID] = nil
            end
        end
    end
end


function PlexusBuffIcons:UNIT_AURA(_, unitid, updatedAuras)
    if not self.enabled then return end
    if not unitid then return end
    local guid = UnitGUID(unitid)
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

    if not PlexusRoster:IsGUIDInRaid(guid) then return end
    local filter = "HELPFUL" -- HARMFUL

    -- UnitAuraInstanceID[guid] = auras = C_UnitAuras.GetUnitAuras(unit, filter [, maxCount [, sortRule [, sortDirection]]])

    if IsRetailWow() then
        if updatedAuras and updatedAuras.isFullUpdate then
            local unitauraInfo = {}
            ForEachAura(unitid, filter, nil,
                function(aura)
                    if aura and aura.auraInstanceID then
                        unitauraInfo[aura.auraInstanceID] = aura
                    end
                end,
            true)
            UnitAuraInstanceID[guid] = {}
            for _, v in pairs(unitauraInfo) do
                UnitAuraInstanceID[guid][v.auraInstanceID] = v
            end
        end
        if updatedAuras and updatedAuras.addedAuras then
            for _, addedAuraInfo in pairs(updatedAuras.addedAuras) do
                local isFiltered = C_UnitAuras.IsAuraFilteredOutByInstanceID(unitid, addedAuraInfo.auraInstanceID, filter)
                if not isFiltered then
                    UnitAuraInstanceID[guid][addedAuraInfo.auraInstanceID] = addedAuraInfo
                end
            end
        end
        if updatedAuras and updatedAuras.updatedAuraInstanceIDs then
            for _, auraInstanceID in ipairs(updatedAuras.updatedAuraInstanceIDs) do
                if UnitAuraInstanceID[guid][auraInstanceID] then
                    local newAura = GetAuraDataByAuraInstanceID(unitid, auraInstanceID)
                    local isFiltered = newAura and C_UnitAuras.IsAuraFilteredOutByInstanceID(unitid, newAura.auraInstanceID, filter) or true
                    if not isFiltered then
                        UnitAuraInstanceID[guid][newAura.auraInstanceID] = newAura
                    end
                end
            end
        end
        if updatedAuras and updatedAuras.removedAuraInstanceIDs then
            for _, auraInstanceID in ipairs(updatedAuras.removedAuraInstanceIDs) do
                if UnitAuraInstanceID[guid] and UnitAuraInstanceID[guid][auraInstanceID] then
                    local aura = UnitAuraInstanceID[guid][auraInstanceID]
                    if aura then
                        UnitAuraInstanceID[guid][auraInstanceID] = nil
                    end
                end
            end
        end
        for _,v in pairs(PlexusFrame.registeredFrames) do
            if v.unitGUID == guid then updateFrame_df(v) end
        end
    end
    -- end

end

function PlexusBuffIcons:UpdateAllUnitsBuffs()
    for _, unitid in PlexusRoster:IterateRoster() do
        self:UNIT_AURA("UpdateAllUnitsBuffs", unitid)
    end
end
