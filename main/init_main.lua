local _G = GLOBAL

local INIT_MAIN_MISC =
{
    "tuning",
    "assets",
    "prefabs",
    "recipes",
    "recipes_sorting",
    -- "scrapbook",
}

for _, v in pairs(INIT_MAIN_MISC) do
	modimport("main/misc/net_"..v)
end