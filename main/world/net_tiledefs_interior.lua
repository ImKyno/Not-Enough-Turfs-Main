local _G          = GLOBAL
local WORLD_TILES = _G.WORLD_TILES

local INTERIOR_TURFS =
{
	"WOODPANEL",
	"DRIFTWOODPANEL",
	"MARBLETILE",
	"CHESS",
	"SLATE",
	"METALWOOD",
	"METALSHEET",
	"GARDENPATH",
	"GARDEN",
	"GEOMETRIC",
	"REDGEOMETRIC",
	"YELLOWGEOMETRIC",
	"GREENGEOMETRIC",
	"BWGEOMETRIC",
	"SHAGCARPET",
	"TRANSITIONAL",
	"HERRING",
	"HEXAGON",
	"HOOF",
	"OCTAGON",
}

for _, turf in ipairs(INTERIOR_TURFS) do
	if WORLD_TILES[turf] ~= nil then
		return
	end
end

AddTile("WOODPANEL", "LAND",
	{
		ground_name     = "INTERIOR_WOODPANEL",
		old_static_id   = 94,
	},
	{
		name            = "blocky",
		noise_texture   = "levels/textures/interior/interior_noise_woodpanel.tex",
		runsound        = "dontstarve/movement/run_wood",
		walksound       = "dontstarve/movement/walk_wood",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/interior/interior_mini_noise_woodpanel.tex",
	},
	{
		name            = "woodpanel",
		anim            = "woodpanel",
		bank_build      = "kyno_turfs_interior",
		pickupsound     = "wood",
	}
)

AddTile("DRIFTWOODPANEL", "LAND",
	{
		ground_name     = "INTERIOR_DRIFTWOODPANEL",
	},
	{
		name            = "blocky",
		noise_texture   = "levels/textures/interior/interior_noise_driftwoodpanel.tex",
		runsound        = "dontstarve/movement/run_wood",
		walksound       = "dontstarve/movement/walk_wood",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/interior/interior_mini_noise_driftwoodpanel.tex",
	},
	{
		name            = "driftwoodpanel",
		anim            = "driftwoodpanel",
		bank_build      = "kyno_turfs_interior",
		pickupsound     = "wood",
	}
)

AddTile("MARBLETILE", "LAND",
	{
		ground_name     = "INTERIOR_MARBLETILE",
		old_static_id   = 99,
	},
	{
		name            = "blocky",
		noise_texture   = "levels/textures/interior/interior_noise_marbletile.tex",
		runsound        = "dontstarve/movement/run_marble",
		walksound       = "dontstarve/movement/walk_marble",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/interior/interior_mini_noise_marbletile.tex",
	},
	{
		name            = "marbletile",
		anim            = "marbletile",
		bank_build      = "kyno_turfs_interior",
		pickupsound     = "rock",
	}
)

AddTile("CHESS", "LAND",
	{
		ground_name     = "INTERIOR_CHESS",
		old_static_id   = 100,
	},
	{
		name            = "tile_lawn",
		noise_texture   = "levels/textures/interior/interior_noise_chess.tex",
		runsound        = "dontstarve/movement/run_marble",
		walksound       = "dontstarve/movement/walk_marble",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
		roadways        = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/interior/interior_mini_noise_chess.tex",
	},
	{
		name            = "chess",
		anim            = "chess",
		bank_build      = "kyno_turfs_interior",
		pickupsound     = "rock",
	}
)

AddTile("SLATE", "LAND",
	{
		ground_name     = "INTERIOR_SLATE",
		old_static_id   = 101,
	},
	{
		name            = "blocky",
		noise_texture   = "levels/textures/interior/interior_noise_slate.tex",
		runsound        = "dontstarve/movement/run_marble",
		walksound       = "dontstarve/movement/walk_marble",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/interior/interior_mini_noise_slate.tex",
	},
	{
		name            = "slate",
		anim            = "slate",
		bank_build      = "kyno_turfs_interior",
		pickupsound     = "rock",
	}
)

AddTile("METALWOOD", "LAND",
	{
		ground_name     = "INTERIOR_METALWOOD",
	},
	{
		name            = "blocky",
		noise_texture   = "levels/textures/interior/interior_noise_metalwood.tex",
		runsound        = "dontstarve/movement/run_marble",
		walksound       = "dontstarve/movement/walk_marble",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/interior/interior_mini_noise_metalwood.tex",
	},
	{
		name            = "metalwood",
		anim            = "metalwood",
		bank_build      = "kyno_turfs_interior",
		pickupsound     = "metal",
	}
)

AddTile("METALSHEET", "LAND",
	{
		ground_name     = "INTERIOR_METALSHEET",
		old_static_id   = 102,
	},
	{
		name            = "blocky",
		noise_texture   = "levels/textures/interior/interior_noise_metalsheet.tex",
		runsound        = "dontstarve/movement/run_marble",
		walksound       = "dontstarve/movement/walk_marble",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/interior/interior_mini_noise_metalsheet.tex",
	},
	{
		name            = "metalsheet",
		anim            = "metalsheet",
		bank_build      = "kyno_turfs_interior",
		pickupsound     = "metal",
	}
)

AddTile("GARDENPATH", "LAND",
	{
		ground_name     = "INTERIOR_GARDENPATH",
	},
	{
		name            = "deciduous",
		noise_texture   = "levels/textures/interior/interior_noise_gardenpath.tex",
		runsound        = "dontstarve/movement/run_marble",
		walksound       = "dontstarve/movement/walk_marble",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/interior/interior_mini_noise_gardenpath.tex",
	},
	{
		name            = "gardenpath",
		anim            = "gardenpath",
		bank_build      = "kyno_turfs_interior",
		pickupsound     = "rock",
	}
)

AddTile("GARDEN", "LAND",
	{
		ground_name     = "INTERIOR_GARDEN",
		old_static_id   = 103,
	},
	{
		name            = "cave",
		noise_texture   = "levels/textures/interior/interior_noise_garden.tex",
		runsound        = "dontstarve/movement/run_marble",
		walksound       = "dontstarve/movement/walk_marble",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/interior/interior_mini_noise_garden.tex",
	},
	{
		name            = "garden",
		anim            = "garden",
		bank_build      = "kyno_turfs_interior",
		pickupsound     = "rock",
	}
)

AddTile("GEOMETRIC", "LAND",
	{
		ground_name     = "INTERIOR_GEOMETRIC",
		old_static_id   = 104,
	},
	{
		name            = "blocky",
		noise_texture   = "levels/textures/interior/interior_noise_geometric.tex",
		runsound        = "dontstarve/movement/run_marble",
		walksound       = "dontstarve/movement/walk_marble",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/interior/interior_mini_noise_geometric.tex",
	},
	{
		name            = "geometric",
		anim            = "geometric",
		bank_build      = "kyno_turfs_interior",
		pickupsound     = "rock",
	}
)

AddTile("REDGEOMETRIC", "LAND",
	{
		ground_name     = "INTERIOR_REDGEOMETRIC",
	},
	{
		name            = "blocky",
		noise_texture   = "levels/textures/interior/interior_noise_redgeometric.tex",
		runsound        = "dontstarve/movement/run_marble",
		walksound       = "dontstarve/movement/walk_marble",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/interior/interior_mini_noise_redgeometric.tex",
	},
	{
		name            = "redgeometric",
		anim            = "redgeometric",
		bank_build      = "kyno_turfs_interior",
		pickupsound     = "rock",
	}
)

AddTile("YELLOWGEOMETRIC", "LAND",
	{
		ground_name     = "INTERIOR_YELLOWGEOMETRIC",
	},
	{
		name            = "blocky",
		noise_texture   = "levels/textures/interior/interior_noise_yellowgeometric.tex",
		runsound        = "dontstarve/movement/run_marble",
		walksound       = "dontstarve/movement/walk_marble",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/interior/interior_mini_noise_yellowgeometric.tex",
	},
	{
		name            = "yellowgeometric",
		anim            = "yellowgeometric",
		bank_build      = "kyno_turfs_interior",
		pickupsound     = "rock",
	}
)

AddTile("GREENGEOMETRIC", "LAND",
	{
		ground_name     = "INTERIOR_GREENGEOMETRIC",
	},
	{
		name            = "blocky",
		noise_texture   = "levels/textures/interior/interior_noise_greengeometric.tex",
		runsound        = "dontstarve/movement/run_marble",
		walksound       = "dontstarve/movement/walk_marble",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/interior/interior_mini_noise_greengeometric.tex",
	},
	{
		name            = "greengeometric",
		anim            = "greengeometric",
		bank_build      = "kyno_turfs_interior",
		pickupsound     = "rock",
	}
)

AddTile("BWGEOMETRIC", "LAND",
	{
		ground_name     = "INTERIOR_BWGEOMETRIC",
	},
	{
		name            = "blocky",
		noise_texture   = "levels/textures/interior/interior_noise_bwgeometric.tex",
		runsound        = "dontstarve/movement/run_marble",
		walksound       = "dontstarve/movement/walk_marble",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/interior/interior_mini_noise_bwgeometric.tex",
	},
	{
		name            = "bwgeometric",
		anim            = "bwgeometric",
		bank_build      = "kyno_turfs_interior",
		pickupsound     = "rock",
	}
)

AddTile("SHAGCARPET", "LAND",
	{
		ground_name     = "INTERIOR_SHAGCARPET",
		old_static_id   = 105,
	},
	{
		name            = "carpet",
		noise_texture   = "levels/textures/interior/interior_noise_shagcarpet.tex",
		runsound        = "dontstarve/movement/run_carpet",
		walksound       = "dontstarve/movement/walk_carpet",
		snowsound       = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/interior/interior_mini_noise_shagcarpet.tex",
	},
	{
		name            = "shagcarpet",
		anim            = "shagcarpet",
		bank_build      = "kyno_turfs_interior",
		pickupsound     = "cloth",
	}
)

AddTile("TRANSITIONAL", "LAND",
	{
		ground_name     = "INTERIOR_TRANSITIONAL",
		old_static_id   = 106,
	},
	{
		name            = "blocky",
		noise_texture   = "levels/textures/interior/interior_noise_transitional.tex",
		runsound        = "dontstarve/movement/run_wood",
		walksound       = "dontstarve/movement/walk_wood",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/interior/interior_mini_noise_transitional.tex",
	},
	{
		name            = "transitional",
		anim            = "transitional",
		bank_build      = "kyno_turfs_interior",
		pickupsound     = "wood",
	}
)

AddTile("HERRING", "LAND",
	{
		ground_name     = "INTERIOR_HERRING",
		old_static_id   = 107,
	},
	{
		name            = "blocky",
		noise_texture   = "levels/textures/interior/interior_noise_herring.tex",
		runsound        = "dontstarve/movement/run_marble",
		walksound       = "dontstarve/movement/walk_marble",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
		roadways        = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/interior/interior_mini_noise_herring.tex",
	},
	{
		name            = "herring",
		anim            = "herring",
		bank_build      = "kyno_turfs_interior",
		pickupsound     = "rock",
	}
)

AddTile("HEXAGON", "LAND",
	{
		ground_name     = "INTERIOR_HEXAGON",
		old_static_id   = 108,
	},
	{
		name            = "blocky",
		noise_texture   = "levels/textures/interior/interior_noise_hexagon.tex",
		runsound        = "dontstarve/movement/run_marble",
		walksound       = "dontstarve/movement/walk_marble",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/interior/interior_mini_noise_hexagon.tex",
	},
	{
		name            = "hexagon",
		anim            = "hexagon",
		bank_build      = "kyno_turfs_interior",
		pickupsound     = "rock",
	}
)

AddTile("HOOF", "LAND",
	{
		ground_name     = "INTERIOR_HOOF",
		old_static_id   = 109,
	},
	{
		name            = "blocky",
		noise_texture   = "levels/textures/interior/interior_noise_hoof.tex",
		runsound        = "dontstarve/movement/run_marble",
		walksound       = "dontstarve/movement/walk_marble",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/interior/interior_mini_noise_hoof.tex",
	},
	{
		name            = "hoof",
		anim            = "hoof",
		bank_build      = "kyno_turfs_interior",
		pickupsound     = "rock",
	}
)

AddTile("OCTAGON", "LAND",
	{
		ground_name     = "INTERIOR_OCTAGON",
		old_static_id   = 110,
	},
	{
		name            = "blocky",
		noise_texture   = "levels/textures/interior/interior_noise_octagon.tex",
		runsound        = "dontstarve/movement/run_marble",
		walksound       = "dontstarve/movement/walk_marble",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/interior/interior_mini_noise_octagon.tex",
	},
	{
		name            = "octagon",
		anim            = "octagon",
		bank_build      = "kyno_turfs_interior",
		pickupsound     = "rock",
	}
)