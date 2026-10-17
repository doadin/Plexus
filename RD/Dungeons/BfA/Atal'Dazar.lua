--local zone = "Atal'Dazar"
local zoneid = 934
local Plexus = _G.Plexus
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
WhenRaidDebuffReady(function(PlexusStatusRaidDebuff)

PlexusStatusRaidDebuff:DebuffId(zoneid, 254959, 1, 6, 6, true) --Soulburn
PlexusStatusRaidDebuff:DebuffId(zoneid, 250372, 1, 6, 6, true) --Lingering Nausea
PlexusStatusRaidDebuff:DebuffId(zoneid, 250096, 1, 6, 6, true) --Wracking Pain
PlexusStatusRaidDebuff:DebuffId(zoneid, 250036, 1, 6, 6, true) --Shadowy Remains
PlexusStatusRaidDebuff:DebuffId(zoneid, 257692, 1, 6, 6, true) --Tiki Blaze
PlexusStatusRaidDebuff:DebuffId(zoneid, 257483, 1, 6, 6, true) --Pile of Bones
PlexusStatusRaidDebuff:DebuffId(zoneid, 249919, 1, 6, 6, true) --Skewer
PlexusStatusRaidDebuff:DebuffId(zoneid, 253562, 1, 6, 6, true) --Wildfire
PlexusStatusRaidDebuff:DebuffId(zoneid, 253279, 1, 6, 6, true) --Merciless Assault
PlexusStatusRaidDebuff:DebuffId(zoneid, 272631, 1, 6, 6, true) --Battering Maul
PlexusStatusRaidDebuff:DebuffId(zoneid, 256138, 1, 6, 6, true) --Fervent Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 255581, 1, 6, 6, true) --Gilded Claws
PlexusStatusRaidDebuff:DebuffId(zoneid, 279118, 1, 6, 6, true) --Unstable Hex
PlexusStatusRaidDebuff:DebuffId(zoneid, 273185, 1, 6, 6, true) --Shield Bash
PlexusStatusRaidDebuff:DebuffId(zoneid, 255620, 1, 6, 6, true) --Festering Eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 251187, 1, 6, 6, true) --Leaping Thrash
PlexusStatusRaidDebuff:DebuffId(zoneid, 255895, 1, 6, 6, true) --Poisoned Claws
PlexusStatusRaidDebuff:DebuffId(zoneid, 256959, 1, 6, 6, true) --Rotting Decay
PlexusStatusRaidDebuff:DebuffId(zoneid, 252923, 1, 6, 6, true) --Venom Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 252687, 1, 6, 6, true) --Venomfang Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 252666, 1, 6, 6, true) --Venom-Tipped Blade
PlexusStatusRaidDebuff:DebuffId(zoneid, 255041, 1, 6, 6, true) --Terrifying Screech
PlexusStatusRaidDebuff:DebuffId(zoneid, 256577, 1, 6, 6, true) --Soulfeast
PlexusStatusRaidDebuff:DebuffId(zoneid, 252692, 1, 6, 6, true) --Waylaying Jab
PlexusStatusRaidDebuff:DebuffId(zoneid, 255567, 1, 6, 6, true) --Frenzied Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 277072, 1, 6, 6, true) --Corrupted Gold
PlexusStatusRaidDebuff:DebuffId(zoneid, 258986, 1, 6, 6, true) --Stink Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 196189, 1, 6, 6, true) --Bloody Talons
PlexusStatusRaidDebuff:DebuffId(zoneid, 255814, 1, 6, 6, true) --Rending Maul
PlexusStatusRaidDebuff:DebuffId(zoneid, 259130, 1, 6, 6, true) --Tiki Flame
PlexusStatusRaidDebuff:DebuffId(zoneid, 255842, 1, 6, 6, true) --Blood-Tainted Cauldron of Gold
PlexusStatusRaidDebuff:DebuffId(zoneid, 258723, 1, 6, 6, true) --Grotesque Pool
PlexusStatusRaidDebuff:DebuffId(zoneid, 255558, 1, 6, 6, true) -- Tainted Blood

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

-- 8.3
PlexusStatusRaidDebuff:DebuffId(zoneid, 314411, 1, 6, 6, true) --Lingering Doubt
PlexusStatusRaidDebuff:DebuffId(zoneid, 314392, 1, 6, 6, true) --Vile Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 314592, 1, 6, 6, true) --Mind Flay
PlexusStatusRaidDebuff:DebuffId(zoneid, 314406, 1, 6, 6, true) --Crippling Pestilence
PlexusStatusRaidDebuff:DebuffId(zoneid, 314308, 1, 6, 6, true) --Spirit Breaker
PlexusStatusRaidDebuff:DebuffId(zoneid, 314478, 1, 6, 6, true) --Cascading Terror
PlexusStatusRaidDebuff:DebuffId(zoneid, 314531, 1, 6, 6, true) --Tear Flesh
PlexusStatusRaidDebuff:DebuffId(zoneid, 313445, 1, 1, 1, true) --Ny'alotha Incursion

--Priestess Alun'az
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Priestess Alun'az")
PlexusStatusRaidDebuff:DebuffId(zoneid, 255582, 11, 6, 6, true) --Molten Gold
PlexusStatusRaidDebuff:DebuffId(zoneid, 255558, 12, 6, 6, true) --Tainted Blood
PlexusStatusRaidDebuff:DebuffId(zoneid, 255577, 13, 6, 6, true) --Transfusion
--Val'Kaal
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Val'Kaal")
PlexusStatusRaidDebuff:DebuffId(zoneid, 250258, 21, 6, 6, true) --Toxic Leap
PlexusStatusRaidDebuff:DebuffId(zoneid, 250585, 22, 6, 6, true) --Toxic Pool
PlexusStatusRaidDebuff:DebuffId(zoneid, 250368, 23, 6, 6, true) --Noxious Stench
--Rezan
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Rezan")
PlexusStatusRaidDebuff:DebuffId(zoneid, 255434, 31, 6, 6, true) --Serrated Teeth
PlexusStatusRaidDebuff:DebuffId(zoneid, 255421, 32, 6, 6, true) --Devour
PlexusStatusRaidDebuff:DebuffId(zoneid, 255371, 33, 6, 6, true) --Terrifying Visage
PlexusStatusRaidDebuff:DebuffId(zoneid, 257407, 34, 6, 6, true) --Pursuit
PlexusStatusRaidDebuff:DebuffId(zoneid, 255365, 35, 6, 6, true) --Ancient Dry Bones
PlexusStatusRaidDebuff:DebuffId(zoneid, 257483, 36, 6, 6, true) --Pile of Bones
--Yazma
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Yazma")
PlexusStatusRaidDebuff:DebuffId(zoneid, 250050, 41, 6, 6, true) --Echoes of Shadra
PlexusStatusRaidDebuff:DebuffId(zoneid, 249924, 42, 6, 6, true) --Soulrend
end)