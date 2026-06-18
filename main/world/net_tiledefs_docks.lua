local _G               = GLOBAL
local TileGroups       = _G.TileGroups
local TileGroupManager = _G.TileGroupManager
local WORLD_TILES      = _G.WORLD_TILES
local FALLOFF_IDS      = _G.FALLOFF_IDS

modimport("main/misc/net_tuning")

local DOCKS =
{
	"DOCKS_DRIFTWOOD",
	"DOCKS_COBBLESTONES",
}

for _, turf in ipairs(DOCKS) do
	if WORLD_TILES[turf] ~= nil then
		return
	end
end

AddTile("DOCKS_DRIFTWOOD", "LAND",
	{
		ground_name     = "DOCKS_DRIFTWOOD",
	},
	{
		name            = "cave",
		noise_texture   = "levels/textures/docks/docks_noise_driftwood.tex",
		runsound        = "monkeyisland/dock/run_dock",
		walksound       = "monkeyisland/dock/walk_dock",
		snowsound       = "monkeyisland/dock/walk_dock",
		mudsound        = "monkeyisland/dock/walk_dock",
		flooring        = true,
		hard            = true,
		cannotbedug     = true,
		istemptile      = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/docks/docks_mini_noise_driftwood.tex",
	}
)

AddTile("DOCKS_COBBLESTONES", "LAND",
	{
		ground_name     = "DOCKS_COBBLESTONES",
	},
	{
		name            = "tile_cobbleroad",
		noise_texture   = "levels/textures/docks/docks_noise_cobblestones.tex",
		runsound        = "dontstarve/movement/run_dirt",
		walksound       = "dontstarve/movement/walk_dirt",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
		roadways        = true,
		cannotbedug     = true,
		istemptile      = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/docks/docks_mini_noise_cobblestones.tex",
	}
)

if TileGroups and TileGroups.TransparentOceanTiles then
	TileGroups.NETDockTilesDriftwood    = TileGroupManager:AddTileGroup()
	TileGroups.NETDockTilesCobblestones = TileGroupManager:AddTileGroup()

	-- Remove our docks from the default falloff.
	TileGroupManager:AddInvalidTile(TileGroups.LandTilesWithDefaultFalloff, WORLD_TILES.DOCKS_DRIFTWOOD)
	TileGroupManager:AddInvalidTile(TileGroups.LandTilesWithDefaultFalloff, WORLD_TILES.DOCKS_COBBLESTONES)

	-- Add our docks to custom falloff.
	TileGroupManager:AddValidTile(TileGroups.NETDockTilesDriftwood,    WORLD_TILES.DOCKS_DRIFTWOOD)
	TileGroupManager:AddValidTile(TileGroups.NETDockTilesCobblestones, WORLD_TILES.DOCKS_COBBLESTONES)

	-- I'm assuming no other mod is using these IDs since they need to be unique.
	FALLOFF_IDS.NET_DOCKS_DRIFTWOOD_FALLOFF    = 350
	FALLOFF_IDS.NET_DOCKS_COBBLESTONES_FALLOFF = 351

	AddFalloffTexture(FALLOFF_IDS.NET_DOCKS_DRIFTWOOD_FALLOFF,
		{
			name                          = "falloff_docks_driftwood",
			noise_texture                 = "images/square.tex",
			should_have_falloff           = TileGroups.NETDockTilesDriftwood,
			should_have_falloff_result    = true,
			neighbor_needs_falloff        = TileGroups.TransparentOceanTiles,
			neighbor_needs_falloff_result = true,
		}
	)

	AddFalloffTexture(FALLOFF_IDS.NET_DOCKS_COBBLESTONES_FALLOFF,
		{
			name                          = "falloff_docks_cobblestones",
			noise_texture                 = "images/square.tex",
			should_have_falloff           = TileGroups.NETDockTilesCobblestones,
			should_have_falloff_result    = true,
			neighbor_needs_falloff        = TileGroups.TransparentOceanTiles,
			neighbor_needs_falloff_result = true,
		}
	)
end