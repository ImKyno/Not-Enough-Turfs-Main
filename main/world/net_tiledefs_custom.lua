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
	"CIRCLESCARPET",
	"MOROCCARPET",
	"WHITECRACKED",
	"COAL",
	"HOTCOAL",
	"LIVINGLOG",
	"GREYROAD",
	"WHITEBRICK",
	"REDLAWN",
	"BLUELAWN",
	"PURPLERAINFOREST",
	"BLUEPLAINS",
	"GLOOMYCARPET",
	"UPHOLDERCARPET",
	"MEADOWYELLOW",
	"HARDWOOD",
	"ARIDROCKY",
	"ARIDGRASS",
	"SINKHOLEYELLOW",
	"SINKHOLERED",
	"SINKHOLEBLUE",
	"SINKHOLEPINK",
	"SINKHOLEPURPLE",
	"SAVANNAGREEN",
	"STICKYWEBBING",
	"STICKYHONEY",
	"STICKYICKER",
	"FAKEDOCKS",
	"FAKEDOCKS_DRIFTWOOD",
	"WOODGREEN",
	"WOODRED",
	"WOODBLUE",
	"WOODPURPLE",
	"WOODBLACK",
	"MOSSYBRICK",
	"GOLDROAD",
	"MOSAIC_WHITE",
	"MOSAIC_BLACK",
	"REDGRASS",
	"PURPLEGRASS",
	"TURQUOISE_DECIDUOUS",
	"MANURE",
	"ROSECARPET",
	"LIMECARPET",
	"FLOWERCARPET",
	"DARKROSECARPET",
	"MUDWET",
	"QUICKSAND",
	"FROZENFLOOR",
	"THULECITE",
	"THULECITE2",
	"THULECITE3",
	"TOADSTOOLRUG",
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
		name             = "tile_modern_cobblestones",
		noise_texture    = "images/square.tex",
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

AddTile("CIRCLESCARPET", "LAND",
	{
		ground_name      = "CUSTOM_CIRCLESCARPET",
	},
	{
		name             = "carpet",
		noise_texture    = "levels/textures/custom/custom_noise_circlescarpet.tex",
		runsound         = "dontstarve/movement/run_carpet",
		walksound        = "dontstarve/movement/walk_carpet",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_circlescarpet.tex",
	},
	{
		name             = "circlescarpet",
		anim             = "circlescarpet",
		bank_build       = "kyno_turfs_custom2",
		pickupsound      = "cloth",
	}
)

AddTile("MOROCCARPET", "LAND",
	{
		ground_name      = "CUSTOM_MOROCCARPET",
	},
	{
		name             = "carpet",
		noise_texture    = "levels/textures/custom/custom_noise_moroccarpet.tex",
		runsound         = "dontstarve/movement/run_carpet",
		walksound        = "dontstarve/movement/walk_carpet",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_moroccarpet.tex",
	},
	{
		name             = "moroccarpet",
		anim             = "moroccarpet",
		bank_build       = "kyno_turfs_custom2",
		pickupsound      = "cloth",
	}
)

AddTile("WHITECRACKED", "LAND",
	{
		ground_name      = "CUSTOM_WHITECRACKED",
	},
	{
		name             = "cave",
		noise_texture    = "levels/textures/custom/custom_noise_whitecracked.tex",
		runsound         = "dontstarve/movement/run_dirt",
		walksound        = "dontstarve/movement/walk_dirt",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_whitecracked.tex",
	},
	{
		name             = "whitecracked",
		anim             = "whitecracked",
		bank_build       = "kyno_turfs_custom2",
		pickupsound      = "rock",
	}
)

AddTile("COAL", "LAND",
	{
		ground_name      = "CUSTOM_COAL",
	},
	{
		name             = "cave",
		noise_texture    = "levels/textures/custom/custom_noise_coal.tex",
		runsound         = "dontstarve/movement/run_marble",
		walksound        = "dontstarve/movement/walk_marble",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_coal.tex",
	},
	{
		name             = "coal",
		anim             = "coal",
		bank_build       = "kyno_turfs_custom2",
		pickupsound      = "rock",
	}
)

AddTile("HOTCOAL", "LAND",
	{
		ground_name      = "CUSTOM_HOTCOAL",
	},
	{
		name             = "cave",
		noise_texture    = "levels/textures/custom/custom_noise_hotcoal.tex",
		runsound         = "dontstarve/movement/run_marble",
		walksound        = "dontstarve/movement/walk_marble",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_hotcoal.tex",
	},
	{
		name             = "hotcoal",
		anim             = "hotcoal",
		bank_build       = "kyno_turfs_custom2",
		pickupsound      = "rock",
	}
)

AddTile("LIVINGLOG", "LAND",
	{
		ground_name      = "CUSTOM_LIVINGLOG",
	},
	{
		name             = "blocky",
		noise_texture    = "levels/textures/custom/custom_noise_livinglog.tex",
		runsound         = "dontstarve/movement/run_cavesbridge",
		walksound        = "dontstarve/movement/walk_cavesbridge",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_livinglog.tex",
	},
	{
		name             = "livinglog",
		anim             = "livinglog",
		bank_build       = "kyno_turfs_custom2",
		pickupsound      = "wood",
	}
)

AddTile("GREYROAD", "LAND",
	{
		ground_name     = "CUSTOM_GREYROAD",
	},
	{
		name            = "cave",
		noise_texture   = "levels/textures/custom/custom_noise_greyroad.tex",
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
		noise_texture   = "levels/textures/custom/custom_mini_noise_greyroad.tex",
	},
	{
		name            = "greyroad",
		anim            = "greyroad",
		bank_build      = "kyno_turfs_custom2",
		pickupsound     = "rock",
	}
)

AddTile("WHITEBRICK", "LAND",
	{
		ground_name     = "CUSTOM_WHITEBRICK",
	},
	{
		name            = "tile_cobbleroad",
		noise_texture   = "levels/textures/custom/custom_noise_whitebrick.tex",
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
		noise_texture   = "levels/textures/custom/custom_mini_noise_whitebrick.tex",
	},
	{
		name            = "whitebrick",
		anim            = "whitebrick",
		bank_build      = "kyno_turfs_custom2",
		pickupsound     = "rock",
	}
)

AddTile("REDLAWN", "LAND",
	{
		ground_name     = "CUSTOM_REDLAWN",
	},
	{
		name            = "tile_lawn",
		noise_texture   = "levels/textures/custom/custom_noise_redlawn.tex",
		runsound        = "dontstarve/movement/run_grass",
		walksound       = "dontstarve/movement/walk_grass",
		snowsound       = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/custom/custom_mini_noise_redlawn.tex",
	},
	{
		name            = "redlawn",
		anim            = "redlawn",
		bank_build      = "kyno_turfs_custom2",
		pickupsound     = "vegetation_grassy",
	}
)

AddTile("BLUELAWN", "LAND",
	{
		ground_name     = "CUSTOM_BLUELAWN",
	},
	{
		name            = "tile_lawn",
		noise_texture   = "levels/textures/custom/custom_noise_bluelawn.tex",
		runsound        = "dontstarve/movement/run_grass",
		walksound       = "dontstarve/movement/walk_grass",
		snowsound       = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/custom/custom_mini_noise_bluelawn.tex",
	},
	{
		name            = "bluelawn",
		anim            = "bluelawn",
		bank_build      = "kyno_turfs_custom2",
		pickupsound     = "vegetation_grassy",
	}
)

AddTile("PURPLERAINFOREST", "LAND",
	{
		ground_name     = "CUSTOM_PURPLERAINFOREST",
	},
	{
		name            = "tile_rainforest",
		noise_texture   = "levels/textures/custom/custom_noise_purplerainforest.tex",
		runsound        = "dontstarve/movement/run_tallgrass",
		walksound       = "dontstarve/movement/walk_tallgrass",
		snowsound       = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/custom/custom_mini_noise_purplerainforest.tex",
	},
	{
		name            = "purplerainforest",
		anim            = "purplerainforest",
		bank_build      = "kyno_turfs_custom2",
		pickupsound     = "vegetation_grassy",
	}
)

AddTile("BLUEPLAINS", "LAND",
	{
		ground_name     = "CUSTOM_BLUEPLAINS",
	},
	{
		name            = "tile_jungle",
		noise_texture   = "levels/textures/custom/custom_noise_blueplains.tex",
		runsound        = "dontstarve/movement/run_grass",
		walksound       = "dontstarve/movement/walk_grass",
		snowsound       = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/custom/custom_mini_noise_blueplains.tex",
	},
	{
		name            = "blueplains",
		anim            = "blueplains",
		bank_build      = "kyno_turfs_custom2",
		pickupsound     = "vegetation_grassy",
	}
)

AddTile("GLOOMYCARPET", "LAND",
	{
		ground_name      = "CUSTOM_GLOOMYCARPET",
	},
	{
		name             = "tile_gloomycarpet",
		noise_texture    = "levels/textures/custom/custom_noise_gloomycarpet.tex",
		runsound         = "dontstarve/movement/run_carpet",
		walksound        = "dontstarve/movement/walk_carpet",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_gloomycarpet.tex",
	},
	{
		name             = "gloomycarpet",
		anim             = "gloomycarpet",
		bank_build       = "kyno_turfs_custom2",
		pickupsound      = "cloth",
	}
)

AddTile("UPHOLDERCARPET", "LAND",
	{
		ground_name      = "CUSTOM_UPHOLDERCARPET",
	},
	{
		name             = "carpet",
		noise_texture    = "levels/textures/custom/custom_noise_upholdercarpet.tex",
		runsound         = "dontstarve/movement/run_carpet",
		walksound        = "dontstarve/movement/walk_carpet",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_upholdercarpet.tex",
	},
	{
		name             = "upholdercarpet",
		anim             = "upholdercarpet",
		bank_build       = "kyno_turfs_custom2",
		pickupsound      = "cloth",
	}
)

AddTile("MEADOWYELLOW", "LAND",
	{
		ground_name     = "CUSTOM_MEADOWYELLOW",
	},
	{
		name            = "tile_jungle",
		noise_texture   = "levels/textures/custom/custom_noise_meadowyellow.tex",
		runsound        = "dontstarve/movement/run_tallgrass",
		walksound       = "dontstarve/movement/walk_tallgrass",
		snowsound       = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/custom/custom_mini_noise_meadowyellow.tex",
	},
	{
		name            = "meadowyellow",
		anim            = "meadowyellow",
		bank_build      = "kyno_turfs_custom2",
		pickupsound     = "vegetation_grassy",
	}
)

AddTile("HARDWOOD", "LAND",
	{
		ground_name      = "CUSTOM_HARDWOOD",
	},
	{
		name             = "blocky",
		noise_texture    = "levels/textures/custom/custom_noise_hardwood.tex",
		runsound         = "dontstarve/movement/run_cavesbridge",
		walksound        = "dontstarve/movement/walk_cavesbridge",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_hardwood.tex",
	},
	{
		name             = "hardwood",
		anim             = "hardwood",
		bank_build       = "kyno_turfs_custom2",
		pickupsound      = "wood",
	}
)

AddTile("ARIDROCKY", "LAND",
	{
		ground_name     = "CUSTOM_ARIDROCKY",
	},
	{
		name            = "desert_dirt",
		noise_texture   = "levels/textures/custom/custom_noise_aridrocky.tex",
		runsound        = "dontstarve/movement/run_dirt",
		walksound       = "dontstarve/movement/walk_dirt",
		mudsound        = "dontstarve/movement/run_mud",
		snowsound       = "dontstarve/movement/run_snow",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/custom/custom_mini_noise_aridrocky.tex",
	},
	{
		name            = "aridrocky",
		anim            = "aridrocky",
		bank_build      = "kyno_turfs_custom2",
		pickupsound     = "rock",
	}
)

AddTile("ARIDGRASS", "LAND",
	{
		ground_name     = "CUSTOM_ARIDGRASS",
	},
	{
		name            = "yellowgrass",
		noise_texture   = "levels/textures/custom/custom_noise_aridgrass.tex",
		runsound        = "dontstarve/movement/run_tallgrass",
		walksound       = "dontstarve/movement/walk_tallgrass",
		mudsound        = "dontstarve/movement/run_mud",
		snowsound       = "dontstarve/movement/run_snow",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/custom/custom_mini_noise_aridgrass.tex",
	},
	{
		name            = "aridgrass",
		anim            = "aridgrass",
		bank_build      = "kyno_turfs_custom2",
		pickupsound     = "vegetation_grassy",
	}
)

AddTile("SINKHOLEYELLOW", "LAND",
	{
		ground_name     = "CUSTOM_SINKHOLEYELLOW",
	},
	{
		name            = "cave",
		noise_texture   = "levels/textures/custom/custom_noise_sinkholeyellow.tex",
		runsound        = "dontstarve/movement/run_dirt",
		walksound       = "dontstarve/movement/walk_dirt",
		mudsound        = "dontstarve/movement/run_mud",
		snowsound       = "dontstarve/movement/run_snow",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/custom/custom_mini_noise_sinkholeyellow.tex",
	},
	{
		name            = "sinkholeyellow",
		anim            = "sinkholeyellow",
		bank_build      = "kyno_turfs_custom2",
		pickupsound     = "squidgy",
	}
)

AddTile("SINKHOLERED", "LAND",
	{
		ground_name     = "CUSTOM_SINKHOLERED",
	},
	{
		name            = "cave",
		noise_texture   = "levels/textures/custom/custom_noise_sinkholered.tex",
		runsound        = "dontstarve/movement/run_dirt",
		walksound       = "dontstarve/movement/walk_dirt",
		mudsound        = "dontstarve/movement/run_mud",
		snowsound       = "dontstarve/movement/run_snow",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/custom/custom_mini_noise_sinkholered.tex",
	},
	{
		name            = "sinkholered",
		anim            = "sinkholered",
		bank_build      = "kyno_turfs_custom2",
		pickupsound     = "squidgy",
	}
)

AddTile("SINKHOLEBLUE", "LAND",
	{
		ground_name     = "CUSTOM_SINKHOLEBLUE",
	},
	{
		name            = "cave",
		noise_texture   = "levels/textures/custom/custom_noise_sinkholeblue.tex",
		runsound        = "dontstarve/movement/run_dirt",
		walksound       = "dontstarve/movement/walk_dirt",
		mudsound        = "dontstarve/movement/run_mud",
		snowsound       = "dontstarve/movement/run_snow",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/custom/custom_mini_noise_sinkholeblue.tex",
	},
	{
		name            = "sinkholeblue",
		anim            = "sinkholeblue",
		bank_build      = "kyno_turfs_custom2",
		pickupsound     = "squidgy",
	}
)

AddTile("SINKHOLEPINK", "LAND",
	{
		ground_name     = "CUSTOM_SINKHOLEPINK",
	},
	{
		name            = "cave",
		noise_texture   = "levels/textures/custom/custom_noise_sinkholepink.tex",
		runsound        = "dontstarve/movement/run_dirt",
		walksound       = "dontstarve/movement/walk_dirt",
		mudsound        = "dontstarve/movement/run_mud",
		snowsound       = "dontstarve/movement/run_snow",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/custom/custom_mini_noise_sinkholepink.tex",
	},
	{
		name            = "sinkholepink",
		anim            = "sinkholepink",
		bank_build      = "kyno_turfs_custom2",
		pickupsound     = "squidgy",
	}
)

AddTile("SINKHOLEPURPLE", "LAND",
	{
		ground_name     = "CUSTOM_SINKHOLEPURPLE",
	},
	{
		name            = "cave",
		noise_texture   = "levels/textures/custom/custom_noise_sinkholepurple.tex",
		runsound        = "dontstarve/movement/run_dirt",
		walksound       = "dontstarve/movement/walk_dirt",
		mudsound        = "dontstarve/movement/run_mud",
		snowsound       = "dontstarve/movement/run_snow",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/custom/custom_mini_noise_sinkholepurple.tex",
	},
	{
		name            = "sinkholepurple",
		anim            = "sinkholepurple",
		bank_build      = "kyno_turfs_custom2",
		pickupsound     = "squidgy",
	}
)

AddTile("SAVANNAGREEN", "LAND",
	{
		ground_name     = "CUSTOM_SAVANNAGREEN",
	},
	{
		name            = "grass2",
		noise_texture   = "levels/textures/custom/custom_noise_savannagreen.tex",
		runsound        = "dontstarve/movement/run_tallgrass",
		walksound       = "dontstarve/movement/walk_tallgrass",
		mudsound        = "dontstarve/movement/run_mud",
		snowsound       = "dontstarve/movement/run_snow",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/custom/custom_mini_noise_savannagreen.tex",
	},
	{
		name            = "savannagreen",
		anim            = "savannagreen",
		bank_build      = "kyno_turfs_custom2",
		pickupsound     = "vegetation_grassy",
	}
)

AddTile("STICKYWEBBING", "LAND",
	{
		ground_name      = "CUSTOM_STICKYWEBBING",
	},
	{
		name             = "tile_beach",
		noise_texture    = "levels/textures/custom/custom_noise_stickywebbing.tex",
		runsound         = "dontstarve/movement/run_marsh",
		walksound        = "dontstarve/movement/walk_marsh",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_stickywebbing.tex",
	},
	{
		name             = "stickywebbing",
		anim             = "stickywebbing",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "squidgy",
	}
)

AddTile("STICKYHONEY", "LAND",
	{
		ground_name      = "CUSTOM_STICKYHONEY",
	},
	{
		name             = "tile_beach",
		noise_texture    = "levels/textures/custom/custom_noise_stickyhoney.tex",
		runsound         = "dontstarve/movement/run_marsh",
		walksound        = "dontstarve/movement/walk_marsh",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_stickyhoney.tex",
	},
	{
		name             = "stickyhoney",
		anim             = "stickyhoney",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "squidgy",
	}
)

AddTile("STICKYICKER", "LAND",
	{
		ground_name      = "CUSTOM_STICKYICKER",
	},
	{
		name             = "tile_beach",
		noise_texture    = "levels/textures/custom/custom_noise_stickyicker.tex",
		runsound         = "dontstarve/movement/run_marsh",
		walksound        = "dontstarve/movement/walk_marsh",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_stickyicker.tex",
	},
	{
		name             = "stickyicker",
		anim             = "stickyicker",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "squidgy",
	}
)

AddTile("FAKEDOCKS", "LAND",
	{
		ground_name      = "CUSTOM_FAKEDOCKS",
	},
	{
		name             = "cave",
		noise_texture    = "levels/textures/custom/custom_noise_fakedocks.tex",
		runsound         = "dontstarve/movement/run_dock",
		walksound        = "dontstarve/movement/walk_dock",
		snowsound        = "dontstarve/movement/walk_dock",
		mudsound         = "dontstarve/movement/walk_dock",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_fakedocks.tex",
	},
	{
		name             = "fakedocks",
		anim             = "fakedocks",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "wood",
	}
)

AddTile("FAKEDOCKS_DRIFTWOOD", "LAND",
	{
		ground_name      = "CUSTOM_FAKEDOCKS_DRIFTWOOD",
	},
	{
		name             = "cave",
		noise_texture    = "levels/textures/custom/custom_noise_fakedocks_driftwood.tex",
		runsound         = "dontstarve/movement/run_dock",
		walksound        = "dontstarve/movement/walk_dock",
		snowsound        = "dontstarve/movement/walk_dock",
		mudsound         = "dontstarve/movement/walk_dock",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_fakedocks_driftwood.tex",
	},
	{
		name             = "fakedocks_driftwood",
		anim             = "fakedocks_driftwood",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "wood",
	}
)

AddTile("WOODGREEN", "LAND",
	{
		ground_name      = "CUSTOM_WOODGREEN",
	},
	{
		name             = "blocky",
		noise_texture    = "levels/textures/custom/custom_noise_woodgreen.tex",
		runsound         = "dontstarve/movement/run_wood",
		walksound        = "dontstarve/movement/walk_wood",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_woodgreen.tex",
	},
	{
		name             = "woodgreen",
		anim             = "woodgreen",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "wood",
	}
)

AddTile("WOODRED", "LAND",
	{
		ground_name      = "CUSTOM_WOODRED",
	},
	{
		name             = "blocky",
		noise_texture    = "levels/textures/custom/custom_noise_woodred.tex",
		runsound         = "dontstarve/movement/run_wood",
		walksound        = "dontstarve/movement/walk_wood",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_woodred.tex",
	},
	{
		name             = "woodred",
		anim             = "woodred",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "wood",
	}
)

AddTile("WOODBLUE", "LAND",
	{
		ground_name      = "CUSTOM_WOODBLUE",
	},
	{
		name             = "blocky",
		noise_texture    = "levels/textures/custom/custom_noise_woodblue.tex",
		runsound         = "dontstarve/movement/run_wood",
		walksound        = "dontstarve/movement/walk_wood",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_woodblue.tex",
	},
	{
		name             = "woodblue",
		anim             = "woodblue",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "wood",
	}
)

AddTile("WOODPURPLE", "LAND",
	{
		ground_name      = "CUSTOM_WOODPURPLE",
	},
	{
		name             = "blocky",
		noise_texture    = "levels/textures/custom/custom_noise_woodpurple.tex",
		runsound         = "dontstarve/movement/run_wood",
		walksound        = "dontstarve/movement/walk_wood",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_woodpurple.tex",
	},
	{
		name             = "woodpurple",
		anim             = "woodpurple",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "wood",
	}
)

AddTile("WOODBLACK", "LAND",
	{
		ground_name      = "CUSTOM_WOODBLACK",
	},
	{
		name             = "blocky",
		noise_texture    = "levels/textures/custom/custom_noise_woodblack.tex",
		runsound         = "dontstarve/movement/run_wood",
		walksound        = "dontstarve/movement/walk_wood",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_woodblack.tex",
	},
	{
		name             = "woodblack",
		anim             = "woodblack",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "wood",
	}
)

AddTile("MOSSYBRICK", "LAND",
	{
		ground_name      = "CUSTOM_MOSSYBRICK",
	},
	{
		name             = "blocky",
		noise_texture    = "levels/textures/custom/custom_noise_mossybrick.tex",
		runsound         = "dontstarve/movement/run_dirt",
		walksound        = "dontstarve/movement/walk_dirt",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_mossybrick.tex",
	},
	{
		name             = "mossybrick",
		anim             = "mossybrick",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "rock",
	}
)

AddTile("GOLDROAD", "LAND",
	{
		ground_name      = "CUSTOM_GOLDROAD",
	},
	{
		name             = "blocky",
		noise_texture    = "levels/textures/custom/custom_noise_goldroad.tex",
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
		noise_texture    = "levels/textures/custom/custom_mini_noise_goldroad.tex",
	},
	{
		name             = "goldroad",
		anim             = "goldroad",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "rock",
	}
)

AddTile("MOSAIC_WHITE", "LAND",
	{
		ground_name      = "CUSTOM_MOSAIC_WHITE",
	},
	{
		name             = "blocky",
		noise_texture    = "levels/textures/custom/custom_noise_mosaic_white.tex",
		runsound         = "dontstarve/movement/run_marble",
		walksound        = "dontstarve/movement/walk_marble",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_mosaic_white.tex",
	},
	{
		name             = "mosaic_white",
		anim             = "mosaic_white",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "rock",
	}
)

AddTile("MOSAIC_BLACK", "LAND",
	{
		ground_name      = "CUSTOM_MOSAIC_BLACK",
	},
	{
		name             = "blocky",
		noise_texture    = "levels/textures/custom/custom_noise_mosaic_black.tex",
		runsound         = "dontstarve/movement/run_marble",
		walksound        = "dontstarve/movement/walk_marble",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_mosaic_black.tex",
	},
	{
		name             = "mosaic_black",
		anim             = "mosaic_black",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "rock",
	}
)

AddTile("REDGRASS", "LAND",
	{
		ground_name      = "CUSTOM_REDGRASS",
	},
	{
		name             = "tile_redgrass",
		noise_texture    = "levels/textures/custom/custom_noise_redgrass.tex",
		runsound         = "dontstarve/movement/run_grass",
		walksound        = "dontstarve/movement/walk_grass",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = false,
		hard             = false,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_redgrass.tex",
	},
	{
		name             = "redgrass",
		anim             = "redgrass",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "vegetation_grassy",
	}
)

AddTile("PURPLEGRASS", "LAND",
	{
		ground_name      = "CUSTOM_PURPLEGRASS",
	},
	{
		name             = "tile_purplegrass",
		noise_texture    = "levels/textures/custom/custom_noise_purplegrass.tex",
		runsound         = "dontstarve/movement/run_grass",
		walksound        = "dontstarve/movement/walk_grass",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = false,
		hard             = false,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_purplegrass.tex",
	},
	{
		name             = "purplegrass",
		anim             = "purplegrass",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "vegetation_grassy",
	}
)

AddTile("TURQUOISE_DECIDUOUS", "LAND",
	{
		ground_name      = "CUSTOM_TURQUOISE_DECIDUOUS",
	},
	{
		name             = "tile_turquoise_deciduous",
		noise_texture    = "levels/textures/custom/custom_noise_turquoise_deciduous.tex",
		runsound         = "dontstarve/movement/run_grass",
		walksound        = "dontstarve/movement/walk_grass",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = false,
		hard             = false,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_turquoise_deciduous.tex",
	},
	{
		name             = "turquoise_deciduous",
		anim             = "turquoise_deciduous",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "vegetation_grassy",
	}
)

AddTile("MANURE", "LAND",
	{
		ground_name      = "CUSTOM_MANURE",
	},
	{
		name             = "cave",
		noise_texture    = "levels/textures/custom/custom_noise_manure.tex",
		runsound         = "dontstarve/movement/run_marsh",
		walksound        = "dontstarve/movement/walk_marsh",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = false,
		hard             = false,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_manure.tex",
	},
	{
		name             = "manure",
		anim             = "manure",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "squidgy",
	}
)

AddTile("ROSECARPET", "LAND",
	{
		ground_name      = "CUSTOM_ROSECARPET",
	},
	{
		name             = "carpet",
		noise_texture    = "levels/textures/custom/custom_noise_rosecarpet.tex",
		runsound         = "dontstarve/movement/run_carpet",
		walksound        = "dontstarve/movement/walk_carpet",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_rosecarpet.tex",
	},
	{
		name             = "rosecarpet",
		anim             = "rosecarpet",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "cloth",
	}
)

AddTile("LIMECARPET", "LAND",
	{
		ground_name      = "CUSTOM_LIMECARPET",
	},
	{
		name             = "carpet",
		noise_texture    = "levels/textures/custom/custom_noise_limecarpet.tex",
		runsound         = "dontstarve/movement/run_carpet",
		walksound        = "dontstarve/movement/walk_carpet",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_limecarpet.tex",
	},
	{
		name             = "limecarpet",
		anim             = "limecarpet",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "cloth",
	}
)

AddTile("FLOWERCARPET", "LAND",
	{
		ground_name      = "CUSTOM_FLOWERCARPET",
	},
	{
		name             = "carpet",
		noise_texture    = "levels/textures/custom/custom_noise_flowercarpet.tex",
		runsound         = "dontstarve/movement/run_carpet",
		walksound        = "dontstarve/movement/walk_carpet",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_flowercarpet.tex",
	},
	{
		name             = "flowercarpet",
		anim             = "flowercarpet",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "cloth",
	}
)

AddTile("DARKROSECARPET", "LAND",
	{
		ground_name      = "CUSTOM_DARKROSECARPET",
	},
	{
		name             = "carpet",
		noise_texture    = "levels/textures/custom/custom_noise_darkrosecarpet.tex",
		runsound         = "dontstarve/movement/run_carpet",
		walksound        = "dontstarve/movement/walk_carpet",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_darkrosecarpet.tex",
	},
	{
		name             = "darkrosecarpet",
		anim             = "darkrosecarpet",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "cloth",
	}
)

AddTile("MUDWET", "LAND",
	{
		ground_name      = "CUSTOM_MUDWET",
	},
	{
		name             = "cave",
		noise_texture    = "levels/textures/custom/custom_noise_mudwet.tex",
		runsound         = "dontstarve/movement/run_mud",
		walksound        = "dontstarve/movement/walk_mud",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = false,
		hard             = false,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_mudwet.tex",
	},
	{
		name             = "mudwet",
		anim             = "mudwet",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "squidgy",
	}
)

AddTile("QUICKSAND", "LAND",
	{
		ground_name      = "CUSTOM_QUICKSAND",
	},
	{
		name             = "tile_beach",
		noise_texture    = "levels/textures/custom/custom_noise_quicksand.tex",
		runsound         = "dontstarve/movement/run_pebblebeach",
		walksound        = "dontstarve/movement/walk_pebblebeach",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = false,
		hard             = false,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_quicksand.tex",
	},
	{
		name             = "quicksand",
		anim             = "quicksand",
		bank_build       = "kyno_turfs_custom3",
		pickupsound      = "grainy",
	}
)

AddTile("FROZENFLOOR", "LAND",
	{
		ground_name      = "CUSTOM_FROZENFLOOR",
	},
	{
		name             = "ocean_ice",
		noise_texture    = "levels/textures/custom/custom_noise_frozenfloor.tex",
		runsound         = "dontstarve/movement/run_iceslab",
		walksound        = "dontstarve/movement/walk_iceslab",
		snowsound        = "dontstarve/movement/run_iceslab",
		mudsound         = "dontstarve/movement/run_iceslab",
		flooring         = true,
		hard             = true,
		roadways         = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_frozenfloor.tex",
	},
	{
		name             = "frozenfloor",
		anim             = "frozenfloor",
		bank_build       = "kyno_turfs_custom4",
		pickupsound      = "rock",
	}
)

AddTile("THULECITE", "LAND",
	{
		ground_name      = "CUSTOM_THULECITE",
	},
	{
		name             = "tile_lawn",
		noise_texture    = "levels/textures/custom/custom_noise_thulecite.tex",
		runsound         = "dontstarve/movement/run_marble",
		walksound        = "dontstarve/movement/walk_marble",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_thulecite.tex",
	},
	{
		name             = "thulecite",
		anim             = "thulecite",
		bank_build       = "kyno_turfs_custom4",
		pickupsound      = "rock",
	}
)

AddTile("THULECITE2", "LAND",
	{
		ground_name      = "CUSTOM_THULECITE2",
	},
	{
		name             = "tile_lawn",
		noise_texture    = "levels/textures/custom/custom_noise_thulecite2.tex",
		runsound         = "dontstarve/movement/run_marble",
		walksound        = "dontstarve/movement/walk_marble",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_thulecite2.tex",
	},
	{
		name             = "thulecite2",
		anim             = "thulecite2",
		bank_build       = "kyno_turfs_custom4",
		pickupsound      = "rock",
	}
)

AddTile("THULECITE3", "LAND",
	{
		ground_name      = "CUSTOM_THULECITE3",
	},
	{
		name             = "tile_lawn",
		noise_texture    = "levels/textures/custom/custom_noise_thulecite3.tex",
		runsound         = "dontstarve/movement/run_marble",
		walksound        = "dontstarve/movement/walk_marble",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_thulecite3.tex",
	},
	{
		name             = "thulecite3",
		anim             = "thulecite3",
		bank_build       = "kyno_turfs_custom4",
		pickupsound      = "rock",
	}
)

AddTile("TOADSTOOLRUG", "LAND",
	{
		ground_name      = "CUSTOM_TOADSTOOLRUG",
	},
	{
		name             = "carpet",
		noise_texture    = "levels/textures/custom/custom_noise_toadstoolrug.tex",
		runsound         = "dontstarve/movement/run_carpet",
		walksound        = "dontstarve/movement/walk_carpet",
		snowsound        = "dontstarve/movement/run_snow",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_toadstoolrug.tex",
	},
	{
		name             = "toadstoolrug",
		anim             = "toadstoolrug",
		bank_build       = "kyno_turfs_custom4",
		pickupsound      = "cloth",
	}
)

AddTile("MOONROCKFLOOR", "LAND",
	{
		ground_name      = "CUSTOM_MOONROCKFLOOR",
	},
	{
		name             = "ocean_ice",
		noise_texture    = "levels/textures/custom/custom_noise_moonrockfloor.tex",
		runsound         = "dontstarve/movement/run_marble",
		walksound        = "dontstarve/movement/walk_marble",
		snowsound        = "dontstarve/movement/run_ice",
		mudsound         = "dontstarve/movement/run_mud",
		flooring         = true,
		hard             = true,
	},
	{
		name             = "map_edge",
		noise_texture    = "levels/textures/custom/custom_mini_noise_moonrockfloor.tex",
	},
	{
		name             = "moonrockfloor",
		anim             = "moonrockfloor",
		bank_build       = "kyno_turfs_custom4",
		pickupsound      = "rock",
	}
)