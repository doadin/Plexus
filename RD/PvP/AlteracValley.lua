-- local zone = "Alterac Valley"
local zoneid --luacheck: ignore
if Plexus:IsRetailWow() then --luacheck: ignore
    zoneid = 91 --luacheck: ignore Retail
end
if Plexus:IsClassicWow() or Plexus:IsWrathWow() then --luacheck: ignore
    zoneid = 1459 --luacheck: ignore Classic
end
