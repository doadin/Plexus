std = "lua51"
max_line_length = false
exclude_files = {
	"**/Libs",
}
ignore = {
        "11/SLASH_.*", -- slash handlers
        "1/[A-Z][A-Z][A-Z0-9_]+", -- three letter+ constants
}
globals = {
	-- wow std api
	"abs",
	"acos",
	"asin",
	"atan",
	"atan2",
	"bit",
	"ceil",
	"cos",
	"date",
	"debuglocals",
	"debugprofilestart",
	"debugprofilestop",
	"debugstack",
	"deg",
	"difftime",
	"exp",
	"fastrandom",
	"floor",
	"forceinsecure",
	"foreach",
	"foreachi",
	"format",
	"frexp",
	"geterrorhandler",
	"getn",
	"gmatch",
	"gsub",
	"hooksecurefunc",
	"issecure",
	"issecurevariable",
	"ldexp",
	"log",
	"log10",
	"max",
	"min",
	"mod",
	"rad",
	"random",
	"scrub",
	"securecall",
	"seterrorhandler",
	"sin",
	"sort",
	"sqrt",
	"strbyte",
	"strchar",
	"strcmputf8i",
	"strconcat",
	"strfind",
	"string.join",
	"strjoin",
	"strlen",
	"strlenutf8",
	"strlower",
	"strmatch",
	"strrep",
	"strrev",
	"strsplit",
	"strsub",
	"strtrim",
	"strupper",
	"table.wipe",
	"tan",
	"time",
	"tinsert",
	"tremove",
	"wipe",

	-- framexml
	"getprinthandler",
	"hash_SlashCmdList",
	"setprinthandler",
	"tContains",
	"tDeleteItem",
	"tInvert",
	"tostringall",

	-- everything else
    "AlertFrame",
    "Ambiguate",
    "AuraUtil",
    "BackdropTemplateMixin",
    "BackpackButton_OnClick",
    "Baggins",
    "BankButtonIDToInvSlotID",
    "BasicMessageDialog",
    "BattlePetToolTip_Show",
    "BNGetFriendIndex",
    "BNIsSelf",
    "BNSendWhisper",
    "BossBanner",
    "C_AccountInfo",
    "C_AchievementInfo",
    "C_ActionBar",
    "C_AddOns",
    "C_AdventureJournal",
    "C_AdventureMap",
    "C_AlliedRaces",
    "C_AnimaDiversion",
    "C_ArdenwealdGardening",
    "C_AreaPoiInfo",
    "C_ArtifactUI",
    "C_AuctionHouse",
    "C_AzeriteEmpoweredItem",
    "C_AzeriteEssence",
    "C_AzeriteItem",
    "C_Bank",
    "C_BarberShop",
    "C_BattleNet",
    "C_BattlePet",
    "C_BehavioralMessaging",
    "C_BlackMarket",
    "C_BlackMarketInfo",
    "C_Browser",
    "C_Calendar",
    "C_CampaignInfo",
    "C_ChallengeMode",
    "C_ChatBubbles",
    "C_ChatInfo",
    "C_ChromieTime",
    "C_Cinematic",
    "C_ClassColor",
    "C_ClassTalents",
    "C_ClassTrial",
    "C_Club",
    "C_ClubFinder",
    "C_CombatLog",
    "C_Commentator",
    "C_CompactUnitFrames",
    "C_ConfigurationWarnings",
    "C_Console",
    "C_Container",
    "C_ContributionCollector",
    "C_CovenantCallings",
    "C_CovenantPreview",
    "C_Covenants",
    "C_CovenantSanctumUI",
    "C_CraftInfo",
    "C_CreatureInfo",
    "C_CurrencyInfo",
    "C_Cursor",
    "C_CVar",
    "C_DateAndTime",
    "C_DeathInfo",
    "C_DuelInfo",
    "C_EncounterInfo",
    "C_EncounterJournal",
    "C_EquipmentSet",
    "C_EventToastManager",
    "C_Expansion",
    "C_FogOfWar",
    "C_FrameManager",
    "C_FriendList",
    "C_GamePad",
    "C_Garrison",
    "C_GlyphInfo",
    "C_GMTicketInfo",
    "C_GossipInfo",
    "C_GuildBank",
    "C_GuildInfo",
    "C_Heirloom",
    "C_HeirloomInfo",
    "C_IncomingSummon",
    "C_InstanceEncounter",
    "C_InvasionInfo",
    "C_IslandsInfo",
    "C_IslandsQueue",
    "C_Item",
    "C_ItemInteraction",
    "C_ItemSocketInfo",
    "C_ItemText",
    "C_ItemUpgrade",
    "C_KeyBindings",
    "C_KnowledgeBase",
    "C_LegendaryCrafting",
    "C_LevelLink",
    "C_LevelSquish",
    "C_LFGInfo",
    "C_LFGList",
    "C_LFGuildInfo",
    "C_LoadingScreen",
    "C_Loot",
    "C_LootHistory",
    "C_LoreText",
    "C_LossOfControl",
    "C_Macro",
    "C_Mail",
    "C_Map",
    "C_MapExplorationInfo",
    "C_MerchantFrame",
    "C_Minimap",
    "C_ModelInfo",
    "C_MountJournal",
    "C_MythicPlus",
    "C_NamePlate",
    "C_NamePlateManager",
    "C_Navigation",
    "C_NewItems",
    "C_PaperDollInfo",
    "C_PartyInfo",
    "C_PartyPose",
    "C_PetBattles",
    "C_PetInfo",
    "C_PetJournal",
    "C_PlayerChoice",
    "C_PlayerInfo",
    "C_PlayerMentorship",
    "C_PrototypeDialog",
    "C_PvP",
    "C_QuestLine",
    "C_QuestLog",
    "C_QuestOffer",
    "C_QuestSession",
    "C_RaidLocks",
    "C_RecruitAFriend",
    "C_ReportSystem",
    "C_Reputation",
    "C_ResearchInfo",
    "C_RestrictedActions",
    "C_Scenario",
    "C_ScenarioInfo",
    "C_ScrappingMachineUI",
    "C_ScriptedAnimations",
    "C_ScriptWarnings",
    "C_Seasons",
    "C_SecureTransfer",
    "C_SkillInfo",
    "C_Social",
    "C_SocialQueue",
    "C_SocialRestrictions",
    "C_Soulbinds",
    "C_Sound",
    "C_SpecializationInfo",
    "C_Spell",
    "C_SpellActivationOverlay",
    "C_SpellBook",
    "C_SplashScreen",
    "C_StableInfo",
    "C_StorePublic",
    "C_SummonInfo",
    "C_SuperTrack",
    "C_System",
    "C_TalkingHead",
    "C_TaskQuest",
    "C_TaxiMap",
    "C_Texture",
    "C_Timer",
    "C_Tooltip",
    "C_TooltipInfo",
    "C_ToyBox",
    "C_ToyBoxInfo",
    "C_TradeInfo",
    "C_TradeSkillUI",
    "C_Trainer",
    "C_Traits",
    "C_Transmog",
    "C_TransmogCollection",
    "C_TransmogSets",
    "C_TTSSettings",
    "C_Tutorial",
    "C_UI",
    "C_UIWidgetManager",
    "C_Unit",
    "C_UnitAuras",
    "C_UserFeedback",
    "C_Vehicle",
    "C_VideoOptions",
    "C_VignetteInfo",
    "C_VoiceChat",
    "C_VoidStorageInfo",
    "C_WeeklyRewards",
    "C_WorldStateInfo",
    "C_WowEntitlementInfo",
    "C_WowTokenUI",
    "C_ZoneAbility",
    "ChatFontNormal",
    "ChatFrame_ImportAllListsToHash",
    "ChatTypeInfo",
    "CheckInteractDistance",
    "CinematicFrame_CancelCinematic",
    "ClearCursor",
    "ClearItemCraftingQualityOverlay",
    "CloseBankFrame",
    "CloseDropDownMenus",
    "CoinPickupFrame",
    "CombatLog_String_GetIcon",
    "CombatLogGetCurrentEventInfo",
    "CompactPartyFrame",
    "CompactRaidFrameContainer",
    "CompactRaidFrameManager_GetSetting",
    "CompactRaidFrameManager_SetSetting",
    "CompactRaidFrameManager",
    "ContainerIDToInventoryID",
    "CooldownFrame_Set",
    "CooldownFrame_SetTimer",
    "CopyTable",
    "CreateColor",
    "CreateFrame",
    "CursorUpdate",
    "DepositReagentBank",
    "DisableAddOn",
    "EasyMenu",
    "EJ_GetCreatureInfo",
    "EJ_GetEncounterInfo",
    "EJ_GetTierInfo",
    "EnableAddOn",
    "Enum",
    "EquipmentManager_UnpackLocation",
    "FillLocalizedClassList",
    "FlashClientIcon",
    "GameFontHighlight",
    "GameFontNormal",
    "GameFontNormalLarge",
    "GameTooltip_Hide",
    "GameTooltip_SetDefaultAnchor",
    "GameTooltip",
    "GetAddOnDependencies",
    "GetAddOnEnableState",
    "GetAddOnInfo",
    "GetAddOnMetadata",
    "GetAddOnOptionalDependencies",
    "GetAuctionItemSubClasses",
    "GetContainerItemCooldown",
    "GetContainerItemID",
    "GetContainerItemInfo",
    "GetContainerItemLink",
    "GetContainerItemQuestInfo",
    "GetContainerNumFreeSlots",
    "GetContainerNumSlots",
    "GetCursorInfo",
    "GetCursorPosition",
    "GetDetailedItemLevelInfo",
    "GetDifficultyInfo",
    "GetFramesRegisteredForEvent",
    "getglobal",
    "GetGossipActiveQuests",
    "GetGossipAvailableQuests",
    "GetGossipOptions",
    "GetGossipText",
    "GetInstanceInfo",
    "GetInventoryItemLink",
    "GetItemClassInfo",
    "GetItemCount",
    "GetItemFamily",
    "GetItemInfo",
    "GetItemInfoInstant",
    "GetItemQualityColor",
    "GetItemSubClassInfo",
    "GetLocale",
    "GetLootMethod",
    "GetMapNameByID",
    "GetMoney",
    "GetMouseButtonClicked",
    "GetNumAddOns",
    "GetNumBankSlots",
    "GetNumGroupMembers",
    "GetNumSubgroupMembers",
    "GetPartyAssignment",
    "GetPlayerFacing",
    "GetPlayerMapAreaID",
    "GetProfessionInfo",
    "GetProfessions",
    "GetRaidRosterInfo",
    "GetRaidTargetIndex",
    "GetReadyCheckStatus",
    "GetRealmName",
    "GetRealZoneText",
    "GetScreenHeight",
    "GetScreenWidth",
    "GetSpecialization",
    "GetSpecializationInfo",
    "GetSpecializationInfoByID",
    "GetSpecializationRole",
    "GetSpellBookItemName",
    "GetSpellBookItemTexture",
    "GetSpellCooldown",
    "GetSpellDescription",
    "GetSpellInfo",
    "GetSpellLink",
    "GetSpellTabInfo",
    "GetSpellTexture",
    "GetSubZoneText",
    "GetThreatStatusColor",
    "GetTime",
    "GetTrackedAchievements",
    "GetZonePVPInfo",
    "HideUIPanel",
    "InCombatLockdown",
    "InRepairMode",
    "InterfaceOptionsFrame_OpenToCategory",
    "InterfaceOptionsFrame",
    "IsAddOnLoaded",
    "IsAddOnLoadOnDemand",
    "IsAltKeyDown",
    "IsBagOpen",
    "IsContainerItemAnUpgrade",
    "IsControlKeyDown",
    "IsEncounterInProgress",
    "IsEquippedItem",
    "IsGuildMember",
    "IsInGroup",
    "IsInRaid",
    "IsItemInRange",
    "IsLoggedIn",
    "IsModifiedClick",
    "IsPartyLFG",
    "IsPlayerSpell",
    "IsReagentBankUnlocked",
    "IsShiftKeyDown",
    "IsSpellInRange",
    "IsSpellKnown",
    "IsTestBuild",
    "ItemButtonUtil",
    "ItemLocation",
    "KeyRingButtonIDToInvSlotID",
    "LFGDungeonReadyPopup",
    "LibStub",
    "LinkUtil",
    "LoadAddOn",
    "LocalizedClassList",
    "LoggingCombat",
    "MainMenuBarBackpackButton",
    "Mixin",
    "MovieFrame",
    "NickTag",
    "ObjectiveTrackerFrame",
    "OpenCoinPickupFrame",
    "PartyFrame",
    "PawnGetItemData",
    "PawnIsContainerItemAnUpgrade",
    "PawnIsItemAnUpgrade",
    "PickupContainerItem",
    "PlayerHasToy",
    "PlaySound",
    "PlaySoundFile",
    "RaidBossEmoteFrame",
    "RaidNotice_AddMessage",
    "RaidWarningFrame",
    "ReagentBankButtonIDToInvSlotID",
    "ReagentBankFrame",
    "RegisterStateDriver",
    "ResetCursor",
    "RolePollPopup",
    "Scrap",
    "SecondsToTime",
    "SecureButton_GetModifiedUnit",
    "SecureHandlerSetFrameRef",
    "SelectGossipOption",
    "SendChatMessage",
    "SetItemButtonDesaturated",
    "SetItemButtonTexture",
    "SetItemButtonTextureVertexColor",
    "SetItemCraftingQualityOverlay",
    "SetRaidTarget",
    "Settings",
    "SettingsPanel",
    "ShowContainerSellCursor",
    "ShowInspectCursor",
    "SlashCmdList",
    "SplitContainerItem",
    "StaticPopup_Show",
    "StopSound",
    "ToggleDropDownMenu",
    "TooltipUtil",
    "Tukui",
    "UIDropDownMenu_AddButton",
    "UIDropDownMenu_Refresh",
    "UIErrorsFrame",
    "UIParent",
    "UnitAffectingCombat",
    "UnitAura",
    "UnitCanAttack",
    "UnitCastingInfo",
    "UnitClass",
    "UnitCreatureType",
    "UnitDebuff",
    "UnitDetailedThreatSituation",
    "UnitEffectiveLevel",
    "UnitExists",
    "UnitFactionGroup",
    "UnitFrame_OnEnter",
    "UnitFrame_OnLeave",
    "UnitFullName",
    "UnitGetIncomingHeals",
    "UnitGetTotalAbsorbs",
    "UnitGetTotalHealAbsorbs",
    "UnitGroupRolesAssigned",
    "UnitGUID",
    "UnitHasIncomingResurrection",
    "UnitHasVehicleUI",
    "UnitHealth",
    "UnitHealthMax",
    "UnitInParty",
    "UnitInPartyIsAI",
    "UnitInPhase",
    "UnitInRaid",
    "UnitInRange",
    "UnitInVehicle",
    "UnitIsAFK",
    "UnitIsConnected",
    "UnitIsCorpse",
    "UnitIsDead",
    "UnitIsDeadOrGhost",
    "UnitIsFeignDeath",
    "UnitIsGhost",
    "UnitIsGroupAssistant",
    "UnitIsGroupLeader",
    "UnitIsPlayer",
    "UnitIsUnit",
    "UnitIsVisible",
    "UnitLevel",
    "UnitName",
    "UnitOnTaxi",
    "UnitPhaseReason",
    "UnitPlayerControlled",
    "UnitPosition",
    "UnitPower",
    "UnitPowerMax",
    "UnitPowerType",
    "UnitRace",
    "UnitSetRole",
    "UnitThreatSituation",
    "UnregisterUnitWatch",
    "UseContainerItem",
    "WorldFrame",
    -- Plexus
    "Clique",
    "PlexusDB",
    "GridDB",
    "PlexusOnAddonCompartmentClick",
    "PlexusLayoutFrame",
}
