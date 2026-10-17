-- local zone = "Naxxramas"
local zoneid = 163
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

--zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 55314, 1, 5, 5) --Strangulate

--Anub'Rekhan
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Anub'Rekhan")
PlexusStatusRaidDebuff:DebuffId(zoneid, 28786, 11, 5, 5, true, true) --Locust Swarm


--Grand Widow Faerlina
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Grand Widow Faerlina")
PlexusStatusRaidDebuff:DebuffId(zoneid, 28796, 21, 5, 5, false, true) --Poison Bolt Volley
PlexusStatusRaidDebuff:DebuffId(zoneid, 28794, 22, 5, 5) --Rain of Fire


--Maexxna
PlexusStatusRaidDebuff:BossNameId(zoneid, 25, "Maexxna")
PlexusStatusRaidDebuff:DebuffId(zoneid, 28622, 26, 5, 5) --Web Wrap
PlexusStatusRaidDebuff:DebuffId(zoneid, 54121, 27, 5, 5) --Necrotic Poison


--Noth the Plaguebringer
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Noth the Plaguebringer")
PlexusStatusRaidDebuff:DebuffId(zoneid, 29213, 31, 5, 5, true) --Curse of the Plaguebringer
PlexusStatusRaidDebuff:DebuffId(zoneid, 29214, 32, 5, 5, true) --Wrath of the Plaguebringer
PlexusStatusRaidDebuff:DebuffId(zoneid, 29212, 33, 5, 5) --Cripple

--Heigan the Unclean
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Heigan the Unclean")
PlexusStatusRaidDebuff:DebuffId(zoneid, 29998, 41, 5, 5) --Decrepit Fever
PlexusStatusRaidDebuff:DebuffId(zoneid, 29310, 42, 5, 5, false, false, nil, true) --Spell Disruption

--Grobbulus
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Grobbulus")
PlexusStatusRaidDebuff:DebuffId(zoneid, 28169, 51, 5, 5, true) --Mutating Injection

--Gluth
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Gluth")
PlexusStatusRaidDebuff:DebuffId(zoneid, 54378, 61, 5, 5, true) --Mortal Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 29306, 62, 5, 5) --Infected Wound

--Thaddius
PlexusStatusRaidDebuff:BossNameId(zoneid, 65, "Thaddius")
PlexusStatusRaidDebuff:DebuffId(zoneid, 28084, 66, 5, 5, false, false, {r = 1, g = 0, b = 0}, true) --Negative Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 28059, 67, 5, 5, false, false, {r = 0, g = 0, b = 1}, true) --Positive Charge


--Instructor Razuvious
PlexusStatusRaidDebuff:BossNameId(zoneid, 70, "Instructor Razuvious")
PlexusStatusRaidDebuff:DebuffId(zoneid, 55550, 71, 5, 5, true) --Jagged Knife

--Sapphiron
PlexusStatusRaidDebuff:BossNameId(zoneid, 80, "Sapphiron")
PlexusStatusRaidDebuff:DebuffId(zoneid, 28522, 81, 5, 5) --Icebolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 28542, 82, 5, 5) --Life Drain

--Kel'Thuzad
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Kel'Thuzad")
PlexusStatusRaidDebuff:DebuffId(zoneid, 28410, 101, 5, 5, true) --Chains of Kel'Thuzad
PlexusStatusRaidDebuff:DebuffId(zoneid, 27819, 102, 5, 5) --Detonate Mana
PlexusStatusRaidDebuff:DebuffId(zoneid, 27808, 103, 5, 5) --Frost Blast
end)
