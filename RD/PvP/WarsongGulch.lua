-- local zone = "Warsong Gulch"
local zoneid --luacheck: ignore
if Plexus:IsRetailWow() then --luacheck: ignore
    zoneid = 1339 --luacheck: ignore Retail
end
if Plexus:IsClassicWow() or Plexus:IsWrathWow() then --luacheck: ignore
    zoneid = 1460 --luacheck: ignore Classic
end
