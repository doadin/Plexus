local _, Plexus = ...
local PlexusRoster = Plexus:GetModule("PlexusRoster")

local GetSpellInfo = _G.GetSpellInfo
local GetSpellTexture = _G.GetSpellTexture
local InCombatLockdown = _G.InCombatLockdown

local UnitAura, UnitClass, UnitGUID, UnitIsPlayer, UnitIsVisible, UnitIsDead, UnitIsGhost
    = _G.UnitAura, _G.UnitClass, _G.UnitGUID, _G.UnitIsPlayer, _G.UnitIsVisible, _G.UnitIsDead, _G.UnitIsGhost

local UnitInPartyIsAI
if Plexus:IsRetailWow() then
    UnitInPartyIsAI = _G.UnitInPartyIsAI
end

local PlexusStatusGroupBuffs = Plexus:NewStatusModule("PlexusStatusGroupBuffs")
PlexusStatusGroupBuffs.menuName = "Group Buffs"
PlexusStatusGroupBuffs.options = false

local spellNameList
local spellIconList
if Plexus:IsRetailWow() then
spellNameList = {
    ["Power Word: Fortitude"] = GetSpellInfo(21562),

    ["Arcane Intellect"] = GetSpellInfo(1459),

    ["Mark of the Wild"] = GetSpellInfo(1126),

    ["Battle Shout"] = GetSpellInfo(6673),

    ["Blessing of the Bronze"] = GetSpellInfo(381748),
}

spellIconList = {
    ["Power Word: Fortitude"] = GetSpellTexture(21562),

    ["Arcane Intellect"] = GetSpellTexture(1459),

    ["Mark of the Wild"] = GetSpellTexture(1126),

    ["Battle Shout"] = GetSpellTexture(6673),

    ["Blessing of the Bronze"] = GetSpellTexture(381748),
}

PlexusStatusGroupBuffs.defaultDB = {
    debug = false,
    EnableClassFilter = false,
    --alert_groupbuffs = {
    --	class = true,
    --	enable = true,
    --	priority = 40,
    --	color = { r = 1, g = 1, b = 0, a = 1 },
    --},
    buffGroup_Fortitude = {
        text = spellNameList["Power Word: Fortitude"],
        desc = "Buff Group: "..spellNameList["Power Word: Fortitude"],
        icon = spellIconList["Power Word: Fortitude"],
        buffs = {
            spellNameList["Power Word: Fortitude"],
        },
        enable = true,
        color = { r = 0, g = 0, b = 1, a = 1 },
        priority = 99,
        class = "PRIEST",
        hidden = true,
    },
    buffGroup_Intellect = {
        text = spellNameList["Arcane Intellect"],
        desc = "Buff Group: "..spellNameList["Arcane Intellect"],
        icon = spellIconList["Arcane Intellect"],
        buffs = {
            spellNameList["Arcane Intellect"],
        },
        enable = true,
        color = { r = 0, g = 0, b = 1, a = 1 },
        priority = 99,
        class = "MAGE",
        hidden = true,
    },
    buffGroup_Wild = {
        text = spellNameList["Mark of the Wild"],
        desc = "Buff Group: "..spellNameList["Mark of the Wild"],
        icon = spellIconList["Mark of the Wild"],
        buffs = {
            spellNameList["Mark of the Wild"],
        },
        enable = true,
        color = { r = 0, g = 0, b = 1, a = 1 },
        priority = 99,
        class = "DRUID",
        hidden = true,
    },
    buffGroup_Battle_Shout = {
        text = spellNameList["Battle Shout"],
        desc = "Buff Group: "..spellNameList["Battle Shout"],
        icon = spellIconList["Battle Shout"],
        buffs = {
            spellNameList["Battle Shout"],
        },
        enable = true,
        color = { r = 0, g = 0, b = 1, a = 1 },
        priority = 99,
        class = "WARRIOR",
        hidden = true,
    },
    buffGroup_Bronze = {
        text = spellNameList["Blessing of the Bronze"],
        desc = "Buff Group: "..spellNameList["Blessing of the Bronze"],
        icon = spellIconList["Blessing of the Bronze"],
        buffs = {
            spellNameList["Blessing of the Bronze"],
        },
        enable = true,
        color = { r = 0, g = 0, b = 1, a = 1 },
        priority = 99,
        class = "EVOKER",
        hidden = true,
    }
}
end

PlexusStatusGroupBuffs.options = {
    name = "Group Buffs",
    desc = "Options for Group Buffs.",
    type = "group",
    childGroups = "tree",
    disabled = InCombatLockdown,
    get = function(info)
        local k = info[#info]
        return PlexusStatusGroupBuffs.db.profile[k]
    end,
    set = function(info, v)
        local k = info[#info]
        PlexusStatusGroupBuffs.db.profile[k] = v
        PlexusStatusGroupBuffs:UpdateAllUnits()
    end,
    args = {
        EnableClassFilter = {
            name = "Enable Class Filter",
            desc = "Enable showing status if your class can cast buff.",
            order = 1, width = "double",
            type = "toggle",
        },
    },
}

if Plexus:IsClassicWow() then
spellNameList = {
    ["Power Word: Fortitude"] = GetSpellInfo(1243),
    ["Prayer of Fortitude"] = GetSpellInfo(21562),
    ["Divine Spirit"] = GetSpellInfo(27841),
    ["Prayer of Spirit"] = GetSpellInfo(27681),

    ["Arcane Intellect"] = GetSpellInfo(1472),
    ["Arcane Brilliance"] = GetSpellInfo(23028),

    ["Battle Shout"] = GetSpellInfo(6673),

    ["Blessing of Kings"] = GetSpellInfo(20217),
    ["Greater Blessing of Kings"] = GetSpellInfo(25898),
    ["Blessing of Might"] = GetSpellInfo(19740),
    ["Greater Blessing of Might"] = GetSpellInfo(25782),
    ["Blessing of Sanctuary"] = GetSpellInfo(20911),
    ["Greater Blessing of Sanctuary"] = GetSpellInfo(25899),
    ["Blessing of Wisdom"] = GetSpellInfo(19742),
    ["Greater Blessing of Wisdom"] = GetSpellInfo(25894),

    ["Mark of the Wild"] = GetSpellInfo(1126),
    ["Gift of the Wild"] = GetSpellInfo(21849),
}

spellIconList = {
    ["Power Word: Fortitude"] = GetSpellTexture(1243),
    ["Prayer of Fortitude"] = GetSpellTexture(21562),
    ["Divine Spirit"] = GetSpellTexture(27841),
    ["Prayer of Spirit"] = GetSpellInfo(27681),

    ["Arcane Intellect"] = GetSpellTexture(1472),
    ["Arcane Brilliance"] = GetSpellInfo(23028),

    ["Battle Shout"] = GetSpellTexture(6673),

    ["Blessing of Kings"] = GetSpellTexture(20217),
    ["Greater Blessing of Kings"] = GetSpellTexture(25898),
    ["Blessing of Might"] = GetSpellTexture(19740),
    ["Greater Blessing of Might"] = GetSpellTexture(25782),
    ["Blessing of Sanctuary"] = GetSpellTexture(20911),
    ["Greater Blessing of Sanctuary"] = GetSpellTexture(25899),
    ["Blessing of Wisdom"] = GetSpellTexture(19742),
    ["Greater Blessing of Wisdom"] = GetSpellTexture(25894),

    ["Mark of the Wild"] = GetSpellTexture(1126),
    ["Gift of the Wild"] = GetSpellTexture(21849),
}

PlexusStatusGroupBuffs.defaultDB = {
    debug = false,
    EnableClassFilter = false,
    --alert_groupbuffs = {
    --	class = true,
    --	enable = true,
    --	priority = 40,
    --	color = { r = 1, g = 1, b = 0, a = 1 },
    --},
    buffGroup_Fortitude = {
        text = spellNameList["Power Word: Fortitude"],
        desc = "Buff Group: "..spellNameList["Power Word: Fortitude"],
        icon = spellIconList["Power Word: Fortitude"],
        buffs = {
            spellNameList["Power Word: Fortitude"],
            spellNameList["Prayer of Fortitude"]
        },
        enable = true,
        color = { r = 0, g = 0, b = 1, a = 1 },
        priority = 99,
        class = "PRIEST",
    },
    buffGroup_Spirit = {
        text = spellNameList["Divine Spirit"],
        desc = "Buff Group: "..spellNameList["Divine Spirit"],
        icon = spellIconList["Divine Spirit"],
        buffs = {
            spellNameList["Divine Spirit"],
            spellNameList["Prayer of Spirit"]
        },
        enable = true,
        color = { r = 0, g = 0, b = 1, a = 1 },
        priority = 99,
        class = "PRIEST",
    },
    buffGroup_Intellect = {
        text = spellNameList["Arcane Intellect"],
        desc = "Buff Group: "..spellNameList["Arcane Intellect"],
        icon = spellIconList["Arcane Intellect"],
        buffs = {
            spellNameList["Arcane Intellect"],
            spellNameList["Arcane Brilliance"]
        },
        enable = true,
        color = { r = 0, g = 0, b = 1, a = 1 },
        priority = 99,
        class = "MAGE",
    },
    buffGroup_Battle_Shout = {
        text = spellNameList["Battle Shout"],
        desc = "Buff Group: "..spellNameList["Battle Shout"],
        icon = spellIconList["Battle Shout"],
        buffs = {
            spellNameList["Battle Shout"]
        },
        enable = true,
        color = { r = 0, g = 0, b = 1, a = 1 },
        priority = 99,
        class = "WARRIOR",
    },
    buffGroup_Wild = {
        text = spellNameList["Mark of the Wild"],
        desc = "Buff Group: "..spellNameList["Mark of the Wild"],
        icon = spellIconList["Mark of the Wild"],
        buffs = {
            spellNameList["Mark of the Wild"],
            spellNameList["Gift of the Wild"]
        },
        enable = true,
        color = { r = 0, g = 0, b = 1, a = 1 },
        priority = 99,
        class = "DRUID",
    },
    buffGroup_Blessing = {
        text = "Paladin Blessings",
        desc = "Buff Group: Paladin Blessings",
        icon = spellIconList["Blessing of Kings"],
        buffs = {
            spellNameList["Blessing of Kings"],
            spellNameList["Greater Blessing of Kings"],
            spellNameList["Blessing of Might"],
            spellNameList["Greater Blessing of Might"],
            spellNameList["Blessing of Sanctuary"],
            spellNameList["Greater Blessing of Sanctuary"],
            spellNameList["Blessing of Wisdom"],
            spellNameList["Greater Blessing of Wisdom"]
        },
        enable = true,
        color = { r = 0, g = 0, b = 1, a = 1 },
        priority = 99,
        class = "PALADIN",
    }
}
end

if Plexus:IsTBCWow() then
    spellNameList = {
        ["Power Word: Fortitude"] = GetSpellInfo(1243),
        ["Prayer of Fortitude"] = GetSpellInfo(21562),
        ["Divine Spirit"] = GetSpellInfo(27841),
        ["Prayer of Spirit"] = GetSpellInfo(27681),

        ["Arcane Intellect"] = GetSpellInfo(1459),
        ["Arcane Brilliance"] = GetSpellInfo(23028),

        ["Battle Shout"] = GetSpellInfo(6673),

        ["Blessing of Kings"] = GetSpellInfo(20217),
        ["Greater Blessing of Kings"] = GetSpellInfo(25898),
        ["Blessing of Might"] = GetSpellInfo(19740),
        ["Greater Blessing of Might"] = GetSpellInfo(25782),
        ["Blessing of Sanctuary"] = GetSpellInfo(20911),
        ["Greater Blessing of Sanctuary"] = GetSpellInfo(25899),
        ["Blessing of Wisdom"] = GetSpellInfo(19742),
        ["Greater Blessing of Wisdom"] = GetSpellInfo(25894),

        ["Mark of the Wild"] = GetSpellInfo(1126),
        ["Gift of the Wild"] = GetSpellInfo(21849),
    }

    spellIconList = {
        ["Power Word: Fortitude"] = GetSpellTexture(1243),
        ["Prayer of Fortitude"] = GetSpellTexture(21562),
        ["Divine Spirit"] = GetSpellTexture(27841),
        ["Prayer of Spirit"] = GetSpellInfo(27681),

        ["Arcane Intellect"] = GetSpellTexture(1459),
        ["Arcane Brilliance"] = GetSpellInfo(23028),

        ["Battle Shout"] = GetSpellTexture(6673),

        ["Blessing of Kings"] = GetSpellTexture(20217),
        ["Greater Blessing of Kings"] = GetSpellTexture(25898),
        ["Blessing of Might"] = GetSpellTexture(19740),
        ["Greater Blessing of Might"] = GetSpellTexture(25782),
        ["Blessing of Sanctuary"] = GetSpellTexture(20911),
        ["Greater Blessing of Sanctuary"] = GetSpellTexture(25899),
        ["Blessing of Wisdom"] = GetSpellTexture(19742),
        ["Greater Blessing of Wisdom"] = GetSpellTexture(25894),

        ["Mark of the Wild"] = GetSpellTexture(1126),
        ["Gift of the Wild"] = GetSpellTexture(21849),
    }

    PlexusStatusGroupBuffs.defaultDB = {
        debug = false,
        EnableClassFilter = false,
        --alert_groupbuffs = {
        --	class = true,
        --	enable = true,
        --	priority = 40,
        --	color = { r = 1, g = 1, b = 0, a = 1 },
        --},
        buffGroup_Fortitude = {
            text = spellNameList["Power Word: Fortitude"],
            desc = "Buff Group: "..spellNameList["Power Word: Fortitude"],
            icon = spellIconList["Power Word: Fortitude"],
            buffs = {
                spellNameList["Power Word: Fortitude"],
                spellNameList["Prayer of Fortitude"]
            },
            enable = true,
            color = { r = 0, g = 0, b = 1, a = 1 },
            priority = 99,
            class = "PRIEST",
        },
        buffGroup_Spirit = {
            text = spellNameList["Divine Spirit"],
            desc = "Buff Group: "..spellNameList["Divine Spirit"],
            icon = spellIconList["Divine Spirit"],
            buffs = {
                spellNameList["Divine Spirit"],
                spellNameList["Prayer of Spirit"]
            },
            enable = true,
            color = { r = 0, g = 0, b = 1, a = 1 },
            priority = 99,
            class = "PRIEST",
        },
        buffGroup_Intellect = {
            text = spellNameList["Arcane Intellect"],
            desc = "Buff Group: "..spellNameList["Arcane Intellect"],
            icon = spellIconList["Arcane Intellect"],
            buffs = {
                spellNameList["Arcane Intellect"],
                spellNameList["Arcane Brilliance"]
            },
            enable = true,
            color = { r = 0, g = 0, b = 1, a = 1 },
            priority = 99,
            class = "MAGE",
        },
        buffGroup_Battle_Shout = {
            text = spellNameList["Battle Shout"],
            desc = "Buff Group: "..spellNameList["Battle Shout"],
            icon = spellIconList["Battle Shout"],
            buffs = {
                spellNameList["Battle Shout"]
            },
            enable = true,
            color = { r = 0, g = 0, b = 1, a = 1 },
            priority = 99,
            class = "WARRIOR",
        },
        buffGroup_Wild = {
            text = spellNameList["Mark of the Wild"],
            desc = "Buff Group: "..spellNameList["Mark of the Wild"],
            icon = spellIconList["Mark of the Wild"],
            buffs = {
                spellNameList["Mark of the Wild"],
                spellNameList["Gift of the Wild"]
            },
            enable = true,
            color = { r = 0, g = 0, b = 1, a = 1 },
            priority = 99,
            class = "DRUID",
        },
        buffGroup_Blessing = {
            text = "Paladin Blessings",
            desc = "Buff Group: Paladin Blessings",
            icon = spellIconList["Blessing of Kings"],
            buffs = {
                spellNameList["Blessing of Kings"],
                spellNameList["Greater Blessing of Kings"],
                spellNameList["Blessing of Might"],
                spellNameList["Greater Blessing of Might"],
                spellNameList["Blessing of Sanctuary"],
                spellNameList["Greater Blessing of Sanctuary"],
                spellNameList["Blessing of Wisdom"],
                spellNameList["Greater Blessing of Wisdom"]
            },
            enable = true,
            color = { r = 0, g = 0, b = 1, a = 1 },
            priority = 99,
            class = "PALADIN",
        }
    }
end

local extraOptionsForStatus = {
    --enable = false, -- you can't disable this
}

function PlexusStatusGroupBuffs:OnInitialize()
    self.super.OnInitialize(self)
    self:RegisterStatuses()
end

function PlexusStatusGroupBuffs:OnEnable()
    self.debugging = self.db.profile.debug

    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("UNIT_AURA", "UpdateUnit")
    self:RegisterMessage("Plexus_UnitJoined")
end


function PlexusStatusGroupBuffs:PLAYER_ENTERING_WORLD()
    self:UpdateAllUnits()
end

function PlexusStatusGroupBuffs:Plexus_UnitJoined(event, guid, unit) --luacheck: ignore 212
    --self:RegisterMessage("Plexus_UnitJoined", guid, roster.unitid[guid])
    --self:Debug("Plexus_UnitJoined", unit)
    self:UpdateUnit(event, unit, _, guid)
end

function PlexusStatusGroupBuffs:RegisterStatuses()
    local desc

    --self:RegisterStatus("alert_groupbuffs", "Settings", extraOptionsForStatus)
    for status, settings in self:ConfiguredStatusIterator() do
        desc = settings.desc or settings.text or ""
        self:Debug("registering", status, desc)
        self:RegisterStatus(status, desc, extraOptionsForStatus, false)
    end
end

function PlexusStatusGroupBuffs:UnregisterStatuses()
    for status, moduleName, desc in self.core:RegisteredStatusIterator() do
        if (moduleName == self.name) then
            self:Debug("unregistering", status, desc)
            self:UnregisterStatus(status)
            self.options.args[status] = nil
        end
    end
end

function PlexusStatusGroupBuffs:ConfiguredStatusIterator()
    local profile = self.db.profile
    local status

    return function ()
        status = next(profile, status)

        -- skip any non-table entries
        while status ~= nil and type(profile[status]) ~= "table" do
            status = next(profile, status)
        end

        if status == nil then
            return nil
        end

        return status, profile[status]
    end
end

function PlexusStatusGroupBuffs:Reset()
    self.super.Reset(self)
    self:UnregisterStatuses()
    self:RegisterStatuses()
    self:UpdateAllUnits()
end

function PlexusStatusGroupBuffs:UpdateAllUnits()
    --self:Debug("UpdateAllUnits")
    for guid, unit in PlexusRoster:IterateRoster() do
        if (UnitIsPlayer(unit) or (Plexus:IsRetailWow() and UnitInPartyIsAI(unit))) then
            self:UpdateUnit("UpdateAllUnits", unit, _, guid)
        end
    end
end

function PlexusStatusGroupBuffs:UpdateUnit(event, unit, _, guid)
    if not guid then guid = UnitGUID(unit) end
    if (UnitIsPlayer(unit) or (Plexus:IsRetailWow() and UnitInPartyIsAI(unit))) then
        for status in self:ConfiguredStatusIterator() do
            self:ShowMissingBuffs(event, unit, status, guid)
        end
    end
end

function PlexusStatusGroupBuffs:ShowMissingBuffs(event, unit, status, guid)
    self:Debug("UpdateUnit Event: ", event)
    self:Debug("UpdateUnit Unit: ", unit)
    self:Debug("UpdateUnit GUID: ", guid)
    if not unit then return end
    if not status then return end
    if not guid then return end
    local settings = self.db.profile[status]
    local BuffClass = settings.class
    local EnableClassFilter = self.db.profile.EnableClassFilter
    local _, englishClass= UnitClass("player")

    if not settings.enable then
        self.core:SendStatusLostAllUnits(status)
        return
    end

    if UnitIsDead(unit) or UnitIsGhost(unit) then
        self.core:SendStatusLost(guid, status)
        return
    end

    if EnableClassFilter then
        if BuffClass ~= englishClass then
            --self:Debug("Class Filter is on, we are not the class")
            self.core:SendStatusLost(guid, status)
            return
        end
    end

    if UnitIsVisible(unit) then
        for i = 1, 40 do
            local name = UnitAura(unit, i, "HELPFUL")
            if not name then break end
            for _, buff in pairs(settings.buffs) do
                if name == buff then
                    self.core:SendStatusLost(guid, status)
                    return
                end
            end
        end
    end

    local icon = settings.icon

    self.core:SendStatusGained(
        guid,
        status,
        settings.priority,
        nil,
        settings.color,
        settings.text,
        nil,
        nil,
        icon
    )

end
