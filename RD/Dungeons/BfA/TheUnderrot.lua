--local zone = "The Underrot"
local zoneid = 1041
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

PlexusStatusRaidDebuff:DebuffId(zoneid, 272457, 1, 6, 6, true) --Shockwave
PlexusStatusRaidDebuff:DebuffId(zoneid, 260312, 1, 6, 6, true) --Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 272180, 1, 6, 6, true) --Death Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 259732, 1, 6, 6, true) --Festering Harvest
PlexusStatusRaidDebuff:DebuffId(zoneid, 272469, 1, 6, 6, true) --Abyssal Slam
PlexusStatusRaidDebuff:DebuffId(zoneid, 266265, 1, 6, 6, true) --Wicked Assault
PlexusStatusRaidDebuff:DebuffId(zoneid, 187647, 1, 6, 6, true) --Bloodletting Pounce
PlexusStatusRaidDebuff:DebuffId(zoneid, 272609, 1, 6, 6, true) --Maddening Gaze
PlexusStatusRaidDebuff:DebuffId(zoneid, 120694, 1, 6, 6, true) --Dire Beast
PlexusStatusRaidDebuff:DebuffId(zoneid, 260793, 1, 6, 6, true) --Indigestion
PlexusStatusRaidDebuff:DebuffId(zoneid, 266201, 1, 6, 6, true) --Bone Shield
PlexusStatusRaidDebuff:DebuffId(zoneid, 261498, 1, 6, 6, true) --Creeping Rot
PlexusStatusRaidDebuff:DebuffId(zoneid, 265377, 1, 6, 6, true) --Hooked Snare
PlexusStatusRaidDebuff:DebuffId(zoneid, 266107, 1, 6, 6, true) --Thirst For Blood
PlexusStatusRaidDebuff:DebuffId(zoneid, 265084, 1, 6, 6, true) --Blood Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 265376, 1, 6, 6, true) --Barbed Spear
PlexusStatusRaidDebuff:DebuffId(zoneid, 265540, 1, 6, 6, true) --Rotten Bile
PlexusStatusRaidDebuff:DebuffId(zoneid, 265568, 1, 6, 6, true) --Dark Omen
PlexusStatusRaidDebuff:DebuffId(zoneid, 278789, 1, 6, 6, true) --Wave of Decay
PlexusStatusRaidDebuff:DebuffId(zoneid, 265468, 1, 6, 6, true) --Withering Curse
PlexusStatusRaidDebuff:DebuffId(zoneid, 266106, 1, 6, 6, true) --Sonic Screech
PlexusStatusRaidDebuff:DebuffId(zoneid, 265511, 1, 6, 6, true) --Spirit Drain
PlexusStatusRaidDebuff:DebuffId(zoneid, 265016, 1, 6, 6, true) --Blood Harvest
PlexusStatusRaidDebuff:DebuffId(zoneid, 265533, 1, 6, 6, true) --Blood Maw
PlexusStatusRaidDebuff:DebuffId(zoneid, 269843, 1, 6, 6, true) --Vile Expulsion
PlexusStatusRaidDebuff:DebuffId(zoneid, 278961, 1, 6, 6, true) --Decaying Mind
PlexusStatusRaidDebuff:DebuffId(zoneid, 265487, 1, 6, 6, true) --Shadow Bolt Volley
PlexusStatusRaidDebuff:DebuffId(zoneid, 265019, 1, 6, 6, true) --Savage Cleave
PlexusStatusRaidDebuff:DebuffId(zoneid, 260455, 1, 6, 6, true) --Serrated Fangs
PlexusStatusRaidDebuff:DebuffId(zoneid, 339, 1, 6, 6, true) --Entangling Roots
PlexusStatusRaidDebuff:DebuffId(zoneid, 164815, 1, 6, 6, true) --Sunfire
PlexusStatusRaidDebuff:DebuffId(zoneid, 256445, 1, 6, 6, true) --Venom Spit

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

--Elder Leaxa
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Saboteur Kip'tilak")
PlexusStatusRaidDebuff:DebuffId(zoneid, 260685, 11, 6, 6, true) --Taint of G'huun
--Cragmaw the Infested
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Saboteur Kip'tilak")
PlexusStatusRaidDebuff:DebuffId(zoneid, 260333, 21, 6, 6, true) --Tantrum
--Sporecaller Zancha
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Saboteur Kip'tilak")
PlexusStatusRaidDebuff:DebuffId(zoneid, 259714, 31, 6, 6, true) --Decaying Spores
PlexusStatusRaidDebuff:DebuffId(zoneid, 259718, 32, 6, 6, true) --Upheaval
--Unbound Abomination
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Saboteur Kip'tilak")
PlexusStatusRaidDebuff:DebuffId(zoneid, 269301, 41, 6, 6, true) --Putrid Blood
end)