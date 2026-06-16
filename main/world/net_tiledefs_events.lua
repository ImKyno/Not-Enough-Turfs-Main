local _G          = GLOBAL
local GROUND      = _G.GROUND
local WORLD_TILES = _G.WORLD_TILES

local EVENTS_TURFS =
{
	"PINKSTONE",
	"STONECITY",
	"PINKPARK",
	"GREYFOREST",
	"BROWNCARPET",
	"FORGEROCK",
	"FORGEROAD",
}

for _, turf in ipairs(EVENTS_TURFS) do
	if WORLD_TILES[turf] ~= nil then
		return
	end
end

AddTile("PINKSTONE", "LAND",
	{
		ground_name     = "EVENTS_PINKSTONE",
		old_static_id   = 87,
	},
	{
		name            = "cave",
		noise_texture   = "levels/textures/events/events_noise_pinkstone.tex",
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
		noise_texture   = "levels/textures/events/events_mini_noise_pinkstone.tex",
	},
	{
		name            = "pinkstone",
		anim            = "pinkstone",
		bank_build      = "kyno_turfs_events",
		pickupsound     = "rock",
	}
)

AddTile("STONECITY", "LAND",
	{
		ground_name     = "EVENTS_STONECITY",
		old_static_id   = GROUND.QUAGMIRE_CITYSTONE,
	},
	{
		name            = "cave",
		noise_texture   = "levels/textures/events/events_noise_stonecity.tex",
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
		noise_texture   = "levels/textures/events/events_mini_noise_stonecity.tex",
	},
	{
		name            = "stonecity",
		anim            = "stonecity",
		bank_build      = "kyno_turfs_events",
		pickupsound     = "rock",
	}
)

AddTile("PINKPARK", "LAND",
	{
		ground_name     = "EVENTS_PINKPARK",
		old_static_id   = GROUND.QUAGMIRE_PARKFIELD,
	},
	{
		name            = "deciduous",
		noise_texture   = "levels/textures/events/events_noise_pinkpark.tex",
		runsound        = "dontstarve/movement/run_grass",
		walksound       = "dontstarve/movement/walk_grass",
		snowsound       = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/events/events_mini_noise_pinkpark.tex",
	},
	{
		name            = "pinkpark",
		anim            = "pinkpark",
		bank_build      = "kyno_turfs_events",
		pickupsound     = "vegetation_grassy",
	}
)

AddTile("GREYFOREST", "LAND",
	{
		ground_name     = "EVENTS_GREYFOREST",
		old_static_id   = 90,
	},
	{
		name            = "grass3",
		noise_texture   = "levels/textures/events/events_noise_greyforest.tex",
		runsound        = "dontstarve/movement/run_grass",
		walksound       = "dontstarve/movement/walk_grass",
		snowsound       = "dontstarve/movement/run_snow",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = false,
		hard            = false,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/events/events_mini_noise_greyforest.tex",
	},
	{
		name            = "greyforest",
		anim            = "greyforest",
		bank_build      = "kyno_turfs_events",
		pickupsound     = "vegetation_grassy",
	}
)

AddTile("BROWNCARPET", "LAND",
	{
		ground_name     = "EVENTS_BROWNCARPET",
		old_static_id   = 91,
	},
	{
		name            = "farmsoil",
		noise_texture   = "levels/textures/events/events_noise_browncarpet.tex",
		runsound        = "dontstarve/movement/run_dirt",
		walksound       = "dontstarve/movement/walk_dirt",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/events/events_mini_noise_browncarpet.tex",
	},
	{
		name            = "browncarpet",
		anim            = "browncarpet",
		bank_build      = "kyno_turfs_events",
		pickupsound     = "grainy",
	}
)

AddTile("FORGEROCK", "LAND",
	{
		ground_name     = "EVENTS_FORGEROCK",
		old_static_id   = 92,
	},
	{
		name            = "tile_forgerock",
		noise_texture   = "levels/textures/events/events_noise_forgerock.tex",
		runsound        = "dontstarve/movement/run_dirt",
		walksound       = "dontstarve/movement/walk_dirt",
		snowsound       = "dontstarve/movement/run_ice",
		mudsound        = "dontstarve/movement/run_mud",
		flooring        = true,
		hard            = true,
	},
	{
		name            = "map_edge",
		noise_texture   = "levels/textures/events/events_mini_noise_forgerock.tex",
	},
	{
		name            = "forgerock",
		anim            = "forgerock",
		bank_build      = "kyno_turfs_events",
		pickupsound     = "rock",
	}
)

AddTile("FORGEROAD", "LAND",
	{
		ground_name     = "EVENTS_FORGEROAD",
		old_static_id   = 93,
	},
	{
		name            = "tile_forgeroad",
		noise_texture   = "levels/textures/events/events_noise_forgeroad.tex",
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
		noise_texture   = "levels/textures/events/events_mini_noise_forgeroad.tex",
	},
	{
		name            = "forgeroad",
		anim            = "forgeroad",
		bank_build      = "kyno_turfs_events",
		pickupsound     = "rock",
	}
)