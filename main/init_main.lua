local _G            = GLOBAL
local MOD_SCRAPBOOK = GetModConfigData("MOD_SCRAPBOOK")

local INIT_MAIN_MISC =
{
    "tuning",
    "assets",
    "prefabs",
    "recipes",
    "recipes_sorting",
}

for _, v in pairs(INIT_MAIN_MISC) do
	modimport("main/misc/net_"..v)
end

if MOD_SCRAPBOOK then
    modimport("main/misc/net_scrapbook")
end