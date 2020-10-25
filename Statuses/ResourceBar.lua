--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2020 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
----------------------------------------------------------------------]]

local _, Plexus = ...
local PlexusRoster = Plexus:GetModule("PlexusRoster")
local PlexusStatus = Plexus:GetModule("PlexusStatus")
local PlexusFrame = Plexus:GetModule("PlexusFrame")
local LibSharedMedia = LibStub:GetLibrary("LibSharedMedia-3.0", true)

local PlexusResourceBar = PlexusStatus:NewModule("PlexusResourceBar")

PlexusResourceBar.menuName = "ResourceBar"

PlexusResourceBar.defaultDB = {
    debug = false,
    manacolor = { r = 0, g = 0.5, b = 1, a = 1.0 },
    energycolor = { r = 1, g = 1, b = 0, a = 1.0 },
    ragecolor = { r = 1, g = 0, b = 0, a = 1.0 },
    runiccolor = { r = 0, g = 0.8, b = 0.8, a = 1.0 },
    unit_resource = {
        color = { r=1, g=1, b=1, a=1 },
        text = "ResourceBar",
        enable = false,
        priority = 30,
        range = false
    },
    size = 0.1,
    side = "Bottom",
--@retail@
    EnableForHealers = false,
--@end-retail@
    EnableOnlyMana = false,
}

local resourcebar_options = {
    ["Resource Bar Size"] = {
        type = "range",
        name = "Size",
        order = 30,
        desc = "Percentage of frame for resource bar",
        max = 50,
        min = 1,
        step = 1,
        get = function ()
            return PlexusResourceBar.db.profile.size * 100
        end,
        set = function(_, v)
            PlexusResourceBar.db.profile.size = v / 100
            PlexusFrame:UpdateAllFrames()
        end
    },
--@retail@
    ["Resource Bar Healer Only"] = {
        type = "toggle",
        name = "Only show Healers Bar",
        order = 50,
        desc = "Only show healers resource bar",
        get = function ()
            return PlexusResourceBar.db.profile.EnableForHealers
            end,
        set = function(_, v)
            PlexusResourceBar.db.profile.EnableForHealers = v
            PlexusResourceBar:UpdateAllUnits()
        end
    },
--@end-retail@
    ["Resource Bar Mana Only"] = {
        type = "toggle",
        name = "Only show mana Bars",
        order = 60,
        desc = "Only show mana bars",
        get = function ()
            return PlexusResourceBar.db.profile.EnableOnlyMana
            end,
        set = function(_, v)
            PlexusResourceBar.db.profile.EnableOnlyMana = v
            PlexusResourceBar:UpdateAllUnits()
        end
    },
    ["Resource Bar Side"] = {
        type = "select",
        name = "Location",
        order = 40,
        desc = "Where resource bar attaches to",
        get = function ()
            return PlexusResourceBar.db.profile.side
            end,
        set = function(_, v)
            PlexusResourceBar.db.profile.side = v
            PlexusFrame:UpdateAllFrames()
        end,
        values={["Left"] = "Left", ["Top"] = "Top", ["Right"] = "Right", ["Bottom"] = "Bottom" },
    },
    ["Resource Bar Colors"] = {
        name = "Colors",
        order = 200,
        type = "group",
        dialogInline = true,
        --childGroups = "tab",
        args = {
            ["Mana Bar Color"] = {
                name = "Mana Color",
                order = 40,
                type = "color", hasAlpha = true,
                get = function()
                    local color = PlexusResourceBar.db.profile.manacolor
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    local color = PlexusResourceBar.db.profile.manacolor
                    color.r = r
                    color.g = g
                    color.b = b
                    color.a = a or 1
                    PlexusFrame:UpdateAllFrames()
                end,
            },
            ["Energy Bar Color"] = {
                name = "Energy Color",
                order = 50,
                type = "color", hasAlpha = true,
                get = function()
                    local color = PlexusResourceBar.db.profile.energycolor
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    local color = PlexusResourceBar.db.profile.energycolor
                    color.r = r
                    color.g = g
                    color.b = b
                    color.a = a or 1
                    PlexusFrame:UpdateAllFrames()
                end,
            },
            ["Rage Bar Color"] = {
                name = "Rage Color",
                order = 60,
                type = "color", hasAlpha = true,
                get = function()
                    local color = PlexusResourceBar.db.profile.ragecolor
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    local color = PlexusResourceBar.db.profile.ragecolor
                    color.r = r
                    color.g = g
                    color.b = b
                    color.a = a or 1
                    PlexusFrame:UpdateAllFrames()
                end,
            },
            ["Runic Bar Color"] = {
                name = "Runic Color",
                order = 70,
                type = "color", hasAlpha = true,
                get = function()
                    local color = PlexusResourceBar.db.profile.runiccolor
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    local color = PlexusResourceBar.db.profile.runiccolor
                    color.r = r
                    color.g = g
                    color.b = b
                    color.a = a or 1
                    PlexusFrame:UpdateAllFrames()
                end,
            },
            ["Reset"] = {
                order = 80,
                name = "Reset Resource colors (Require Reload)",
                type = "execute", width = "double",
                func = function() PlexusResourceBar:ResetResourceColors() end,
            },
        },
    },
}

function PlexusResourceBar:ResetResourceColors() --luacheck: ignore 212
    PlexusResourceBar.db.profile.manacolor = PlexusResourceBar.defaultDB.manacolor
    PlexusResourceBar.db.profile.energycolor = PlexusResourceBar.defaultDB.energycolor
    PlexusResourceBar.db.profile.ragecolor = PlexusResourceBar.defaultDB.ragecolor
    PlexusResourceBar.db.profile.runiccolor = PlexusResourceBar.defaultDB.runiccolor
    PlexusFrame:UpdateAllFrames()
end

function PlexusResourceBar:OnInitialize()
    self.super.OnInitialize(self)

    self:RegisterStatus('unit_resource',"Resource Bar", resourcebar_options, true)
    PlexusStatus.options.args['unit_resource'].args['color'] = nil
    PlexusFrame:RegisterIndicator("resourcebar", "Resource Bar",
        function(frame)
            local bar = CreateFrame("StatusBar", nil, frame)
            local bg = bar:CreateTexture(nil, "BACKGROUND")
            bg:SetAllPoints(true)
            bar.bg = bg
            bar:SetStatusBarTexture("Interface\\Addons\\Plexus\\gradient32x32")
            bar:SetMinMaxValues(0,1)
            bar:SetValue(1)
            bar.bg:Show()
            bar:Hide()
            return bar
        end,
        function(self) -- luacheck: ignore 432
            local texture = LibSharedMedia:Fetch("statusbar", PlexusFrame.db.profile.texture) or "Interface\\Addons\\Plexus\\gradient32x32"
            local frame = self.__owner
            local side = PlexusResourceBar.db.profile.side
            local healthBar = frame.indicators.bar
            local barWidth = PlexusResourceBar.db.profile.size
            local offset = PlexusFrame.db.profile.borderSize + 1
            self:SetParent(healthBar)
            self:ClearAllPoints()
            if side == "Right" then
                self:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -offset, -offset)
                self:SetWidth((frame:GetWidth()-2*offset) * barWidth)
                self:SetHeight((frame:GetHeight()-2*offset))
                self:SetOrientation("VERTICAL")
            elseif side == "Left" then
                self:SetPoint("TOPLEFT", frame, "TOPLEFT", offset, -offset)
                self:SetWidth((frame:GetWidth()-2*offset) * barWidth)
                self:SetHeight((frame:GetHeight()-2*offset))
                self:SetOrientation("VERTICAL")
            elseif side == "Bottom" then
                self:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", offset, offset)
                self:SetWidth((frame:GetWidth()-2*offset))
                self:SetHeight((frame:GetHeight()-2*offset) * barWidth)
                self:SetOrientation("HORIZONTAL")
            elseif side == "Top" then
                self:SetPoint("TOPLEFT", frame, "TOPLEFT", offset, -offset)
                self:SetWidth((frame:GetWidth()-2*offset))
                self:SetHeight((frame:GetHeight()-2*offset) * barWidth)
                self:SetOrientation("HORIZONTAL")
            else
                self:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", offset, offset)
                self:SetWidth((frame:GetWidth()-2*offset))
                self:SetHeight((frame:GetHeight()-2*offset) * barWidth)
                self:SetOrientation("HORIZONTAL")
            end
            if self:IsShown() then
                frame.indicators.text:SetParent(self)
                frame.indicators.text2:SetParent(self)
                frame.indicators.corner1:SetParent(self)
                frame.indicators.corner2:SetParent(self)
                frame.indicators.corner3:SetParent(self)
                frame.indicators.corner4:SetParent(self)
                frame.indicators.icon:SetParent(self)
            end

            self:SetStatusBarTexture(texture)
            self.bg:SetTexture(texture)
        end,
        function(self, color, _, value, maxValue) -- luacheck: ignore 432
            if not value or not maxValue then return end
            self:SetMinMaxValues(0, maxValue)
            self:SetValue(value)

            if color then
                if PlexusFrame.db.profile.invertResourceBarColor then
                    self:SetStatusBarColor(color.r,color.g,color.b,color.a)
                    self.bg:SetVertexColor(0,0,0,0.8)
                else
                    self:SetStatusBarColor(0,0,0,0.8)
                    self.bg:SetVertexColor(color.r,color.g,color.b,color.a)
                end
            end

            if not self:IsShown() then
                local frame = self.__owner
                frame.indicators.text:SetParent(self)
                frame.indicators.text2:SetParent(self)
                frame.indicators.corner1:SetParent(self)
                frame.indicators.corner2:SetParent(self)
                frame.indicators.corner3:SetParent(self)
                frame.indicators.corner4:SetParent(self)
                frame.indicators.icon:SetParent(self)
            end
            self:Show()
        end,
        function(self) -- luacheck: ignore 432
            if self:IsShown() then
                local frame = self.__owner
                local healthBar = frame.indicators.bar
                frame.indicators.text:SetParent(healthBar)
                frame.indicators.text2:SetParent(healthBar)
                frame.indicators.corner1:SetParent(healthBar)
                frame.indicators.corner2:SetParent(healthBar)
                frame.indicators.corner3:SetParent(healthBar)
                frame.indicators.corner4:SetParent(healthBar)
                frame.indicators.icon:SetParent(healthBar)
            end
            self:Hide()
            self:SetValue(0)
        end
    )
end

function PlexusResourceBar:OnStatusEnable(status)
    if status == "unit_resource" then
        self:RegisterEvent("UNIT_POWER_UPDATE","UpdateUnit")
        self:RegisterEvent("UNIT_MAXPOWER","UpdateUnit")
        self:RegisterEvent("PLAYER_ENTERING_WORLD","UpdateAllUnits")
--@retail@
        self:RegisterEvent("ROLE_CHANGED_INFORM")
--@end-retail@
        self:RegisterMessage("Plexus_UnitJoined")
        self:UpdateAllUnits()
    end
end

function PlexusResourceBar:OnStatusDisable(status)
    if status == "unit_resource" then
        for guid, _ in PlexusRoster:IterateRoster() do
            self.core:SendStatusLost(guid, "unit_resource")
        end
        self:UnregisterEvent("UNIT_POWER_UPDATE")
        self:UnregisterEvent("UNIT_MAXPOWER")
        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
--@retail@
        self:UnregisterEvent("ROLE_CHANGED_INFORM")
--@end-retail@
        self:UnregisterMessage("Plexus_UnitJoined")
    end
end

function PlexusResourceBar:UpdateUnit(_, unitid)
    if not unitid then return end
    local unitGUID = UnitGUID(unitid)
    --don't update for a unit not in group
    if not PlexusRoster:IsGUIDInGroup(unitGUID) then return end
    self:UpdateUnitResource(unitid)
end

--@retail@
function PlexusResourceBar:ROLE_CHANGED_INFORM(event, changedName, fromName, oldRole, newRole)
    -- Catch if a unit changes role so that if a unit power doesn't change(role changed spec not changed)
    -- We will still update their frame
    local unitGUID = PlexusRoster:GetGUIDByFullName(changedName)
    local unitid = PlexusRoster:GetUnitidByGUID(unitGUID)
    self:Debug("ROLE_CHANGED_INFORM", event, changedName, fromName, oldRole, newRole)
    self:Debug("ROLE_CHANGED_INFORM",changedName, unitGUID, unitid)
    local EnableForHealers = PlexusResourceBar.db.profile.EnableForHealers
    if EnableForHealers then
        if newRole ~= "HEALER" then
            self.core:SendStatusLost(unitGUID, "unit_resource")
            return
        end
    end

    if not unitid then return end
    self:UpdateUnitResource(unitid)
end
--@end-retail@

function PlexusResourceBar:Plexus_UnitJoined(_, _, unitid)
    if not unitid then return end
    self:UpdateUnitResource(unitid)
end

function PlexusResourceBar:UpdateAllUnits()
    for _, unitid in PlexusRoster:IterateRoster() do
        self:UpdateUnitResource(unitid)
    end
end

function PlexusResourceBar:UpdateUnitResource(unitid)
    local color
    if not unitid then return end
    --local UnitGUID = UnitGUID(unitid)
    --if not UnitGUID then return end
    local unitGUID = UnitGUID(unitid)
    local current, max = UnitPower(unitid), UnitPowerMax(unitid)
    local priority = PlexusResourceBar.db.profile.unit_resource.priority
    local EnableForHealers = PlexusResourceBar.db.profile.EnableForHealers
    local unitpower = UnitPowerType(unitid)
--@retail@
    if EnableForHealers then
        local members = GetNumGroupMembers();
        local subGroupMembers = GetNumSubgroupMembers()
        local currentSpec = GetSpecialization()
        local currentSpecRole = currentSpec and select(5, GetSpecializationInfo(currentSpec)) or "None"
        if ((members ~= 0 or subGroupMembers ~= 0) and UnitGroupRolesAssigned(unitid) ~= "HEALER") or
        (UnitGUID("player") == UnitGUID(unitid) and currentSpecRole ~= "HEALER") then
            self.core:SendStatusLost(unitGUID, "unit_resource")
            return
        end
    end
--@end-retail@
    local EnableOnlyMana = PlexusResourceBar.db.profile.EnableOnlyMana
    if EnableOnlyMana then
        if unitpower ~= 0 then
            self.core:SendStatusLost(unitGUID, "unit_resource")
            return
        end
    end

    if unitpower == 3 or unitpower == 2 then
        color = PlexusResourceBar.db.profile.energycolor
    elseif unitpower == 6 then
        color = PlexusResourceBar.db.profile.runiccolor
    elseif unitpower == 1 then
        color = PlexusResourceBar.db.profile.ragecolor
    else
        color = PlexusResourceBar.db.profile.manacolor
    end
    self.core:SendStatusGained(
        unitGUID, "unit_resource",
        priority,
        nil,
        color,
        nil,
        current,max,
        nil
    )
end

