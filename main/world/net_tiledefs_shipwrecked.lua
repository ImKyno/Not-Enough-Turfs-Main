local _G          = GLOBAL
local WORLD_TILES = _G.WORLD_TILES

modimport("main/misc/net_tuning")

-- Don't create these turfs if these two mods are enabled.
if TUNING.NET_IS_IAS_ENABLED and TUNING.NET_IS_IAC_ENABLED then
	return
end

local SHIPWRECKED_TURFS =
{
	"BEACH",
	"VOLCANO_ROCK",
	"TIDALMARSH",
	"MEADOW",
	"JUNGLE",
	"VOLCANO",
	"ASH",
	"MAGMAFIELD",
	"SNAKESKINFLOOR",
}

for _, turf in ipairs(SHIPWRECKED_TURFS) do
	if WORLD_TILES[turf] ~= nil then
		return
	end
end

AddTile("BEACH", "LAND",
	{
		ground_name     = "SHIPWRECKED_BEACH",
		old_static_id   = 78,
	},
	{
		name            = "tile_beach",
		noise_texture   = "levels/textures/shipwrecked/shipwrecked_noise_beach.tex",
		runsound        = "turnoftides/movement/run_pebblebeach",
		walksound       = "turnoftides/movement/run_pebblebeach",
		snowsound       = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/shipwrecked/shipwrecked_mini_noise_beach.tex",
	},
	{
		name            = "beach",
		anim            = "beach",
		bank_build      = "kyno_turfs_shipwrecked",
		pickupsound     = "grainy",
	}
)

AddTile("VOLCANO_ROCK", "LAND",
	{
		ground_name     = "SHIPWRECKED_VOLCANO_ROCK",
		old_static_id   = 79,
	},
	{
		name            = "tile_volcano",
		noise_texture   = "levels/textures/shipwrecked/shipwrecked_noise_volcano_rock.tex",
		runsound        = "dontstarve/movement/run_dirt",
		walksound       = "dontstarve/movement/walk_dirt",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/shipwrecked/shipwrecked_mini_noise_volcano_rock.tex",
	},
	{
		name            = "volcano_rock",
		anim            = "volcano_rock",
		bank_build      = "kyno_turfs_shipwrecked",
		pickupsound     = "rock",
	}
)

AddTile("TIDALMARSH", "LAND",
	{
		ground_name     = "SHIPWRECKED_TIDALMARSH",
		old_static_id   = 80,
	},
	{
		name            = "tile_tidalmarsh",
		noise_texture   = "levels/textures/shipwrecked/shipwrecked_noise_tidalmarsh.tex",
		runsound        = "dontstarve/movement/run_marsh",
		walksound       = "dontstarve/movement/walk_marsh",
		mudsound        = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/shipwrecked/shipwrecked_mini_noise_tidalmarsh.tex",
	},
	{
		name            = "tidalmarsh",
		anim            = "tidalmarsh",
		bank_build      = "kyno_turfs_shipwrecked",
		pickupsound     = "squidgy",
	}
)

AddTile("MEADOW", "LAND",
	{
		ground_name     = "SHIPWRECKED_MEADOW",
		old_static_id   = 81,
	},
	{
		name            = "tile_jungle",
		noise_texture   = "levels/textures/shipwrecked/shipwrecked_noise_meadow.tex",
		runsound        = "dontstarve/movement/run_tallgrass",
		walksound       = "dontstarve/movement/walk_tallgrass",
		snowsound       = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/shipwrecked/shipwrecked_mini_noise_meadow.tex",
	},
	{
		name            = "meadow",
		anim            = "meadow",
		bank_build      = "kyno_turfs_shipwrecked",
		pickupsound     = "vegetation_grassy",
	}
)

AddTile("JUNGLE", "LAND",
	{
		ground_name     = "SHIPWRECKED_JUNGLE",
		old_static_id   = 82,
	},
	{
		name            = "tile_jungle",
		noise_texture   = "levels/textures/shipwrecked/shipwrecked_noise_jungle.tex",
		runsound        = "dontstarve/movement/run_tallgrass",
		walksound       = "dontstarve/movement/walk_tallgrass",
		snowsound       = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/shipwrecked/shipwrecked_mini_noise_jungle.tex",
	},
	{
		name            = "jungle",
		anim            = "jungle",
		bank_build      = "kyno_turfs_shipwrecked",
		pickupsound     = "vegetation_grassy",
	}
)

AddTile("VOLCANO", "LAND",
	{
		ground_name     = "SHIPWRECKED_VOLCANO",
		old_static_id   = 83,
	},
	{
		name            = "cave",
		noise_texture   = "levels/textures/shipwrecked/shipwrecked_noise_volcano.tex",
		runsound        = "dontstarve/movement/run_dirt",
		walksound       = "dontstarve/movement/walk_dirt",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/shipwrecked/shipwrecked_mini_noise_volcano.tex",
	},
	{
		name            = "volcano",
		anim            = "volcano",
		bank_build      = "kyno_turfs_shipwrecked",
		pickupsound     = "rock",
	}
)

AddTile("ASH", "LAND",
	{
		ground_name     = "SHIPWRECKED_ASH",
		old_static_id   = 84,
	},
	{
		name            = "cave",
		noise_texture   = "levels/textures/shipwrecked/shipwrecked_noise_ash.tex",
		runsound        = "dontstarve/movement/run_dirt",
		walksound       = "dontstarve/movement/walk_dirt",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/shipwrecked/shipwrecked_mini_noise_ash.tex",
	},
	{
		name            = "ash",
		anim            = "ash",
		bank_build      = "kyno_turfs_shipwrecked",
		pickupsound     = "grainy",
	}
)

AddTile("MAGMAFIELD", "LAND",
	{
		ground_name     = "SHIPWRECKED_MAGMAFIELD",
		old_static_id   = 85,
	},
	{
		name            = "cave",
		noise_texture   = "levels/textures/shipwrecked/shipwrecked_noise_magmafield.tex",
		runsound        = "dontstarve/movement/run_dirt",
		walksound       = "dontstarve/movement/walk_dirt",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/shipwrecked/shipwrecked_mini_noise_magmafield.tex",
	},
	{
		name            = "magmafield",
		anim            = "magmafield",
		bank_build      = "kyno_turfs_shipwrecked",
		pickupsound     = "rock",
	}
)

AddTile("SNAKESKINFLOOR", "LAND",
	{
		ground_name     = "SHIPWRECKED_SNAKESKINFLOOR",
		old_static_id   = 86,
	},
	{
		name            = "carpet",
		noise_texture   = "levels/textures/shipwrecked/shipwrecked_noise_snakeskinfloor.tex",
		runsound        = "dontstarve/movement/run_carpet",
		walksound       = "dontstarve/movement/walk_carpet",
		snowsound       = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/shipwrecked/shipwrecked_mini_noise_snakeskinfloor.tex",
	},
	{
		name            = "snakeskinfloor",
		anim            = "snakeskinfloor",
		bank_build      = "kyno_turfs_shipwrecked",
		pickupsound     = "cloth",
	}
)