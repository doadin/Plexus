--local zone = "The Everbloom"
local zoneid = 620

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

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 169823, 1, 6, 6, true) -- Bola de Fuego
PlexusStatusRaidDebuff:DebuffId(zoneid, 169840, 1, 6, 6, true) -- Descarga de Escarcha
PlexusStatusRaidDebuff:DebuffId(zoneid, 169844, 1, 6, 6, true) -- Aliento de dragon
PlexusStatusRaidDebuff:DebuffId(zoneid, 169824, 1, 6, 6, true) -- Descarga de Escarcha
PlexusStatusRaidDebuff:DebuffId(zoneid, 169850, 1, 6, 6, true) -- Ola gelida
PlexusStatusRaidDebuff:DebuffId(zoneid, 169839, 1, 6, 6, true) -- Bola de Fuego
PlexusStatusRaidDebuff:DebuffId(zoneid, 164886, 1, 6, 6, true) -- Toxina de horripetalo
PlexusStatusRaidDebuff:DebuffId(zoneid, 164834, 1, 6, 6, true) -- Tromba de hojas
PlexusStatusRaidDebuff:DebuffId(zoneid, 164965, 1, 6, 6, true) -- Vides asfixiantes
PlexusStatusRaidDebuff:DebuffId(zoneid, 169445, 1, 6, 6, true) -- Noxious Eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 426849, 1, 6, 6, true) -- Cold Fusion
PlexusStatusRaidDebuff:DebuffId(zoneid, 165123, 1, 6, 6, true) -- Venom Burst
PlexusStatusRaidDebuff:DebuffId(zoneid, 426500, 1, 6, 6, true) -- Gnarled Roots
PlexusStatusRaidDebuff:DebuffId(zoneid, 169495, 1, 6, 6, true) -- Living Leaves
PlexusStatusRaidDebuff:DebuffId(zoneid, 427460, 1, 6, 6, true) --Toxic Bloom

--Withrbark
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Withrbark")
PlexusStatusRaidDebuff:DebuffId(zoneid, 164275, 11, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 164357, 12, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169495, 13, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 164294, 14, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 164538, 15, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 164302, 16, 6, 6, true)

--Ancient Protectors
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Ancient Protectors")
PlexusStatusRaidDebuff:DebuffId(zoneid, 168520, 21, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 173263, 22, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 168092, 23, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 168082, 24, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 168105, 25, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 168040, 26, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 167966, 27, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 168041, 28, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 168187, 29, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 168375, 30, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 168383, 31, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 167977, 32, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169658, 33, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 427513, 34, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 427510, 35, 6, 6, true)

--Archmage Sol
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Archmage Sol")
PlexusStatusRaidDebuff:DebuffId(zoneid, 166464, 41, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 166489, 42, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 166465, 43, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 166726, 44, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 166466, 45, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 166751, 46, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 168885, 47, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 168894, 48, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 168895, 49, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 166891, 50, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 166492, 51, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 170016, 52, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 426991, 53, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 428084, 54, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 427863, 55, 6, 6, true)

--Xeri'tac
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Xeri'tac")
PlexusStatusRaidDebuff:DebuffId(zoneid, 169275, 61, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169375, 62, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169376, 63, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169382, 64, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169249, 65, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169218, 66, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169224, 67, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169371, 68, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169233, 69, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 173080, 70, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169223, 71, 6, 6, true)

--Yalnu
PlexusStatusRaidDebuff:BossNameId(zoneid, 80, "Yalnu")
PlexusStatusRaidDebuff:DebuffId(zoneid, 169179, 81, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169120, 82, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169876, 83, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169878, 84, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169929, 85, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169613, 86, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 173536, 87, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 173563, 88, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169251, 89, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 170132, 90, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 169879, 91, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 428834, 92, 6, 6, true)
end)