--local zone = "Siege of Boralus"
local zoneid = 1162
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

PlexusStatusRaidDebuff:DebuffId(zoneid, 272588, 1, 6, 6, true)  --Rotting Wounds
PlexusStatusRaidDebuff:DebuffId(zoneid, 257168, 1, 6, 6, true)  --Cursed Slash
PlexusStatusRaidDebuff:DebuffId(zoneid, 257036, 1, 6, 6, true)  --Feral Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 272140, 1, 6, 6, true)  --Iron Volley
PlexusStatusRaidDebuff:DebuffId(zoneid, 273930, 1, 6, 6, true)  --Hindering Cut
PlexusStatusRaidDebuff:DebuffId(zoneid, 272421, 1, 6, 6, true)  --Sighted Artillery
PlexusStatusRaidDebuff:DebuffId(zoneid, 272144, 1, 6, 6, true)  --Cover
PlexusStatusRaidDebuff:DebuffId(zoneid, 256663, 1, 6, 6, true)  --Burning Tar
PlexusStatusRaidDebuff:DebuffId(zoneid, 272834, 1, 6, 6, true)  --Viscous Slobber
PlexusStatusRaidDebuff:DebuffId(zoneid, 256866, 1, 6, 6, true)  --Iron Ambush
PlexusStatusRaidDebuff:DebuffId(zoneid, 272571, 1, 6, 6, true)  --Choking Waters
PlexusStatusRaidDebuff:DebuffId(zoneid, 272874, 1, 6, 6, true)  --Trample
PlexusStatusRaidDebuff:DebuffId(zoneid, 257169, 1, 6, 6, true)  --Terrifying Roar
PlexusStatusRaidDebuff:DebuffId(zoneid, 274942, 1, 6, 6, true)  --Banana Rampage
PlexusStatusRaidDebuff:DebuffId(zoneid, 256897, 1, 6, 6, true)  --Clamping Jaws
PlexusStatusRaidDebuff:DebuffId(zoneid, 257292, 1, 6, 6, true)  --Heavy Slash
PlexusStatusRaidDebuff:DebuffId(zoneid, 257886, 1, 6, 6, true)  --Brine Pool
PlexusStatusRaidDebuff:DebuffId(zoneid, 261428, 1, 6, 6, true)  --Hangman's Noose
PlexusStatusRaidDebuff:DebuffId(zoneid, 270624, 1, 6, 6, true)  --Crushing Embrace
PlexusStatusRaidDebuff:DebuffId(zoneid, 275836, 1, 6, 6, true)  --Stinging Venom
PlexusStatusRaidDebuff:DebuffId(zoneid, 257069, 1, 6, 6, true)  --Watertight Shell

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

--Sergeant Bainbridge
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Sergeant Bainbridge")
PlexusStatusRaidDebuff:DebuffId(zoneid, 273716, 11, 6, 6, true)  --Heavy Ordnance
PlexusStatusRaidDebuff:DebuffId(zoneid, 260954, 12, 6, 6, true)  --Iron Gaze
--Dread Captain Lockwood
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Dread Captain Lockwood")
PlexusStatusRaidDebuff:DebuffId(zoneid, 273470, 21, 6, 6, true)  --Gut Shot
PlexusStatusRaidDebuff:DebuffId(zoneid, 463182, 22, 6, 6, true)  --Fiery Ricochet
--Hadal Darkfathom
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Hadal Darkfathom")
PlexusStatusRaidDebuff:DebuffId(zoneid, 257882, 31, 6, 6, true)  --Break Water
PlexusStatusRaidDebuff:DebuffId(zoneid, 276068, 32, 6, 6, true)  --Tidal Surge
--Viq'Goth
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Viq'Goth")
PlexusStatusRaidDebuff:DebuffId(zoneid, 274991, 41, 6, 6, true)  --Putrid Waters
end)