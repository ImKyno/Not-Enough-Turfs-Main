local _G            = GLOBAL
local require       = _G.require
local WORLD_TILES   = _G.WORLD_TILES
local UpvalueHacker = require("tools/net_upvaluehacker")

local SHIPWRECKED_ENABLED = _G.NETRecipeAlreadyExists("chiminea", "limestone")
local HAMLET_ENABLED      = _G.NETRecipeAlreadyExists("cork_bat", "corkchest")

print("SHIP ENABLED", SHIPWRECKED_ENABLED, TUNING.NET_IS_IAS_ENABLED)
print("HAMLET ENABLED", HAMLET_ENABLED, TUNING.NET_IS_ABC_ENABLED)

-- Don't override the ambient sound for these turfs.
local AMBIENT_SOUND_BLACKLIST =
{
	-- Shipwrecked Tiles.
	[WORLD_TILES.MAGMAFIELD]     = TUNING.NET_IS_IAS_ENABLED and SHIPWRECKED_ENABLED,
	[WORLD_TILES.VOLCANO]        = TUNING.NET_IS_IAS_ENABLED and SHIPWRECKED_ENABLED,
	[WORLD_TILES.VOLCANO_ROCK]   = TUNING.NET_IS_IAS_ENABLED and SHIPWRECKED_ENABLED,
	[WORLD_TILES.ASH]            = TUNING.NET_IS_IAS_ENABLED and SHIPWRECKED_ENABLED,
	[WORLD_TILES.BEACH]          = TUNING.NET_IS_IAS_ENABLED and SHIPWRECKED_ENABLED,
	[WORLD_TILES.MEADOW]         = TUNING.NET_IS_IAS_ENABLED and SHIPWRECKED_ENABLED,
	[WORLD_TILES.JUNGLE]         = TUNING.NET_IS_IAS_ENABLED and SHIPWRECKED_ENABLED,
	[WORLD_TILES.TIDALMARSH]     = TUNING.NET_IS_IAS_ENABLED and SHIPWRECKED_ENABLED,
	[WORLD_TILES.SNAKESKINFLOOR] = TUNING.NET_IS_IAS_ENABLED and SHIPWRECKED_ENABLED,

	-- Hamlet Tiles.
	[WORLD_TILES.COBBLEROAD]     = TUNING.NET_IS_ABC_ENABLED and HAMLET_ENABLED,
	[WORLD_TILES.FOUNDATION]     = TUNING.NET_IS_ABC_ENABLED and HAMLET_ENABLED,
	[WORLD_TILES.LAWN]           = TUNING.NET_IS_ABC_ENABLED and HAMLET_ENABLED,
	[WORLD_TILES.PIGRUINS]       = TUNING.NET_IS_ABC_ENABLED and HAMLET_ENABLED,
	[WORLD_TILES.PIGRUINS_BLUE]  = TUNING.NET_IS_ABC_ENABLED and HAMLET_ENABLED,
	[WORLD_TILES.FIELDS]         = TUNING.NET_IS_ABC_ENABLED and HAMLET_ENABLED,
	[WORLD_TILES.MOSSY_BLOSSOM]  = TUNING.NET_IS_ABC_ENABLED and HAMLET_ENABLED,
	[WORLD_TILES.RAINFOREST]     = TUNING.NET_IS_ABC_ENABLED and HAMLET_ENABLED,
	[WORLD_TILES.DEEPJUNGLE]     = TUNING.NET_IS_ABC_ENABLED and HAMLET_ENABLED,
	[WORLD_TILES.GASJUNGLE]      = TUNING.NET_IS_ABC_ENABLED and HAMLET_ENABLED,
	[WORLD_TILES.PLAINS]         = TUNING.NET_IS_ABC_ENABLED and HAMLET_ENABLED,
	[WORLD_TILES.BOG]            = TUNING.NET_IS_ABC_ENABLED and HAMLET_ENABLED,
	[WORLD_TILES.ANTCAVE]        = TUNING.NET_IS_ABC_ENABLED and HAMLET_ENABLED,
	[WORLD_TILES.BATCAVE]        = TUNING.NET_IS_ABC_ENABLED and HAMLET_ENABLED,
}

local SOUNDS_ROCKY     = { sound = "dontstarve/AMB/rocky",                      wintersound = "dontstarve/AMB/rocky_winter",                 springsound = "dontstarve/AMB/rocky",                        summersound = "dontstarve_DLC001/AMB/rocky_summer",          rainsound = "dontstarve/AMB/rocky_rain"           }
local SOUNDS_ISLAND    = { sound = "hookline_2/amb/hermit_island",              wintersound = "hookline_2/amb/hermit_island",                springsound = "hookline_2/amb/hermit_island",                summersound = "hookline_2/amb/hermit_island",                rainsound = "hookline_2/amb/hermit_island"        }
local SOUNDS_MEADOW    = { sound = "dontstarve/AMB/meadow",                     wintersound = "dontstarve/AMB/meadow_winter",                springsound = "dontstarve/AMB/meadow",                       summersound = "dontstarve_DLC001/AMB/meadow_summer",         rainsound = "dontstarve/AMB/meadow_rain"          }
local SOUNDS_GRASSLAND = { sound = "dontstarve/AMB/grassland",                  wintersound = "dontstarve/AMB/grassland_winter",             springsound = "dontstarve/AMB/grassland",                    summersound = "dontstarve_DLC001/AMB/grassland_summer",      rainsound = "dontstarve/AMB/grassland_rain"       }
local SOUNDS_FOREST    = { sound = "dontstarve/AMB/forest",                     wintersound = "dontstarve/AMB/forest_winter",                springsound = "dontstarve/AMB/forest",                       summersound = "dontstarve_DLC001/AMB/forest_summer",         rainsound = "dontstarve/AMB/forest_rain"          }
local SOUNDS_MARSH     = { sound = "dontstarve/AMB/marsh",                      wintersound = "dontstarve/AMB/marsh_winter",                 springsound = "dontstarve/AMB/marsh",                        summersound = "dontstarve_DLC001/AMB/marsh_summer",          rainsound = "dontstarve/AMB/marsh_rain"           }
local SOUNDS_CHESS     = { sound = "dontstarve/AMB/chess",                      wintersound = "dontstarve/AMB/chess_winter",                 springsound = "dontstarve/AMB/chess",                        summersound = "dontstarve_DLC001/AMB/chess_summer",          rainsound = "dontstarve_DLC001/AMB/chess_summer"  }
local SOUNDS_BADLANDS  = { sound = "dontstarve/AMB/badland",                    wintersound = "dontstarve/AMB/badland_winter",               springsound = "dontstarve/AMB/badland",                      summersound = "dontstarve_DLC001/AMB/badland_summer",        rainsound = "dontstarve/AMB/badland_rain"         }
local SOUNDS_LUNAR     = { sound = "turnoftides/together_amb/moon_island/fall", wintersound = "turnoftides/together_amb/moon_island/winter", springsound = "turnoftides/together_amb/moon_island/spring", summersound = "turnoftides/together_amb/moon_island/summer", rainsound = "dontstarve_DLC001/AMB/chess_summer"  }
local SOUNDS_DOCKS     = { sound = "monkeyisland/amb/dock_ambience",            wintersound = "monkeyisland/amb/dock_ambience",              springsound = "monkeyisland/amb/dock_ambience",              summersound = "monkeyisland/amb/dock_ambience",              rainsound = "monkeyisland/amb/dock_ambience_rain" }
local SOUNDS_CAVE      = { sound = "dontstarve/AMB/caves/main"           }
local SOUNDS_CAVE_LIT  = { sound = "dontstarve/AMB/caves/litcave"        }
local SOUNDS_ARCHIVES  = { sound = "grotto/amb/archive"                  }
local SOUNDS_PARKFIELD = { sound = "dontstarve/AMB/quagmire/park_field"  }
local SOUNDS_GATEWAY   = { sound = "dontstarve/AMB/quagmire/gateway"     }
local SOUNDS_CITYSTONE = { sound = "dontstarve/AMB/quagmire/city_stone"  }
local SOUNDS_LAVAARENA = { sound = "dontstarve/AMB/lava_arena/arena_day" }

local AMBIENT_TILES =
{
	-- Shipwrecked Tiles.
	[WORLD_TILES.MAGMAFIELD]          = SOUNDS_ROCKY,
	[WORLD_TILES.VOLCANO]             = SOUNDS_ROCKY,
	[WORLD_TILES.VOLCANO_ROCK]        = SOUNDS_ROCKY,
	[WORLD_TILES.ASH]                 = SOUNDS_BADLANDS,
	[WORLD_TILES.BEACH]               = SOUNDS_ISLAND,
	[WORLD_TILES.MEADOW]              = SOUNDS_MEADOW,
	[WORLD_TILES.JUNGLE]              = SOUNDS_FOREST,
	[WORLD_TILES.TIDALMARSH]          = SOUNDS_MARSH,
	[WORLD_TILES.SNAKESKINFLOOR]      = SOUNDS_CHESS,

	-- Hamlet Tiles.
	[WORLD_TILES.COBBLEROAD]          = SOUNDS_ROCKY,
	[WORLD_TILES.FOUNDATION]          = SOUNDS_ROCKY,
	[WORLD_TILES.LAWN]                = SOUNDS_GRASSLAND,
	[WORLD_TILES.PIGRUINS]            = SOUNDS_ROCKY,
	[WORLD_TILES.PIGRUINS_BLUE]       = SOUNDS_ROCKY,
	[WORLD_TILES.FIELDS]              = SOUNDS_GRASSLAND,
	[WORLD_TILES.MOSSY_BLOSSOM]       = SOUNDS_GRASSLAND,
	[WORLD_TILES.RAINFOREST]          = SOUNDS_FOREST,
	[WORLD_TILES.DEEPJUNGLE]          = SOUNDS_FOREST,
	[WORLD_TILES.GASJUNGLE]           = SOUNDS_FOREST,
	[WORLD_TILES.PLAINS]              = SOUNDS_MEADOW,
	[WORLD_TILES.BOG]                 = SOUNDS_BADLANDS,
	[WORLD_TILES.ANTCAVE]             = SOUNDS_CAVE,
	[WORLD_TILES.BATCAVE]             = SOUNDS_CAVE,

	-- Events Tiles.
	[WORLD_TILES.PINKSTONE]           = SOUNDS_PARKFIELD,    
	[WORLD_TILES.STONECITY]           = SOUNDS_CITYSTONE,
	[WORLD_TILES.PINKPARK]            = SOUNDS_PARKFIELD,
	[WORLD_TILES.GREYFOREST]          = SOUNDS_GATEWAY,
	[WORLD_TILES.BROWNCARPET]         = SOUNDS_GATEWAY,
	[WORLD_TILES.FORGEROCK]           = SOUNDS_LAVAARENA,
	[WORLD_TILES.FORGEROAD]           = SOUNDS_LAVAARENA,

	-- Custom Tiles.
	[WORLD_TILES.LEGACYRAINFOREST]    = SOUNDS_FOREST,
	[WORLD_TILES.LEGACYDEEPJUNGLE]    = SOUNDS_FOREST,
	[WORLD_TILES.LEGACYBOG]           = SOUNDS_BADLANDS,
	[WORLD_TILES.GREENMARSH]          = SOUNDS_MARSH,
	[WORLD_TILES.IVYGRASS]            = SOUNDS_GRASSLAND,
	[WORLD_TILES.SWIRLGRASS]          = SOUNDS_GRASSLAND,
	[WORLD_TILES.SWIRLGRASSMONO]      = SOUNDS_GRASSLAND,
	[WORLD_TILES.SNOWFALL]            = SOUNDS_ROCKY,
	[WORLD_TILES.REDCARPET]           = SOUNDS_CHESS,
	[WORLD_TILES.PINKCARPET]          = SOUNDS_CHESS,
	[WORLD_TILES.CYANCARPET]          = SOUNDS_CHESS,
	[WORLD_TILES.WHITECARPET]         = SOUNDS_CHESS,
	[WORLD_TILES.YELLOWCARPET]        = SOUNDS_CHESS,
	[WORLD_TILES.GREENCARPET]         = SOUNDS_CHESS,
	[WORLD_TILES.ORANGECARPET]        = SOUNDS_CHESS,
	[WORLD_TILES.BLUEYELLOW]          = SOUNDS_CHESS,
	[WORLD_TILES.LEAKPROOFCARPET]     = SOUNDS_CHESS,
	[WORLD_TILES.MODERN_COBBLESTONES] = SOUNDS_ROCKY,
	[WORLD_TILES.COPACABANA]          = SOUNDS_ISLAND,              
	[WORLD_TILES.DRIFTWOODFLOOR]      = SOUNDS_ISLAND,
	[WORLD_TILES.WAGPUNKFLOOR]        = SOUNDS_ISLAND,
	[WORLD_TILES.LUNARRIFT]           = SOUNDS_LUNAR,
	[WORLD_TILES.VAULTMOSSY]          = SOUNDS_ARCHIVES,
	[WORLD_TILES.CHILLEDFLOOR]        = SOUNDS_ROCKY,
	[WORLD_TILES.CIRCLESCARPET]       = SOUNDS_CHESS,
	[WORLD_TILES.MOROCCARPET]         = SOUNDS_CHESS,
	[WORLD_TILES.WHITECRACKED]        = SOUNDS_CHESS,
	[WORLD_TILES.COAL]                = SOUNDS_ROCKY,
	[WORLD_TILES.HOTCOAL]             = SOUNDS_ROCKY,
	[WORLD_TILES.LIVINGLOG]           = SOUNDS_ROCKY,
	[WORLD_TILES.GREYROAD]            = SOUNDS_ROCKY,
	[WORLD_TILES.WHITEBRICK]          = SOUNDS_ROCKY,
	[WORLD_TILES.REDLAWN]             = SOUNDS_GRASSLAND,
	[WORLD_TILES.BLUELAWN]            = SOUNDS_GRASSLAND,
	[WORLD_TILES.PURPLERAINFOREST]    = SOUNDS_FOREST,
	[WORLD_TILES.BLUEPLAINS]          = SOUNDS_MEADOW,
	[WORLD_TILES.GLOOMYCARPET]        = SOUNDS_CHESS,
	[WORLD_TILES.UPHOLDERCARPET]      = SOUNDS_CHESS,
	[WORLD_TILES.MEADOWYELLOW]        = SOUNDS_MEADOW,
	[WORLD_TILES.HARDWOOD]            = SOUNDS_ROCKY,
	[WORLD_TILES.ARIDROCKY]           = SOUNDS_BADLANDS,
	[WORLD_TILES.ARIDGRASS]           = SOUNDS_BADLANDS,
	[WORLD_TILES.SINKHOLEYELLOW]      = SOUNDS_CAVE_LIT,
	[WORLD_TILES.SINKHOLERED]         = SOUNDS_CAVE_LIT,
	[WORLD_TILES.SINKHOLEBLUE]        = SOUNDS_CAVE_LIT,
	[WORLD_TILES.SINKHOLEPINK]        = SOUNDS_CAVE_LIT,
	[WORLD_TILES.SINKHOLEPURPLE]      = SOUNDS_CAVE_LIT,
	[WORLD_TILES.SAVANNAGREEN]        = SOUNDS_MEADOW,
	[WORLD_TILES.STICKYWEBBING]       = SOUNDS_ROCKY,
	[WORLD_TILES.STICKYHONEY]         = SOUNDS_ROCKY,
	[WORLD_TILES.STICKYICKER]         = SOUNDS_ROCKY,

	-- Interior Tiles.
	[WORLD_TILES.WOODPANEL]           = SOUNDS_ROCKY,
	[WORLD_TILES.DRIFTWOODPANEL]      = SOUNDS_ISLAND,
	[WORLD_TILES.MARBLETILE]          = SOUNDS_ROCKY,
	[WORLD_TILES.CHESS]               = SOUNDS_CHESS,
	[WORLD_TILES.SLATE]               = SOUNDS_CHESS,
	[WORLD_TILES.METALWOOD]           = SOUNDS_ROCKY,
	[WORLD_TILES.METALSHEET]          = SOUNDS_ROCKY,
	[WORLD_TILES.GARDENPATH]          = SOUNDS_ROCKY,
	[WORLD_TILES.GARDEN]              = SOUNDS_ROCKY,
	[WORLD_TILES.GEOMETRIC]           = SOUNDS_CHESS,
	[WORLD_TILES.REDGEOMETRIC]        = SOUNDS_CHESS,
	[WORLD_TILES.YELLOWGEOMETRIC]     = SOUNDS_CHESS,
	[WORLD_TILES.GREENGEOMETRIC]      = SOUNDS_CHESS,
	[WORLD_TILES.BWGEOMETRIC]         = SOUNDS_CHESS,
	[WORLD_TILES.SHAGCARPET]          = SOUNDS_CHESS,
	[WORLD_TILES.TRANSITIONAL]        = SOUNDS_CHESS,
	[WORLD_TILES.HERRING]             = SOUNDS_CHESS,
	[WORLD_TILES.HEXAGON]             = SOUNDS_CHESS,
	[WORLD_TILES.HOOF]                = SOUNDS_CHESS,
	[WORLD_TILES.OCTAGON]             = SOUNDS_CHESS,

	-- Dock Tiles.
	[WORLD_TILES.DOCKS_DRIFTWOOD]     = SOUNDS_DOCKS,
	[WORLD_TILES.DOCKS_COBBLESTONES]  = SOUNDS_DOCKS,
}

AddClassPostConstruct("components/ambientsound", function(self)
	local AMBIENT_SOUNDS = UpvalueHacker.GetUpvalue(self.OnUpdate, "AMBIENT_SOUNDS")

	if AMBIENT_SOUNDS == nil then
		return
	end

	for tile, data in pairs(AMBIENT_TILES) do
		if tile ~= nil and not AMBIENT_SOUND_BLACKLIST[tile] and AMBIENT_SOUNDS[tile] == nil then
			AMBIENT_SOUNDS[tile] = data
		end
	end
end)