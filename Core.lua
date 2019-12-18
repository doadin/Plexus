--[[--------------------------------------------------------------------
	Plexus
	Compact party and raid unit frames.
	Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
	Copyright (c) 2009-2018 Phanx <addons@phanx.net>
	All rights reserved. See the accompanying LICENSE file for details.
----------------------------------------------------------------------]]

local PLEXUS, Plexus = ...
local LDBIcon = LibStub:GetLibrary("LibDBIcon-1.0")
local LibDeflate = LibStub:GetLibrary('LibDeflate')
local AceGUI = LibStub:GetLibrary("AceGUI-3.0")
local AceSerializer = LibStub:GetLibrary("AceSerializer-3.0")
local format, print, strfind, strlen, tostring, type , tcopy, timer = format, print, strfind, strlen, tostring, type, CopyTable, C_Timer

_G.Plexus = LibStub:GetLibrary("AceAddon-3.0"):NewAddon(Plexus, PLEXUS, "AceConsole-3.0", "AceEvent-3.0")
if not (IsAddOnLoaded("Grid")) then
_G.Grid = _G.Plexus
end
if (IsAddOnLoaded("Grid")) then
StaticPopupDialogs["GRID_ENABLED"] = {
  text = "Grid and Plexus should never be enabled at the same time, unless you are copying settings! Do you want to copy Grid settings to Plexus?(Please Have Backups and Note: Restart is Required After Copy)",
  button1 = "Yes",
  button2 = "No",
  OnAccept = function()
  _G.PlexusDB.namespaces.PlexusFrame = _G.GridDB.namespaces.GridFrame
  _G.PlexusDB.namespaces.PlexusLayout = _G.GridDB.namespaces.GridLayout
  _G.PlexusDB.namespaces.PlexusRoster = _G.GridDB.namespaces.GridRoster
  _G.PlexusDB.namespaces.PlexusStatus = _G.GridDB.namespaces.GridStatus
  _G.PlexusDB.namespaces.PlexusStatusAbsorbs = _G.GridDB.namespaces.GridStatusAbsorbs
  _G.PlexusDB.namespaces.PlexusStatusAggro = _G.GridDB.namespaces.GridStatusAggro
  _G.PlexusDB.namespaces.PlexusStatusAuras = _G.GridDB.namespaces.GridStatusAuras
  _G.PlexusDB.namespaces.PlexusStatusGroup = _G.GridDB.namespaces.GridStatusGroup
  _G.PlexusDB.namespaces.PlexusStatusHeals = _G.GridDB.namespaces.GridStatusHeals
  _G.PlexusDB.namespaces.PlexusStatusHealth = _G.GridDB.namespaces.GridStatusHealth
  _G.PlexusDB.namespaces.PlexusStatusMana = _G.GridDB.namespaces.GridStatusMana
  _G.PlexusDB.namespaces.PlexusStatusMouseover = _G.GridDB.namespaces.GridStatusMouseover
  _G.PlexusDB.namespaces.PlexusStatusName = _G.GridDB.namespaces.GridStatusName
  _G.PlexusDB.namespaces.PlexusStatusRaidIcon = _G.GridDB.namespaces.GridStatusRaidIcon
  _G.PlexusDB.namespaces.PlexusStatusRange = _G.GridDB.namespaces.GridStatusRange
  _G.PlexusDB.namespaces.PlexusStatusReadyCheck = _G.GridDB.namespaces.GridStatusReadyCheck
  _G.PlexusDB.namespaces.PlexusStatusResurrect = _G.GridDB.namespaces.GridStatusResurrect
  _G.PlexusDB.namespaces.PlexusStatusRole = _G.GridDB.namespaces.GridStatusRole
  _G.PlexusDB.namespaces.PlexusStatusStagger = _G.GridDB.namespaces.GridStatusStagger
  _G.PlexusDB.namespaces.PlexusStatusTarget = _G.GridDB.namespaces.GridStatusTarget
  _G.PlexusDB.namespaces.PlexusStatusVehicle = _G.GridDB.namespaces.GridStatusVehicle
  end,
  timeout = 0,
  whileDead = true,
  hideOnEscape = true,
  preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/
}
StaticPopup_Show ("GRID_ENABLED")
end

if not Plexus.L then Plexus.L = { } end
local L = setmetatable( Plexus.L, {
	__index = function(t, k)
		t[k] = k
		return k
	end
})

------------------------------------------------------------------------

function Plexus:Debug(str, ...)
	if not self.debug then return end
	if not str or strlen(str) == 0 then return end

	if (...) then
		if strfind(str, "%%%.%d") or strfind(str, "%%[dfqsx%d]") then
			str = format(str, ...)
		else
			str = strjoin(" ", str, tostringall(...))
		end
	end

	local name = self.moduleName or self.name or PLEXUS
	_G[Plexus.db.global.debugFrame]:AddMessage(format("|cffff9933%s:|r %s", name, str))
end

function Plexus:GetDebuggingEnabled(moduleName)
	return self.db.global.debug[moduleName]
end

do
	local function FindModule(start, moduleName)
		--print("FindModule", start.moduleName, moduleName)
		if start.name == moduleName or start.moduleName == moduleName then
			return start
		end
		for name, module in start:IterateModules() do
			local found = FindModule(module, moduleName)
			if found then
				--print("FOUND")
				return found
			end
		end
	end

	function Plexus:SetDebuggingEnabled(moduleName, value)
		--print("SetDebuggingEnabled", moduleName, value)
		local module = FindModule(self, moduleName)
		if not module then
			--print("ERROR: module "..moduleName.." doesn't exist!")
			return
		end

		if module.db and module.db.profile and module.db.profile.debug ~= nil then
			--print("Removed old debug setting from module", moduleName, tostring(module.db.profile.debug))
			module.db.profile.debug = nil
		end

		local args = self.options.args.debug.args
		if not args[moduleName] then
			args[moduleName] = self:GetDebuggingOptions(moduleName)
		end

		if value == nil then
			module.debug = self.db.global.debug[moduleName]
		else
			self.db.global.debug[moduleName] = value or nil
			module.debug = value
		end
	end
end

------------------------------------------------------------------------

Plexus.options = {
	handler = Plexus,
	type = "group",
	childGroups = "tab",
	args = {
		general = {
			type = "group",
			name = L["General"],
			order = 1,
			args = {
				minimap = {
					name = L["Show minimap icon"],
					desc = L["Show the Plexus icon on the minimap. Note that some DataBroker display addons may hide the icon regardless of this setting."],
					order = 1,
					width = "double",
					type = "toggle",
					get = function()
						return not Plexus.db.profile.minimap.hide
					end,
					set = function(info, value)
						Plexus.db.profile.minimap.hide = not value
						if value then
							LDBIcon:Show(PLEXUS)
						else
							LDBIcon:Hide(PLEXUS)
						end
					end
				},
				standaloneOptions = {
					name = L["Standalone options"],
					desc = L["Open Plexus's options in their own window, instead of the Interface Options window, when typing /plexus or right-clicking on the minimap icon, DataBroker icon, or layout tab."],
					order = 2,
					width = "double",
					type = "toggle",
					get = function()
						return Plexus.db.profile.standaloneOptions
					end,
					set = function(info, value)
						Plexus.db.profile.standaloneOptions = value
					end,
				},
		        import = {
		        	name = L["Import Profile"],
		        	order = 3,
		        	width = "double",
		        	type = "execute",
		        	func = function() Plexus:ImportProfile() end,
		        },
		        export = {
		        	name = L["Export Profile"],
		        	order = 4,
		        	width = "double",
		        	type = "execute",
		        	func = function() Plexus:ExportProfile() end,
		        }                
			},
		},
		debug = {
			type = "group",
			name = L["Debugging"],
			desc = L["Module debugging menu."],
			order = -1,
			args = {
				desc = {
					order = 1,
					type = "description",
					name = L["Debugging messages help developers or testers see what is happening inside Plexus in real time. Regular users should leave debugging turned off except when troubleshooting a problem for a bug report."],
				},
				frame = {
					order = 2,
					name = L["Output Frame"],
					desc = L["Show debugging messages in this frame."],
					type = "select",
					get = function(info)
						return Plexus.db.global.debugFrame
					end,
					set = function(info, value)
						Plexus.db.global.debugFrame = value
					end,
					values = {
						ChatFrame1  = "ChatFrame1",
						ChatFrame2  = "ChatFrame2",
						ChatFrame3  = "ChatFrame3",
						ChatFrame4  = "ChatFrame4",
						ChatFrame5  = "ChatFrame5",
						ChatFrame6  = "ChatFrame6",
						ChatFrame7  = "ChatFrame7",
						ChatFrame8  = "ChatFrame8",
						ChatFrame9  = "ChatFrame9",
						ChatFrame10 = "ChatFrame10",
					},
				},
				spacer = {
					order = 3,
					name = " ",
					type = "description",
				},
			}
		}
	}
}

function Plexus:ExportProfile()
	local ExportProfile = tcopy(_G.PlexusDB.namespaces)
	local SerializedProfile = AceSerializer:Serialize(ExportProfile)
    local EncodedProfile = LibDeflate:EncodeForPrint(SerializedProfile);
	local input = AceGUI:Create("MultiLineEditBox");
    input:SetWidth(400);
    input:SetNumLines(20);
    input.button:Hide();
    input.frame:SetClipsChildren(true);
    input:SetLabel("Export Plexus Profile");
    input:SetText(EncodedProfile);
    input.editBox:HighlightText();
    input:SetFocus();
	local f = AceGUI:Create("Frame")
	f:SetStatusText("Profile Exported Copy Text Above!")
	f:SetTitle("Export Profile")
    f:SetWidth(500)
    f:AddChild(input)
    f:SetCallback("OnClose", function(input) AceGUI:Release(input) end)
    input.editBox:SetScript("OnEscapePressed", function() f:Close(); end);
end

function Plexus:ImportProfile()
	local input = AceGUI:Create("MultiLineEditBox");
    input:SetWidth(400);
    input:SetNumLines(20);
    input.button:Hide();
    input.frame:SetClipsChildren(true);
    input:SetLabel("Import Plexus Profile");
    input:SetText("");
    input.editBox:HighlightText();
    input:SetFocus();
	local f = AceGUI:Create("Frame")
	f:SetTitle("Import Profile")
    f:SetWidth(500)
	f:AddChild(input)
    local ImportButton = CreateFrame("Button", nil, f.frame, "UIPanelButtonTemplate");
	ImportButton:SetScript("OnClick", 
								function() 
								local decoded = LibDeflate:DecodeForPrint(input:GetText()); 
								local DeserializedResult, DeserializedData = AceSerializer:Deserialize(decoded);  
								if DeserializedResult then 
									_G.PlexusDB.namespaces = DeserializedData; 
									f:SetStatusText("Profile imported You can now reload!"); 
								else 
									f:SetStatusText("Invalid Profile!") 
								end; 
							end);
    ImportButton:SetPoint("BOTTOMRIGHT", -30, 50);
    ImportButton:SetFrameLevel(ImportButton:GetFrameLevel() + 1)
    ImportButton:SetHeight(25);
    ImportButton:SetWidth(150);
    ImportButton:SetText("Import and ReloadUI")
end

------------------------------------------------------------------------

Plexus.defaultDB = {
	profile = {
		minimap = {},
		standaloneOptions = false,
	},
	global = {
		debug = {},
		debugFrame = "ChatFrame1",
	}
}

------------------------------------------------------------------------

Plexus.modulePrototype = {
	core = Plexus,
	Debug = Plexus.Debug,
	registeredModules = { },
}

function Plexus:IsClassicWow()
	local gameVersion = GetBuildInfo()
	if (gameVersion:match ("%d") == "1") then
		return true
	end
	return false
end

function Plexus.modulePrototype:OnInitialize()
	if not self.db then
		self.db = Plexus.db:RegisterNamespace(self.moduleName, { profile = self.defaultDB or { } })
	end

	self:Debug("OnInitialize")

	Plexus:SetDebuggingEnabled(self.moduleName)
	for name, module in self:IterateModules() do
		self:RegisterModule(name, module)
		Plexus:SetDebuggingEnabled(name)
	end

	if type(self.PostInitialize) == "function" then
		self:PostInitialize()
	end
end

function Plexus.modulePrototype:OnEnable()
	for name, module in self:IterateModules() do
		self:RegisterModule(name, module)
	end

	self:EnableModules()

	if type(self.PostEnable) == "function" then
		self:PostEnable()
	end
end

function Plexus.modulePrototype:OnDisable()
	self:DisableModules()

	if type(self.PostDisable) == "function" then
		self:PostDisable()
	end
end

function Plexus.modulePrototype:Reset()
	self:Debug("Reset")
	self:ResetModules()

	if type(self.PostReset) == "function" then
		self:PostReset()
	end
end

function Plexus.modulePrototype:OnModuleCreated(module)
	module.super = self.modulePrototype
	self:Debug("OnModuleCreated", module.moduleName)
	if Plexus.db then
		-- otherwise it will be caught in core OnInitialize
		Plexus:SetDebuggingEnabled(module.moduleName)
	end
end

function Plexus.modulePrototype:RegisterModule(name, module)
	if self.registeredModules[module] then return end

	self:Debug("Registering", name)

	if not module.db then
		module.db = Plexus.db:RegisterNamespace(name, { profile = module.defaultDB or { } })
	end

	if module.extraOptions and not module.options then
		module.options = {
			name = module.menuName or module.moduleName,
			type = "group",
			args = {},
		}
		for name, option in pairs(module.extraOptions) do
			module.options.args[name] = option
		end
	end

	if module.options then
		self.options.args[name] = module.options
	end

	self.registeredModules[module] = true
end

function Plexus.modulePrototype:EnableModules()
	for name, module in self:IterateModules() do
		self:EnableModule(name)
	end
end

function Plexus.modulePrototype:DisableModules()
	for name, module in self:IterateModules() do
		self:DisableModule(name)
	end
end

function Plexus.modulePrototype:ResetModules()
	for name, module in self:IterateModules() do
		self:Debug("Resetting " .. name)
		module.db = self.core.db:GetNamespace(name)
		if type(module.Reset) == "function" then
			module:Reset()
		end
	end
end

function Plexus.modulePrototype:StartTimer(callback, delay, repeating, arg)
	if not self.ScheduleTimer then
		-- This module doesn't use AceTimer-3.0.
		self:Debug("Attempt to call StartTimer without AceTimer-3.0!")
		return
	end
	self:Debug("StartTimer", callback, delay, repeating, arg)

	local handles = self.timerHandles
	if not handles then
		-- First time starting a timer.
		handles = {}
		self.timerHandles = handles
	end

	local timerName = tostring(callback)
	if handles[timerName] then
		-- Timer is already running; stop it first.
		self:StopTimer(timerName)
	end

	local handle
	if repeating then
		handle = self:ScheduleRepeatingTimer(callback, delay, arg)
	else
		handle = self:ScheduleTimer(callback, delay, arg)
		-- KNOWN ISSUE: Unless the module cancels the timer itself in
		-- the callback function, the timer will remain listed in the
		-- module.timerHandles table. Should not cause any problems,
		-- though, since StopTimer calls CancelTimer silently.
	end
	handles[timerName] = handle
	return handle
end

function Plexus.modulePrototype:StopTimer(callback)
	local handles, timerName = self.timerHandles, tostring(callback)
	if not handles or not handles[timerName] then
		-- This module doesn't use AceTimer, or hasn't started any timers
		-- yet, or the specified timer is not running.
		self:Debug("Attempt to call StopTimer without AceTimer-3.0!")
		return
	end
	self:Debug("StopTimer", timerName)
	self:CancelTimer(handles[timerName], true)
	handles[timerName] = nil
end

Plexus:SetDefaultModulePrototype(Plexus.modulePrototype)
Plexus:SetDefaultModuleLibraries("AceEvent-3.0")

------------------------------------------------------------------------

function Plexus:OnInitialize()
	self.db = LibStub:GetLibrary("AceDB-3.0"):New("PlexusDB", self.defaultDB, true)

	self.db.RegisterCallback(self, "OnProfileChanged", "OnProfileEnable")
	self.db.RegisterCallback(self, "OnProfileCopied", "OnProfileEnable")
	self.db.RegisterCallback(self, "OnProfileReset", "OnProfileEnable")

	self.options.args.profile = LibStub:GetLibrary("AceDBOptions-3.0"):GetOptionsTable(self.db)
	self.options.args.profile.order = -3
    if not Plexus:IsClassicWow() then
	  local LibDualSpec = LibStub:GetLibrary("LibDualSpec-1.0")
	  LibDualSpec:EnhanceDatabase(self.db, PLEXUS)
	  LibDualSpec:EnhanceOptions(self.options.args.profile, self.db)
    end

	LibStub:GetLibrary("AceConfigRegistry-3.0"):RegisterOptionsTable(PLEXUS, self.options)

	--
	--	Broker launcher
	--

	local DataBroker = LibStub:GetLibrary("LibDataBroker-1.1", true)
	if DataBroker then
		self.Broker = DataBroker:NewDataObject(PLEXUS, {
			type = "launcher",
			icon = "Interface\\AddOns\\Plexus\\Media\\icon",
			OnClick = function(self, button)
				if button == "RightButton" then
					Plexus:ToggleOptions()
				elseif not InCombatLockdown() then
					local PlexusLayout = Plexus:GetModule("PlexusLayout")
					PlexusLayout.db.profile.lock = not PlexusLayout.db.profile.lock
					LibStub:GetLibrary("AceConfigRegistry-3.0"):NotifyChange(PLEXUS)
					PlexusLayout:UpdateTabVisibility()
				end
			end,
			OnTooltipShow = function(tooltip)
				tooltip:AddLine(PLEXUS, 1, 1, 1)
				if InCombatLockdown() then
					tooltip:AddLine(L["Click to toggle the frame lock."], 0.5, 0.5, 0.5)
				else
					tooltip:AddLine(L["Click to toggle the frame lock."])
				end
				tooltip:AddLine(L["Right-Click for more options."])
			end,
		})
	end

	LDBIcon:Register(PLEXUS, self.Broker, self.db.profile.minimap)
	if self.db.profile.minimap.hide then
		LDBIcon:Hide(PLEXUS)
	else
		LDBIcon:Show(PLEXUS)
	end

	self:SetDebuggingEnabled("Plexus")
	for name, module in self:IterateModules() do
		self:RegisterModule(name, module)
	end

	-- to catch mysteriously late-loading modules
	self:RegisterEvent("ADDON_LOADED")
end

function Plexus:OnEnable()
	self:Debug("OnEnable")

	for name, module in self:IterateModules() do
		self:RegisterModule(name, module)
	end

	self:EnableModules()

	if self.SetupOptions then
		self:SetupOptions()
	end

	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("PLAYER_REGEN_DISABLED")
	self:RegisterEvent("PLAYER_REGEN_ENABLED")

	self:SendMessage("Plexus_Enabled")
end

function Plexus:OnDisable()
	self:Debug("OnDisable")

	self:SendMessage("Plexus_Disabled")

	self:DisableModules()
end

function Plexus:OnProfileEnable()
	self:Debug("Loaded profile", self.db:GetCurrentProfile())

	local LDBIcon = LibStub:GetLibrary("LibDBIcon-1.0", true)
	if LDBIcon then
		LDBIcon:Refresh(PLEXUS, self.db.profile.minimap)
		if self.db.profile.minimap.hide then
			LDBIcon:Hide(PLEXUS)
		else
			LDBIcon:Show(PLEXUS)
		end
	end

	self:ResetModules()
end

function Plexus:SetupOptions()
	local Command = LibStub:GetLibrary("AceConfigCmd-3.0")
	local Dialog = LibStub:GetLibrary("AceConfigDialog-3.0")

	---------------------------------------------------------------------
	--	Standalone options

	local status = Dialog:GetStatusTable(PLEXUS)
	status.width = 780 -- 685
	status.height = 500 -- 530

	local child1 = Dialog:GetStatusTable(PLEXUS, { "PlexusIndicator" })
	child1.groups = child1.groups or {}
	child1.groups.treewidth = 220

	local child2 = Dialog:GetStatusTable(PLEXUS, { "PlexusStatus" })
	child2.groups = child2.groups or {}
	child2.groups.treewidth = 260

	local child3 = Dialog:GetStatusTable(PLEXUS, { "PlexusHelp" })
	child3.groups = child3.groups or {}
	child3.groups.treewidth = 300

	self:RegisterChatCommand("plexus", function(input)
		if input then
			input = strtrim(input)
		end
		if not input or input == "" then
			self:ToggleOptions()
		elseif strmatch(strlower(input), "^ve?r?s?i?o?n?$") then
			local version = GetAddOnMetadata(PLEXUS, "Version")
			if version == "@" .. "project-version" .. "@" then -- concatenation to trick the packager
				self:Print("You are using a developer version.") -- no need to localize
			else
				self:Print(format(L["You are using version %s"], version))
			end
		else
			Command.HandleCommand(Plexus, "plexus", PLEXUS, input)
		end
	end)

	InterfaceOptionsFrame:HookScript("OnShow", function()
		Dialog:Close(PLEXUS)
	end)

	---------------------------------------------------------------------
	--	Interface Options frame integrated options

	local panels = {}
	for k, v in pairs(self.options.args) do
		if k ~= "general" then
			tinsert(panels, k)
		end
	end

	table.sort(panels, function(a, b) -- copied from Dialog-3.0
		if not a then return true end
		if not b then return false end
		local orderA, orderB = self.options.args[a].order or 10000, self.options.args[b].order or 10000
		if orderA == orderB then
			return strupper(self.options.args[a].name or "") < strupper(self.options.args[b].name or "")
		end
		if orderA < 0 then
			if orderB > 0 then return false end
		else
			if orderB < 0 then return true end
		end
		return orderA < orderB
	end)

	self.optionsPanels = {
		Dialog:AddToBlizOptions(PLEXUS, PLEXUS, nil, "general") -- "appName", "panelName", "parentName", ... "optionsPath"
	}

	local noop = function() end
	for i = 1, #panels do
		local path = panels[i]
		local name = self.options.args[path].name
		local f = Dialog:AddToBlizOptions(PLEXUS, name, PLEXUS, path)
		f.obj:SetTitle(PLEXUS .. " - " .. name) -- workaround for AceConfig deficiency
		f.obj.SetTitle = noop
		self.optionsPanels[i+1] = f
	end

	self.SetupOptions = nil
end

function Plexus:ToggleOptions()
	if self.db.profile.standaloneOptions then
		local Dialog = LibStub:GetLibrary("AceConfigDialog-3.0")
		if Dialog.OpenFrames[PLEXUS] then
			Dialog:Close(PLEXUS)
		else
			Dialog:Open(PLEXUS)
		end
	else
		InterfaceOptionsFrame_OpenToCategory(self.optionsPanels[2]) -- default to Layout
		InterfaceOptionsFrame_OpenToCategory(self.optionsPanels[2]) -- double up as a workaround for the bug that opens the frame without selecting the panel
	end
end

------------------------------------------------------------------------

do
	local function debug_get(info)
		--print("debug_get", info[#info])
		return Plexus:GetDebuggingEnabled(info[#info])
	end

	local function debug_set(info, value)
		--print("debug_set", info[#info], value)
		return Plexus:SetDebuggingEnabled(info[#info], value)
	end

	function Plexus:GetDebuggingOptions(moduleName)
		return {
			name = moduleName,
			desc = format(L["Enable debugging messages for the %s module."], moduleName),
			type = "toggle",
			width = "double",
			get = debug_get,
			set = debug_set,
		}
	end
end

function Plexus:OnModuleCreated(module)
	module.super = self.modulePrototype

	if self.db then
		-- otherwise it will be caught in core OnInitialize
		self:SetDebuggingEnabled(module.moduleName)
	end
end

------------------------------------------------------------------------

local registeredModules = { }

function Plexus:RegisterModule(name, module)
	if registeredModules[module] then return end

	self:Debug("Registering " .. name)

	if not module.db then
		module.db = self.db:RegisterNamespace(name, { profile = module.defaultDB or { } })
	end

	if module.options then
		self.options.args[name] = module.options
	end

	registeredModules[module] = true
end

function Plexus:EnableModules()
	for name, module in self:IterateModules() do
		self:EnableModule(name)
	end
end

function Plexus:DisableModules()
	for name, module in self:IterateModules() do
		self:DisableModule(name)
	end
end

function Plexus:ResetModules()
	for name, module in self:IterateModules() do
		self:Debug("Resetting " .. name)
		module.db = self.db:GetNamespace(name)
		if type(module.Reset) == "function" then
			module:Reset()
		end
	end
end

------------------------------------------------------------------------

function Plexus:PLAYER_ENTERING_WORLD()
	-- this is needed for zoning while in combat
	self:PLAYER_REGEN_ENABLED()
end

function Plexus:PLAYER_REGEN_DISABLED()
	self:Debug("Entering combat")
	self:SendMessage("Plexus_EnteringCombat")
	Plexus.inCombat = true
end

function Plexus:PLAYER_REGEN_ENABLED()
	Plexus.inCombat = InCombatLockdown() == 1
	if not Plexus.inCombat then
		self:Debug("Leaving combat")
		self:SendMessage("Plexus_LeavingCombat")
	end
end

function Plexus:ADDON_LOADED()
	for name, module in self:IterateModules() do
		self:RegisterModule(name, module)
	end
end
