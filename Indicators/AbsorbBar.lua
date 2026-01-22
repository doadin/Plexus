local _, Plexus = ...

local CreateFrame = CreateFrame
local GetTime = GetTime

local PlexusFrame = Plexus:GetModule("PlexusFrame")
local LibSharedMedia = LibStub:GetLibrary("LibSharedMedia-3.0", true)

local PlexusIndicatorsAbsorbBar = PlexusFrame:NewModule("PlexusIndicatorsAbsorbBar")

local function New(frame)
    local bar = CreateFrame("StatusBar", nil, frame)
    local bg = bar:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bar.bg = bg
    bar:SetStatusBarTexture("Interface\\Addons\\Plexus\\gradient32x32")
    bar:SetMinMaxValues(0,1)
    bar:SetValue(1)
    --bar.bg:SetVertexColor(1, 1, 1, 0.1)  -- 20% opacity
    bar.bg:Show()
    bar:Hide()
    return bar
end

local function Reset(self) -- luacheck: ignore 432
    local profile = PlexusFrame.db.profile
    local texture = LibSharedMedia:Fetch("statusbar", PlexusFrame.db.profile.texture) or "Interface\\Addons\\Plexus\\gradient32x32"
    local frame = self.__owner
    local side = profile.ExtraBarSide
    local healthBar = frame.indicators.bar
    local barWidth = profile.ExtraBarSize
    local offset = PlexusFrame.db.profile.ExtraBarBorderSize + 1

    self:SetParent(healthBar)
    self:ClearAllPoints()
    self:SetPoint("TOP", frame, "TOP", offset, -offset)
    self:SetWidth(frame:GetWidth()-5)
    self:SetHeight(frame:GetHeight()-5)
    self:SetOrientation(profile.orientation)
    self:SetReverseFill(true)
    --if side == "Right" then
    --    self:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -offset, -offset)
    --    self:SetWidth((frame:GetWidth()-2*offset) * barWidth)
    --    self:SetHeight((frame:GetHeight()-2*offset))
    --    self:SetOrientation("VERTICAL")
    --elseif side == "Left" then
    --    self:SetPoint("TOPLEFT", frame, "TOPLEFT", offset, -offset)
    --    self:SetWidth((frame:GetWidth()-2*offset) * barWidth)
    --    self:SetHeight((frame:GetHeight()-2*offset))
    --    self:SetOrientation("VERTICAL")
    --elseif side == "Bottom" then
    --    self:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", offset, offset)
    --    self:SetWidth((frame:GetWidth()-2*offset))
    --    self:SetHeight((frame:GetHeight()-2*offset) * barWidth)
    --    self:SetOrientation("HORIZONTAL")
    --elseif side == "Top" then
    --    self:SetPoint("TOPLEFT", frame, "TOPLEFT", offset, -offset)
    --    self:SetWidth((frame:GetWidth()-2*offset))
    --    self:SetHeight((frame:GetHeight()-2*offset) * barWidth)
    --    self:SetOrientation("HORIZONTAL")
    --else
    --    self:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", offset, offset)
    --    self:SetWidth((frame:GetWidth()-2*offset))
    --    self:SetHeight((frame:GetHeight()-2*offset) * barWidth)
    --    self:SetOrientation("HORIZONTAL")
    --end

    if profile.ExtraBarTrackDuration and not self.updateConfigured then
        self.TimeSinceLastUpdate = 0
        self.ProcessingDuration = false

        local updateInterval = profile.ExtraBarDurationUpdateRate

        self:SetScript("OnUpdate", function(selfInUpdate, elapsed)
            selfInUpdate.TimeSinceLastUpdate = selfInUpdate.TimeSinceLastUpdate + elapsed;

            while (selfInUpdate.ProcessingDuration and selfInUpdate.TimeSinceLastUpdate > updateInterval) do
                selfInUpdate:SetValue(selfInUpdate:GetValue() + updateInterval)
                selfInUpdate.TimeSinceLastUpdate = selfInUpdate.TimeSinceLastUpdate - updateInterval;
            end
        end)

        self.updateConfigured = true
    end

    if self:IsShown() then
        frame.indicators.text:SetParent(self)
        if profile.enableText2 then
            frame.indicators.text2:SetParent(self)
        end
        frame.indicators.icon:SetParent(self)
    end

    self:SetFrameLevel(healthBar:GetFrameLevel() + 1)

    self:SetStatusBarTexture(texture)
    self.bg:SetTexture(texture)
end

local function SetStatus(self, color, _, value, maxValue, _, _, _, start, duration) -- luacheck: ignore 432
	local profile = PlexusFrame.db.profile

	if profile.ExtraBarTrackDuration and type(duration) == "number" and duration > 0 and type(start) == "number" and start > 0 then --luacheck: ignore 631
        self.ProcessingDuration = true
        self.TimeSinceLastUpdate = 0
        self:SetMinMaxValues(0, duration)
        self:SetValue(GetTime() - start)
	else
        if not value or not maxValue then return end
        self.ProcessingDuration = false
        self:SetMinMaxValues(0, maxValue)
        self:SetValue(value)
	end

    if color then
        if PlexusFrame.db.profile.ExtraBarInvertColor then
            self:SetStatusBarColor(color.r,color.g,color.b,color.a)
            self.bg:SetVertexColor(0,0,0,0.8)
        else
            self:SetStatusBarColor(0,0,0,0.8)
            self.bg:SetVertexColor(color.r,color.g,color.b,color.a)
        end
    end
    self:SetStatusBarColor(0,1,0,0.5)
    --if not self:IsShown() then
    --    local frame = self.__owner
    --    frame.indicators.text:SetParent(self)
    --    if profile.enableText2 then
    --        frame.indicators.text2:SetParent(self)
    --    end
    --    frame.indicators.icon:SetParent(self)
    --end
    if profile.enableExtraBar and not self:IsShown() then
        self:Show()
    elseif not profile.enableExtraBar and self:IsShown() then
        self:Hide()
    end
    self:SetAlpha(value)
    self.bg:Hide()
end

local function Clear(self) -- luacheck: ignore 432
    local profile = PlexusFrame.db.profile
    if self:IsShown() then
        local frame = self.__owner
        local healthBar = frame.indicators.bar
        frame.indicators.text:SetParent(healthBar)
        if profile.enableText2 then
            frame.indicators.text2:SetParent(healthBar)
        end
        frame.indicators.icon:SetParent(healthBar)
        if not profile.enableCornerBarSeparation then
            for indicator in pairs(frame.indicators) do
                if indicator ~= "text" or indicator ~= "text2" or indicator ~= "text3" then
                    --indicator:SetFrameLevel(indicator:GetFrameLevel()+1)
                    indicator:SetParent(healthBar)
                end
            end
        end
    end
    self:Hide()
    self:SetValue(0)
end

function PlexusIndicatorsAbsorbBar:OnInitialize() --luacheck: ignore 212
    local profile = PlexusFrame.db.profile
    if profile.enableExtraBar then
        PlexusFrame:RegisterIndicator("ei_bar_bartwo", "Absorb Bar", New, Reset, SetStatus, Clear)
    end
end