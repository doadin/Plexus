-- local zone = "Arathi Basin"
local zoneid
if Plexus:IsRetailWow() then
    zoneid = 1366 --luacheck: ignore Retail
end
if Plexus:IsClassicWow() or Plexus:IsWrathWow() then
    zoneid = 1461 --luacheck: ignore Classic
end
