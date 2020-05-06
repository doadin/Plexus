--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Target.lua
    Plexus status module for tracking the player's target and focus target.
    Created by noha, modified by Pastamancer and Phanx.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local currentTarget, currentFocus

local PlexusStatusTarget = Plexus:NewStatusModule("PlexusStatusTarget")
PlexusStatusTarget.menuName = L["Target"]
PlexusStatusTarget.options = false

PlexusStatusTarget.defaultDB = {
    player_target = {
        text = L["Target"],
        enable = true,
        color = { r = 0.8, g = 0.8, b = 0.8, a = 0.8 },
        priority = 69,
    },
    player_focus = {
        text = L["Focus"],
        enable = true,
        color = { r = 0.8, g = 0.8, b = 0.8, a = 0.8 },
        priority = 49,
    },
}


function PlexusStatusTarget:PostInitialize()
    self:RegisterStatus("player_target", L["Your Target"], nil, true)
    self:RegisterStatus("player_focus", L["Your Focus"], nil, true)
end

function PlexusStatusTarget:OnStatusEnable(status)
    if status == "player_target" then
        self:RegisterEvent("PLAYER_TARGET_CHANGED")
        self:PLAYER_TARGET_CHANGED()
    elseif status == "player_focus" then
        if not Plexus:IsClassicWow() then
            self:RegisterEvent("PLAYER_FOCUS_CHANGED")
        end
        self:PLAYER_FOCUS_CHANGED()
    end
end

function PlexusStatusTarget:OnStatusDisable(status)
    if status == "player_target" then
        self:UnregisterEvent("PLAYER_TARGET_CHANGED")
        self.core:SendStatusLostAllUnits("player_target")
    elseif status == "player_focus" then
        if not Plexus:IsClassicWow() then
            self:UnregisterEvent("PLAYER_FOCUS_CHANGED")
        end
        self.core:SendStatusLostAllUnits("player_focus")
    end
end

function PlexusStatusTarget:PLAYER_TARGET_CHANGED()
    local settings = self.db.profile.player_target

    if currentTarget then
        self.core:SendStatusLost(currentTarget, "player_target")
    end

    if UnitExists("target") and settings.enable then
        currentTarget = UnitGUID("target")
        self.core:SendStatusGained(currentTarget, "player_target",
            settings.priority,
            settings.range,
            settings.color,
            settings.text,
            nil,
            nil,
            settings.icon)
    end
end

function PlexusStatusTarget:PLAYER_FOCUS_CHANGED()
    local settings = self.db.profile.player_focus

    if currentFocus then
        self.core:SendStatusLost(currentFocus, "player_focus")
    end

    if UnitExists("focus") and settings.enable then
        currentFocus = UnitGUID("focus")
        self.core:SendStatusGained(currentFocus, "player_focus",
            settings.priority,
            settings.range,
            settings.color,
            settings.text,
            nil,
            nil,
            settings.icon)
    end
end
