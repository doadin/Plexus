local _, Plexus = ...
local PlexusFrame = Plexus:GetModule("PlexusFrame")
local LibSharedMedia = LibStub:GetLibrary("LibSharedMedia-3.0", true)

local PlexusIndicatorsExtraBar = PlexusFrame:NewModule("PlexusIndicatorsExtraBar")

local function New(frame)
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
        if profile.enableText2 then
            frame.indicators.text2:SetParent(self)
        end
        frame.indicators.icon:SetParent(self)
    end

    self:SetStatusBarTexture(texture)
    self.bg:SetTexture(texture)
end

local function SetStatus(self, color, _, value, maxValue) -- luacheck: ignore 432

    if not value or not maxValue then return end
    self:SetMinMaxValues(0, maxValue)
    self:SetValue(value)

    if color then
        if PlexusFrame.db.profile.ExtraBarInvertColor then
            self:SetStatusBarColor(color.r,color.g,color.b,color.a)
            self.bg:SetVertexColor(0,0,0,0.8)
        else
            self:SetStatusBarColor(0,0,0,0.8)
            self.bg:SetVertexColor(color.r,color.g,color.b,color.a)
        end
    end
    --if not self:IsShown() then
    --    local frame = self.__owner
    --    frame.indicators.text:SetParent(self)
    --    if profile.enableText2 then
    --        frame.indicators.text2:SetParent(self)
    --    end
    --    frame.indicators.icon:SetParent(self)
    --end
    self:Show()

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
    end
    self:Hide()
    self:SetValue(0)
end

function PlexusIndicatorsExtraBar:OnInitialize() --luacheck: ignore 212
    local profile = PlexusFrame.db.profile
    if profile.enableExtraBar then
        PlexusFrame:RegisterIndicator("ei_bar_barone", "Extra Bar", New, Reset, SetStatus, Clear)
    end
end