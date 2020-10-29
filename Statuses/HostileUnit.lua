local PlexusStatusHostileUnit = Plexus:GetModule("PlexusStatus"):NewModule("PlexusStatusHostileUnit")
PlexusStatusHostileUnit.menuName = "HostileUnit"

PlexusStatusHostileUnit.defaultDB = {
    unitIsHostile = {
        enable = false,
        priority = 90,
        color = { r = 1, g = 0, b = 0, a = 1 },
        text = "MC'd",
    },
    warningDisplayed = false,
}

local settings

function PlexusStatusHostileUnit:OnInitialize()
    self.super.OnInitialize(self)
    self:RegisterStatus("unitIsHostile", "Hostile Unit", nil, true)
    settings = PlexusStatusHostileUnit.db.profile
end

function PlexusStatusHostileUnit:OnStatusEnable(status)
    if status == "unitIsHostile" then
        self:RegisterEvent("UNIT_AURA", "UNIT_AURA")
        self:RegisterMessage("Plexus_UnitJoined")
        self:RegisterMessage("Plexus_UnitChanged")
    end
end

function PlexusStatusHostileUnit:OnStatusDisable(status)
    if status == "unitIsHostile" then
        self:UnregisterEvent("UNIT_AURA", "UNIT_AURA")
        self:UnregisterMessage("Plexus_UnitJoined")
        self:UnregisterMessage("Plexus_UnitChanged")
    end
end

function PlexusStatusHostileUnit:Plexus_UnitJoined(_, _, unitid)
    self:Update(unitid)
end

function PlexusStatusHostileUnit:Plexus_UnitChanged(_, _, unitid)
    self:Update(unitid)
end

function PlexusStatusHostileUnit:UNIT_AURA(_, unitid)
    self:Update(unitid)
end

function PlexusStatusHostileUnit:Update(unitid)
    if not unitid then
        return
    end

    local plexusName = UnitGUID(unitid);
    local hostile = UnitCanAttack("player", unitid);

    if hostile then
        self.core:SendStatusGained(plexusName, "unitIsHostile",
                    settings.unitIsHostile.priority,
                    nil, --"Interface\\Icons\\Spell_Shadow_ShadowWordDominate"
                    settings.unitIsHostile.color,
                    settings.unitIsHostile.text,
                    nil,
                    "Interface\\Icons\\Spell_Shadow_ShadowWordDominate"
        )
    else
        self.core:SendStatusLost(plexusName, "unitIsHostile")
    end
end

