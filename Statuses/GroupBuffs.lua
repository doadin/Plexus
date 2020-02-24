local _, Plexus = ...
local PlexusRoster = Plexus:GetModule("PlexusRoster")
local IsPlayerSpell, UnitAura, UnitClass, UnitGUID, UnitIsPlayer, UnitIsVisible, UnitIsDead, UnitIsGhost
	= IsPlayerSpell, UnitAura, UnitClass, UnitGUID, UnitIsPlayer, UnitIsVisible, UnitIsDead, UnitIsGhost
local settings
local PlexusStatusGroupBuffs = Plexus:NewStatusModule("PlexusStatusGroupBuffs")
PlexusStatusGroupBuffs.menuName = "Group Buffs"

local spellNameList = {}
local spellIconList = {}
if not Plexus:IsClassicWow() then
spellNameList = {
    ["Power Word: Fortitude"] = GetSpellInfo(21562),
    ["War-Scroll of Fortitude"] = GetSpellInfo(264764),

    ["Arcane Intellect"] = GetSpellInfo(1459),
    ["War-Scroll of Intellect"] = GetSpellInfo(264760),

    ["Battle Shout"] = GetSpellInfo(6673),
    ["War-Scroll of Battle"] = GetSpellInfo(264761),    
}

spellIconList = {
    ["Power Word: Fortitude"] = GetSpellTexture(21562),
    ["War-Scroll of Fortitude"] = GetSpellTexture(264764),

    ["Arcane Intellect"] = GetSpellTexture(1459),
    ["War-Scroll of Intellect"] = GetSpellTexture(264760),

    ["Battle Shout"] = GetSpellTexture(6673),
    ["War-Scroll of Battle"] = GetSpellTexture(264761),    
}

PlexusStatusGroupBuffs.defaultDB = {
	debug = false,
    type = "group",
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
			spellNameList["War-Scroll of Fortitude"]
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
			spellNameList["War-Scroll of Intellect"]
		},
		enable = true,
		color = { r = 0, g = 0, b = 1, a = 1 },
		priority = 99,
        class = "MAGE",
        hidden = true,
	},
	buffGroup_Battle_Shout = {
		text = spellNameList["Battle Shout"],
		desc = "Buff Group: "..spellNameList["Battle Shout"],
		icon = spellIconList["Battle Shout"],
		buffs = {
			spellNameList["Battle Shout"],
			spellNameList["War-Scroll of Battle"]
		},
		enable = true,
		color = { r = 0, g = 0, b = 1, a = 1 },
		priority = 99,
        class = "WARRIOR",
        hidden = true,
	}
}
end

if Plexus:IsClassicWow() then
spellNameList = {
    ["Power Word: Fortitude"] = GetSpellInfo(1243),
    ["Prayer of Fortitude"] = GetSpellInfo(21562),

    ["Arcane Intellect"] = GetSpellInfo(1472),

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

    ["Arcane Intellect"] = GetSpellTexture(1472),

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
	buffGroup_Intellect = {
		text = spellNameList["Arcane Intellect"],
		desc = "Buff Group: "..spellNameList["Arcane Intellect"],
		icon = spellIconList["Arcane Intellect"],
		buffs = {
			spellNameList["Arcane Intellect"]
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
	class = {
		type = "toggle",
		name = "Class",
		desc = "Only show buffs your class can cast.",
		get = function()
			return PlexusStatusGroupBuffs.db.profile.class
		end,
		set = function(_, v)
			PlexusStatusGroupBuffs.db.profile.class = v
		end,
	},
}

function PlexusStatusGroupBuffs:OnInitialize()
	self.super.OnInitialize(self)
	self:RegisterStatuses()
end

function PlexusStatusGroupBuffs:OnEnable()
	self.debugging = self.db.profile.debug

	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("PLAYER_LEAVING_WORLD")
end

function PlexusStatusGroupBuffs:PLAYER_LEAVING_WORLD()
	self:UnregisterEvent("UNIT_AURA")
end

function PlexusStatusGroupBuffs:PLAYER_ENTERING_WORLD()
	self:UpdateAllUnits()
	self:RegisterEvent("UNIT_AURA", "UpdateUnit")
end

function PlexusStatusGroupBuffs:Plexus_UnitJoined(guid, unit)
	--self:Debug("Plexus_UnitJoined", unit)
	self:UpdateUnit(unit)
end

function PlexusStatusGroupBuffs:RegisterStatuses()
	local status, settings, desc

    --self:RegisterStatus("alert_groupbuffs", "Settings", extraOptionsForStatus)
	for status, settings in self:ConfiguredStatusIterator() do
		desc = settings.desc or settings.text or ""
		self:Debug("registering", status, desc)
		self:RegisterStatus(status, desc)
	end
end

function PlexusStatusGroupBuffs:UnregisterStatuses()
	local status, moduleName, desc
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

function PlexusStatusGroupBuffs:UpdateAllUnits(guid)
	for guid, unit in PlexusRoster:IterateRoster() do
		self:UpdateUnit(unit, guid)
	end
end

function PlexusStatusGroupBuffs:UpdateUnit(event, unit, guid)
    if not guid then guid = UnitGUID(unit) end
	for status in self:ConfiguredStatusIterator() do
        self:ShowMissingBuffs(event, unit, status, guid)
	end
    
end

function PlexusStatusGroupBuffs:ShowMissingBuffs(event, unit, status, guid)
    if not unit then return end
    if not status then return end
    if not guid then return end
	local settings = self.db.profile[status]
    local BuffClass = settings.class

	if not settings.enable then
		return self.core:SendStatusLost(guid, status)
	end

	if UnitIsDead(unit) or UnitIsGhost(unit) then
		return self.core:SendStatusLost(guid, status)
	end

    if UnitIsVisible(unit) then
    	for i = 1, 40 do
            local name, icon, count, debuffType, duration, expirationTime, caster, isStealable
    		name, icon, count, debuffType, duration, expirationTime, caster, isStealable = UnitAura(unit, i, "HELPFUL")
            for buffId, buff in pairs(settings.buffs) do
    		    if name == buff then
    		    	return self.core:SendStatusLost(guid, status)
    		    end
            end
    	end
	end

    local icon = settings.icon

    if not Plexus:IsClassicWow() and UnitIsPlayer(unit) then
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

	--self:Debug("UnitClass", UnitClass)
	local localizedClass, englishClass, classIndex = UnitClass("player")
    if Plexus:IsClassicWow() and UnitIsPlayer(unit) and BuffClass == englishClass then
    self:Debug("status", icon)
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
end
