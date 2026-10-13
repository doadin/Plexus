-- local zone = "Arathi Basin"
local zoneid --luacheck: ignore
if Plexus:IsRetailWow() then --luacheck: ignore
    zoneid = 1366 --luacheck: ignore Retail
end
if Plexus:IsClassicWow() or Plexus:IsWrathWow() then --luacheck: ignore
    zoneid = 1461 --luacheck: ignore Classic
end
