local _G          = GLOBAL
local WORLD_TILES = _G.WORLD_TILES

local function GetTileName(tileid)
	for name, id in pairs(WORLD_TILES) do
		if id == tileid then
			return name
		end
	end

	return "UNKNOWN"
end

local function SafeChangeTileRenderOrder(tile, target, moveafter)
	if tile ~= nil and target ~= nil then
		ChangeTileRenderOrder(tile, target, moveafter)
	else
		print("Not Enough Turfs Mod - WARNING:",
		"Missing Tile:", tile, GetTileName(tile), 
		"Missing Tile Targert:", target, GetTileName(target))
	end
end

-- Turfs priority.
SafeChangeTileRenderOrder(WORLD_TILES.PINKSTONE,            WORLD_TILES.ROAD,               true)
SafeChangeTileRenderOrder(WORLD_TILES.STONECITY,            WORLD_TILES.PINKSTONE,          true)
SafeChangeTileRenderOrder(WORLD_TILES.BEACH,                WORLD_TILES.STONECITY,          true)
SafeChangeTileRenderOrder(WORLD_TILES.VOLCANO_ROCK,         WORLD_TILES.BEACH,              true)
SafeChangeTileRenderOrder(WORLD_TILES.TIDALMARSH,           WORLD_TILES.MARSH,              true)
SafeChangeTileRenderOrder(WORLD_TILES.GREENMARSH,           WORLD_TILES.TIDALMARSH,         true)
SafeChangeTileRenderOrder(WORLD_TILES.MEADOW,               WORLD_TILES.DIRT,               true)
SafeChangeTileRenderOrder(WORLD_TILES.JUNGLE,               WORLD_TILES.MEADOW,             true)
SafeChangeTileRenderOrder(WORLD_TILES.VOLCANO,              WORLD_TILES.DESERT_DIRT,        true)
SafeChangeTileRenderOrder(WORLD_TILES.ASH,                  WORLD_TILES.VOLCANO,            true)
SafeChangeTileRenderOrder(WORLD_TILES.MAGMAFIELD,           WORLD_TILES.ASH,                true)
SafeChangeTileRenderOrder(WORLD_TILES.ANTCAVE,              WORLD_TILES.MAGMAFIELD,         true)
SafeChangeTileRenderOrder(WORLD_TILES.BATCAVE,              WORLD_TILES.ANTCAVE,            true)
SafeChangeTileRenderOrder(WORLD_TILES.COPACABANA,           WORLD_TILES.BATCAVE,            true)
SafeChangeTileRenderOrder(WORLD_TILES.LEGACYBOG,            WORLD_TILES.COPACABANA,         true)
SafeChangeTileRenderOrder(WORLD_TILES.BOG,                  WORLD_TILES.LEGACYBOG,          true)
SafeChangeTileRenderOrder(WORLD_TILES.PLAINS,               WORLD_TILES.BOG,                true)
SafeChangeTileRenderOrder(WORLD_TILES.LEGACYRAINFOREST,     WORLD_TILES.PLAINS,             true)
SafeChangeTileRenderOrder(WORLD_TILES.LEGACYDEEPJUNGLE,     WORLD_TILES.LEGACYRAINFOREST,   true)
SafeChangeTileRenderOrder(WORLD_TILES.RAINFOREST,           WORLD_TILES.LEGACYDEEPJUNGLE,   true)
SafeChangeTileRenderOrder(WORLD_TILES.DEEPJUNGLE,           WORLD_TILES.RAINFOREST,         true)
SafeChangeTileRenderOrder(WORLD_TILES.GASJUNGLE,            WORLD_TILES.DEEPJUNGLE,         true)
SafeChangeTileRenderOrder(WORLD_TILES.FIELDS,               WORLD_TILES.GASJUNGLE,          true)
SafeChangeTileRenderOrder(WORLD_TILES.IVYGRASS,             WORLD_TILES.FIELDS,             true)
SafeChangeTileRenderOrder(WORLD_TILES.SWIRLGRASS,           WORLD_TILES.IVYGRASS,           true)
SafeChangeTileRenderOrder(WORLD_TILES.SWIRLGRASSMONO,       WORLD_TILES.SWIRLGRASS,         true)
SafeChangeTileRenderOrder(WORLD_TILES.PINKPARK,             WORLD_TILES.SWIRLGRASSMONO,     true)
SafeChangeTileRenderOrder(WORLD_TILES.GREYFOREST,           WORLD_TILES.PINKPARK,           true)
SafeChangeTileRenderOrder(WORLD_TILES.MOSSY_BLOSSOM,        WORLD_TILES.GREYFOREST,         true)
SafeChangeTileRenderOrder(WORLD_TILES.PIGRUINS,             WORLD_TILES.MOSSY_BLOSSOM,      true)
SafeChangeTileRenderOrder(WORLD_TILES.FOUNDATION,           WORLD_TILES.PIGRUINS,           true)
SafeChangeTileRenderOrder(WORLD_TILES.WOODPANEL,            WORLD_TILES.FOUNDATION,         true)
SafeChangeTileRenderOrder(WORLD_TILES.MARBLETILE,           WORLD_TILES.WOODPANEL,          true)
SafeChangeTileRenderOrder(WORLD_TILES.CHESS,                WORLD_TILES.MARBLETILE,         true)
SafeChangeTileRenderOrder(WORLD_TILES.SLATE,                WORLD_TILES.CHESS,              true)
SafeChangeTileRenderOrder(WORLD_TILES.METALSHEET,           WORLD_TILES.SLATE,              true)
SafeChangeTileRenderOrder(WORLD_TILES.GARDEN,               WORLD_TILES.METALSHEET,         true)
SafeChangeTileRenderOrder(WORLD_TILES.GEOMETRIC,            WORLD_TILES.GARDEN,             true)
SafeChangeTileRenderOrder(WORLD_TILES.TRANSITIONAL,         WORLD_TILES.GEOMETRIC,          true)
SafeChangeTileRenderOrder(WORLD_TILES.HERRING,              WORLD_TILES.TRANSITIONAL,       true)
SafeChangeTileRenderOrder(WORLD_TILES.HEXAGON,              WORLD_TILES.HERRING,            true)
SafeChangeTileRenderOrder(WORLD_TILES.HOOF,                 WORLD_TILES.HEXAGON,            true)
SafeChangeTileRenderOrder(WORLD_TILES.OCTAGON,              WORLD_TILES.HOOF,               true)
SafeChangeTileRenderOrder(WORLD_TILES.SHAGCARPET,           WORLD_TILES.OCTAGON,            true)
SafeChangeTileRenderOrder(WORLD_TILES.SNOWFALL,             WORLD_TILES.SHAGCARPET,         true)
SafeChangeTileRenderOrder(WORLD_TILES.DRIFTWOODFLOOR,       WORLD_TILES.SCALE,              true)
SafeChangeTileRenderOrder(WORLD_TILES.LUNARRIFT,            WORLD_TILES.METEOR,             true)
SafeChangeTileRenderOrder(WORLD_TILES.VAULTMOSSY,           WORLD_TILES.VAULT,              true)
SafeChangeTileRenderOrder(WORLD_TILES.REDCARPET,            WORLD_TILES.CARPET,             true)
SafeChangeTileRenderOrder(WORLD_TILES.PINKCARPET,           WORLD_TILES.REDCARPET,          true)
SafeChangeTileRenderOrder(WORLD_TILES.CYANCARPET,           WORLD_TILES.PINKCARPET,         true)
SafeChangeTileRenderOrder(WORLD_TILES.WHITECARPET,          WORLD_TILES.CYANCARPET,         true)
SafeChangeTileRenderOrder(WORLD_TILES.YELLOWCARPET,         WORLD_TILES.WHITECARPET,        true)
SafeChangeTileRenderOrder(WORLD_TILES.GREENCARPET,          WORLD_TILES.YELLOWCARPET,       true)
SafeChangeTileRenderOrder(WORLD_TILES.LEAKPROOFCARPET,      WORLD_TILES.GREENCARPET,        true)
SafeChangeTileRenderOrder(WORLD_TILES.ORANGECARPET,         WORLD_TILES.LEAKPROOFCARPET,    true)
SafeChangeTileRenderOrder(WORLD_TILES.BLUEYELLOW,           WORLD_TILES.ORANGECARPET,       true)
SafeChangeTileRenderOrder(WORLD_TILES.SNAKESKINFLOOR,       WORLD_TILES.BLUEYELLOW,         true)
SafeChangeTileRenderOrder(WORLD_TILES.LAWN,                 WORLD_TILES.SNAKESKINFLOOR,     true)
SafeChangeTileRenderOrder(WORLD_TILES.CHILLEDFLOOR,         WORLD_TILES.LAWN,               true)
SafeChangeTileRenderOrder(WORLD_TILES.BROWNCARPET,          WORLD_TILES.CHILLEDFLOOR,       true)
SafeChangeTileRenderOrder(WORLD_TILES.FORGEROAD,            WORLD_TILES.BROWNCARPET,        true)
SafeChangeTileRenderOrder(WORLD_TILES.COBBLEROAD,           WORLD_TILES.FORGEROAD,          true)
SafeChangeTileRenderOrder(WORLD_TILES.MODERN_COBBLESTONES,  WORLD_TILES.COBBLEROAD,         true)
SafeChangeTileRenderOrder(WORLD_TILES.FORGEROCK,            WORLD_TILES.UNDERROCK,          true)
SafeChangeTileRenderOrder(WORLD_TILES.WAGPUNKFLOOR,         WORLD_TILES.WAGSTAFF_FLOOR,     true)