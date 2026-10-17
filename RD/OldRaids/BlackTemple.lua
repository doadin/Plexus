-- local zone = "Black Temple"
local zoneid = 340
local Plexus = _G.Plexus
local PlexusStatus = Plexus:GetModule("PlexusStatus")
local PlexusStatusRaidDebuff = PlexusStatus:GetModule("PlexusStatusRaidDebuff", true)
local function WhenRaidDebuffReady(callback)
    if PlexusStatusRaidDebuff and PlexusStatusRaidDebuff.options then
        callback(PlexusStatusRaidDebuff)
        return
    end
    C_Timer.After(1, function()
        if PlexusStatusRaidDebuff and PlexusStatusRaidDebuff.options then
            callback(PlexusStatusRaidDebuff)
        end
    end)
end
WhenRaidDebuffReady(function()
-- Note: updated spell ids as of WoD 6.1 3/8/2015

--zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 34654, 1, 4, 4, true) --Blind (poison)

-- Illidari Defiler
PlexusStatusRaidDebuff:DebuffId(zoneid, 39674, 1, 4, 4, true) --Banish (magic)

-- Illidari Nightlord
PlexusStatusRaidDebuff:DebuffId(zoneid, 41150, 1, 4, 4, true) --Fear (magic)

-- Illidari Centurion
PlexusStatusRaidDebuff:DebuffId(zoneid, 41168, 1, 4, 4, true) --Sonic Strike (silence)

-- Illidari Battle-mage
PlexusStatusRaidDebuff:DebuffId(zoneid, 41382, 1, 3, 3) --Blizzard (mana drain)
-- This spell is listed under High Nethermancer Zerevor instead
-- PlexusStatusRaidDebuff:DebuffId(zoneid, 41379, 1, 1, 1) --Flamestrike
PlexusStatusRaidDebuff:DebuffId(zoneid, 41384, 1, 2, 2, true) -- Frostbolt (magic)

-- Illidari Heartseeker
PlexusStatusRaidDebuff:DebuffId(zoneid, 41171, 1, 3, 3, true) -- Skeleton Shot (dot)
PlexusStatusRaidDebuff:DebuffId(zoneid, 41170, 1, 4, 4, true) -- Curse of the Bleakheart (curse, stun)

-- Illidari Assassin
PlexusStatusRaidDebuff:DebuffId(zoneid, 3609, 1, 4, 4, true) --Paralyzing Poison (poison, stun)

-- Illidari Boneslicer
PlexusStatusRaidDebuff:DebuffId(zoneid, 24698, 1, 2, 2, true) --Gouge (stun)

-- Bonechewer Spectator
PlexusStatusRaidDebuff:DebuffId(zoneid, 25646, 1, 2, 2, true) --Mortal Wound (healing reduction)

-- Bonechewer Behemoth
PlexusStatusRaidDebuff:DebuffId(zoneid, 41274, 1, 2, 2, true) --Fel Stomp (stun)

-- Bonechewer Shield Disciple
PlexusStatusRaidDebuff:DebuffId(zoneid, 41197, 1, 2, 2, true) --Shield Bash (stun)

-- Temple Concubine
PlexusStatusRaidDebuff:DebuffId(zoneid, 41338, 1, 2, 2, true) --Love Tap (stun)

-- Priestess of Delight
PlexusStatusRaidDebuff:DebuffId(zoneid, 41351, 1, 4, 4, true) --Curse of Virtality (curse, dot)

-- Priestess of Dementia
PlexusStatusRaidDebuff:DebuffId(zoneid, 41404, 1, 2, 2, true) -- Dementia

-- Charming Courtesan
PlexusStatusRaidDebuff:DebuffId(zoneid, 41345, 1, 4, 4, true) --Infatuation (charm)

-- Mutant War Hound
PlexusStatusRaidDebuff:DebuffId(zoneid, 41193, 1, 3, 3, true) -- Cloud of Disease (dot)

-- Unknown trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 41392, 1, 1, 1) --Riposte (disarm)
PlexusStatusRaidDebuff:DebuffId(zoneid, 41272, 1, 2, 2, true) --Behemoth Charge (stun)
PlexusStatusRaidDebuff:DebuffId(zoneid, 41397, 1, 2, 2, true) --Confusion (blind)
PlexusStatusRaidDebuff:DebuffId(zoneid, 41541, 1, 2, 2) --Consecration
PlexusStatusRaidDebuff:DebuffId(zoneid, 41389, 1, 2, 2, true) --Kidney shot (stun)

--Najentus
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "High Warlord Naj'entus")
PlexusStatusRaidDebuff:DebuffId(zoneid, 39837, 11, 5, 5) --Impaling Spine

--Terron
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Teron Gorefiend")
PlexusStatusRaidDebuff:DebuffId(zoneid, 40239, 21, 5, 5, true) --Incinerate
PlexusStatusRaidDebuff:DebuffId(zoneid, 40251, 22, 5, 5, true) --Shadow of death
PlexusStatusRaidDebuff:DebuffId(zoneid, 40243, 23, 5, 5) --Crushing Shadows

--Gurtogg
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Gurtogg Bloodboil")
PlexusStatusRaidDebuff:DebuffId(zoneid, 40604, 31, 5, 5, true) --Fel Rage
PlexusStatusRaidDebuff:DebuffId(zoneid, 40481, 32, 5, 5, true, true) --Acidic Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 40508, 33, 5, 5) --Fel-Acid Breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 42005, 34, 5, 5, true, true) --Bloodboil

--ROS
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Reliquary of Souls")
-- Essence of Suffering
PlexusStatusRaidDebuff:DebuffId(zoneid, 41303, 41, 5, 5) --Soul Drain
PlexusStatusRaidDebuff:DebuffId(zoneid, 41294, 42, 5, 5, true) --Fixate
PlexusStatusRaidDebuff:DebuffId(zoneid, 41292, 43, 1, 1) -- Aura of Suffering
-- Essence of Desire
PlexusStatusRaidDebuff:DebuffId(zoneid, 41410, 44, 5, 5, true) --Deaden
PlexusStatusRaidDebuff:DebuffId(zoneid, 41426, 45, 4, 4, true) --Spirit Shock (stun)
PlexusStatusRaidDebuff:DebuffId(zoneid, 41350, 46, 1, 1) --Aura of Desire
-- Essence of Anger
PlexusStatusRaidDebuff:DebuffId(zoneid, 41376, 47, 5, 5, true) --Spite
PlexusStatusRaidDebuff:DebuffId(zoneid, 41337, 48, 1, 1) --Aura of Anger

--Mother Shahraz
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Mother Shahraz")
PlexusStatusRaidDebuff:DebuffId(zoneid, 40860, 51, 5, 5, true) --Vile Beam
PlexusStatusRaidDebuff:DebuffId(zoneid, 41001, 52, 5, 5) --Fatal Attraction
PlexusStatusRaidDebuff:DebuffId(zoneid, 40823, 53, 1, 1, true) --Silencing Shriek

--Council
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "The Illidari Council")
-- Veras Darkshadow
PlexusStatusRaidDebuff:DebuffId(zoneid, 41485, 61, 5, 5, true) --Deadly Poison
-- Lady Malande
PlexusStatusRaidDebuff:DebuffId(zoneid, 41472, 62, 5, 5, true) --Divine Wrath
-- Gathios the Shatterer
PlexusStatusRaidDebuff:DebuffId(zoneid, 13005, 63, 5, 5, true) --Hammer of Justice (stun)
-- High Nethermancer Zerevor
PlexusStatusRaidDebuff:DebuffId(zoneid, 41481, 64, 5, 5) --Flamestrike

--Illidan
PlexusStatusRaidDebuff:BossNameId(zoneid, 70, "Illidan Stormrage")
PlexusStatusRaidDebuff:DebuffId(zoneid, 41914, 71, 5, 5, true) --Parasitic Shadowfiend
PlexusStatusRaidDebuff:DebuffId(zoneid, 40585, 72, 5, 5, true) --Dark Barrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 41032, 73, 4, 4) --Shear
PlexusStatusRaidDebuff:DebuffId(zoneid, 40932, 74, 5, 5, true) --Agonizing Flames
PlexusStatusRaidDebuff:DebuffId(zoneid, 41142, 75, 1, 1, true) --Aura of Dread
PlexusStatusRaidDebuff:DebuffId(zoneid, 40647, 76, 6, 6, true) --Shadow Prison
end)
