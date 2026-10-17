--local zone = "Shrine of the Storm"
local zoneid = 1039
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

PlexusStatusRaidDebuff:DebuffId(zoneid, 268317, 1, 6, 6, true) --Rip Mind
PlexusStatusRaidDebuff:DebuffId(zoneid, 268322, 1, 6, 6, true) --Touch of the Drowned
PlexusStatusRaidDebuff:DebuffId(zoneid, 268233, 1, 6, 6, true) --Electrifying Shock
PlexusStatusRaidDebuff:DebuffId(zoneid, 268273, 1, 6, 6, true) --Deep Smash
PlexusStatusRaidDebuff:DebuffId(zoneid, 267969, 1, 6, 6, true) --Water Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 267973, 1, 6, 6, true) --Wash Away
PlexusStatusRaidDebuff:DebuffId(zoneid, 265001, 1, 6, 6, true) --Sea Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 274703, 1, 6, 6, true) --Void Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 224729, 1, 6, 6, true) --Bursting Shot
PlexusStatusRaidDebuff:DebuffId(zoneid, 276286, 1, 6, 6, true) --Slicing Hurricane
PlexusStatusRaidDebuff:DebuffId(zoneid, 269104, 1, 6, 6, true) --Explosive Void
PlexusStatusRaidDebuff:DebuffId(zoneid, 274438, 1, 6, 6, true) --Tempest
PlexusStatusRaidDebuff:DebuffId(zoneid, 277373, 1, 6, 6, true) --Massive Glaive
PlexusStatusRaidDebuff:DebuffId(zoneid, 268028, 1, 6, 6, true) --Crushing Waters
PlexusStatusRaidDebuff:DebuffId(zoneid, 268391, 1, 6, 6, true) --Mental Assault
PlexusStatusRaidDebuff:DebuffId(zoneid, 268309, 1, 6, 6, true) --Unending Darkness
PlexusStatusRaidDebuff:DebuffId(zoneid, 268280, 1, 6, 6, true) --Tidal Pod
PlexusStatusRaidDebuff:DebuffId(zoneid, 267956, 1, 6, 6, true) --Zap
PlexusStatusRaidDebuff:DebuffId(zoneid, 268315, 1, 6, 6, true) --Lash
PlexusStatusRaidDebuff:DebuffId(zoneid, 274720, 1, 6, 6, true) --Abyssal Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 269419, 1, 6, 6, true) --Yawning Gate
PlexusStatusRaidDebuff:DebuffId(zoneid, 268348, 1, 6, 6, true) --Colossal Slam
PlexusStatusRaidDebuff:DebuffId(zoneid, 268214, 1, 6, 6, true) --Carve Flesh
PlexusStatusRaidDebuff:DebuffId(zoneid, 268059, 1, 6, 6, true) --Anchor of Binding
PlexusStatusRaidDebuff:DebuffId(zoneid, 268027, 1, 6, 6, true) --Rising Tides
PlexusStatusRaidDebuff:DebuffId(zoneid, 274633, 1, 6, 6, true) --Sundering Blow
PlexusStatusRaidDebuff:DebuffId(zoneid, 267818, 1, 6, 6, true) --Slicing Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 274792, 1, 6, 6, true) --Bite
PlexusStatusRaidDebuff:DebuffId(zoneid, 265056, 1, 6, 6, true) --Invigorating Freehold Brew
PlexusStatusRaidDebuff:DebuffId(zoneid, 264526, 1, 6, 6, true) --Grasp from the Depths
PlexusStatusRaidDebuff:DebuffId(zoneid, 12054, 1, 6, 6, true) --Rend
PlexusStatusRaidDebuff:DebuffId(zoneid, 276268, 1, 6, 6, true) --Heaving Blow
PlexusStatusRaidDebuff:DebuffId(zoneid, 276297, 1, 6, 6, true) --Void Seed
PlexusStatusRaidDebuff:DebuffId(zoneid, 274714, 1, 6, 6, true) --Twisting Void
PlexusStatusRaidDebuff:DebuffId(zoneid, 259618, 1, 6, 6, true) --Gruesome Tear

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


--Aqu'sirr
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Aqu'sirr")
PlexusStatusRaidDebuff:DebuffId(zoneid, 264560, 11, 6, 6, true) --Choking Brine
PlexusStatusRaidDebuff:DebuffId(zoneid, 264155, 12, 6, 6, true) --Surging Rush
PlexusStatusRaidDebuff:DebuffId(zoneid, 264166, 13, 6, 6, true) --Undertow
--Tidesage Council
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Tidesage Council")
PlexusStatusRaidDebuff:DebuffId(zoneid, 267905, 21, 6, 6, true) --Reinforcing Ward
PlexusStatusRaidDebuff:DebuffId(zoneid, 267891, 22, 6, 6, true) --Swiftness Ward
PlexusStatusRaidDebuff:DebuffId(zoneid, 267899, 23, 6, 6, true) --Hindering Cleave
PlexusStatusRaidDebuff:DebuffId(zoneid, 267830, 24, 6, 6, true) --Blessing of the Tempest
PlexusStatusRaidDebuff:DebuffId(zoneid, 267841, 25, 6, 6, true) --Blowback
--Lord Stormsong
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Lord Stormsong")
PlexusStatusRaidDebuff:DebuffId(zoneid, 269097, 31, 6, 6, true) --Waken the Void
PlexusStatusRaidDebuff:DebuffId(zoneid, 269131, 32, 6, 6, true) --Ancient mindbender
PlexusStatusRaidDebuff:DebuffId(zoneid, 268896, 33, 6, 6, true) --Mind Rend
--Vol'zith the Whisperer
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Vol'zith the Whisperer")
PlexusStatusRaidDebuff:DebuffId(zoneid, 267548, 41, 6, 6, true) --Leviathan's Wake
PlexusStatusRaidDebuff:DebuffId(zoneid, 267360, 42, 6, 6, true) --Grasp of the Sunken City
PlexusStatusRaidDebuff:DebuffId(zoneid, 267034, 43, 6, 6, true) --Whispers of Power
end)