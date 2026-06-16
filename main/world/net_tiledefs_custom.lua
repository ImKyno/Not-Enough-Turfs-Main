local _G          = GLOBAL
local WORLD_TILES = _G.WORLD_TILES

local CUSTOM_TURFS =
{
	"LEGACYBOG",
	"GREENMARSH",
	"IVYGRASS",
	"LEGACYRAINFOREST",
	"LEGACYDEEPJUNGLE",
	"SNOWFALL",
	"REDCARPET",
	"MODERN_COBBLESTONES",
	"COPACABANA",
	"SWIRLGRASS",
	"SWIRLGRASSMONO",
	"LEAKPROOFCARPET",
	"PINKCARPET",
	"CYANCARPET",
	"WHITECARPET",
	"YELLOWCARPET",
	"GREENCARPET",
	"ORANGECARPET",
	"BLUEYELLOW",
	"DRIFTWOODFLOOR",
	"LUNARRIFT",
	"VAULTMOSSY",
	"WAGPUNKFLOOR",
	"CHILLEDFLOOR",
}

for _, turf in ipairs(CUSTOM_TURFS) do
	if WORLD_TILES[turf] ~= nil then
		return
	end
end

AddTile("LEGACYBOG", "LAND",
	{
		ground_name      = "CUSTOM_LEGACYBOG",
		old_static_id    = 60,
	},
	{
		name             = "cave",
		noise_texture    = "levels/textures/custom/custom_noise_legacybog.tex",
		runsound         = "dontstarve/movement/run_sand",
		walksound        = "dontstarve/movement/walk_sand",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = false,
		hard             = false,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_legacybog.tex",
	},
	{
		name             = "legacybog",
		anim             = "legacybog",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "grainy",
	}
)

AddTile("GREENMARSH", "LAND",
	{
		ground_name      = "CUSTOM_GREENMARSH",
		old_static_id    = 61,
	},
	{
		name             = "tile_tidalmarsh",
		noise_texture    = "levels/textures/custom/custom_noise_greenmarsh.tex",
		runsound         = "dontstarve/movement/run_marsh",
		walksound        = "dontstarve/movement/walk_marsh",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = false,
		hard             = false,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_greenmarsh.tex",
	},
	{
		name             = "greenmarsh",
		anim             = "greenmarsh",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "squidgy",
	}
)

AddTile("IVYGRASS", "LAND",
	{
		ground_name      = "CUSTOM_IVYGRASS",
		old_static_id    = 62,
	},
	{
		name             = "tile_rainforest",
		noise_texture    = "levels/textures/custom/custom_noise_ivygrass.tex",
		runsound         = "dontstarve/movement/run_grass",
		walksound        = "dontstarve/movement/walk_grass",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = false,
		hard             = false,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_ivygrass.tex",
	},
	{
		name             = "ivygrass",
		anim             = "ivygrass",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "vegetation_grassy",
	}
)

AddTile("LEGACYRAINFOREST", "LAND",
	{
		ground_name      = "CUSTOM_LEGACYRAINFOREST",
		old_static_id    = 111,
	},
	{
		name             = "tile_rainforest",
		noise_texture    = "levels/textures/custom/custom_noise_legacyrainforest.tex",
		runsound         = "dontstarve/movement/run_tallgrass",
		walksound        = "dontstarve/movement/walk_tallgrass",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = false,
		hard             = false,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_legacyrainforest.tex",
	},
	{
		name             = "legacyrainforest",
		anim             = "legacyrainforest",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "vegetation_grassy",
	}
)

AddTile("LEGACYDEEPJUNGLE", "LAND",
	{
		ground_name      = "CUSTOM_LEGACYDEEPJUNGLE",
		old_static_id    = 112,
	},
	{
		name             = "tile_deepjungle",
		noise_texture    = "levels/textures/custom/custom_noise_legacydeepjungle.tex",
		runsound         = "dontstarve/movement/run_tallgrass",
		walksound        = "dontstarve/movement/walk_tallgrass",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = false,
		hard             = false,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_legacydeepjungle.tex",
	},
	{
		name             = "legacydeepjungle",
		anim             = "legacydeepjungle",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "vegetation_grassy",
	}
)

AddTile("SNOWFALL", "LAND",
	{
		ground_name      = "CUSTOM_SNOWFALL",
		old_static_id    = 113,
	},
	{
		name             = "tile_snowfall",
		noise_texture    = "levels/textures/custom/custom_noise_snowfall.tex",
		runsound         = "turnoftides/movement/run_pebblebeach",
		walksound        = "turnoftides/movement/run_pebblebeach",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = false,
		hard             = false,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_snowfall.tex",
	},
	{
		name             = "snowfall",
		anim             = "snowfall",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "grainy",
	}
)

AddTile("REDCARPET", "LAND",
	{
		ground_name      = "CUSTOM_REDCARPET",
		old_static_id    = 114,
	},
	{
		name             = "carpet",
		noise_texture    = "levels/textures/custom/custom_noise_redcarpet.tex",
		runsound         = "dontstarve/movement/run_carpet",
		walksound        = "dontstarve/movement/walk_carpet",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_redcarpet.tex",
	},
	{
		name             = "redcarpet",
		anim             = "redcarpet",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "cloth",
	}
)

AddTile("MODERN_COBBLESTONES", "LAND",
	{
		ground_name      = "CUSTOM_MODERN_COBBLESTONES",
		old_static_id    = 115,
	},
	{
		name             = "farmsoil",
		noise_texture    = "levels/textures/custom/custom_noise_modern_cobblestones.tex",
		runsound         = "dontstarve/movement/run_dirt",
		walksound        = "dontstarve/movement/walk_dirt",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
		roadways         = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_modern_cobblestones.tex",
	},
	{
		name             = "modern_cobblestones",
		anim             = "modern_cobblestones",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "rock",
	}
)

AddTile("COPACABANA", "LAND",
	{
		ground_name      = "CUSTOM_COPACABANA",
		old_static_id    = 116,
	},
	{
		name             = "blocky",
		noise_texture    = "levels/textures/custom/custom_noise_copacabana.tex",
		runsound         = "dontstarve/movement/run_marble",
		walksound        = "dontstarve/movement/walk_marble",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_copacabana.tex",
	},
	{
		name             = "copacabana",
		anim             = "copacabana",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "rock",
	}
)

AddTile("SWIRLGRASS", "LAND",
	{
		ground_name      = "CUSTOM_SWIRLGRASS",
		old_static_id    = 117,
	},
	{
		name             = "deciduous",
		noise_texture    = "levels/textures/custom/custom_noise_swirlgrass.tex",
		runsound         = "dontstarve/movement/run_grass",
		walksound        = "dontstarve/movement/walk_grass",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = false,
		hard             = false,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_swirlgrass.tex",
	},
	{
		name             = "swirlgrass",
		anim             = "swirlgrass",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "vegetation_grassy",
	}
)

AddTile("SWIRLGRASSMONO", "LAND",
	{
		ground_name      = "CUSTOM_SWIRLGRASSMONO",
		old_static_id    = 118,
	},
	{
		name             = "deciduous",
		noise_texture    = "levels/textures/custom/custom_noise_swirlgrassmono.tex",
		runsound         = "dontstarve/movement/run_grass",
		walksound        = "dontstarve/movement/walk_grass",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = false,
		hard             = false,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_swirlgrassmono.tex",
	},
	{
		name             = "swirlgrassmono",
		anim             = "swirlgrassmono",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "vegetation_grassy",
	}
)

AddTile("LEAKPROOFCARPET", "LAND",
	{
		ground_name      = "CUSTOM_LEAKPROFFCARPET",
		old_static_id    = 119,
	},
	{
		name             = "carpet",
		noise_texture    = "levels/textures/custom/custom_noise_leakproofcarpet.tex",
		runsound         = "dontstarve/movement/run_carpet",
		walksound        = "dontstarve/movement/walk_carpet",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
		flashpoint       = 250,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_leakproofcarpet.tex",
	},
	{
		name             = "leakproofcarpet",
		anim             = "leakproofcarpet",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "cloth",
	}
)

AddTile("PINKCARPET", "LAND",
	{
		ground_name      = "CUSTOM_PINKCARPET",
	},
	{
		name             = "carpet",
		noise_texture    = "levels/textures/custom/custom_noise_pinkcarpet.tex",
		runsound         = "dontstarve/movement/run_carpet",
		walksound        = "dontstarve/movement/walk_carpet",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_pinkcarpet.tex",
	},
	{
		name             = "pinkcarpet",
		anim             = "pinkcarpet",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "cloth",
	}
)

AddTile("CYANCARPET", "LAND",
	{
		ground_name      = "CUSTOM_CYANCARPET",
	},
	{
		name             = "carpet",
		noise_texture    = "levels/textures/custom/custom_noise_cyancarpet.tex",
		runsound         = "dontstarve/movement/run_carpet",
		walksound        = "dontstarve/movement/walk_carpet",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_cyancarpet.tex",
	},
	{
		name             = "cyancarpet",
		anim             = "cyancarpet",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "cloth",
	}
)

AddTile("WHITECARPET", "LAND",
	{
		ground_name      = "CUSTOM_WHITECARPET",
	},
	{
		name             = "carpet",
		noise_texture    = "levels/textures/custom/custom_noise_whitecarpet.tex",
		runsound         = "dontstarve/movement/run_carpet",
		walksound        = "dontstarve/movement/walk_carpet",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_whitecarpet.tex",
	},
	{
		name             = "whitecarpet",
		anim             = "whitecarpet",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "cloth",
	}
)

AddTile("YELLOWCARPET", "LAND",
	{
		ground_name      = "CUSTOM_YELLOWCARPET",
	},
	{
		name             = "carpet",
		noise_texture    = "levels/textures/custom/custom_noise_yellowcarpet.tex",
		runsound         = "dontstarve/movement/run_carpet",
		walksound        = "dontstarve/movement/walk_carpet",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_yellowcarpet.tex",
	},
	{
		name             = "yellowcarpet",
		anim             = "yellowcarpet",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "cloth",
	}
)

AddTile("GREENCARPET", "LAND",
	{
		ground_name      = "CUSTOM_GREENCARPET",
	},
	{
		name             = "carpet",
		noise_texture    = "levels/textures/custom/custom_noise_greencarpet.tex",
		runsound         = "dontstarve/movement/run_carpet",
		walksound        = "dontstarve/movement/walk_carpet",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_greencarpet.tex",
	},
	{
		name             = "greencarpet",
		anim             = "greencarpet",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "cloth",
	}
)

AddTile("ORANGECARPET", "LAND",
	{
		ground_name      = "CUSTOM_ORANGECARPET",
	},
	{
		name             = "carpet",
		noise_texture    = "levels/textures/custom/custom_noise_orangecarpet.tex",
		runsound         = "dontstarve/movement/run_carpet",
		walksound        = "dontstarve/movement/walk_carpet",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_orangecarpet.tex",
	},
	{
		name             = "orangecarpet",
		anim             = "orangecarpet",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "cloth",
	}
)

AddTile("BLUEYELLOW", "LAND",
	{
		ground_name      = "CUSTOM_BLUEYELLOW",
	},
	{
		name             = "carpet",
		noise_texture    = "levels/textures/custom/custom_noise_blueyellow.tex",
		runsound         = "dontstarve/movement/run_carpet",
		walksound        = "dontstarve/movement/walk_carpet",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_blueyellow.tex",
	},
	{
		name             = "blueyellow",
		anim             = "blueyellow",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "cloth",
	}
)

AddTile("DRIFTWOODFLOOR", "LAND",
	{
		ground_name      = "CUSTOM_DRIFTWOODFLOOR",
	},
	{
		name             = "blocky",
		noise_texture    = "levels/textures/custom/custom_noise_driftwoodfloor.tex",
		runsound         = "dontstarve/movement/run_wood",
		walksound        = "dontstarve/movement/walk_wood",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_driftwoodfloor.tex",
	},
	{
		name             = "driftwoodfloor",
		anim             = "driftwoodfloor",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "wood",
	}
)

AddTile("LUNARRIFT", "LAND",
	{
		ground_name      = "CUSTOM_LUNARRIFT",
	},
	{
		name             = "meteor",
		noise_texture    = "levels/textures/custom/custom_noise_lunarrift.tex",
		runsound         = "turnoftides/movement/run_meteor",
		walksound        = "turnoftides/movement/run_meteor",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_lunarrift.tex",
	},
	{
		name             = "lunarrift",
		anim             = "lunarrift",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "rock",
	}
)

AddTile("VAULTMOSSY", "LAND",
	{
		ground_name      = "CUSTOM_VAULTMOSSY",
	},
	{
		name             = "blocky",
		noise_texture    = "levels/textures/custom/custom_noise_vaultmossy.tex",
		runsound         = "dontstarve/movement/run_marble",
		walksound        = "dontstarve/movement/walk_marble",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_vaultmossy.tex",
	},
	{
		name             = "vaultmossy",
		anim             = "vaultmossy",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "rock",
	}
)

AddTile("WAGPUNKFLOOR", "LAND",
	{
		ground_name      = "CUSTOM_WAGPUNKFLOOR",
	},
	{
		name             = "blocky",
		noise_texture    = "levels/textures/custom/custom_noise_wagpunkfloor.tex",
		runsound         = "dontstarve/movement/run_wagdock",
		walksound        = "dontstarve/movement/walk_wagdock",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_wagpunkfloor.tex",
	},
	{
		name             = "wagpunkfloor",
		anim             = "idle",
		bank_build       = "wagpunk_floor_kit",
		pickupsound      = "metal",
	}
)

AddTile("CHILLEDFLOOR", "LAND",
	{
		ground_name      = "CUSTOM_CHILLEDFLOOR",
	},
	{
		name             = "ocean_ice",
		noise_texture    = "levels/textures/custom/custom_noise_chilledfloor.tex",
		runsound         = "dontstarve/movement/run_iceslab",
		walksound        = "dontstarve/movement/walk_iceslab",
		snowsound        = "dontstarve/movement/run_iceslab",
		mudsound         = "dontstarve/movement/run_iceslab",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_chilledfloor.tex",
	},
	{
		name             = "chilledfloor",
		anim             = "chilledfloor",
		bank_build       = "kyno_turfs_custom",
		pickupsound      = "rock",
	}
)