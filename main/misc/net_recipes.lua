local _G                   = GLOBAL
local WORLD_TILES          = _G.WORLD_TILES
local TECH                 = _G.TECH
local Ingredient           = _G.Ingredient
local AllRecipes           = _G.AllRecipes
local Recipe2              = _G.Recipe2
local TechTree             = require("techtree")
local RecipeFilter         = require("recipes_filter")

local AMOUNT_GIVEN_MODDED  = GetModConfigData("AMOUNT_GIVEN_MODDED")

-- Client-side checks for Island Adventures Mod.
local SHIPWRECKED_ENABLED  = AllRecipes["chiminea"] and AllRecipes["limestone"]
local HAMLET_ENABLED       = AllRecipes["cork_bat"] and AllRecipes["corkchest"]

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

-- Custom TechTree for The Terraformer.
table.insert(TechTree.AVAILABLE_TECH, "TURFMAKER")

TechTree.Create = function(t)
	t = t or {}

	for i, v in ipairs(TechTree.AVAILABLE_TECH) do
		t[v] = t[v] or 0
	end

	return t
end

_G.TECH.NONE.TURFMAKER = 0
_G.TECH.TURFMAKER_ONE  = { TURFMAKER = 1 }
_G.TECH.TURFMAKER_TWO  = { TURFMAKER = 2 }

for k,v in pairs(TUNING.PROTOTYPER_TREES) do
	v.TURFMAKER = 0
end

for i, v in pairs(_G.AllRecipes) do
	if v.level.TURFMAKER == nil then
		v.level.TURFMAKER = 0
	end
end

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
if not SHIPWRECKED_ENABLED then
	AddRecipe2("turf_magmafield", {Ingredient("turf_underrock", 1), Ingredient("charcoal", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_magmafield.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_volcano", {Ingredient("turf_magmafield", 1, ModAtlas), Ingredient("rocks", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_volcano.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_volcano_rock", {Ingredient("turf_volcano", 1, ModAtlas), Ingredient("rocks", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_volcano_rock.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_ash", {Ingredient("ash", 2)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_ash.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_beach", {Ingredient("turf_desertdirt", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_beach.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_meadow", {Ingredient("turf_grass", 1), Ingredient("cutgrass", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_meadow.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_jungle", {Ingredient("turf_forest", 1), Ingredient("twigs", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_jungle.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_tidalmarsh", {Ingredient("turf_mud", 1), Ingredient("ice", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_tidalmarsh.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_snakeskinfloor", {Ingredient("turf_carpetfloor", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_snakeskinfloor.tex",
		},
		{"DECOR"}
	)
end

-- Hamlet Turf Recipes.
if not HAMLET_ENABLED then
	AddRecipe2("turf_cobbleroad", {Ingredient("cutstone", 1), Ingredient("flint", 2)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_cobbleroad.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_foundation", {Ingredient("cutstone", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_foundation.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_lawn", {Ingredient("cutgrass", 2), Ingredient("nitre", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_lawn.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_pigruins", {Ingredient("cutstone", 1), Ingredient("flint", 2)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_pigruins.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_fields", {Ingredient("turf_rainforest", 1, ModAtlas), Ingredient("ash", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_fields.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_mossy_blossom", {Ingredient("turf_deciduous", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_mossy_blossom.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_rainforest", {Ingredient("turf_grass", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_rainforest.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_deepjungle", {Ingredient("turf_forest", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_deepjungle.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_gasjungle", {Ingredient("turf_deepjungle", 1, ModAtlas), Ingredient("spoiled_food", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_gasjungle.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_plains", {Ingredient("turf_savanna", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_plains.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_bog", {Ingredient("turf_desertdirt", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_bog.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_antcave", {Ingredient("turf_mud", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
			numtogive   = AMOUNT_GIVEN_MODDED,
			atlas       = ModAtlas,
			image       = "turf_antcave.tex",
		},
		{"DECOR"}
	)

	AddRecipe2("turf_batcave", {Ingredient("turf_cave", 1)}, TECH.TURFMAKER_ONE,
		{
			hint_msg    = "NEEDTURFMAKER",
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
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_pinkstone.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_stonecity", {Ingredient("cutstone", 1), Ingredient("flint", 2)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_stonecity.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_pinkpark", {Ingredient("turf_deciduous", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_pinkpark.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_greyforest", {Ingredient("turf_forest", 1), Ingredient("twigs", 2)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_greyforest.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_browncarpet", {Ingredient("poop", 2), Ingredient("seeds", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_browncarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_forgerock", {Ingredient("turf_underrock", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_forgerock.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_forgeroad", {Ingredient("turf_forgerock", 1, ModAtlas), Ingredient("redgem", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_forgeroad.tex",
	},
	{"DECOR"}
)

-- Custom Turf Recipes.
AddRecipe2("turf_legacyrainforest", {Ingredient("turf_rainforest", 1, ModAtlas)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_legacyrainforest.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_legacydeepjungle", {Ingredient("turf_deepjungle", 1, ModAtlas)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_legacydeepjungle.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_legacybog", {Ingredient("turf_bog", 1, ModAtlas), Ingredient("turf_marsh", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_legacybog.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_greenmarsh", {Ingredient("turf_marsh", 1), Ingredient("turf_grass", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_greenmarsh.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_ivygrass", {Ingredient("turf_grass", 1), Ingredient("turf_forest", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_ivygrass.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_swirlgrass", {Ingredient("turf_forest", 1), Ingredient("cutgrass", 2)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_swirlgrass.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_swirlgrassmono", {Ingredient("turf_grass", 1), Ingredient("twigs", 2)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_swirlgrassmono.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_snowfall", {Ingredient("ice", 2)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_snowfall.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_redcarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("feather_robin", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_redcarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_pinkcarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("spidergland", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_pinkcarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_cyancarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("cutlichen", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_cyancarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_whitecarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("silk", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_whitecarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_yellowcarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("cutgrass", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_yellowcarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_greencarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("succulent_picked", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_greencarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_orangecarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("pumpkin", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_orangecarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_blueyellow", {Ingredient("turf_carpetfloor", 1), Ingredient("cutgrass", 1), Ingredient("cutlichen", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_blueyellow.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_leakproofcarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("cutlichen", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_leakproofcarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_modern_cobblestones", {Ingredient("turf_road", 1), Ingredient("flint", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_modern_cobblestones.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_copacabana", {Ingredient("charcoal", 1), Ingredient("marble", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_copacabana.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_driftwoodfloor", {Ingredient("boards", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_driftwoodfloor.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_lunarrift", {Ingredient("moonrocknugget", 1), Ingredient("moonglass", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_lunarrift.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_vaultmossy", {Ingredient("thulecite_pieces", 1), Ingredient("moonrocknugget", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_vaultmossy.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_wagpunkfloor", {Ingredient("cutstone", 1), Ingredient("wagpunk_bits", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = DefaultAtlas3,
		image       = "wagpunk_floor_kit.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_chilledfloor", {Ingredient("ice", 1), Ingredient("rocks", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_chilledfloor.tex",
	},
	{"DECOR"}
)

-- Interior Turf Recipes.
AddRecipe2("turf_woodpanel", {Ingredient("turf_woodfloor", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_woodpanel.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_marbletile", {Ingredient("marble", 1), Ingredient("cutstone", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_marbletile.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_chess", {Ingredient("marble", 1), Ingredient("turf_rocky", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_chess.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_slate", {Ingredient("marble", 1), Ingredient("rocks", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_slate.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_metalsheet", {Ingredient("cutstone", 1), Ingredient("rocks", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_metalsheet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_garden", {Ingredient("turf_grass", 1), Ingredient("cutstone", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_garden.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_geometric", {Ingredient("turf_checkerfloor", 1), Ingredient("bluegem", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_geometric.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_shagcarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("silk", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_shagcarpet.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_transitional", {Ingredient("boards", 1), Ingredient("marble", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_transitional.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_herring", {Ingredient("turf_rocky", 1), Ingredient("boneshard", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_herring.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_hexagon", {Ingredient("charcoal", 1), Ingredient("marble", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_hexagon.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_hoof", {Ingredient("cutstone", 1), Ingredient("pigskin", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_hoof.tex",
	},
	{"DECOR"}
)

AddRecipe2("turf_octagon", {Ingredient("charcoal", 1), Ingredient("cutstone", 1)}, TECH.TURFMAKER_ONE,
	{
		hint_msg    = "NEEDTURFMAKER",
		numtogive   = AMOUNT_GIVEN_MODDED,
		atlas       = ModAtlas,
		image       = "turf_octagon.tex",
	},
	{"DECOR"}
)