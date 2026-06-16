local _G          = GLOBAL
local GROUND      = _G.GROUND
local WORLD_TILES = _G.WORLD_TILES

-- Import our Turf Defs.
local INIT_TILEDEFS =
{
	"shipwrecked",
	"hamlet",
	"interior",
	"events",
	"custom",
}

for _, v in pairs(INIT_TILEDEFS) do
	modimport("main/world/net_tiledefs_"..v)
end

-- Needs to be loaded after all tiledefs.
modimport("main/world/net_tile_render_order")