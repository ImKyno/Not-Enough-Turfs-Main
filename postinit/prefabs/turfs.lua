local _G                   = GLOBAL
local AMOUNT_GIVEN_VANILLA = GetModConfigData("AMOUNT_GIVEN_VANILLA")

local VANILLA_TURFS =
{
	"turf_archive",
	"turf_beard_rug",
	"turf_carpetfloor",
	"turf_carpetfloor2",
	"turf_cave",
	"turf_checkerfloor",
	"turf_cotl_brick",
	"turf_cotl_gold",
	"turf_deciduous",
	"turf_desertdirt",
	"turf_forest",
	"turf_fungus",
	"turf_fungus_green",
	"turf_fungus_moon",
	"turf_fungus_red",
	"turf_grass",
	"turf_marsh",
	"turf_meteor",
	"turf_monkey_ground",
	"turf_mosaic_blue",
	"turf_mosaic_grey",
	"turf_mosaic_red",
	"turf_mud",
	"turf_pebblebeach",
	"turf_road",
	"turf_rocky",
	"turf_ruinsbrick",
	"turf_ruinsbrick_glow",
	"turf_ruinstiles",
	"turf_ruinstiles_glow",
	"turf_ruinstrim",
	"turf_ruinstrim_glow",
	"turf_savanna",
	"turf_shellbeach",
	"turf_sinkhole",
	"turf_underrock",
	"turf_vault",
	"turf_vent",
	"turf_woodfloor",
	"wurt_turf_marsh",
}

for turf, data in pairs(VANILLA_TURFS) do
	AddRecipePostInit(data, function(recipe)
		recipe.numtogive = AMOUNT_GIVEN_VANILLA
	end)
end

local MODDED_TURFS =
{
	turf_magmafield          = "ROCKY",
	turf_volcano             = "ROCKY",
	turf_volcano_rock        = "ROCKY",
	turf_beach               = "SAND",
	turf_meadow              = "GRASS",
	turf_jungle              = "FOREST",
	turf_tidalmarsh          = "MARSH",
	turf_snakeskinfloor      = "CARPET",

	turf_cobbleroad          = "ROAD",
	turf_foundation          = "STONE",
	turf_lawn                = "CARPET",
	turf_pigruins            = "ANCIENT",
	turf_mossy_blossom       = "SOIL",
	turf_rainforest          = "FOREST",
	turf_deepjungle          = "FOREST",
	turf_gasjungle           = "FOREST",
	turf_plains              = "GRASS",
	turf_bog                 = "SAND",
	turf_antcave             = "CAVE",
	turf_batcave             = "CAVE",

	turf_pinkstone           = "STONE",
	turf_stonecity           = "STONE",
	turf_pinkpark            = "GRASS",
	turf_greyforest          = "FOREST",
	turf_browncarpet         = "SOIL",
	turf_forgerock           = "ROCKY",
	turf_forgeroad           = "ROAD",

	turf_legacyrainforest    = "FOREST",
	turf_legacydeepjungle    = "FOREST",
	turf_legacybog           = "MARSH",
	turf_greenmarsh          = "MARSH",
	turf_ivygrass            = "GRASS",
	turf_swirlgrass          = "GRASS",
	turf_swirlgrassmono      = "GRASS",
	turf_snowfall            = "SNOW",
	turf_redcarpet           = "CARPET",
	turf_pinkcarpet          = "CARPET",
	turf_cyancarpet          = "CARPET",
	turf_whitecarpet         = "CARPET",
	turf_yellowcarpet        = "CARPET",
	turf_greencarpet         = "CARPET",
	turf_orangecarpet        = "CARPET",
	turf_blueyellow          = "CARPET",
	turf_leakproofcarpet     = "CARPET",
	turf_modern_cobblestones = "ROAD",
	turf_copacabana          = "MARBLE",
	turf_driftwoodfloor      = "WOOD",
	turf_lunarrift           = "LUNAR",
	turf_vaultmossy          = "ANCIENT",
	turf_wagpunkfloor        = "WOOD",
	turf_chilledfloor        = "FROZEN",

	turf_woodpanel           = "WOOD",
	turf_marbletile          = "MARBLE",
	turf_chess               = "MARBLE",
	turf_slate               = "MARBLE",
	turf_metalsheet          = "METAL",
	turf_garden              = "GARDEN",
	turf_geometric           = "MARBLE",
	turf_shagcarpet          = "CARPET",
	turf_transitional        = "WOOD",
	turf_herring             = "STONE",
	turf_hexagon             = "MARBLE",
	turf_hoof                = "MARBLE",
	turf_octagon             = "MARBLE",
}

for turf, data in pairs(MODDED_TURFS) do
	AddPrefabPostInit(turf, function(inst)
		if not _G.TheWorld.ismastersim then
			return inst
		end

		if inst.components.inspectable ~= nil then
			inst.components.inspectable.nameoverride = "TURF_TYPE_"..data
		end
	end)
end