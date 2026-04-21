------------------------------------------------------------------------------
-- PlexusStatusExternals
------------------------------------------------------------------------------

local Plexus = _G.Plexus


local PlexusStatusExternals = Plexus:GetModule("PlexusStatus"):NewModule("PlexusStatusExternals")  --luacheck: ignore 211
PlexusStatusExternals.menuName = "Tanking cooldowns"  --luacheck: ignore 112

local AceGUI = LibStub("AceGUI-3.0")
local GetSpellInfo = C_Spell and C_Spell.GetSpellInfo and C_Spell.GetSpellInfo or GetSpellInfo

do
    local widgetType = "PSE-SpellsConfig"
    local widgetVersion = 1
    local SPELL_HEIGHT = 24

    local function GetSpellPriority(self, spellid)
        for p, s in ipairs(self.active_spellids) do
            if s == spellid then
                return p
            end
        end

        return false
    end

    local function GetSpellClass(self, spellid)
        for class, buffs in pairs(self.spells) do
            for _, s in ipairs(buffs) do
                if s == spellid then
                    return class
                end
            end
        end

        return nil
    end

    local function SetContainerSpell(self, i, spellid, class, active)
        local spellInfo = GetSpellInfo(spellid)
        local sname, _, sicon
        if type(spellInfo) == "table" then
            sname = spellInfo.name
            sicon = spellInfo.iconID
        else
            sname, _, sicon = GetSpellInfo(spellid)
        end
        if sicon == nil then
            sname = "bad spellid"
            sicon = "bad spellid"
        end

        self.spell_containers[i].spellid = spellid
        self.spell_containers[i].label:SetText(string.format(" |T%s:20|t |cFF%02x%02x%02x%s|r", sicon, RAID_CLASS_COLORS[class].r * 0xff, RAID_CLASS_COLORS[class].g * 0xff, RAID_CLASS_COLORS[class].b * 0xff, sname))

        if active then
            self.spell_containers[i].check.checktex:Show()
            self.spell_containers[i].upbtn:Enable()
            self.spell_containers[i].downbtn:Enable()
        else
            self.spell_containers[i].check.checktex:Hide()
            self.spell_containers[i].upbtn:Disable()
            self.spell_containers[i].downbtn:Disable()
        end
    end

    local function UpdateSpells(self)
        local i = 1

        for _, spellid in ipairs(self.active_spellids) do
            SetContainerSpell(self, i, spellid, GetSpellClass(self, spellid), true)
            i = i + 1
        end

        for class, buffs in pairs(self.spells) do
            for _, spellid in pairs(buffs) do
                if not GetSpellPriority(self, spellid) then
                    SetContainerSpell(self, i, spellid, class, false)
                    i = i + 1
                end
            end
        end
    end

    local function CheckBox_OnClick(frame)
        local self = frame.obj.obj
        local spellid = frame.obj.spellid
        local i = GetSpellPriority(self, spellid)

        if i then
            table.remove(self.active_spellids, i)
            self.inactive_spellids[spellid] = i
        else
            local pos
            if self.inactive_spellids[spellid] and self.inactive_spellids[spellid] <= (#self.active_spellids + 1) then
                pos = self.inactive_spellids[spellid]
            else
                pos = #self.active_spellids+1
            end

            table.insert(self.active_spellids, pos, spellid)
        end

        UpdateSpells(self)
        local PlexusStatusExternals = Plexus:GetModule("PlexusStatus"):GetModule("PlexusStatusExternals")
        PlexusStatusExternals:UpdateAllUnits()
    end

    local function UpButton_Click(frame)
        local self = frame.obj.obj
        local i = GetSpellPriority(self, frame.obj.spellid)

        if i and i > 1 then
            if IsLeftShiftKeyDown() then
                local tmp = self.active_spellids[i]
                table.remove(self.active_spellids, i)
                table.insert(self.active_spellids, 1, tmp)
            else
                local tmp = self.active_spellids[i-1]
                self.active_spellids[i-1] = self.active_spellids[i]
                self.active_spellids[i] = tmp
            end

            UpdateSpells(self)
            local PlexusStatusExternals = Plexus:GetModule("PlexusStatus"):GetModule("PlexusStatusExternals")
            PlexusStatusExternals:UpdateAllUnits()
        end
    end

    local function DownButton_Click(frame)
        local self = frame.obj.obj
        local i = GetSpellPriority(self, frame.obj.spellid)

        if i and i < #self.active_spellids then
            if IsLeftShiftKeyDown() then
                local tmp = self.active_spellids[i]
                table.remove(self.active_spellids, i)
                table.insert(self.active_spellids, #self.active_spellids+1, tmp)
            else
                local tmp = self.active_spellids[i+1]
                self.active_spellids[i+1] = self.active_spellids[i]
                self.active_spellids[i] = tmp
            end

            UpdateSpells(self)
            local PlexusStatusExternals = Plexus:GetModule("PlexusStatus"):GetModule("PlexusStatusExternals")
            PlexusStatusExternals:UpdateAllUnits()
        end
    end

    local function LabelFrame_OnEnter(frame)
        -- HACK: replaces tooltips of some spells for other more descriptive spellids..
        local spellfilters = {
            -- [63087] = 63086 -- Raptor Strike => Glyph of Raptor Strike
        }
        GameTooltip:SetOwner(frame, "ANCHOR_NONE")
        GameTooltip:SetPoint("BOTTOMLEFT", frame, "BOTTOMRIGHT")
        GameTooltip:SetSpellByID(spellfilters[frame.spellid] or frame.spellid, true, true)
        GameTooltip:Show()
    end

    local function LabelFrame_OnLeave(frame) --luacheck: ignore 212
        GameTooltip:Hide()
    end

    local function LabelFrame_OnMouseUp(frame)
        if IsModifiedClick("CHATLINK") then
            ChatEdit_InsertLink(GetSpellLink(frame.spellid))
        end
    end

    local function OnAcquire(self)
        UpdateSpells(self)
    end

    -- These are required by AceConfigDialog
    local function SetLabel(self, label) --luacheck: ignore 212
    end

    local function SetText(self, text) --luacheck: ignore 212
    end

    local function SetDisabled(self, disabled) --luacheck: ignore 212
    end

    local function Constructor()
        local widget = {
            type = widgetType,

            OnAcquire = OnAcquire,
            SetLabel = SetLabel,
            SetText = SetText,
            SetDisabled = SetDisabled,
        }

        -- Create spell containers
        local PlexusStatusExternals = Plexus:GetModule("PlexusStatus"):GetModule("PlexusStatusExternals")
        local spells = PlexusStatusExternals.tankingbuffs

        local spell_count = 0
        for _, cspells in pairs(spells) do
            spell_count = spell_count + #cspells
        end

        spell_containers = {} --luacheck: ignore 111

        local frame = CreateFrame("Frame")
        frame:SetWidth(200)
        frame:SetHeight(spell_count * SPELL_HEIGHT)
        frame.obj = self

        local spell_containers = { }

        for i = 1, spell_count do
            -- checkbox
            local check = CreateFrame("Button", nil, frame)
            check:SetPoint("TOPLEFT", 0, (i - 1) * -SPELL_HEIGHT)
            check:SetWidth(24)
            check:SetHeight(SPELL_HEIGHT)
            check:Show()
            check:SetScript("OnClick", CheckBox_OnClick)

            local checkbg = check:CreateTexture(nil, "ARTWORK")
            checkbg:SetAllPoints()
            checkbg:SetTexture("Interface\\Buttons\\UI-CheckBox-Up")

            local checktex = check:CreateTexture(nil, "OVERLAY")
            checktex:SetAllPoints(checkbg)
            checktex:SetTexture("Interface\\Buttons\\UI-CheckBox-Check")
            check.checktex = checktex

            local highlight = check:CreateTexture(nil, "HIGHLIGHT")
            highlight:SetTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
            highlight:SetBlendMode("ADD")
            highlight:SetAllPoints(checkbg)

            -- up button
            local upbtn = CreateFrame("Button", nil, frame)
            upbtn:SetPoint("TOPLEFT", check, "TOPRIGHT")
            upbtn:SetWidth(24)
            upbtn:SetHeight(24)
            upbtn:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollUp-Up")
            upbtn:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollUp-Down")
            upbtn:SetDisabledTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollUp-Disabled")
            upbtn:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
            upbtn:SetScript("OnClick", UpButton_Click)

            -- down button
            local downbtn = CreateFrame("Button", nil, frame)
            downbtn:SetPoint("TOPLEFT", upbtn, "TOPRIGHT")
            downbtn:SetWidth(24)
            downbtn:SetHeight(24)
            downbtn:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Up")
            downbtn:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Down")
            downbtn:SetDisabledTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Disabled")
            downbtn:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
            downbtn:SetScript("OnClick", DownButton_Click)

            -- label
            local label = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            label:SetPoint("TOPLEFT", downbtn, "TOPRIGHT")
            label:SetWidth(200)
            label:SetHeight(SPELL_HEIGHT)
            label:SetJustifyH("LEFT")
            label:SetJustifyV("MIDDLE")

            -- label frame
            local label_frame = CreateFrame("Frame", nil, frame)
            label_frame:SetAllPoints(label)
            label_frame:EnableMouse()
            label_frame:SetScript("OnEnter", LabelFrame_OnEnter)
            label_frame:SetScript("OnLeave", LabelFrame_OnLeave)
            label_frame:SetScript("OnMouseUp", LabelFrame_OnMouseUp)

            check.obj = label_frame
            upbtn.obj = label_frame
            downbtn.obj = label_frame

            label_frame.obj = widget
            label_frame.check = check
            label_frame.label = label
            label_frame.upbtn = upbtn
            label_frame.downbtn = downbtn

            spell_containers[i] = label_frame
        end

        widget.frame = frame
        widget.spell_containers = spell_containers
        widget.spells = spells
        widget.active_spellids = PlexusStatusExternals.db.profile.alert_externals.active_spellids
        widget.inactive_spellids = PlexusStatusExternals.db.profile.alert_externals.inactive_spellids

        AceGUI:RegisterAsWidget(widget)

        return widget
    end

    AceGUI:RegisterWidgetType(widgetType, Constructor, widgetVersion)
end

local tankingbuffs
if Plexus:IsRetailWow() then
tankingbuffs = {
    --["DEATHKNIGHT"] = {
    --    48707, -- Anti-Magic Shell
    --    50461, -- Anti-Magic Zone
    --    77535, -- Blood Shield
    --    195181, -- Bone Shield
    --    49028, -- Dancing Rune Weapon
    --    48792, -- Icebound Fortitude
    --    55233, -- Vampiric Blood
    --},
    --["DEMONHUNTER"] = {
    --    198589, -- Blur
    --    209426,  -- Darkness
    --    203819,  -- Demon Spikes
    --    187827,  -- Metamorphosis
    --    207810,  -- Nether Bond
    --},
    --["DRUID"] = {
    --    22812,  -- Barkskin
    --    102351, -- Cenarion Ward
    --    102342, -- Ironbark
    --    192081, -- Ironfur
    --    105737, -- Might of Ursoc (Mass Regeneration tier bonus)
    --    61336,  -- Survival Instincts
    --    740,    -- Tranquility
    --},
    --["EVOKER"] = {
    --    357170, -- Time Dilation
    --    363534, -- Rewind
    --    363916, -- Obsidian Scale
    --    374348, -- Renewing Blaze
    --    360827, -- Blistering Scales
    --},
    --["HUNTER"] = {
    --    186265,  -- Aspect of the Turtle
    --    19263,  -- Deterrence
    --},
    --["MAGE"] = {
    --    11426,  -- Ice Barrier
    --    235313, -- Blazing Barrier
    --    235450, -- Prismatic Barrier
    --    45438,  -- Ice Block
    --    113862, -- Greater Invisibility
    --},
    --["MONK"] = {
    --    122278, -- Dampen Harm
    --    122783, -- Diffuse Magic
    --    115308, -- Elusive Brew
    --    243435, -- Fortifying Brew
    --    116849, -- Life Cocoon
    --    124275, -- Light Stagger
    --    124274, -- Moderate Stagger
    --    124273, -- Heavy Stagger
    --    115176, -- Zen Meditation
    --},
    --["PALADIN"] = {
    --    31850,   -- Ardent Defender
    --    1044,    -- Blessing of Freedom
    --    1022,    -- Blessing of Protection
    --    6940,    -- Blessing of Sacrifice
    --    204018,  -- Blessing of Spellwarding
    --    465,     -- Devotion Aura
    --    498,     -- Divine Protection
    --    642,     -- Divine Shield
    --    86659,   -- Guardian of Ancient Kings
    --    132403,  -- Shield of the Righteous
    --    184662,  -- Shield of Vengeance
    --},
    --["PRIEST"] = {
    --    47585,  -- Dispersion
    --    64843,  -- Divine Hymn
    --    47788,  -- Guardian Spirit
    --    33206,  -- Pain Suppression
    --    81782,  -- Power Word: Barrier
    --    15286,  -- Vampiric Embrace
    --},
    --["ROGUE"] = {
    --    31224,  -- Cloak of Shadows
    --    5277,   -- Evasion
    --    1966,   -- Feint
    --    76577,  -- Smoke Bomb
    --},
    --["SHAMAN"] = {
    --    207399, -- Ancestral Protection Totem
    --    108271, -- Astral Shift
    --    98008,  -- Spirit Link Totem
    --    114893, -- Stone Bulwark Totem
    --},
    --["WARLOCK"] = {
    --    108359, -- Dark Regeneration
    --    212295, -- Nether Ward
    --    108416, -- Dark Pact
    --    104773, -- Unending Resolve
    --},
    --["WARRIOR"] = {
    --    118038, -- Die by the Sword
    --    190456, -- Ignore Pain
    --    12975,  -- Last Stand
    --    97463,  -- Commanding Shout
    --    122973, -- Safeguard
    --    2565,   -- Shield Block
    --    871,    -- Shield Wall
    --    23920,  -- Spell Reflection
    --    114030, -- Vigilance
    --}
}
end

if Plexus:IsClassicWow() then
    tankingbuffs = {
        ["DRUID"] = {
            22812,  -- Barkskin
            740,    -- Tranquility
        },
        ["HUNTER"] = {
            19263,  -- Deterrence
        },
        ["MAGE"] = {
            11426,  -- Ice Barrier
            168, -- Frost Armor
        },
        ["PALADIN"] = {
            1044,    -- Blessing of Freedom
            1022,    -- Blessing of Protection
            6940,    -- Blessing of Sacrifice
            465,     -- Devotion Aura
            498,     -- Divine Protection
            642,     -- Divine Shield
        },
        ["PRIEST"] = {
            15286,  -- Vampiric Embrace
        },
        ["ROGUE"] = {
            5277,   -- Evasion
        },
        ["SHAMAN"] = {
        },
        ["WARLOCK"] = {
        },
        ["WARRIOR"] = {
            12975,  -- Last Stand
            2565,   -- Shield Block
            871,    -- Shield Wall
        }
    }
    end

if Plexus:IsTBCWow() or Plexus:IsWrathWow() or Plexus:IsCataWow() then
tankingbuffs = {
    ["DRUID"] = {
        22812,  -- Barkskin
        740,    -- Tranquility
    },
    ["HUNTER"] = {
        19263,  -- Deterrence
    },
    ["MAGE"] = {
        11426,  -- Ice Barrier
        168, -- Frost Armor
    },
    ["PALADIN"] = {
        1044,    -- Blessing of Freedom
        1022,    -- Blessing of Protection
        6940,    -- Blessing of Sacrifice
        465,     -- Devotion Aura
        498,     -- Divine Protection
        642,     -- Divine Shield
    },
    ["PRIEST"] = {
        15286,  -- Vampiric Embrace
    },
    ["ROGUE"] = {
        5277,   -- Evasion
    },
    ["SHAMAN"] = {
    },
    ["WARLOCK"] = {
    },
    ["WARRIOR"] = {
        12975,  -- Last Stand
        2565,   -- Shield Block
        871,    -- Shield Wall
    }
}
end

PlexusStatusExternals.tankingbuffs = tankingbuffs --luacheck: ignore 112

-- locals
local PlexusRoster = Plexus:GetModule("PlexusRoster") --luacheck: ignore 211
local GetSpellInfo = C_Spell and C_Spell.GetSpellInfo and C_Spell.GetSpellInfo or GetSpellInfo
local UnitBuff = UnitBuff
local UnitGUID = UnitGUID
local GetAuraDataByAuraInstanceID
local ForEachAura
if Plexus:IsRetailWow() then
    GetAuraDataByAuraInstanceID = C_UnitAuras.GetAuraDataByAuraInstanceID
    ForEachAura = AuraUtil.ForEachAura
end

local settings
local spellnames = {} --luacheck: ignore 241
local spellid_list = {}

if Plexus:IsRetailWow() then
PlexusStatusExternals.defaultDB = { --luacheck: ignore 112
    debug = false,
    alert_externals = {
        enable = true,
        color = { r = 1, g = 1, b = 0, a = 1 },
        priority = 99,
        range = false,
        showtextas = "caster",
        active_spellids =  { -- default spells
            --86659,	-- Guardian of Ancient Kings
            --31850,	-- Ardent Defender
            --642,     -- Divine Shield
            --498,     -- Divine Protection
            --132403,  -- Shield of the Righteous
            --184662,  -- Shield of Vengeance
            --48792, 	-- Icebound Fortitude
            --195181, -- Bone Shield
            --48707, -- Anti-Magic Shell
            --49028, -- Dancing Rune Weapon
            --55233, -- Vampiric Blood
            --77535, -- Blood Shield
            --61336,	-- Survival Instincts
            --22812,  -- Barkskin
            --102351, -- Cenarion Ward
            --192081, -- Ironfur
            --102342, -- Ironbark
            --243435, -- Fortifying Brew
            --115308, -- Elusive Brew
            --122278, -- Dampen Harm
            --122783, -- Diffuse Magic
            --115176, -- Zen Meditation
            --871,	-- Shield Wall
            --12975,  -- Last Stand
            --23920,  -- Spell Reflection
            --190456, -- Ignore Pain
            --2565,   -- Shield Block
            --114030, -- Vigilance
            --187827,  -- Metamorphosis
            --203819,  -- Demon Spikes
            --209426,  -- Darkness
            --198589, -- Blur
            --97463,  -- Commanding Shout
            --740,    -- Tranquility
            --357170, -- Time Dilation
            --363534, -- Rewind
            --363916, -- Obsidian Scale
            --374348, -- Renewing Blaze
            --360827, -- Blistering Scales
            --64843,  -- Divine Hymn
            --207399, -- Ancestral Protection Totem
            --98008,  -- Spirit Link Totem
            --114893, -- Stone Bulwark Totem
            --81782,  -- Power Word: Barrier
            --50461, -- Anti-Magic Zone
            --15286,  -- Vampiric Embrace
            --47788,	-- Guardian Spirit
            --33206,	-- Pain Suppression
            --6940, 	-- Hand of Sacrifice
            --116849, -- Life Cocoon
            --124275, -- Light Stagger
            --124274, -- Moderate Stagger
            --124273, -- Heavy Stagger
            --118038, -- Die by the Sword
            --186265,  -- Aspect of the Turtle
            --45438,  -- Ice Block
            --11426,  -- Ice Barrier
            --235313, -- Blazing Barrier
            --235450, -- Prismatic Barrier
            --47585,  -- Dispersion
            --31224,  -- Cloak of Shadows
            --5277,   -- Evasion
            --1966,   -- Feint
            --76577,  -- Smoke Bomb
            --108271, -- Astral Shift
            --108416, -- Dark Pact
            --104773, -- Unending Resolve
            --1044,    -- Blessing of Freedom
            --1022,    -- Blessing of Protection
            --204018,  -- Blessing of Spellwarding
            --465,     -- Devotion Aura
        },
        inactive_spellids = { -- used to remember priority of disabled spells
        }
    }
}
end

if Plexus:IsClassicWow() or Plexus:IsTBCWow() or Plexus:IsWrathWow() or Plexus:IsCataWow() then
PlexusStatusExternals.defaultDB = { --luacheck: ignore 112
    debug = false,
    alert_externals = {
        enable = true,
        color = { r = 1, g = 1, b = 0, a = 1 },
        priority = 99,
        range = false,
        showtextas = "caster",
        active_spellids =  { -- default spells
            --871,    -- Shield Wall
            --12975, -- Last Stand
            --2565,   -- Shield Block
            --498, -- Divine Protection
            --642, -- Divine Shield
            --22812, -- Barkskin
            --740,    -- Tranquility
            --1022,    -- Blessing of Protection
            --6940,    -- Blessing of Sacrifice
            --1044,    -- Blessing of Freedom
            --465,   -- Devotion Aura
            --19263, -- Deterrence
            --11426,  -- Ice Barrier
            --168, -- Frost Armor
            --5277,   -- Evasion
            --15286,  -- Vampiric Embrace
        },
        inactive_spellids = { -- used to remember priority of disabled spells
        }
    }
}
end

local myoptions = {}
if not Plexus:IsRetailWow() then
    myoptions = {
        ["PSE_header_1"] = {
            type = "header",
            order = 200,
            name = "Options",
        },
        ["showtextas"] = {
            order = 201,
            type = "select",
            name = "Show text as",
            desc = "Text to show when assigned to an indicator capable of displaying text",
            values = { ["caster"] = "Caster name", ["spell"] = "Spell name" },
            style = "radio",
            get = function() return PlexusStatusExternals.db.profile.alert_externals.showtextas end,
            set = function(_, v) PlexusStatusExternals.db.profile.alert_externals.showtextas = v end, --luacheck: ignore 112
        },
        ["PSE_header_2"] = {
            type = "header",
            order = 203,
            name = "Spells",
        },
        ["spells_description"] = {
            type = "description",
            order = 204,
            name = "Check the spells that you want PlexusStatusExternals to keep track of. Their position on the list defines their priority in the case that a unit has more than one of them.",
        },
        ["spells"] = {
            type = "input",
            order = 205,
            name = "Spells",
            control = "PSE-SpellsConfig",
        },
    }
end

function PlexusStatusExternals:OnInitialize() --luacheck: ignore 112
    self.super.OnInitialize(self)

    if not Plexus:IsRetailWow() then
        for class, buffs in pairs(tankingbuffs) do --luacheck: ignore 213
            for _, spellid in pairs(buffs) do
                local spellInfo = GetSpellInfo(spellid)
                local sname = spellInfo and spellInfo.name or nil
                if not sname then print(spellid, ": Bad spellid") end
                spellnames[spellid] = sname or tostring(spellid)
            end
        end
    end

    self:RegisterStatus("alert_externals", "External cooldowns", myoptions, true)

    settings = self.db.profile.alert_externals

    if not Plexus:IsRetailWow() then
        -- delete old format settings
        if settings.spellids then
            settings.spellids = nil
        end

        -- remove old spellids
        for p, aspellid in ipairs(settings.active_spellids) do
            local found = false
            for class, buffs in pairs(tankingbuffs) do --luacheck: ignore 213
                for _, spellid in pairs(buffs) do
                    if spellid == aspellid then
                        found = true
                        break
                    end
                end
            end

            if not found then
                table.remove(settings.active_spellids, p)
            end

            -- remove duplicates
            for i = #settings.active_spellids, p + 1, -1 do
                if settings.active_spellids[i] == aspellid then
                    table.remove(settings.active_spellids, i)
                end
            end
        end
        self:UpdateAuraScanList()
    end
end

function PlexusStatusExternals:UpdateAuraScanList() --luacheck: ignore 212 112
    if settings.active_spellids == nil then
        return
    end
    spellid_list = {}

    for _, spellid in ipairs(settings.active_spellids) do
        spellid_list[spellid] = true
    end
end

function PlexusStatusExternals:OnStatusEnable(status) --luacheck: ignore 112
    if status == "alert_externals" then
        if Plexus:IsRetailWow() then
            self:RegisterEvent("UNIT_AURA", "ScanUnitByAuraInfo")
        else
            self:RegisterEvent("UNIT_AURA", "ScanUnit")
        end
        self:RegisterMessage("Plexus_UnitJoined")
        self:UpdateAllUnits()
    end
end

function PlexusStatusExternals:OnStatusDisable(status) --luacheck: ignore 112
    if status == "alert_externals" then
        self:UnregisterEvent("UNIT_AURA")
        self:UnregisterMessage("Plexus_UnitJoined")
        self.core:SendStatusLostAllUnits("alert_externals")
    end
end

function PlexusStatusExternals:Plexus_UnitJoined(_, guid, unitid) --luacheck: ignore 112
    if Plexus:IsRetailWow() then
        self:ScanUnitByAuraInfo(_, unitid, {isFullUpdate = true})
    end
    if Plexus:IsClassicWow() or Plexus:IsTBCWow() or Plexus:IsWrathWow() then
        self:ScanUnit("Plexus_UnitJoined", unitid, guid)
    end
end

function PlexusStatusExternals:UpdateAllUnits() --luacheck: ignore 112
    for guid, unitid in PlexusRoster:IterateRoster() do
        if Plexus:IsRetailWow() then
            self:ScanUnitByAuraInfo(_, unitid, {isFullUpdate = true})
        else
            self:ScanUnit("UpdateAllUnits", unitid, guid)
        end
    end
    if not Plexus:IsRetailWow() then
        self:UpdateAuraScanList()
    end
end

local unitAuras
function PlexusStatusExternals:ScanUnitByAuraInfo(event, unit, updatedAuras)
    if not unit then return end
    local guid = UnitGUID(unit)
    if not guid then
        return
    end
    if not unitAuras then
        unitAuras = {}
    end
    if not PlexusRoster:IsGUIDInRaid(guid) then
        return
    end
    if Plexus.IsSpecialUnit[unit] then
        return
    end

    local filter = "HELPFUL|EXTERNAL_DEFENSIVE"
    local result = C_UnitAuras.GetUnitAuras(unit, filter , 1 , Enum.UnitAuraSortRule.ExpirationOnly , Enum.UnitAuraSortDirection.Normal)
    --local dur = result and result[1] and C_UnitAuras.GetAuraDurationRemainingByAuraInstanceID(unit, result[1].auraInstanceID)
    if result and result[1] then
        self.core:SendStatusGained(
            guid, "alert_externals", settings.priority, (settings.range and 40),
            nil, nil, nil, nil, result[1].icon, nil, dur, result[1].applications, nil, result[1].expirationTime)
    else
        self.core:SendStatusLost(guid, "alert_externals")
    end
    return

    ---- Full Update
    --if updatedAuras and updatedAuras.isFullUpdate then
    --    local unitauraInfo = {}
    --    ForEachAura(unit, "HELPFUL", nil,
    --        function(aura)
    --            if aura and aura.auraInstanceID then
    --                unitauraInfo[aura.auraInstanceID] = aura
    --            end
    --        end,
    --    true)
--
    --    if unitAuras[guid] then
    --        unitAuras[guid] = nil
    --        self.core:SendStatusLost(guid, "alert_externals")
    --    end
--
    --    for _, v in pairs(unitauraInfo) do
    --        if not unitAuras[guid] then
    --            unitAuras[guid] = {}
    --        end
    --        if v.spellId and spellid_list[v.spellId] then
    --            unitAuras[guid][v.auraInstanceID] = v
    --        end
    --    end
    --end
--
    --if updatedAuras and updatedAuras.addedAuras then
    --    for _, aura in pairs(updatedAuras.addedAuras) do
    --        if aura.spellId and spellid_list[aura.spellId] then
    --            if not unitAuras[guid] then
    --                unitAuras[guid] = {}
    --            end
    --            unitAuras[guid][aura.auraInstanceID] = aura
    --        end
    --    end
    --end
--
    --if updatedAuras and updatedAuras.updatedAuraInstanceIDs then
    --    for _, auraInstanceID in ipairs(updatedAuras.updatedAuraInstanceIDs) do
    --        local auraTable = GetAuraDataByAuraInstanceID(unit, auraInstanceID)
    --        if unitAuras[guid] and unitAuras[guid][auraInstanceID] and not auraTable then
    --            self.core:SendStatusLost(guid, "alert_externals")
    --            unitAuras[guid][auraInstanceID] = nil
    --        end
    --        if auraTable and auraTable.spellId and spellid_list[auraTable.spellId] then
    --            if not unitAuras[guid] then
    --                unitAuras[guid] = {}
    --            end
    --            unitAuras[guid][auraInstanceID] = auraTable
    --        end
    --    end
    --end
--
    --if updatedAuras and updatedAuras.removedAuraInstanceIDs then
    --    for _, auraInstanceID in ipairs(updatedAuras.removedAuraInstanceIDs) do
    --        if unitAuras[guid] and unitAuras[guid][auraInstanceID] then
    --            unitAuras[guid][auraInstanceID] = nil
    --            self.core:SendStatusLost(guid, "alert_externals")
    --        end
    --    end
    --end
--
    --if unitAuras[guid] then
    --    local numAuras = 0
    --    for instanceID, info in pairs(unitAuras[guid]) do
    --        if unitAuras[guid][instanceID] then
    --            numAuras = numAuras + 1
    --            local name, uicon, count, duration, expirationTime, caster = info.name, info.icon, info.applications, info.duration, info.expirationTime, info.sourceUnit
    --            local text
    --            if settings.showtextas == "caster" and caster then
    --                text = UnitName(caster)
    --            else
    --                text = name
    --            end
    --            self.core:SendStatusGained(guid,
    --                "alert_externals",
    --                settings.priority,
    --                (settings.range and 40),
    --                settings.color,
    --                text,
    --                0,							-- value
    --                nil,						-- maxValue
    --                uicon,						-- icon
    --                expirationTime - duration,	-- start
    --                duration,					-- duration
    --                count                       -- stack
    --            )
    --        end
    --    end
--
    --    if numAuras == 0 then
    --        unitAuras[guid] = nil
    --        self.core:SendStatusLost(guid, "alert_externals")
    --    end
    --end
end

function PlexusStatusExternals:ScanUnit(_, unitid, unitguid) --luacheck: ignore 112
    if not unitguid then unitguid = UnitGUID(unitid) end
    if not PlexusRoster:IsGUIDInRaid(unitguid) then
        return
    end

    local name, uicon, count, duration, expirationTime, caster, spellId

    for i =1, 40 do
        if Plexus:IsRetailWow() or Plexus:IsTBCWow() or Plexus:IsWrathWow() then
            name, uicon, count, _, duration, expirationTime, caster, _, _, spellId = UnitAura(unitid, i, "HELPFUL")
        end
        if Plexus:IsClassicWow() then
            name, uicon, count, _, duration, expirationTime, caster, _, _, spellId = UnitBuff(unitid, i)
        end
        if not spellId then
            break
        end

        if spellid_list[spellId] then
            local text
            if settings.showtextas == "caster" then
                if caster then
                    text = UnitName(caster)
                end
            else
                if not name then
                    break
                else
                    text = name
                end
            end

            self.core:SendStatusGained(unitguid,
                "alert_externals",
                settings.priority,
                (settings.range and 40),
                settings.color,
                text,
                0,							-- value
                nil,						-- maxValue
                uicon,						-- icon
                expirationTime - duration,	-- start
                duration,					-- duration
                count                       -- stack
            )
            return
        end
    end

    self.core:SendStatusLost(unitguid, "alert_externals")
end