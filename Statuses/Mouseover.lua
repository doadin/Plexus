--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    Copyright (c) 2018-2025 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Mouseover.lua
    Plexus status module for mouseover units.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local CreateFrame = CreateFrame
local UnitGUID = UnitGUID

local PlexusRoster = Plexus:GetModule("PlexusRoster")

local PlexusStatusMouseover = Plexus:NewStatusModule("PlexusStatusMouseover")
PlexusStatusMouseover.menuName = L["Mouseover"]
PlexusStatusMouseover.options = false

PlexusStatusMouseover.defaultDB = {
    mouseover = {
        enable = true,
        priority = 50,
        color = { r = 1, g = 1, b = 1, a = 1 },
        text = L["Mouseover"],
    }
}

function PlexusStatusMouseover:PostInitialize()
    self:Debug("PostInitialize")
    self:RegisterStatus("mouseover", L["Mouseover"], nil, true)
end

function PlexusStatusMouseover:OnStatusEnable(status)
    self:Debug("OnStatusEnable", status)
    self:RegisterEvent("UPDATE_MOUSEOVER_UNIT", "UpdateAllUnits")
    self:RegisterMessage("Plexus_RosterUpdated", "UpdateAllUnits")
    self:UpdateAllUnits()
end

function PlexusStatusMouseover:OnStatusDisable(status)
    self:Debug("OnStatusDisable", status)
    self:UnregisterEvent("UPDATE_MOUSEOVER_UNIT")
    self:UnregisterMessage("Plexus_RosterUpdated")
    self:SendStatusLostAllUnits(status)
end

local updater, t = CreateFrame("Frame"), 0.1
updater:Hide()
updater:SetScript("OnUpdate", function(self, elapsed)
    t = t - elapsed
    if t <= 0 then
        local guid = UnitGUID("mouseover")
        if not guid then
            PlexusStatusMouseover.core:SendStatusLostAllUnits("mouseover")
            return self:Hide()
        end
        t = 0.1
    end
end)

function PlexusStatusMouseover:UpdateAllUnits()
    local profile = self.db.profile.mouseover
    local mouseover = UnitGUID("mouseover")
    if not mouseover or Plexus:issecretvalue(mouseover) then
        return self.core:SendStatusLostAllUnits("mouseover")
    end
    if PlexusRoster:IsGUIDInGroup(mouseover) then
        self.core:SendStatusGained(mouseover, "mouseover",
            profile.priority,
            nil,
            profile.color,
            profile.text
        )
        updater:Show()
    end
end
