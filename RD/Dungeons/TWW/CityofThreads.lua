-- local zone = "City of Threads"
local zoneid = 2343
local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 443401, 1, 5, 5, true) -- Venom Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 443437, 1, 5, 5, true) -- Shadow of Doubt
PlexusStatusRaidDebuff:DebuffId(zoneid, 443438, 1, 5, 5, true) -- Doubt
PlexusStatusRaidDebuff:DebuffId(zoneid, 450783, 1, 5, 5, true) -- Perfume Toss
PlexusStatusRaidDebuff:DebuffId(zoneid, 443432, 1, 5, 5, true) -- Silken Binding
PlexusStatusRaidDebuff:DebuffId(zoneid, 446718, 1, 5, 5, true) -- Umbral Weave
PlexusStatusRaidDebuff:DebuffId(zoneid, 443435, 1, 5, 5, true) -- Twist Thoughts
PlexusStatusRaidDebuff:DebuffId(zoneid, 448047, 1, 5, 5, true) -- Web Wrap
PlexusStatusRaidDebuff:DebuffId(zoneid, 451426, 1, 5, 5, true) -- Gossamer Barrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 461630, 1, 5, 5, true) -- Venomous Spray
PlexusStatusRaidDebuff:DebuffId(zoneid, 451239, 1, 5, 5, true) -- Brutal Jab
PlexusStatusRaidDebuff:DebuffId(zoneid, 451295, 1, 5, 5, true) -- Void Rush
PlexusStatusRaidDebuff:DebuffId(zoneid, 452151, 1, 5, 5, true) -- Rigorous Jab
PlexusStatusRaidDebuff:DebuffId(zoneid, 443509, 1, 5, 5, true) -- Ravenous Swarm
PlexusStatusRaidDebuff:DebuffId(zoneid, 445812, 1, 5, 5, true) -- Dark Barrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 443427, 1, 5, 5, true) -- Web Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 451309, 1, 5, 5, true) -- Eye of the Queen

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

PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Orator Krix'vizk")
PlexusStatusRaidDebuff:DebuffId(zoneid, 434710, 101, 5, 5, true) --Chains of Oppression
PlexusStatusRaidDebuff:DebuffId(zoneid, 434722, 102, 5, 5, true) --Subjugate
PlexusStatusRaidDebuff:DebuffId(zoneid, 434779, 103, 5, 5, true) --Terrorize
PlexusStatusRaidDebuff:DebuffId(zoneid, 448561, 104, 5, 5, true) --Shadows of Doubt
PlexusStatusRaidDebuff:DebuffId(zoneid, 434829, 105, 5, 5, true) --Vociferous Indoctrination
PlexusStatusRaidDebuff:DebuffId(zoneid, 434926, 106, 5, 5, true) --Lingering Influence


PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Fangs of the Queen")
PlexusStatusRaidDebuff:DebuffId(zoneid, 439518, 201, 5, 5, true) --Twin Fangs
PlexusStatusRaidDebuff:DebuffId(zoneid, 439522, 202, 5, 5, true) --Synergic Step
PlexusStatusRaidDebuff:DebuffId(zoneid, 439621, 203, 5, 5, true) --Shade Slash
PlexusStatusRaidDebuff:DebuffId(zoneid, 439637, 204, 5, 5, true) --Echoing Shade
PlexusStatusRaidDebuff:DebuffId(zoneid, 439692, 205, 5, 5, true) --Duskbringer
PlexusStatusRaidDebuff:DebuffId(zoneid, 440218, 206, 5, 5, true) --Ice Sickles
PlexusStatusRaidDebuff:DebuffId(zoneid, 440107, 207, 5, 5, true) --Knife Throw
PlexusStatusRaidDebuff:DebuffId(zoneid, 440468, 208, 5, 5, true) --Rime Dagger
PlexusStatusRaidDebuff:DebuffId(zoneid, 440470, 209, 5, 5, true) --Freezing Blood
PlexusStatusRaidDebuff:DebuffId(zoneid, 458741, 210, 5, 5, true) --Frozen Solid


PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "The Coaglamation")
PlexusStatusRaidDebuff:DebuffId(zoneid, 441216, 301, 5, 5, true) --Viscous Darkness
PlexusStatusRaidDebuff:DebuffId(zoneid, 442285, 302, 5, 5, true) --Corrupted Coating
PlexusStatusRaidDebuff:DebuffId(zoneid, 461842, 303, 5, 5, true) --Oozing Smash
PlexusStatusRaidDebuff:DebuffId(zoneid, 461880, 304, 5, 5, true) --Blood Surge
PlexusStatusRaidDebuff:DebuffId(zoneid, 437533, 305, 5, 5, true) --Dark Pulse


PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Izo, the Grand Splicer")
PlexusStatusRaidDebuff:DebuffId(zoneid, 439401, 401, 5, 5, true) --Shifting Anomalies
PlexusStatusRaidDebuff:DebuffId(zoneid, 439341, 402, 5, 5, true) --Splice
PlexusStatusRaidDebuff:DebuffId(zoneid, 437700, 403, 5, 5, true) --Tremor Slam
PlexusStatusRaidDebuff:DebuffId(zoneid, 450042, 404, 5, 5, true) --Gorge
PlexusStatusRaidDebuff:DebuffId(zoneid, 450047, 405, 5, 5, true) --Gorged
PlexusStatusRaidDebuff:DebuffId(zoneid, 450055, 406, 5, 5, true) --Gutburst
PlexusStatusRaidDebuff:DebuffId(zoneid, 438860, 407, 5, 5, true) --Umbral Weave
PlexusStatusRaidDebuff:DebuffId(zoneid, 439646, 408, 5, 5, true) --Process of Elimination

