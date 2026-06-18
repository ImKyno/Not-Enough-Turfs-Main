local _G = GLOBAL

-- For sorting recipe.
-- From Island Adventures: https://steamcommunity.com/sharedfiles/filedetails/?id=1467214795
local function SortRecipe(a, b, filter_name, offset)
	local filter = _G.CRAFTING_FILTERS[filter_name]

	if filter and filter.recipes then
		for sortvalue, product in ipairs(filter.recipes) do
			if product == a then
				table.remove(filter.recipes, sortvalue)
				break
			end
		end

		local target_position = #filter.recipes + 1

		for sortvalue, product in ipairs(filter.recipes) do
			if product == b then
				target_position = sortvalue + offset
				break
			end
		end

		table.insert(filter.recipes, target_position, a)
	end
end

local function SortBefore(a, b, filter_name)
	SortRecipe(a, b, filter_name, 0)
end

local function SortAfter(a, b, filter_name)
	SortRecipe(a, b, filter_name, 1)
end

SortAfter("kyno_terraformer",         "turfcraftingstation",      "PROTOTYPERS")
SortAfter("kyno_terraformer",         "turfcraftingstation",      "DECOR")
SortAfter("kyno_terraformer",         "turfcraftingstation",      "STRUCTURES")

-- Shipwrecked Turfs.
SortAfter("turf_magmafield",          "turf_fungus_green",        "DECOR")
SortAfter("turf_volcano",             "turf_magmafield",          "DECOR")
SortAfter("turf_volcano_rock",        "turf_volcano",             "DECOR")
SortAfter("turf_ash",                 "turf_volcano_rock",        "DECOR")
SortAfter("turf_beach",               "turf_ash",                 "DECOR")
SortAfter("turf_meadow",              "turf_beach",               "DECOR")
SortAfter("turf_jungle",              "turf_meadow",              "DECOR")
SortAfter("turf_tidalmarsh",          "turf_jungle",              "DECOR")
SortAfter("turf_snakeskinfloor",      "turf_tidalmarsh",          "DECOR")

-- Hamlet Turfs.
SortAfter("turf_cobbleroad",          "turf_snakeskinfloor",      "DECOR")
SortAfter("turf_foundation",          "turf_cobbleroad",          "DECOR")
SortAfter("turf_lawn",                "turf_foundation",          "DECOR")
SortAfter("turf_pigruins",            "turf_lawn",                "DECOR")
SortAfter("turf_pigruins_blue",       "turf_pigruins",            "DECOR")
SortAfter("turf_fields",              "turf_pigruins_blue",       "DECOR")
SortAfter("turf_mossy_blossom",       "turf_fields",              "DECOR")
SortAfter("turf_rainforest",          "turf_mossy_blossom",       "DECOR")
SortAfter("turf_deepjungle",          "turf_rainforest",          "DECOR")
SortAfter("turf_gasjungle",           "turf_deepjungle",          "DECOR")
SortAfter("turf_plains",              "turf_gasjungle",           "DECOR")
SortAfter("turf_bog",                 "turf_plains",              "DECOR")
SortAfter("turf_antcave",             "turf_bog",                 "DECOR")
SortAfter("turf_batcave",             "turf_antcave",             "DECOR")

-- Events Turfs.
SortAfter("turf_pinkstone",           "turf_batcave",             "DECOR")
SortAfter("turf_stonecity",           "turf_pinkstone",           "DECOR")
SortAfter("turf_pinkpark",            "turf_stonecity",           "DECOR")
SortAfter("turf_greyforest",          "turf_pinkpark",            "DECOR")
SortAfter("turf_browncarpet",         "turf_greyforest",          "DECOR")
SortAfter("turf_forgerock",           "turf_browncarpet",         "DECOR")
SortAfter("turf_forgeroad",           "turf_forgerock",           "DECOR")

-- Custom Turfs.
SortAfter("turf_legacyrainforest",    "turf_forgeroad",           "DECOR")
SortAfter("turf_legacydeepjungle",    "turf_legacyrainforest",    "DECOR")
SortAfter("turf_legacybog",           "turf_legacydeepjungle",    "DECOR")
SortAfter("turf_greenmarsh",          "turf_legacybog",           "DECOR")
SortAfter("turf_ivygrass",            "turf_greenmarsh",          "DECOR")
SortAfter("turf_swirlgrass",          "turf_ivygrass",            "DECOR")
SortAfter("turf_swirlgrassmono",      "turf_swirlgrass",          "DECOR")
SortAfter("turf_snowfall",            "turf_swirlgrassmono",      "DECOR")
SortAfter("turf_redcarpet",           "turf_snowfall",            "DECOR")
SortAfter("turf_pinkcarpet",          "turf_redcarpet",           "DECOR")
SortAfter("turf_cyancarpet",          "turf_pinkcarpet",          "DECOR")
SortAfter("turf_whitecarpet",         "turf_cyancarpet",          "DECOR")
SortAfter("turf_yellowcarpet",        "turf_whitecarpet",         "DECOR")
SortAfter("turf_greencarpet",         "turf_yellowcarpet",        "DECOR")
SortAfter("turf_orangecarpet",        "turf_greencarpet",         "DECOR")
SortAfter("turf_gloomycarpet",        "turf_orangecarpet",        "DECOR")
SortAfter("turf_blueyellow",          "turf_gloomycarpet",        "DECOR")
SortAfter("turf_leakproofcarpet",     "turf_blueyellow",          "DECOR")
SortAfter("turf_circlescarpet",       "turf_leakproofcarpet",     "DECOR")
SortAfter("turf_moroccarpet",         "turf_circlescarpet",       "DECOR")
SortAfter("turf_upholdercarpet",      "turf_moroccarpet",         "DECOR")
SortAfter("turf_modern_cobblestones", "turf_upholdercarpet",      "DECOR")
SortAfter("turf_copacabana",          "turf_modern_cobblestones", "DECOR")
SortAfter("turf_driftwoodfloor",      "turf_copacabana",          "DECOR")
SortAfter("turf_livinglog",           "turf_driftwoodfloor",      "DECOR")
SortAfter("turf_hardwood",            "turf_livinglog",           "DECOR")
SortAfter("turf_fakedocks",           "turf_hardwood",            "DECOR")
SortAfter("turf_fakedocks_driftwood", "turf_fakedocks",           "DECOR")
SortAfter("turf_lunarrift",           "turf_fakedocks_driftwood", "DECOR")
SortAfter("turf_vaultmossy",          "turf_lunarrift",           "DECOR")
SortAfter("turf_wagpunkfloor",        "turf_vaultmossy",          "DECOR")
SortAfter("turf_chilledfloor",        "turf_wagpunkfloor",        "DECOR")
SortAfter("turf_whitecracked",        "turf_chilledfloor",        "DECOR")
SortAfter("turf_coal",                "turf_whitecracked",        "DECOR")
SortAfter("turf_hotcoal",             "turf_coal",                "DECOR")
SortAfter("turf_greyroad",            "turf_hotcoal",             "DECOR")
SortAfter("turf_whitebrick",          "turf_greyroad",            "DECOR")
SortAfter("turf_redlawn",             "turf_whitebrick",          "DECOR")
SortAfter("turf_bluelawn",            "turf_redlawn",             "DECOR")
SortAfter("turf_purplerainforest",    "turf_bluelawn",            "DECOR")
SortAfter("turf_blueplains",          "turf_purplerainforest",    "DECOR")
SortAfter("turf_meadowyellow",        "turf_blueplains",          "DECOR")
SortAfter("turf_aridrocky",           "turf_meadowyellow",        "DECOR")
SortAfter("turf_aridgrass",           "turf_aridrocky",           "DECOR")
SortAfter("turf_sinkholeyellow",      "turf_aridgrass",           "DECOR")
SortAfter("turf_sinkholered",         "turf_sinkholeyellow",      "DECOR")
SortAfter("turf_sinkholeblue",        "turf_sinkholered",         "DECOR")
SortAfter("turf_sinkholepink",        "turf_sinkholeblue",        "DECOR")
SortAfter("turf_sinkholepurple",      "turf_sinkholepink",        "DECOR")
SortAfter("turf_savannagreen",        "turf_sinkholepurple",      "DECOR")
SortAfter("turf_stickywebbing",       "turf_savannagreen",        "DECOR")
SortAfter("turf_stickyhoney",         "turf_stickywebbing",       "DECOR")
SortAfter("turf_stickyicker",         "turf_stickyhoney",         "DECOR")

-- Interior Turfs.
SortAfter("turf_woodpanel",           "turf_stickyicker",         "DECOR")
SortAfter("turf_driftwoodpanel",      "turf_woodpanel",           "DECOR")
SortAfter("turf_marbletile",          "turf_driftwoodpanel",      "DECOR")
SortAfter("turf_chess",               "turf_marbletile",          "DECOR")
SortAfter("turf_slate",               "turf_chess",               "DECOR")
SortAfter("turf_metalwood",           "turf_slate",               "DECOR")
SortAfter("turf_metalsheet",          "turf_metalwood",           "DECOR")
SortAfter("turf_gardenpath",          "turf_metalsheet",          "DECOR")
SortAfter("turf_garden",              "turf_gardenpath",          "DECOR")
SortAfter("turf_geometric",           "turf_garden",              "DECOR")
SortAfter("turf_redgeometric",        "turf_geometric",           "DECOR")
SortAfter("turf_yellowgeometric",     "turf_redgeometric",        "DECOR")
SortAfter("turf_greengeometric",      "turf_yellowgeometric",     "DECOR")
SortAfter("turf_bwgeometric",         "turf_greengeometric",      "DECOR")
SortAfter("turf_shagcarpet",          "turf_bwgeometric",         "DECOR")
SortAfter("turf_transitional",        "turf_shagcarpet",          "DECOR")
SortAfter("turf_herring",             "turf_transitional",        "DECOR")
SortAfter("turf_hexagon",             "turf_herring",             "DECOR")
SortAfter("turf_hoof",                "turf_hexagon",             "DECOR")
SortAfter("turf_octagon",             "turf_hoof",                "DECOR")

-- Docks
SortAfter("dock_kit_driftwood",       "dock_kit",                 "DECOR")
SortAfter("dock_kit_driftwood",       "dock_kit",                 "SEAFARING")
SortAfter("dock_kit_driftwood",       "dock_kit",                 "STRUCTURES")
SortAfter("dock_kit_cobblestones",    "dock_kit_driftwood",       "DECOR")
SortAfter("dock_kit_cobblestones",    "dock_kit_driftwood",       "SEAFARING")
SortAfter("dock_kit_cobblestones",    "dock_kit_driftwood",       "STRUCTURES")