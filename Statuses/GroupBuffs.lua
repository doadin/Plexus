local _, Plexus = ...
local PlexusRoster = Plexus:GetModule("PlexusRoster")

local GetSpellInfo = C_Spell and C_Spell.GetSpellInfo or GetSpellInfo
local GetSpellTexture = C_Spell and C_Spell.GetSpellTexture or GetSpellTexture
local InCombatLockdown = InCombatLockdown

local UnitClass, UnitGUID, UnitIsPlayer, UnitIsDead, UnitIsGhost
    = UnitClass, UnitGUID, UnitIsPlayer, UnitIsDead, UnitIsGhost

local GetAuraDataByAuraInstanceID = C_UnitAuras and C_UnitAuras.GetAuraDataByAuraInstanceID
local ForEachAura = AuraUtil and AuraUtil.ForEachAura

local UnitInPartyIsAI = UnitInPartyIsAI

local PlexusStatusGroupBuffs = Plexus:NewStatusModule("PlexusStatusGroupBuffs")
PlexusStatusGroupBuffs.menuName = "Group Buffs"
PlexusStatusGroupBuffs.options = false

local function GetSpellName(spellid)
    local info = GetSpellInfo(spellid)
    if Plexus:IsRetailWow() then
        if info and info.name then
            return info.name
        end
    else
        return info
    end
end

local spellNameList
local spellIconList
if Plexus:IsRetailWow() then
spellNameList = {
    ["Power Word: Fortitude"] = GetSpellName(21562),

    ["Arcane Intellect"] = GetSpellName(1459),

    ["Mark of the Wild"] = GetSpellName(1126),

    ["Battle Shout"] = GetSpellName(6673),

    ["Blessing of the Bronze"] = GetSpellName(381748),

    ["Skyfury"] = GetSpellName(462854),
}

spellIconList = {
    ["Power Word: Fortitude"] = GetSpellTexture(21562),

    ["Arcane Intellect"] = GetSpellTexture(1459),

    ["Mark of the Wild"] = GetSpellTexture(1126),

    ["Battle Shout"] = GetSpellTexture(6673),

    ["Blessing of the Bronze"] = GetSpellTexture(381748),

    ["Skyfury"] = GetSpellTexture(462854),
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
    },
    buffGroup_Skyfury = {
        text = spellNameList["Skyfury"],
        desc = "Buff Group: "..spellNameList["Skyfury"],
        icon = spellIconList["Skyfury"],
        buffs = {
            spellNameList["Skyfury"],
        },
        enable = true,
        color = { r = 0, g = 0, b = 1, a = 1 },
        priority = 99,
        class = "SHAMAN",
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
    ["Power Word: Fortitude"] = GetSpellName(1243),
    ["Prayer of Fortitude"] = GetSpellName(21562),
    ["Divine Spirit"] = GetSpellName(27841),
    ["Prayer of Spirit"] = GetSpellName(27681),

    ["Arcane Intellect"] = GetSpellName(1472),
    ["Arcane Brilliance"] = GetSpellName(23028),

    ["Battle Shout"] = GetSpellName(6673),

    ["Blessing of Kings"] = GetSpellName(20217),
    ["Greater Blessing of Kings"] = GetSpellName(25898),
    ["Blessing of Might"] = GetSpellName(19740),
    ["Greater Blessing of Might"] = GetSpellName(25782),
    ["Blessing of Sanctuary"] = GetSpellName(20911),
    ["Greater Blessing of Sanctuary"] = GetSpellName(25899),
    ["Blessing of Wisdom"] = GetSpellName(19742),
    ["Greater Blessing of Wisdom"] = GetSpellName(25894),

    ["Mark of the Wild"] = GetSpellName(1126),
    ["Gift of the Wild"] = GetSpellName(21849),
}

spellIconList = {
    ["Power Word: Fortitude"] = GetSpellTexture(1243),
    ["Prayer of Fortitude"] = GetSpellTexture(21562),
    ["Divine Spirit"] = GetSpellTexture(27841),
    ["Prayer of Spirit"] = GetSpellName(27681),

    ["Arcane Intellect"] = GetSpellTexture(1472),
    ["Arcane Brilliance"] = GetSpellName(23028),

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
        ["Power Word: Fortitude"] = GetSpellName(1243),
        ["Prayer of Fortitude"] = GetSpellName(21562),
        ["Divine Spirit"] = GetSpellName(27841),
        ["Prayer of Spirit"] = GetSpellName(27681),

        ["Arcane Intellect"] = GetSpellName(1459),
        ["Arcane Brilliance"] = GetSpellName(23028),

        ["Battle Shout"] = GetSpellName(6673),

        ["Blessing of Kings"] = GetSpellName(20217),
        ["Greater Blessing of Kings"] = GetSpellName(25898),
        ["Blessing of Might"] = GetSpellName(19740),
        ["Greater Blessing of Might"] = GetSpellName(25782),
        ["Blessing of Sanctuary"] = GetSpellName(20911),
        ["Greater Blessing of Sanctuary"] = GetSpellName(25899),
        ["Blessing of Wisdom"] = GetSpellName(19742),
        ["Greater Blessing of Wisdom"] = GetSpellName(25894),

        ["Mark of the Wild"] = GetSpellName(1126),
        ["Gift of the Wild"] = GetSpellName(21849),
    }

    spellIconList = {
        ["Power Word: Fortitude"] = GetSpellTexture(1243),
        ["Prayer of Fortitude"] = GetSpellTexture(21562),
        ["Divine Spirit"] = GetSpellTexture(27841),
        ["Prayer of Spirit"] = GetSpellName(27681),

        ["Arcane Intellect"] = GetSpellTexture(1459),
        ["Arcane Brilliance"] = GetSpellName(23028),

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

if Plexus:IsCataWow() then
    spellNameList = {
        --Priest
        ["Power Word: Fortitude"] = GetSpellName(21562),
        --Mage
        ["Arcane Brilliance"] = GetSpellName(1459),
        ["Dalaran Brilliance"] = GetSpellName(61316),
        --Warrior
        ["Battle Shout"] = GetSpellName(6673),
        --Paladin
        ["Blessing of Kings"] = GetSpellName(20217),
        ["Blessing of Might"] = GetSpellName(19740),
        --Druid
        ["Mark of the Wild"] = GetSpellName(1126),
        --Death Knight
        ["Horn of Winter"] = GetSpellName(57330),
        --Hunter
        ["Embrace of the Shale Spider"] = GetSpellName(90363),
    }

    spellIconList = {
        --Priest
        ["Power Word: Fortitude"] = GetSpellTexture(21562),
        --Mage
        ["Arcane Brilliance"] = GetSpellTexture(1459),
        ["Dalaran Brilliance"] = GetSpellTexture(61316),
        --Warrior
        ["Battle Shout"] = GetSpellTexture(6673),
        --Paladin
        ["Blessing of Kings"] = GetSpellTexture(20217),
        ["Blessing of Might"] = GetSpellTexture(19740),
        --Druid
        ["Mark of the Wild"] = GetSpellTexture(1126),
        --Death Knight
        ["Horn of Winter"] = GetSpellTexture(57330),
        --Hunter
        ["Embrace of the Shale Spider"] = GetSpellTexture(90363),
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
                spellNameList["Power Word: Fortitude"]
            },
            enable = true,
            color = { r = 0, g = 0, b = 1, a = 1 },
            priority = 99,
            class = "PRIEST",
        },
        buffGroup_Intellect = {
            text = spellNameList["Arcane Brilliance"],
            desc = "Buff Group: "..spellNameList["Arcane Brilliance"],
            icon = spellIconList["Arcane Brilliance"],
            buffs = {
                spellNameList["Arcane Brilliance"],
                spellNameList["Dalaran Brilliance"],
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
                spellNameList["Battle Shout"],
                spellNameList["Horn of Winter"]
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
                spellNameList["Mark of the Wild"]
            },
            enable = true,
            color = { r = 0, g = 0, b = 1, a = 1 },
            priority = 99,
            class = "DRUID",
        },
        buffGroup_HunterStats = {
            text = "buffGroup_HunterStats",
            desc = "Buff Group: ".."HunterStats",
            icon = spellIconList["Embrace of the Shale Spider"],
            buffs = {
                spellNameList["Embrace of the Shale Spider"]
            },
            enable = true,
            color = { r = 0, g = 0, b = 1, a = 1 },
            priority = 99,
            class = "HUNTER",
        },
        buffGroup_Blessing = {
            text = "Paladin Blessings",
            desc = "Buff Group: Paladin Blessings",
            icon = spellIconList["Blessing of Kings"],
            buffs = {
                spellNameList["Blessing of Kings"],
                spellNameList["Blessing of Might"],
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
            self:UpdateUnit("UpdateAllUnits", unit, {isFullUpdate = true}, guid)
        end
    end
end

local enabledBuffs
function PlexusStatusGroupBuffs:UpdateUnit(event, unit, updatedAuras, guid)
    if not guid then guid = UnitGUID(unit) end
    if not PlexusRoster:IsGUIDInGroup(guid) then return end
    if not enabledBuffs then enabledBuffs = {} end
    if (UnitIsPlayer(unit) or (Plexus:IsRetailWow() and UnitInPartyIsAI(unit))) then
        for status in self:ConfiguredStatusIterator() do
            local settings = self.db.profile[status]
            local BuffClass = settings.class
            local EnableClassFilter = self.db.profile.EnableClassFilter
            local _, englishClass= UnitClass("player")
            if not settings.enable or (UnitIsDead(unit) or UnitIsGhost(unit)) or (EnableClassFilter and BuffClass ~= englishClass) then
                for _,buffName in pairs(settings.buffs) do
                    enabledBuffs[buffName] = nil
                end
                self.core:SendStatusLostAllUnits(status)
            elseif settings.enable then
                --self:ShowMissingBuffs(event, unit, status, guid, updatedAuras)
                for _,buffName in pairs(settings.buffs) do
                    enabledBuffs[buffName] = {settings = settings, status = status}
                end
            end
        end
        self:ShowMissingBuffs(event, unit, guid, updatedAuras)
    end
end

local unitAuras
function PlexusStatusGroupBuffs:ShowMissingBuffs(event, unit, guid, updatedAuras)
    self:Debug("UpdateUnit Event: ", event)
    self:Debug("UpdateUnit Unit: ", unit)
    self:Debug("UpdateUnit GUID: ", guid)
    if not unit then return end
    if not guid then return end
    if not PlexusRoster:IsGUIDInGroup(guid) then return end
    --local settings = self.db.profile[status]
    --local BuffClass = settings.class
    --local EnableClassFilter = self.db.profile.EnableClassFilter
    --local _, englishClass= UnitClass("player")

    --if (UnitIsDead(unit) or UnitIsGhost(unit)) or (EnableClassFilter and BuffClass ~= englishClass) then
    --    self.core:SendStatusLost(guid, status)
    --    if (EnableClassFilter and BuffClass ~= englishClass) then
    --        self:Debug("Class Filter is on, we are not the class")
    --    end
    --    return
    --end

    --for i = 1, 40 do
    --    local name = UnitAura(unit, i, "HELPFUL")
    --    if not name then break end
    --    for _, buff in pairs(settings.buffs) do
    --        if name == buff then
    --            self.core:SendStatusLost(guid, status)
    --            return
    --        end
    --    end
    --end

    if not unitAuras then
        unitAuras = {}
    end

    -- Full Update
    if (updatedAuras and updatedAuras.isFullUpdate) then --or (not updatedAuras.isFullUpdate and (not updatedAuras.addedAuras and not updatedAuras.updatedAuraInstanceIDs and not updatedAuras.removedAuraInstanceIDs)) then
        local unitauraInfo = {}
        if (AuraUtil.ForEachAura) then
            ForEachAura(unit, "HELPFUL", nil,
                function(aura)
                    if aura and aura.auraInstanceID then
                        unitauraInfo[aura.auraInstanceID] = aura
                    end
                end,
            true)
            --ForEachAura(unit, "HARMFUL", nil,
            --    function(aura)
            --        if aura and aura.auraInstanceID then
            --            unitauraInfo[aura.auraInstanceID] = aura
            --        end
            --    end,
            --true)
        else
            for i = 0, 40 do
                local auraData = C_UnitAuras.GetAuraDataByIndex(unit, i, "HELPFUL")
                if auraData then
                    unitauraInfo[auraData.auraInstanceID] = auraData
                end
            end
            --for i = 0, 40 do
            --    local auraData = C_UnitAuras.GetAuraDataByIndex(unit, i, "HARMFUL")
            --    if auraData then
            --        unitauraInfo[auraData.auraInstanceID] = auraData
            --    end
            --end
        end
        if unitAuras[guid] then
            --self.core:SendStatusGained(
            --    guid,
            --    status,
            --    settings.priority,
            --    nil,
            --    settings.color,
            --    settings.text,
            --    nil,
            --    nil,
            --    icon
            --)
            unitAuras[guid] = nil
        end
        for _, v in pairs(unitauraInfo) do
            if not unitAuras[guid] then
                unitAuras[guid] = {}
            end
            if v.spellId == 367364 then
                v.name = "Echo: Reversion"
            end
            if v.spellId == 376788 then
                v.name = "Echo: Dream Breath"
            end
            --if buff_names[v.name] or player_buff_names[v.name] or debuff_names[v.name] or player_debuff_names[v.name] or debuff_types[v.dispelName] then
                unitAuras[guid][v.auraInstanceID] = v
            --end
        end
    end

    if updatedAuras and updatedAuras.addedAuras then
        for _, aura in pairs(updatedAuras.addedAuras) do
            if aura.spellId == 367364 then
                aura.name = "Echo: Reversion"
            end
            if aura.spellId == 376788 then
                aura.name = "Echo: Dream Breath"
            end
            --if buff_names[aura.name] or player_buff_names[aura.name] or debuff_names[aura.name] or player_debuff_names[aura.name] or debuff_types[aura.dispelName] then
                if not unitAuras[guid] then
                    unitAuras[guid] = {}
                end
                unitAuras[guid][aura.auraInstanceID] = aura
            --end
       end
    end

    if updatedAuras and updatedAuras.updatedAuraInstanceIDs then
        for _, auraInstanceID in ipairs(updatedAuras.updatedAuraInstanceIDs) do
            local auraTable = GetAuraDataByAuraInstanceID(unit, auraInstanceID)
            if auraTable and auraTable.spellId == 367364 then
                auraTable.name = "Echo: Reversion"
            end
            if auraTable and auraTable.spellId == 376788 then
                auraTable.name = "Echo: Dream Breath"
            end
            if not unitAuras[guid] then
                unitAuras[guid] = {}
            end
            unitAuras[guid][auraInstanceID] = auraTable
            --if auraTable then
            --    --if buff_names[auraTable.name] or player_buff_names[auraTable.name] or debuff_names[auraTable.name] or player_debuff_names[auraTable.name] or debuff_types[auraTable.dispelName] then
            --        if not unitAuras[guid] then
            --            unitAuras[guid] = {}
            --        end
            --        unitAuras[guid][auraInstanceID] = auraTable
            --    --end
            --end
        end
    end

    if updatedAuras and updatedAuras.removedAuraInstanceIDs then
        for _, auraInstanceIDTable in ipairs(updatedAuras.removedAuraInstanceIDs) do
            if unitAuras[guid] and unitAuras[guid][auraInstanceIDTable] then
                unitAuras[guid][auraInstanceIDTable] = nil
                --self.core:SendStatusGained(
                --    guid,
                --    status,
                --    settings.priority,
                --    nil,
                --    settings.color,
                --    settings.text,
                --    nil,
                --    nil,
                --    icon
                --)
            end
        end
    end

    for _, info in pairs(enabledBuffs) do
        local settings = info.settings
        local status = info.status
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

    if unitAuras[guid] then
        local numAuras = 0
        --id, info
        for id in pairs(unitAuras[guid]) do
            local auraTable = GetAuraDataByAuraInstanceID(unit, id)
            if not auraTable then
                unitAuras[guid][id] = nil
            end
            if auraTable  then
                numAuras = numAuras + 1
                for _,buffInfo in pairs(enabledBuffs) do
                    for _,buffName in pairs(buffInfo.settings.buffs) do
                        if buffName == auraTable.name then
                            self.core:SendStatusLost(guid, buffInfo.status)
                            --return
                        end
                    end
                end
            end
        end
        if numAuras == 0 then
            unitAuras[guid] = nil
        end
    end
end
