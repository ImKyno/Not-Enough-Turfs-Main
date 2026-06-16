local _G          = GLOBAL
local WORLD_TILES = _G.WORLD_TILES

modimport("main/misc/net_tuning")

-- Don't create these turfs if these two mods are enabled.
if TUNING.NET_IS_IAS_ENABLED and TUNING.NET_IS_IAC_ENABLED then
	return
end

local HAMLET_TURFS =
{
	"COBBLEROAD",
	"PIGRUINS",
	"FIELDS",
	"FOUNDATION",
	"LAWN",
	"RAINFOREST",
	"PLAINS",
	"DEEPJUNGLE",
	"BOG",
	"MOSSY_BLOSSOM",
	"GASJUNGLE",
	"ANTCAVE",
	"BATCAVE",
}

for _, turf in ipairs(HAMLET_TURFS) do
	if WORLD_TILES[turf] ~= nil then
		return
	end
end

AddTile("COBBLEROAD", "LAND",
	{
		ground_name     = "HAMLET_COBBLEROAD",
		old_static_id   = 63,
	},
	{
		name            = "tile_cobbleroad",
		noise_texture   = "levels/textures/hamlet/hamlet_noise_cobbleroad.tex",
		runsound        = "dontstarve/movement/run_dirt",
		walksound       = "dontstarve/movement/walk_dirt",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
		roadways        = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/hamlet/hamlet_mini_noise_cobbleroad.tex",
	},
	{
		name            = "cobbleroad",
		anim            = "cobbleroad",
		bank_build      = "kyno_turfs_hamlet",
		pickupsound     = "rock",
	}
)

AddTile("PIGRUINS", "LAND",
	{
		ground_name     = "HAMLET_PIGRUINS",
		old_static_id   = 64,
	},
	{
		name            = "blocky",
		noise_texture   = "levels/textures/hamlet/hamlet_noise_pigruins.tex",
		runsound        = "dontstarve/movement/run_dirt",
		walksound       = "dontstarve/movement/walk_dirt",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
		roadways        = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/hamlet/hamlet_mini_noise_pigruins.tex",
	},
	{
		name            = "pigruins",
		anim            = "pigruins",
		bank_build      = "kyno_turfs_hamlet",
		pickupsound     = "rock",
	}
)

AddTile("FIELDS", "LAND",
	{
		ground_name     = "HAMLET_FIELDS",
		old_static_id   = 65,
	},
	{
		name            = "tile_jungle",
		noise_texture   = "levels/textures/hamlet/hamlet_noise_fields.tex",
		runsound        = "dontstarve/movement/run_grass",
		walksound       = "dontstarve/movement/walk_grass",
		snowsound       = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/hamlet/hamlet_mini_noise_fields.tex",
	},
	{
		name            = "fields",
		anim            = "fields",
		bank_build      = "kyno_turfs_hamlet",
		pickupsound     = "vegetation_grassy",
	}
)

AddTile("FOUNDATION", "LAND",
	{
		ground_name     = "HAMLET_FOUNDATION",
		old_static_id   = 67,
	},
	{
		name            = "blocky",
		noise_texture   = "levels/textures/hamlet/hamlet_noise_foundation.tex",
		runsound        = "dontstarve/movement/run_marble",
		walksound       = "dontstarve/movement/walk_marble",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/hamlet/hamlet_mini_noise_foundation.tex",
	},
	{
		name            = "foundation",
		anim            = "foundation",
		bank_build      = "kyno_turfs_hamlet",
		pickupsound     = "rock",
	}
)

AddTile("LAWN", "LAND",
	{
		ground_name     = "HAMLET_LAWN",
		old_static_id   = 68,
	},
	{
		name            = "tile_lawn",
		noise_texture   = "levels/textures/hamlet/hamlet_noise_lawn.tex",
		runsound        = "dontstarve/movement/run_grass",
		walksound       = "dontstarve/movement/walk_grass",
		snowsound       = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/hamlet/hamlet_mini_noise_lawn.tex",
	},
	{
		name            = "lawn",
		anim            = "lawn",
		bank_build      = "kyno_turfs_hamlet",
		pickupsound     = "vegetation_grassy",
	}
)

AddTile("RAINFOREST", "LAND",
	{
		ground_name     = "HAMLET_RAINFOREST",
		old_static_id   = 69,
	},
	{
		name            = "tile_rainforest",
		noise_texture   = "levels/textures/hamlet/hamlet_noise_rainforest.tex",
		runsound        = "dontstarve/movement/run_tallgrass",
		walksound       = "dontstarve/movement/walk_tallgrass",
		snowsound       = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/hamlet/hamlet_mini_noise_rainforest.tex",
	},
	{
		name            = "rainforest",
		anim            = "rainforest",
		bank_build      = "kyno_turfs_hamlet",
		pickupsound     = "vegetation_grassy",
	}
)

AddTile("PLAINS", "LAND",
	{
		ground_name     = "HAMLET_PLAINS",
		old_static_id   = 70,
	},
	{
		name            = "tile_jungle",
		noise_texture   = "levels/textures/hamlet/hamlet_noise_plains.tex",
		runsound        = "dontstarve/movement/run_grass",
		walksound       = "dontstarve/movement/walk_grass",
		snowsound       = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/hamlet/hamlet_mini_noise_plains.tex",
	},
	{
		name            = "plains",
		anim            = "plains",
		bank_build      = "kyno_turfs_hamlet",
		pickupsound     = "vegetation_grassy",
	}
)

AddTile("DEEPJUNGLE", "LAND",
	{
		ground_name     = "HAMLET_DEEPJUNGLE",
		old_static_id   = 71,
	},
	{
		name            = "tile_deepjungle",
		noise_texture   = "levels/textures/hamlet/hamlet_noise_deepjungle.tex",
		runsound        = "dontstarve/movement/run_tallgrass",
		walksound       = "dontstarve/movement/walk_tallgrass",
		snowsound       = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/hamlet/hamlet_mini_noise_deepjungle.tex",
	},
	{
		name            = "deepjungle",
		anim            = "deepjungle",
		bank_build      = "kyno_turfs_hamlet",
		pickupsound     = "vegetation_grassy",
	}
)

AddTile("BOG", "LAND",
	{
		ground_name     = "HAMLET_BOG",
		old_static_id   = 72,
	},
	{
		name            = "cave",
		noise_texture   = "levels/textures/hamlet/hamlet_noise_bog.tex",
		runsound        = "dontstarve/movement/run_sand",
		walksound       = "dontstarve/movement/walk_sand",
		snowsound       = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/hamlet/hamlet_mini_noise_bog.tex",
	},
	{
		name            = "bog",
		anim            = "bog",
		bank_build      = "kyno_turfs_hamlet",
		pickupsound     = "vegetation_firm",
	}
)

AddTile("MOSSY_BLOSSOM", "LAND",
	{
		ground_name     = "HAMLET_MOSSY_BLOSSOM",
		old_static_id   = 73,
	},
	{
		name            = "desert_dirt",
		noise_texture   = "levels/textures/hamlet/hamlet_noise_mossy_blossom.tex",
		runsound        = "dontstarve/movement/run_grass",
		walksound       = "dontstarve/movement/walk_grass",
		snowsound       = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/hamlet/hamlet_mini_noise_mossy_blossom.tex",
	},
	{
		name            = "mossy_blossom",
		anim            = "mossy_blossom",
		bank_build      = "kyno_turfs_hamlet",
		pickupsound     = "vegetation_grassy",
	}
)

AddTile("GASJUNGLE", "LAND",
	{
		ground_name     = "HAMLET_GASJUNGLE",
		old_static_id   = 74,
	},
	{
		name            = "tile_deepjungle",
		noise_texture   = "levels/textures/hamlet/hamlet_noise_gasjungle.tex",
		runsound        = "dontstarve/movement/run_tallgrass",
		walksound       = "dontstarve/movement/walk_tallgrass",
		snowsound       = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/hamlet/hamlet_mini_noise_gasjungle.tex",
	},
	{
		name            = "gasjungle",
		anim            = "gasjungle",
		bank_build      = "kyno_turfs_hamlet",
		pickupsound     = "vegetation_grassy",
	}
)

AddTile("ANTCAVE", "LAND",
	{
		ground_name     = "HAMLET_ANTCAVE",
		old_static_id   = 76,
	},
	{
		name            = "cave",
		noise_texture   = "levels/textures/hamlet/hamlet_noise_antcave.tex",
		runsound        = "dontstarve/movement/run_dirt",
		walksound       = "dontstarve/movement/walk_dirt",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/hamlet/hamlet_mini_noise_antcave.tex",
	},
	{
		name            = "antcave",
		anim            = "antcave",
		bank_build      = "kyno_turfs_hamlet",
		pickupsound     = "rock",
	}
)

AddTile("BATCAVE", "LAND",
	{
		ground_name     = "HAMLET_BATCAVE",
		old_static_id   = 77,
	},
	{
		name            = "cave",
		noise_texture   = "levels/textures/hamlet/hamlet_noise_batcave.tex",
		runsound        = "dontstarve/movement/run_dirt",
		walksound       = "dontstarve/movement/walk_dirt",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/hamlet/hamlet_mini_noise_batcave.tex",
	},
	{
		name            = "batcave",
		anim            = "batcave",
		bank_build      = "kyno_turfs_hamlet",
		pickupsound     = "rock",
	}
)