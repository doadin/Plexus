--local zone = "Highmaul"
local zoneid = 612
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

--zoneid, debuffID, order, icon_priority, colorpriority, timer, stackable, color, defaultdisable, noicon
--, true, true is for stackable

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 175601, 1, 5, 5) -- Trash TAINTED CLAWS
PlexusStatusRaidDebuff:DebuffId(zoneid, 175599, 1, 4, 4) -- Trash DEVOUR
PlexusStatusRaidDebuff:DebuffId(zoneid, 172069, 1, 5, 5) -- Trash RADIATING POISON
PlexusStatusRaidDebuff:DebuffId(zoneid, 172066, 1, 4, 4) -- Trash RADIATING POISON
PlexusStatusRaidDebuff:DebuffId(zoneid, 166779, 1, 5, 5) -- Trash STAGGERING BLOW
PlexusStatusRaidDebuff:DebuffId(zoneid, 56037, 1,  4, 4) -- Trash RUNE OF DESTRUCTION
PlexusStatusRaidDebuff:DebuffId(zoneid, 175654, 1, 5, 5) -- Trash RUNE OF DISINTEGRATION
PlexusStatusRaidDebuff:DebuffId(zoneid, 166185, 1, 5, 5) -- Trash RENDING SLASH
PlexusStatusRaidDebuff:DebuffId(zoneid, 166175, 1, 5, 5) -- Trash EARTHDEVASTATING SLAM
PlexusStatusRaidDebuff:DebuffId(zoneid, 174404, 1, 5, 5) -- Trash FROZEN CORE
PlexusStatusRaidDebuff:DebuffId(zoneid, 173763, 1, 5, 5) -- Trash WILD FLAMES
PlexusStatusRaidDebuff:DebuffId(zoneid, 174500, 1, 5, 5) -- Trash RENDING THROW
PlexusStatusRaidDebuff:DebuffId(zoneid, 174939, 1, 4, 4) -- Trash Time Stop
PlexusStatusRaidDebuff:DebuffId(zoneid, 172115, 1, 4, 4) -- Trash Earthen Thrust
PlexusStatusRaidDebuff:DebuffId(zoneid, 166200, 1, 4, 4) -- Trash ARCANEVOLATILITY
PlexusStatusRaidDebuff:DebuffId(zoneid, 174473, 1, 5, 5) -- Trash Corrupted Blood

--The Butcher
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "The Butcher")
PlexusStatusRaidDebuff:DebuffId(zoneid, 156152, 11, 5, 5, true, true) --GUSHING WOUNDS
PlexusStatusRaidDebuff:DebuffId(zoneid, 156151, 12, 6, 6) --THE TENDERIZER
PlexusStatusRaidDebuff:DebuffId(zoneid, 156143, 13, 5, 5, true, true) --THE CLEAVER
PlexusStatusRaidDebuff:DebuffId(zoneid, 163046, 14, 5, 5) --PALE VITRIOL

--Kargath Bladefist
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Kargath Bladefist")
PlexusStatusRaidDebuff:DebuffId(zoneid, 159113, 21, 5, 5) --IMPALE
PlexusStatusRaidDebuff:DebuffId(zoneid, 159178, 22, 6, 6) --OPENWOUNDS
PlexusStatusRaidDebuff:DebuffId(zoneid, 159213, 23, 7, 7) --MONSTERS BRAWL
PlexusStatusRaidDebuff:DebuffId(zoneid, 158986, 24, 4, 4) --BERSERKER RUSH
PlexusStatusRaidDebuff:DebuffId(zoneid, 159410, 25, 5, 5) --MAULING BREW
PlexusStatusRaidDebuff:DebuffId(zoneid, 160521, 26, 6, 6) --VILE BREATH
PlexusStatusRaidDebuff:DebuffId(zoneid, 159386, 27, 5, 5) --IRON BOMB
PlexusStatusRaidDebuff:DebuffId(zoneid, 159188, 28, 5, 5) --GRAPPLE
PlexusStatusRaidDebuff:DebuffId(zoneid, 162497, 29, 4, 4) --ON THE HUNT
PlexusStatusRaidDebuff:DebuffId(zoneid, 159202, 30, 5, 5) --FLAME JET

--Twin Ogron
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Twin Ogron")
PlexusStatusRaidDebuff:DebuffId(zoneid, 158026, 41, 6, 6) --ENFEEBLING ROAR
PlexusStatusRaidDebuff:DebuffId(zoneid, 158241, 42, 5, 5, true, true) --BLAZE
PlexusStatusRaidDebuff:DebuffId(zoneid, 155569, 43, 5, 5) --INJURED
PlexusStatusRaidDebuff:DebuffId(zoneid, 167200, 44, 5, 5, true, true) --ARCANE WOUND
PlexusStatusRaidDebuff:DebuffId(zoneid, 159709, 45, 6, 6, true, true) --WEAKENED DEFENSES 159709 167179
PlexusStatusRaidDebuff:DebuffId(zoneid, 163374, 46, 4, 4) --ARCANE VOLATILITY
PlexusStatusRaidDebuff:DebuffId(zoneid, 158200, 47, 4, 4) --QUAKE

--Ko'ragh
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Ko'ragh")
PlexusStatusRaidDebuff:DebuffId(zoneid, 161242, 51, 4, 4) --CAUSTIC ENERGY
PlexusStatusRaidDebuff:DebuffId(zoneid, 161358, 52, 4, 4) --SUPPRESSION FIELD
PlexusStatusRaidDebuff:DebuffId(zoneid, 162184, 53, 6, 6) --EXPEL MAGIC SHADOW
PlexusStatusRaidDebuff:DebuffId(zoneid, 162186, 54, 6, 6) --EXPEL MAGIC ARCANE
PlexusStatusRaidDebuff:DebuffId(zoneid, 161411, 55, 6, 6) --EXPEL MAGIC FROST
PlexusStatusRaidDebuff:DebuffId(zoneid, 163472, 56, 4, 4) --DOMINATING POWER
PlexusStatusRaidDebuff:DebuffId(zoneid, 162185, 57, 7, 7) --EXPEL MAGIC FEL
--PlexusStatusRaidDebuff:DebuffId(zoneid, 156803, 57, 7, 7) --NULLIFICATION BARRIER

--Tectus
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Tectus")
PlexusStatusRaidDebuff:DebuffId(zoneid, 162346, 61, 5, 5) --CRYSTALLINE BARRAGE
PlexusStatusRaidDebuff:DebuffId(zoneid, 162892, 62, 5, 5) --PETRIFICATION
PlexusStatusRaidDebuff:DebuffId(zoneid, 162475, 63, 5, 5) --Tectonic Upheaval

--Brackenspore
PlexusStatusRaidDebuff:BossNameId(zoneid, 70, "Brackenspore")
PlexusStatusRaidDebuff:DebuffId(zoneid, 163242, 71, 5, 5, true, true) --INFESTING SPORES
PlexusStatusRaidDebuff:DebuffId(zoneid, 163590, 72, 5, 5) --CREEPING MOSS
PlexusStatusRaidDebuff:DebuffId(zoneid, 163241, 73, 5, 5, true, true) --ROT
PlexusStatusRaidDebuff:DebuffId(zoneid, 159220, 74, 6, 6) --NECROTIC BREATH
PlexusStatusRaidDebuff:DebuffId(zoneid, 160179, 75, 6, 6) --MIND FUNGUS
PlexusStatusRaidDebuff:DebuffId(zoneid, 159972, 76, 6, 6, true, true) --FLESHEATER

--Imperator Mar'gok
PlexusStatusRaidDebuff:BossNameId(zoneid, 80, "Imperator Mar'gok")
PlexusStatusRaidDebuff:DebuffId(zoneid, 156238, 81, 4, 4) --BRANDED  156238 163990 163989 163988
PlexusStatusRaidDebuff:DebuffId(zoneid, 156467, 82, 5, 5) --DESTRUCTIVE RESONANCE  156467 164075 164076 164077
PlexusStatusRaidDebuff:DebuffId(zoneid, 158605, 83, 4, 4) --MARK OF CHAOS  158605 164176 164178 164191
PlexusStatusRaidDebuff:DebuffId(zoneid, 164004, 84, 4, 4) --BRANDED DISPLACEMENT
PlexusStatusRaidDebuff:DebuffId(zoneid, 164075, 85, 4, 4) --DESTRUCTIVE RESONANCE DISPLACEMENT
PlexusStatusRaidDebuff:DebuffId(zoneid, 164176, 86, 4, 4) --MARK OF CHAOS DISPLACEMENT
PlexusStatusRaidDebuff:DebuffId(zoneid, 164005, 87, 4, 4) --BRANDED FORTIFICATION
PlexusStatusRaidDebuff:DebuffId(zoneid, 164076, 88, 4, 4) --DESTRUCTIVE RESONANCE FORTIFICATION
PlexusStatusRaidDebuff:DebuffId(zoneid, 164178, 89, 4, 4) --MARK OF CHAOS FORTIFICATION
PlexusStatusRaidDebuff:DebuffId(zoneid, 164006, 90, 4, 4) --BRANDED REPLICATION
PlexusStatusRaidDebuff:DebuffId(zoneid, 164077, 91, 4, 4) --DESTRUCTIVE RESONANCE REPLICATION
PlexusStatusRaidDebuff:DebuffId(zoneid, 164191, 92, 4, 4) --MARK OF CHAOS REPLICATION
PlexusStatusRaidDebuff:DebuffId(zoneid, 157349, 93, 5, 5) --FORCE NOVA  157349 164232 164235 164240
PlexusStatusRaidDebuff:DebuffId(zoneid, 157763, 94, 4, 4) --FIXATE
PlexusStatusRaidDebuff:DebuffId(zoneid, 158553, 95, 6, 6, true, true) --CRUSH ARMOR
PlexusStatusRaidDebuff:DebuffId(zoneid, 165102, 96, 7, 7) --Infinite Darkness
PlexusStatusRaidDebuff:DebuffId(zoneid, 157801, 97, 7, 7) --Slow
end)