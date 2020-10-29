local PlexusStatusPlayer

PlexusStatusPlayer = Plexus:GetModule("PlexusStatus"):NewModule("PlexusStatusPlayer")
PlexusStatusPlayer.menuName = "Player"

PlexusStatusPlayer.defaultDB = {
	alert_me = {
		text = "Self",
		enable = false,
		color = { r = 0.25, g = 1.0, b = 0.25, a = 1 },
		priority = 75,
		range = false,
	},
}

function PlexusStatusPlayer:PostInitialize()
	self:Debug("OnInitialize")
    self:RegisterStatus("alert_me", "Player")
end

function PlexusStatusPlayer:OnStatusEnable(status)
	self:Debug("OnEnable")
	if status ~= "alert_me" then return end
	self:RegisterEvent("Plexus_RosterUpdated","Update")
	self:Update()
end

function PlexusStatusPlayer:OnStatusDisable(status)
	self:Debug("OnDisable")
	if status ~= "alert_me" then return end
	self:UnregisterEvent("Plexus_RosterUpdated")
	self:ClearAll("alert_me")
end

function PlexusStatusPlayer:Update()
	self:Debug("Update")

	self:ClearAll("alert_me")
    local me = UnitGUID("player")
	local settings_me = self.db.profile.alert_me
    self.core:SendStatusGained(me, "alert_self",
                               settings_me.priority,
                               settings_me.range,
                               settings_me.color,
                               settings_me.text
	)
end

function PlexusStatusPlayer:ClearAll(status)
	for name in self.core:CachedStatusIterator(status) do
		self.core:SendStatusLost(name, status)
	end
end
