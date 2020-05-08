--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    All rights reserved. See the accompanying LICENSE file for details.
----------------------------------------------------------------------]]

local _, Plexus = ...
local PlexusFrame = Plexus:GetModule("PlexusFrame")
local L = Plexus.L

local BACKDROP = {
    bgFile = "Interface\\BUTTONS\\WHITE8X8", tile = true, tileSize = 8,
    edgeFile = "Interface\\BUTTONS\\WHITE8X8", edgeSize = 1,
    insets = { left = 1, right = 1, top = 1, bottom = 1 },
}

PlexusFrame:RegisterIndicator("border", L["Border"],
    -- New
    function(frame)
        frame:SetBackdrop(BACKDROP)
        return {}
    end,

    -- Reset
    function(self)
        local profile = PlexusFrame.db.profile
        local size = profile.borderSize

        local frame = self.__owner
        local r, g, b, a = frame:GetBackdropBorderColor()

        BACKDROP.edgeSize = size
        BACKDROP.insets.left = size
        BACKDROP.insets.right = size
        BACKDROP.insets.top = size
        BACKDROP.insets.bottom = size

        frame:SetBackdrop(BACKDROP)
        frame:SetBackdropColor(0, 0, 0, 1)
        frame:SetBackdropBorderColor(r, g, b, a)
    end,

    -- SetStatus
    function(self, color)
        if not color then return end

        local frame = self.__owner
        frame:SetBackdropBorderColor(color.r, color.g, color.b, color.a or 1)
    end,

    -- Clear
    function(self)
        local frame = self.__owner
        frame:SetBackdropBorderColor(0, 0, 0, 0)
    end
)
