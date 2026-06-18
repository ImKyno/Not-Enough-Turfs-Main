local _G                   = GLOBAL
local WORLD_TILES          = _G.WORLD_TILES
local TECH                 = _G.TECH
local Ingredient           = _G.Ingredient
local AllRecipes           = _G.AllRecipes
local Recipe2              = _G.Recipe2
local TechTree             = require("techtree")
local RecipeFilter         = require("recipes_filter")

local AMOUNT_GIVEN_MODDED  = GetModConfigData("AMOUNT_GIVEN_MODDED")

local ModAtlas             = "images/inventoryimages/net_inventoryimages.xml"
local DefaultAtlas3        = "images/inventoryimages3.xml"
local CraftingFilterAtlas  = "images/tabimages/net_tabimages.xml"

-- Wurt can craft her structures on Tidal Marsh ground.
-- Source: https://steamcommunity.com/sharedfiles/filedetails/?id=3435352667
local _IsMarshLand = AllRecipes["mermhouse_crafted"].testfn
local function IsTidalMarshLand(pt, rot, ...)
	return _G.TheWorld.Map:GetTileAtPoint(pt.x, pt.y, pt.z) == WORLD_TILES.TIDALMARSH
	or _IsMarshLand(pt, rot, ...)
end

AllRecipes["mermhouse_crafted"].testfn       = IsTidalMarshLand
AllRecipes["mermthrone_construction"].testfn = IsTidalMarshLand
AllRecipes["mermwatchtower"].testfn          = IsTidalMarshLand
AllRecipes["offering_pot"].testfn            = IsTidalMarshLand
AllRecipes["offering_pot_upgraded"].testfn   = IsTidalMarshLand
AllRecipes["merm_toolshed"].testfn           = IsTidalMarshLand
AllRecipes["merm_toolshed_upgraded"].testfn  = IsTidalMarshLand
AllRecipes["merm_armory"].testfn             = IsTidalMarshLand
AllRecipes["merm_armory_upgraded"].testfn    = IsTidalMarshLand

-- Custom TechTree for the Terra Former Tamper.
TECH.TURFMAKER     = { TURFMAKER = 1 }
TECH.TURFMAKER_ONE = { TURFMAKER = 1 }
TECH.TURFMAKER_TWO = { TURFMAKER = 2 }

local function ResetAllTech()
	TECH.NONE = TechTree.Create()

	for k, v in pairs(AllRecipes) do
		AllRecipes[k].level = TechTree.Create(v.level)
	end

	for k, v in pairs(TUNING.PROTOTYPER_TREES) do
		TUNING.PROTOTYPER_TREES[k] = TechTree.Create(v)
	end
end

table.insert(TechTree.AVAILABLE_TECH, "TURFMAKER")

ResetAllTech()

local NET_PROTOTYPERS       =
{
	kyno_terraformer        =
	{
		icon_atlas          = CraftingFilterAtlas,
		icon_image          = "kyno_tab_turfs.tex",
		is_crafting_station = false,
		action_str          = "TERRAFORMER",
		filter_text         = _G.STRINGS.UI.CRAFTING_FILTERS.TERRAFORMER,
	},
}

for k, prototyper in pairs(NET_PROTOTYPERS) do
	AddPrototyperDef(k, prototyper)
end

AddRecipe2("kyno_terraformer", {Ingredient("moonrocknugget", 1), Ingredient("cutstone", 3), Ingredient("pitchfork", 1)}, TECH.SCIENCE_TWO,
	{
		placer      = "kyno_terraformer_placer",
		min_spacing = 2.5,
		atlas       = ModAtlas,
		image       = "kyno_terraformer.tex",
	},
	{"PROTOTYPERS", "DECOR", "STRUCTURES"}
)

-- Shipwrecked Turf Recipes.
if not _G.NETRecipeAlreadyExists("chiminea", "limestone") and not TUNING.NET_IS_IAS_ENABLED then
	AddRecipe2("turf_magmafield", {Ingredient("rocks", 1), Ingredient("nitre", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_magmafield.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_volcano", {Ingredient("rocks", 1), Ingredient("charcoal", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_volcano.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_volcano_rock", {Ingredient("rocks", 1), Ingredient("charcoal", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_volcano_rock.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_ash", {Ingredient("ash", 1), Ingredient("charcoal", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_ash.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_beach", {Ingredient("rocks", 1), Ingredient("nitre", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_beach.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_meadow", {Ingredient("cutgrass", 1), Ingredient("petals", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_meadow.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_jungle", {Ingredient("pinecone", 1), Ingredient("twigs", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_jungle.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_tidalmarsh", {Ingredient("cutreeds", 1), Ingredient("spoiled_food", 2)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_tidalmarsh.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_snakeskinfloor", {Ingredient("boards", 1), Ingredient("beefalowool", 1), Ingredient("feather_robin", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_snakeskinfloor.tex",
		},
		{"DECOR"}
	)
end

-- Hamlet Turf Recipes.
if not _G.NETRecipeAlreadyExists("cork_bat", "corkchest") and not TUNING.NET_IS_ABC_ENABLED then
	AddRecipe2("turf_cobbleroad", {Ingredient("cutstone", 1), Ingredient("flint", 2)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_cobbleroad.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_foundation", {Ingredient("cutstone", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_foundation.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_lawn", {Ingredient("cutgrass", 1), Ingredient("nitre", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_lawn.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_pigruins", {Ingredient("cutstone", 1), Ingredient("flint", 2)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_pigruins.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_pigruins_blue", {Ingredient("cutstone", 1), Ingredient("flint", 2)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_pigruins_blue.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_fields", {Ingredient("cutgrass", 1), Ingredient("ash", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_fields.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_mossy_blossom", {Ingredient("twigs", 1), Ingredient("ash", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_mossy_blossom.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_rainforest", {Ingredient("cutgrass", 1), Ingredient("twigs", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_rainforest.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_deepjungle", {Ingredient("pinecone", 1), Ingredient("cutgrass", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_deepjungle.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_gasjungle", {Ingredient("ash", 1), Ingredient("spoiled_food", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_gasjungle.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_plains", {Ingredient("cutgrass", 1), Ingredient("poop", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_plains.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_bog", {Ingredient("rocks", 1), Ingredient("nitre", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_bog.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_antcave", {Ingredient("rocks", 1), Ingredient("nitre", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_antcave.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_batcave", {Ingredient("rocks", 1), Ingredient("guano", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDSTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_batcave.tex",
		},
		{"DECOR"}
	)
end

-- Event Turf Recipes.
AddRecipe2("turf_pinkstone", {Ingredient("cutstone", 1), Ingredient("flint", 2)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_pinkstone.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_stonecity", {Ingredient("cutstone", 1), Ingredient("flint", 2)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_stonecity.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_pinkpark", {Ingredient("cutgrass", 1), Ingredient("petals", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_pinkpark.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_greyforest", {Ingredient("ash", 1), Ingredient("twigs", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_greyforest.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_browncarpet", {Ingredient("poop", 1), Ingredient("seeds", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_browncarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_forgerock", {Ingredient("rocks", 1), Ingredient("flint", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_forgerock.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_forgeroad", {Ingredient("cutstone", 1), Ingredient("flint", 2)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_forgeroad.tex",
	},
	{"DECOR"}
)

-- Custom Turf Recipes.
AddRecipe2("turf_legacyrainforest", {Ingredient("cutgrass", 1), Ingredient("twigs", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_legacyrainforest.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_legacydeepjungle", {Ingredient("pinecone", 1), Ingredient("cutgrass", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_legacydeepjungle.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_legacybog", {Ingredient("rocks", 1), Ingredient("nitre", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_legacybog.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_greenmarsh", {Ingredient("cutreeds", 1), Ingredient("cutgrass", 2)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_greenmarsh.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_ivygrass", {Ingredient("cutgrass", 1), Ingredient("twigs", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_ivygrass.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_swirlgrass", {Ingredient("cutgrass", 1), Ingredient("cutreeds", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_swirlgrass.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_swirlgrassmono", {Ingredient("cutgrass", 1), Ingredient("cutreeds", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_swirlgrassmono.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_snowfall", {Ingredient("rocks", 1),Ingredient("ice", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_snowfall.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_redcarpet", {Ingredient("boards", 1), Ingredient("beefalowool", 1), Ingredient("feather_robin", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_redcarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_pinkcarpet", {Ingredient("boards", 1), Ingredient("beefalowool", 1), Ingredient("spidergland", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_pinkcarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_cyancarpet", {Ingredient("boards", 1), Ingredient("beefalowool", 1), Ingredient("cutlichen", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_cyancarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_whitecarpet", {Ingredient("boards", 1), Ingredient("beefalowool", 1), Ingredient("silk", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_whitecarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_yellowcarpet", {Ingredient("boards", 1), Ingredient("beefalowool", 1), Ingredient("feather_canary", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_yellowcarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_greencarpet", {Ingredient("boards", 1), Ingredient("beefalowool", 1), Ingredient("cutreeds", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_greencarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_orangecarpet", {Ingredient("boards", 1), Ingredient("beefalowool", 1), Ingredient("pumpkin", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_orangecarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_gloomycarpet", {Ingredient("boards", 1), Ingredient("beefalowool", 1), Ingredient("beardhair", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_gloomycarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_blueyellow", {Ingredient("boards", 1), Ingredient("beefalowool", 1), Ingredient("goldnugget", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_blueyellow.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_leakproofcarpet", {Ingredient("boards", 1), Ingredient("beefalowool", 1), Ingredient("silk", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_leakproofcarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_circlescarpet", {Ingredient("boards", 1), Ingredient("beefalowool", 1), Ingredient("feather_robin_winter", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_circlescarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_moroccarpet", {Ingredient("boards", 1), Ingredient("beefalowool", 1), Ingredient("feather_robin_winter", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_moroccarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_upholdercarpet", {Ingredient("boards", 1), Ingredient("beefalowool", 1), Ingredient("goose_feather", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_upholdercarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_modern_cobblestones", {Ingredient("cutstone", 1), Ingredient("flint", 2)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_modern_cobblestones.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_copacabana", {Ingredient("charcoal", 1), Ingredient("marble", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_copacabana.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_driftwoodfloor", {Ingredient("driftwood_log", 4)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_driftwoodfloor.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_livinglog", {Ingredient("livinglog", 2)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_livinglog.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_hardwood", {Ingredient("boards", 1), Ingredient("rope", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_hardwood.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_lunarrift", {Ingredient("moonrocknugget", 1), Ingredient("moonglass", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_lunarrift.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_vaultmossy", {Ingredient("thulecite_pieces", 1), Ingredient("moonrocknugget", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_vaultmossy.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_wagpunkfloor", {Ingredient("cutstone", 1), Ingredient("wagpunk_bits", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = DefaultAtlas3,
		image       = "wagpunk_floor_kit.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_chilledfloor", {Ingredient("ice", 1), Ingredient("rocks", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_chilledfloor.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_whitecracked", {Ingredient("rocks", 1), Ingredient("flint", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_whitecracked.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_coal", {Ingredient("trap_fumarole", 1), Ingredient("rocks", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_coal.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_hotcoal", {Ingredient("trap_fumarole", 1), Ingredient("charcoal", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_hotcoal.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_greyroad", {Ingredient("cutstone", 1), Ingredient("flint", 2)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_greyroad.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_whitebrick", {Ingredient("cutstone", 1), Ingredient("flint", 2)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_whitebrick.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_redlawn", {Ingredient("cutgrass", 1), Ingredient("nitre", 1), Ingredient("feather_robin", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_redlawn.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_bluelawn", {Ingredient("cutgrass", 1), Ingredient("nitre", 1), Ingredient("feather_robin_winter", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_bluelawn.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_purplerainforest", {Ingredient("pinecone", 1), Ingredient("foliage", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_purplerainforest.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_blueplains", {Ingredient("cutgrass", 1), Ingredient("blue_cap", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_blueplains.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_meadowyellow", {Ingredient("cutgrass", 1), Ingredient("petals", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_meadowyellow.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_aridrocky", {Ingredient("rocks", 1), Ingredient("boneshard", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_aridrocky.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_aridgrass", {Ingredient("cutgrass", 1), Ingredient("spoiled_food", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_aridgrass.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_sinkholeyellow", {Ingredient("cutgrass", 1), Ingredient("twigs", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_sinkholeyellow.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_sinkholered", {Ingredient("cutgrass", 1), Ingredient("feather_robin", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_sinkholered.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_sinkholeblue", {Ingredient("cutgrass", 1), Ingredient("feather_robin_winter", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_sinkholeblue.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_sinkholepink", {Ingredient("cutgrass", 1), Ingredient("spidergland", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_sinkholepink.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_sinkholepurple", {Ingredient("cutgrass", 1), Ingredient("foliage", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_sinkholepurple.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_savannagreen", {Ingredient("cutgrass", 1), Ingredient("cutreeds", 1), Ingredient("poop", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_savannagreen.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_stickywebbing", {Ingredient("boards", 1), Ingredient("silk", 6)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_stickywebbing.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_stickyhoney", {Ingredient("boards", 1), Ingredient("honey", 6)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_stickyhoney.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_stickyicker", {Ingredient("boards", 1), Ingredient("gelblob_bottle", 3)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_stickyicker.tex",
	},
	{"DECOR"}
)

-- Interior Turf Recipes.
AddRecipe2("turf_woodpanel", {Ingredient("boards", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_woodpanel.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_driftwoodpanel", {Ingredient("driftwood_log", 4)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_driftwoodpanel.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_marbletile", {Ingredient("marble", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_marbletile.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_chess", {Ingredient("marble", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_chess.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_slate", {Ingredient("marble", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_slate.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_metalwood", {Ingredient("cutstone", 1), Ingredient("boards", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_metalwood.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_metalsheet", {Ingredient("cutstone", 1), Ingredient("boards", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_metalsheet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_gardenpath", {Ingredient("rocks", 1), Ingredient("cutgrass", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_gardenpath.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_garden", {Ingredient("cutstone", 1), Ingredient("cutgrass", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_garden.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_geometric", {Ingredient("marble", 1), Ingredient("feather_robin_winter", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_geometric.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_redgeometric", {Ingredient("marble", 1), Ingredient("feather_robin", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_redgeometric.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_yellowgeometric", {Ingredient("marble", 1), Ingredient("feather_canary", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_yellowgeometric.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_greengeometric", {Ingredient("marble", 1), Ingredient("cutreeds", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_greengeometric.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_bwgeometric", {Ingredient("marble", 1), Ingredient("charcoal", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_bwgeometric.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_shagcarpet", {Ingredient("boards", 1), Ingredient("beefalowool", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_shagcarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_transitional", {Ingredient("boards", 1), Ingredient("cutstone", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_transitional.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_herring", {Ingredient("boneshard", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_herring.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_hexagon", {Ingredient("marble", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_hexagon.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_hoof", {Ingredient("marble", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_hoof.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_octagon", {Ingredient("marble", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDSTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_octagon.tex",
	},
	{"DECOR"}
)

AddRecipe2("dock_kit_driftwood", {Ingredient("driftwood_log", 16), Ingredient("cutstone", 1), 
Ingredient("stinger", 2), Ingredient("palmcone_scale", 1)}, TECH.LOST,
	{
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "dock_kit_driftwood.tex",
	},
	{"DECOR", "SEAFARING", "STRUCTURES"}
)

AddRecipe2("dock_kit_cobblestones", {Ingredient("boards", 1), Ingredient("cutstone", 4), 
Ingredient("stinger", 2), Ingredient("flint", 1)}, TECH.LOST,
	{
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "dock_kit_cobblestones.tex",
	},
	{"DECOR", "SEAFARING", "STRUCTURES"}
)