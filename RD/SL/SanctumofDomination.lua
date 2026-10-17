-- local zone = "Sanctum of Domination"
local zoneid = 1998
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
--zoneid, first, second, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

-- Trash


-- The Tarragrue
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "The Tarragrue")
PlexusStatusRaidDebuff:DebuffId(zoneid, 347668, 101, 5, 5, true) -- Grasp of Death
PlexusStatusRaidDebuff:DebuffId(zoneid, 346986, 102, 5, 5, true) -- Crushed Armor
PlexusStatusRaidDebuff:DebuffId(zoneid, 347283, 103, 5, 5, true) -- Predator's Howl
PlexusStatusRaidDebuff:DebuffId(zoneid, 347269, 104, 5, 5, true) -- Chains of Eternity
PlexusStatusRaidDebuff:DebuffId(zoneid, 346985, 105, 5, 5, true) -- Overpower
PlexusStatusRaidDebuff:DebuffId(zoneid, 352387, 106, 4, 4, true) -- Remnant: Mort'regar's Echoes
PlexusStatusRaidDebuff:DebuffId(zoneid, 352392, 107, 4, 4, true) -- Remnant: Soulforge Heat
PlexusStatusRaidDebuff:DebuffId(zoneid, 352384, 108, 4, 4, true) -- Remnant: Upper Reaches' Might

-- The Eye of the Jailer
PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "The Eye of the Jailer")
PlexusStatusRaidDebuff:DebuffId(zoneid, 351143, 201, 6, 6) -- Deathlink
PlexusStatusRaidDebuff:DebuffId(zoneid, 350809, 202, 6, 6) -- Jailer's Misery
PlexusStatusRaidDebuff:DebuffId(zoneid, 348969, 203, 4, 4) -- Immediate Extermination
PlexusStatusRaidDebuff:DebuffId(zoneid, 348074, 204, 6, 6, true, true) -- Assailing Lance
PlexusStatusRaidDebuff:DebuffId(zoneid, 351826, 205, 5, 5, true, true) -- Suffering
PlexusStatusRaidDebuff:DebuffId(zoneid, 351827, 206, 5, 5, true) -- Spreading Misery
PlexusStatusRaidDebuff:DebuffId(zoneid, 350713, 207, 6, 6, true) -- Slothful Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 349979, 208, 6, 6, true) -- Dragging Chains
PlexusStatusRaidDebuff:DebuffId(zoneid, 350034, 209, 5, 5, true, true) -- Shattered Soul

-- The Nine
PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "The Nine")
PlexusStatusRaidDebuff:DebuffId(zoneid, 350475, 301, 5, 5, true, true) -- Pierce Soul
PlexusStatusRaidDebuff:DebuffId(zoneid, 350483, 302, 5, 5) -- Link Essence
PlexusStatusRaidDebuff:DebuffId(zoneid, 350202, 303, 5, 5, true, true) -- Unending Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 350542, 304, 5, 5) -- Fragments of Destiny
PlexusStatusRaidDebuff:DebuffId(zoneid, 350287, 305, 5, 5, true, true) -- Song of Dissolution
PlexusStatusRaidDebuff:DebuffId(zoneid, 350555, 306, 5, 5) -- Shard of Destiny
PlexusStatusRaidDebuff:DebuffId(zoneid, 350374, 307, 5, 5, true) -- Wings of Rage
PlexusStatusRaidDebuff:DebuffId(zoneid, 350039, 308, 5, 5, true) -- Arthura's Crushing Gaze
PlexusStatusRaidDebuff:DebuffId(zoneid, 350184, 309, 5, 5) -- Daschla's Mighty Anvil
PlexusStatusRaidDebuff:DebuffId(zoneid, 350109, 310, 5, 5) -- Brynja's Mournful Dirge

-- Remnant of Ner'zhul
PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Remnant of Ner'zhul")
PlexusStatusRaidDebuff:DebuffId(zoneid, 349890, 401, 5, 5, true) -- Suffering
PlexusStatusRaidDebuff:DebuffId(zoneid, 350469, 402, 5, 5, true) -- Malevolence
PlexusStatusRaidDebuff:DebuffId(zoneid, 354479, 403, 5, 5, true) -- Spite
PlexusStatusRaidDebuff:DebuffId(zoneid, 350073, 404, 5, 5, true) -- Torment
PlexusStatusRaidDebuff:DebuffId(zoneid, 350388, 405, 5, 5, true) -- Thermal Lament
PlexusStatusRaidDebuff:DebuffId(zoneid, 350489, 406, 5, 5) -- Lingering Malevolence


-- Soulrender of Dormazain
PlexusStatusRaidDebuff:BossNameId(zoneid, 500, "Soulrender of Dormazain")
PlexusStatusRaidDebuff:DebuffId(zoneid, 350422, 501, 4, 4, true, true) -- Ruinblade
PlexusStatusRaidDebuff:DebuffId(zoneid, 350647, 502, 5, 5, true, true) -- Brand of Torment
PlexusStatusRaidDebuff:DebuffId(zoneid, 353429, 503, 5, 5) -- Tormented
PlexusStatusRaidDebuff:DebuffId(zoneid, 353023, 504, 5, 5, true, true) -- Torment
PlexusStatusRaidDebuff:DebuffId(zoneid, 350927, 505, 5, 5) -- Warmonger Shackle
PlexusStatusRaidDebuff:DebuffId(zoneid, 351787, 506, 5, 5, true, true) -- Agonizing Spike

-- Painsmith Raznal
PlexusStatusRaidDebuff:BossNameId(zoneid, 600, "Painsmith Raznal")
PlexusStatusRaidDebuff:DebuffId(zoneid, 355506, 601, 5, 5, true) -- Shadowsteel Chains
PlexusStatusRaidDebuff:DebuffId(zoneid, 355786, 602, 5, 5, true, true) -- Blackened Armor
PlexusStatusRaidDebuff:DebuffId(zoneid, 348463, 603, 5, 5) -- Flameclasp Detonation
PlexusStatusRaidDebuff:DebuffId(zoneid, 355526, 604, 5, 5) -- Spiked

-- Guardian of the First Ones
PlexusStatusRaidDebuff:BossNameId(zoneid, 700, "Guardian of the First Ones")
PlexusStatusRaidDebuff:DebuffId(zoneid, 350732, 701, 5, 5, true) -- Sunder
PlexusStatusRaidDebuff:DebuffId(zoneid, 355357, 702, 5, 5, true) -- Obliterate
PlexusStatusRaidDebuff:DebuffId(zoneid, 352833, 703, 5, 5, true) -- Disintegration
PlexusStatusRaidDebuff:DebuffId(zoneid, 350496, 704, 5, 5) -- Threat Neutralization
PlexusStatusRaidDebuff:DebuffId(zoneid, 352394, 705, 4, 4) -- Radiant Energy

-- Fatescribe Roh-Kalo
PlexusStatusRaidDebuff:BossNameId(zoneid, 800, "Fatescribe Roh-Kalo")
PlexusStatusRaidDebuff:DebuffId(zoneid, 350355, 801, 5, 5, true) -- Fated Conjunction
PlexusStatusRaidDebuff:DebuffId(zoneid, 351680, 802, 5, 5, true) -- Heroic Destiny
PlexusStatusRaidDebuff:DebuffId(zoneid, 353693, 803, 5, 5) -- Unstable Fate
PlexusStatusRaidDebuff:DebuffId(zoneid, 350568, 804, 5, 5, true) -- Call of Eternity
PlexusStatusRaidDebuff:DebuffId(zoneid, 353931, 805, 5, 5, true) -- Twist Fate
PlexusStatusRaidDebuff:DebuffId(zoneid, 353162, 806, 5, 5, true) -- Frayed Fate
PlexusStatusRaidDebuff:DebuffId(zoneid, 353432, 807, 5, 5) -- Burden of Destiny
PlexusStatusRaidDebuff:DebuffId(zoneid, 353398, 808, 5, 5) -- Anomalous Blast

-- Kel'Thuzad
PlexusStatusRaidDebuff:BossNameId(zoneid, 900, "Kel'Thuzad")
PlexusStatusRaidDebuff:DebuffId(zoneid, 348638, 901, 5, 5, true) -- Return of the Damned
PlexusStatusRaidDebuff:DebuffId(zoneid, 348760, 902, 5, 5, true) -- Frost Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 348978, 903, 5, 5, true) -- Soul Exhaustion
PlexusStatusRaidDebuff:DebuffId(zoneid, 346530, 904, 5, 5, true, true) -- Shatter
PlexusStatusRaidDebuff:DebuffId(zoneid, 354289, 905, 5, 5, nil, true) -- Necrotic Miasma
PlexusStatusRaidDebuff:DebuffId(zoneid, 352316, 906, 5, 5) -- Soul Marked
PlexusStatusRaidDebuff:DebuffId(zoneid, 347292, 907, 5, 5, true) -- Oblivion's Echo
PlexusStatusRaidDebuff:DebuffId(zoneid, 354208, 908, 5, 5) -- Howling Blizzard
PlexusStatusRaidDebuff:DebuffId(zoneid, 354033, 909, 5, 5) -- Frozen Wastes

-- Sylvanas Windrunner
PlexusStatusRaidDebuff:BossNameId(zoneid, 1000, "Sylvanas Windrunner")
PlexusStatusRaidDebuff:DebuffId(zoneid, 347807, 1001, 5, 5, true, true) -- Barbed Arrow
PlexusStatusRaidDebuff:DebuffId(zoneid, 347607, 1002, 5, 5, true, true) -- Banshee's Mark
PlexusStatusRaidDebuff:DebuffId(zoneid, 347704, 1003, 5, 5, true, true) -- Veil of Darkness
PlexusStatusRaidDebuff:DebuffId(zoneid, 349458, 1004, 5, 5, nil, true) -- Domination Chains
PlexusStatusRaidDebuff:DebuffId(zoneid, 348064, 1005, 5, 5) -- Wailing Arrow
PlexusStatusRaidDebuff:DebuffId(zoneid, 347670, 1006, 5, 5, true) -- Shadow Dagger
end)