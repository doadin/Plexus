--local zone = "Iron Docks"
local zoneid = 595

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

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

--M+
PlexusStatusRaidDebuff:DebuffId(zoneid, 240447, 1, 6, 6, true) --Quake
PlexusStatusRaidDebuff:DebuffId(zoneid, 240559, 1, 6, 6, true, true) --Grievous Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 209858, 1, 6, 6, true, true) --Necrotic Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 240443, 1, 6, 6, true, true) --Burst
PlexusStatusRaidDebuff:DebuffId(zoneid, 226512, 1, 6, 6, true) --Sanguine Ichor
PlexusStatusRaidDebuff:DebuffId(zoneid, 409492, 1, 6, 6, true, true) --Afflicted Cry
PlexusStatusRaidDebuff:DebuffId(zoneid, 408805, 1, 6, 6, true) --Destabilize
PlexusStatusRaidDebuff:DebuffId(zoneid, 408556, 1, 6, 6, true) --Entangled
PlexusStatusRaidDebuff:DebuffId(zoneid, 440313, 1, 6, 6, true) --Devouring Rift

PlexusStatusRaidDebuff:DebuffId(zoneid, 373552, 1, 6, 6, true) --Hypnosis Bat
PlexusStatusRaidDebuff:DebuffId(zoneid, 373429, 1, 6, 6, true, true) --Carrion Swarm
PlexusStatusRaidDebuff:DebuffId(zoneid, 373391, 1, 6, 6, true) --Nightmare
PlexusStatusRaidDebuff:DebuffId(zoneid, 373744, 1, 6, 6, true) --Blood Siphon

--Trash

PlexusStatusRaidDebuff:DebuffId(zoneid, 173149, 1, 6, 6, true) --Flaming Arrows
PlexusStatusRaidDebuff:DebuffId(zoneid, 168398, 1, 6, 6, true) --Rapid Fire Targeting
PlexusStatusRaidDebuff:DebuffId(zoneid, 178156, 1, 6, 6, true) --Acid Splash
PlexusStatusRaidDebuff:DebuffId(zoneid, 374295, 1, 6, 6, true) --Restoration
PlexusStatusRaidDebuff:DebuffId(zoneid, 164504, 1, 6, 6, true) --Intimidated
PlexusStatusRaidDebuff:DebuffId(zoneid, 168227, 1, 6, 6, true) --Gronn Smash
PlexusStatusRaidDebuff:DebuffId(zoneid, 172771, 1, 6, 6, true) --Incendiary Slug
PlexusStatusRaidDebuff:DebuffId(zoneid, 173489, 1, 6, 6, true) --Lava Barrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 173324, 1, 6, 6, true) --Jagged Caltrops
PlexusStatusRaidDebuff:DebuffId(zoneid, 158341, 1, 6, 6, true) --Gushing Wounds
PlexusStatusRaidDebuff:DebuffId(zoneid, 173307, 1, 6, 6, true) --Serrated Spear
PlexusStatusRaidDebuff:DebuffId(zoneid, 373509, 1, 6, 6, true) --Shadow Claws
PlexusStatusRaidDebuff:DebuffId(zoneid, 226512, 1, 6, 6, true) --Sanguine Ichor
PlexusStatusRaidDebuff:DebuffId(zoneid, 173105, 1, 6, 6, true) --Whirling Chains
PlexusStatusRaidDebuff:DebuffId(zoneid, 167240, 1, 6, 6, true) --Leg Shot
PlexusStatusRaidDebuff:DebuffId(zoneid, 172963, 1, 6, 6, true) --Gatecrasher
PlexusStatusRaidDebuff:DebuffId(zoneid, 172889, 1, 6, 6, true) --Charging Slash
PlexusStatusRaidDebuff:DebuffId(zoneid, 173113, 1, 6, 6, true) --Hatchet Toss
PlexusStatusRaidDebuff:DebuffId(zoneid, 172636, 1, 6, 6, true) --Slippery Grease

--Fleshrender Nok'gar
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Fleshrender Nok'gar")
PlexusStatusRaidDebuff:DebuffId(zoneid, 164648, 11, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 164632, 12, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 164426, 13, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 164835, 14, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 164837, 15, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 164734, 16, 6, 6, true)

--Grimrail Enforcers
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Grimrail Enforcers")
PlexusStatusRaidDebuff:DebuffId(zoneid, 163689, 21, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 163705, 22, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 163740, 23, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 163668, 24, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 165152, 25, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 163376, 26, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 163390, 27, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 163276, 28, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 163376, 29, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 163379, 30, 6, 6, true)

--Oshir
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Oshir")
PlexusStatusRaidDebuff:DebuffId(zoneid, 163166, 41, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 162418, 42, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 162415, 43, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 163054, 44, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 163059, 45, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 161256, 46, 6, 6, true)

--Skulloc, Son of Gruul
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Skulloc, Son of Gruul")
PlexusStatusRaidDebuff:DebuffId(zoneid, 168929, 51, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169129, 52, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 168399, 53, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 168955, 54, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 168401, 55, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 168348, 56, 6, 6, true)
end)