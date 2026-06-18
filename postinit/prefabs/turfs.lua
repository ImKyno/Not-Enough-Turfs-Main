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
	"dock_kit",
}

for turf, data in pairs(VANILLA_TURFS) do
	AddRecipePostInit(data, function(recipe)
		if recipe.numtogive ~= nil then
			recipe.numtogive = AMOUNT_GIVEN_VANILLA
		end
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
	turf_pigruins_blue       = "ANCIENT",
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
	turf_circlescarpet       = "CARPET",
	turf_moroccarpet         = "CARPET",
	turf_whitecracked        = "ROCKY",
	turf_coal                = "ROCKY",
	turf_hotcoal             = "ROCKY",
	turf_livinglog           = "WOOD",
	turf_greyroad            = "ROAD",
	turf_whitebrick          = "ROAD",
	turf_bluelawn            = "CARPET",
	turf_redlawn             = "CARPET",
	turf_purplerainforest    = "FOREST",
	turf_blueplains          = "GRASS",
	turf_gloomycarpet        = "CARPET",
	turf_upholdercarpet      = "CARPET",
	turf_meadowyellow        = "GRASS",
	turf_hardwood            = "WOOD",
	turf_aridrocky           = "ROCKY",
	turf_aridgrass           = "GRASS",
	turf_sinkholeyellow      = "CAVE",
	turf_sinkholered         = "CAVE",
	turf_sinkholeblue        = "CAVE",
	turf_sinkholepink        = "CAVE",
	turf_sinkholepurple      = "CAVE",
	turf_savannagreen        = "GRASS",
	turf_stickywebbing       = "WEBBED",
	turf_stickyhoney         = "STICKY",
	turf_stickyicker         = "STICKY",

	turf_woodpanel           = "WOOD",
	turf_driftwoodpanel      = "WOOD",
	turf_marbletile          = "MARBLE",
	turf_chess               = "MARBLE",
	turf_slate               = "MARBLE",
	turf_metalwood           = "METAL",
	turf_metalsheet          = "METAL",
	turf_gardenpath          = "GARDEN",
	turf_garden              = "GARDEN",
	turf_geometric           = "MARBLE",
	turf_redgeometric        = "MARBLE",
	turf_yellowgeometric     = "MARBLE",
	turf_greengeometric      = "MARBLE",
	turf_bwgeometric         = "MARBLE",
	turf_shagcarpet          = "CARPET",
	turf_transitional        = "WOOD",
	turf_herring             = "STONE",
	turf_hexagon             = "MARBLE",
	turf_hoof                = "MARBLE",
	turf_octagon             = "MARBLE",
}

-- The turfs below won't have their strings changed.
-- Their own mods already have strings defined and does not need ours.
local IA_TURFS =
{
	turf_magmafield          = true,
	turf_volcano             = true,
	turf_volcano_rock        = true,
	turf_beach               = true,
	turf_meadow              = true,
	turf_jungle              = true,
	turf_tidalmarsh          = true,
	turf_snakeskinfloor      = true,
}

local ABC_TURFS =
{
	turf_cobbleroad          = true,
	turf_foundation          = true,
	turf_lawn                = true,
	turf_pigruins            = true,
	turf_pigruins_blue       = true,
	turf_mossy_blossom       = true,
	turf_rainforest          = true,
	turf_deepjungle          = true,
	turf_gasjungle           = true,
	turf_plains              = true,
	turf_bog                 = true,
	turf_antcave             = true,
	turf_batcave             = true,
}

for turf, data in pairs(MODDED_TURFS) do
	if not (TUNING.NET_IS_IAS_ENABLED and IA_TURFS[turf]) 
	and not (TUNING.NET_IS_ABC_ENABLED and ABC_TURFS[turf]) then
		AddPrefabPostInit(turf, function(inst)
			if not _G.TheWorld.ismastersim then
				return inst
			end

			if inst.components.inspectable ~= nil then
				inst.components.inspectable.nameoverride = "TURF_TYPE_"..data
			end
		end)
	end
end

-- Returns empty bottle when crafted.
AddPrefabPostInit("turf_stickyicker", function(inst)
	if not _G.TheWorld.ismastersim then
		return inst
	end

	_G.MakeCraftingMaterialRecycler(inst, { gelblob_bottle = "messagebottleempty" })
end)