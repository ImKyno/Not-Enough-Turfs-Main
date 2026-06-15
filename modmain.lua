-- Common Dependencies.
local _G              = GLOBAL
local require         = _G.require
local TECH            = _G.TECH
local Ingredient      = _G.Ingredient
local AllRecipes      = _G.AllRecipes
local Recipe2         = _G.Recipe2
local resolvefilepath = _G.resolvefilepath
local WORLD_TILES     = _G.WORLD_TILES

require("recipes")
require("recipes_filter")

-- Mod Dependencies.
modimport("scripts/kyno_turfsstrings")
modimport("scripts/kyno_turfspostinits")

-- Assets.
Assets =
{
	Asset("ANIM", "anim/kyno_turfs_hamlet.zip"),
	Asset("ANIM", "anim/kyno_turfs_shipwrecked.zip"),
	Asset("ANIM", "anim/kyno_turfs_events.zip"),
	Asset("ANIM", "anim/kyno_turfs_ruins.zip"),
	Asset("ANIM", "anim/kyno_turfs_interior.zip"),
	Asset("ANIM", "anim/kyno_turfs_other.zip"),
	Asset("ANIM", "anim/kyno_terraformer.zip"),

	Asset("IMAGE", "images/inventoryimages/kyno_terraformer.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_terraformer.xml"),

	Asset("IMAGE", "images/minimapimages/kyno_terraformer.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_terraformer.xml"),

	Asset("IMAGE", "images/tabimages/kyno_turfmakertab.tex"),
	Asset("ATLAS", "images/tabimages/kyno_turfmakertab.xml"),

	Asset("IMAGE", "images/inventoryimages/kyno_turfsimages.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_turfsimages.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_turfsimages.xml", 256),
}

-- Prefabs.
PrefabFiles =
{
	"k_terraformer",
	"k_webcreep",
}

-- Minimap Assets.
AddMinimapAtlas("images/minimapimages/kyno_terraformer.xml")

-- For sorting recipe.
-- Source: https://steamcommunity.com/sharedfiles/filedetails/?id=1467214795
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
local TechTree = require("techtree")
table.insert(TechTree.AVAILABLE_TECH, "TURFMAKER")

TechTree.Create = function(t)
	t = t or {}

	for i, v in ipairs(TechTree.AVAILABLE_TECH) do
		t[v] = t[v] or 0
	end

	return t
end

_G.TECH.NONE.TURFMAKER 	= 0
_G.TECH.TURFMAKER_ONE 	= { TURFMAKER = 1 }
_G.TECH.TURFMAKER_TWO 	= { TURFMAKER = 2 }

for k,v in pairs(TUNING.PROTOTYPER_TREES) do
	v.TURFMAKER = 0
end

TUNING.PROTOTYPER_TREES.TURFMAKER_ONE = TechTree.Create({
	TURFMAKER 	= 1,
})
TUNING.PROTOTYPER_TREES.TURFMAKER_TWO = TechTree.Create({
	TURFMAKER 	= 2,
})

for i, v in pairs(_G.AllRecipes) do
	if v.level.TURFMAKER == nil then
		v.level.TURFMAKER = 0
	end
end

-- The Terraformer Recipe / Custom Prototyper and Recipe Filters.
local Terraformer	= AddRecipe2("kyno_terraformer", {Ingredient("moonrocknugget", 1), Ingredient("cutstone", 3), Ingredient("pitchfork", 1)}, TECH.SCIENCE_TWO,
	{
		placer		= "kyno_terraformer_placer",
		min_spacing	= 1,
		atlas		= "images/inventoryimages/kyno_terraformer.xml",
		image		= "kyno_terraformer.tex",
	},
	{"PROTOTYPERS", "DECOR", "STRUCTURES"}
)
SortAfter("kyno_terraformer", "turfcraftingstation", "PROTOTYPERS")
SortAfter("kyno_terraformer", "turfcraftingstation", "DECOR")
SortAfter("kyno_terraformer", "turfcraftingstation", "STRUCTURES")

-- Turfs Recipes.
local AMOUNT_GIVEN_MOD 	    = GetModConfigData("amount_given")
local TurfsAtlas		    = "images/inventoryimages/kyno_turfsimages.xml"
local DefaultAtlas3         = "images/inventoryimages3.xml"

local PROTOTYPED_TURFS      = GetModConfigData("prototyped_turfs")
if PROTOTYPED_TURFS         == 0 then
AddPrototyperDef("kyno_terraformer",
	{
		icon_atlas 			= "images/tabimages/kyno_turfmakertab.xml",
		icon_image 			= "kyno_tab_turfs.tex",
		is_crafting_station = true,
		action_str 			= "TERRAFORMER",
		filter_text 		= _G.STRINGS.TERRAFORMER_FILTER,
	}
)

local Cobbleroad 	= AddRecipe2("turf_cobbleroad", {Ingredient("cutstone", 1), Ingredient("flint", 2)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_cobbleroad.tex",
	},
	{"CRAFTING_STATION"}
)

local Foundation 	= AddRecipe2("turf_foundation", {Ingredient("cutstone", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_foundation.tex",
	},
	{"CRAFTING_STATION"}
)
local Lawn 			= AddRecipe2("turf_lawn", {Ingredient("cutgrass", 2), Ingredient("nitre", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_lawn.tex",
	},
	{"CRAFTING_STATION"}
)

local Pigruins 		= AddRecipe2("turf_pigruins", {Ingredient("cutstone", 1), Ingredient("flint", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_pigruins.tex",
	},
	{"CRAFTING_STATION"}
)

local Fields 		= AddRecipe2("turf_fields", {Ingredient("turf_rainforest", 1, TurfsAtlas), Ingredient("ash", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_fields.tex",
	},
	{"CRAFTING_STATION"}
)

local Mossy 		= AddRecipe2("turf_mossy_blossom", {Ingredient("turf_deciduous", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_mossy_blossom.tex",
	},
	{"CRAFTING_STATION"}
)

local Rainforest 	= AddRecipe2("turf_rainforest", {Ingredient("turf_grass", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_rainforest.tex",
	},
	{"CRAFTING_STATION"}
)

local Deepjungle 	= AddRecipe2("turf_deepjungle", {Ingredient("turf_forest", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_deepjungle.tex",
	},
	{"CRAFTING_STATION"}
)

local Gasjungle 	= AddRecipe2("turf_gasjungle", {Ingredient("turf_deepjungle", 1, TurfsAtlas), Ingredient("spoiled_food", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_gasjungle.tex",
	},
	{"CRAFTING_STATION"}
)

local Plains 		= AddRecipe2("turf_plains", {Ingredient("turf_savanna", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_plains.tex",
	},
	{"CRAFTING_STATION"}
)

local Bog 			= AddRecipe2("turf_bog", {Ingredient("turf_desertdirt", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_bog.tex",
	},
	{"CRAFTING_STATION"}
)

local Antcave 		= AddRecipe2("turf_antcave", {Ingredient("turf_mud", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_antcave.tex",
	},
	{"CRAFTING_STATION"}
)

local Batcave 		= AddRecipe2("turf_batcave", {Ingredient("turf_cave", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_batcave.tex",
	},
	{"CRAFTING_STATION"}
)

local Magmafield 	= AddRecipe2("turf_magmafield", {Ingredient("turf_underrock", 1), Ingredient("charcoal", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_magmafield.tex",
	},
	{"CRAFTING_STATION"}
)

local Volcano 		= AddRecipe2("turf_volcano", {Ingredient("turf_magmafield", 1, TurfsAtlas), Ingredient("rocks", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_volcano.tex",
	},
	{"CRAFTING_STATION"}
)

local Volcanorock 	= AddRecipe2("turf_volcano_rock", {Ingredient("turf_volcano", 1, TurfsAtlas), Ingredient("rocks", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_volcano_rock.tex",
	},
	{"CRAFTING_STATION"}
)

local Ashy 			= AddRecipe2("turf_ash", {Ingredient("ash", 2)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_ash.tex",
	},
	{"CRAFTING_STATION"}
)

local Beachy 		= AddRecipe2("turf_beach", {Ingredient("turf_desertdirt", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_beach.tex",
	},
	{"CRAFTING_STATION"}
)

local Meadow 		= AddRecipe2("turf_meadow", {Ingredient("turf_grass", 1), Ingredient("cutgrass", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_meadow.tex",
	},
	{"CRAFTING_STATION"}
)

local Jungler 		= AddRecipe2("turf_jungle", {Ingredient("turf_forest", 1), Ingredient("twigs", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_jungle.tex",
	},
	{"CRAFTING_STATION"}
)

local Tidalmarsh 	= AddRecipe2("turf_tidalmarsh", {Ingredient("turf_mud", 1), Ingredient("ice", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_tidalmarsh.tex",
	},
	{"CRAFTING_STATION"}
)

local Snakeskin 	= AddRecipe2("turf_snakeskinfloor", {Ingredient("turf_carpetfloor", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_snakeskinfloor.tex",
	},
	{"CRAFTING_STATION"}
)

local Pinkstone 	= AddRecipe2("turf_pinkstone", {Ingredient("cutstone", 1), Ingredient("flint", 2)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_pinkstone.tex",
	},
	{"CRAFTING_STATION"}
)

local Stonecity 	= AddRecipe2("turf_stonecity", {Ingredient("cutstone", 1), Ingredient("flint", 2)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_stonecity.tex",
	},
	{"CRAFTING_STATION"}
)

local Pinkpark 		= AddRecipe2("turf_pinkpark", {Ingredient("turf_deciduous", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_pinkpark.tex",
	},
	{"CRAFTING_STATION"}
)

local Greyforest 	= AddRecipe2("turf_greyforest", {Ingredient("turf_forest", 1), Ingredient("twigs", 2)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_greyforest.tex",
	},
	{"CRAFTING_STATION"}
)

local Soilcarpet 	= AddRecipe2("turf_browncarpet", {Ingredient("poop", 2), Ingredient("seeds", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_browncarpet.tex",
	},
	{"CRAFTING_STATION"}
)

local Forgerock 	= AddRecipe2("turf_forgerock", {Ingredient("turf_underrock", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_forgerock.tex",
	},
	{"CRAFTING_STATION"}
)

local Forgeroad 	= AddRecipe2("turf_forgeroad", {Ingredient("turf_forgerock", 1, TurfsAtlas), Ingredient("redgem", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_forgeroad.tex",
	},
	{"CRAFTING_STATION"}
)

local Legacyforest 	= AddRecipe2("turf_legacyrainforest", {Ingredient("turf_rainforest", 1, TurfsAtlas)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_legacyrainforest.tex",
	},
	{"CRAFTING_STATION"}
)

local Legacyjungle 	= AddRecipe2("turf_legacydeepjungle", {Ingredient("turf_deepjungle", 1, TurfsAtlas)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_legacydeepjungle.tex",
	},
	{"CRAFTING_STATION"}
)

local Snowfall 		= AddRecipe2("turf_snowfall", {Ingredient("ice", 2)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_snowfall.tex",
	},
	{"CRAFTING_STATION"}
)

local Redcarpet 	= AddRecipe2("turf_redcarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("feather_robin", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_redcarpet.tex",
	},
	{"CRAFTING_STATION"}
)

local Pinkcarpet	= AddRecipe2("turf_pinkcarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("spidergland", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_pinkcarpet.tex",
	},
	{"CRAFTING_STATION"}
)

local Cyancarpet	= AddRecipe2("turf_cyancarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("cutlichen", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_cyancarpet.tex",
	},
	{"CRAFTING_STATION"}
)

local Whitecarpet	= AddRecipe2("turf_whitecarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("silk", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_whitecarpet.tex",
	},
	{"CRAFTING_STATION"}
)

local Yellowcarpet	= AddRecipe2("turf_yellowcarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("cutgrass", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_yellowcarpet.tex",
	},
	{"CRAFTING_STATION"}
)

local Greencarpet	= AddRecipe2("turf_greencarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("succulent_picked", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_greencarpet.tex",
	},
	{"CRAFTING_STATION"}
)

local Orangecarpet	= AddRecipe2("turf_orangecarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("pumpkin", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_orangecarpet.tex",
	},
	{"CRAFTING_STATION"}
)

local Blueyellow	= AddRecipe2("turf_blueyellow", {Ingredient("turf_carpetfloor", 1), Ingredient("cutgrass", 1), Ingredient("cutlichen", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_blueyellow.tex",
	},
	{"CRAFTING_STATION"}
)

local MCobblestones = AddRecipe2("turf_modern_cobblestones", {Ingredient("turf_road", 1), Ingredient("flint", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_modern_cobblestones.tex",
	},
	{"CRAFTING_STATION"}
)

local LunarRift     = AddRecipe2("turf_lunarrift", {Ingredient("purebrilliance", 1), Ingredient("moonrocknugget", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_lunarrift.tex",
	},
	{"CRAFTING_STATION"}
)

local Copacabana 	= AddRecipe2("turf_copacabana", {Ingredient("charcoal", 1), Ingredient("marble", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_copacabana.tex",
	},
	{"CRAFTING_STATION"}
)

local Driftwood     = AddRecipe2("turf_driftwoodfloor", {Ingredient("boards", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_driftwoodfloor.tex",
	},
	{"CRAFTING_STATION"}
)

local Leakproof 	= AddRecipe2("turf_leakproofcarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("cutlichen", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_leakproofcarpet.tex",
	},
	{"CRAFTING_STATION"}
)

local Legacybog 	= AddRecipe2("turf_legacybog", {Ingredient("turf_bog", 1, TurfsAtlas), Ingredient("turf_marsh", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_legacybog.tex",
	},
	{"CRAFTING_STATION"}
)

local Greenmarsh 	= AddRecipe2("turf_greenmarsh", {Ingredient("turf_marsh", 1), Ingredient("turf_grass", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_greenmarsh.tex",
	},
	{"CRAFTING_STATION"}
)

local Ivygrass 		= AddRecipe2("turf_ivygrass", {Ingredient("turf_grass", 1), Ingredient("turf_forest", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_ivygrass.tex",
	},
	{"CRAFTING_STATION"}
)

local Swirlgrass 	= AddRecipe2("turf_swirlgrass", {Ingredient("turf_forest", 1), Ingredient("cutgrass", 2)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_swirlgrass.tex",
	},
	{"CRAFTING_STATION"}
)

local Swirlgrass2 	= AddRecipe2("turf_swirlgrassmono", {Ingredient("turf_grass", 1), Ingredient("twigs", 2)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_swirlgrassmono.tex",
	},
	{"CRAFTING_STATION"}
)

local WebbedGround	= AddRecipe2("turf_webcreep", {Ingredient("silk", 3)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_webcreep.tex",
	},
	{"CRAFTING_STATION"}
)

local VaultMossy	= AddRecipe2("turf_vaultmossy", {Ingredient("thulecite_pieces", 1), Ingredient("moonrocknugget", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_vaultmossy.tex",
	},
	{"CRAFTING_STATION"}
)

local Woodpanel 	= AddRecipe2("turf_woodpanel", {Ingredient("turf_woodfloor", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_woodpanel.tex",
	},
	{"CRAFTING_STATION"}
)

local Marbletile 	= AddRecipe2("turf_marbletile", {Ingredient("marble", 1), Ingredient("cutstone", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_marbletile.tex",
	},
	{"CRAFTING_STATION"}
)

local Chessy 		= AddRecipe2("turf_chess", {Ingredient("marble", 1), Ingredient("turf_rocky", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_chess.tex",
	},
	{"CRAFTING_STATION"}
)

local Slate 		= AddRecipe2("turf_slate", {Ingredient("marble", 1), Ingredient("rocks", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_slate.tex",
	},
	{"CRAFTING_STATION"}
)

local Metalsheet 	= AddRecipe2("turf_metalsheet", {Ingredient("cutstone", 1), Ingredient("rocks", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_metalsheet.tex",
	},
	{"CRAFTING_STATION"}
)

local Gardeny 		= AddRecipe2("turf_garden", {Ingredient("turf_grass", 1), Ingredient("cutstone", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_garden.tex",
	},
	{"CRAFTING_STATION"}
)

local Geometrik 	= AddRecipe2("turf_geometric", {Ingredient("turf_checkerfloor", 1), Ingredient("bluegem", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_geometric.tex",
	},
	{"CRAFTING_STATION"}
)

local Shagcarpet 	= AddRecipe2("turf_shagcarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("silk", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_shagcarpet.tex",
	},
	{"CRAFTING_STATION"}
)

local Transitional 	= AddRecipe2("turf_transitional", {Ingredient("boards", 1), Ingredient("marble", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_transitional.tex",
	},
	{"CRAFTING_STATION"}
)

local Herring 		= AddRecipe2("turf_herring", {Ingredient("turf_rocky", 1), Ingredient("boneshard", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_herring.tex",
	},
	{"CRAFTING_STATION"}
)

local Thexagon 		= AddRecipe2("turf_hexagon", {Ingredient("charcoal", 1), Ingredient("marble", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_hexagon.tex",
	},
	{"CRAFTING_STATION"}
)

local Hoof 			= AddRecipe2("turf_hoof", {Ingredient("cutstone", 1), Ingredient("pigskin", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_hoof.tex",
	},
	{"CRAFTING_STATION"}
)

local Toctagon 		= AddRecipe2("turf_octagon", {Ingredient("charcoal", 1), Ingredient("cutstone", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr 	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_octagon.tex",
	},
	{"CRAFTING_STATION"}
)

local WagpunkFloor  = AddRecipe2("turf_wagpunkfloor", {Ingredient("cutstone", 1), Ingredient("wagpunk_bits", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= true,
		actionstr	= "TERRAFORMER",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= DefaultAtlas3,
		image		= "wagpunk_floor_kit.tex",
	},
	{"CRAFTING_STATION"}
)

else

AddPrototyperDef("kyno_terraformer",
	{
		icon_atlas 			= "images/tabimages/kyno_turfmakertab.xml",
		icon_image 			= "kyno_tab_turfs.tex",
		is_crafting_station = false,
		action_str 			= "TERRAFORMER",
		filter_text 		= _G.STRINGS.TERRAFORMER_FILTER,
	}
)

local Cobbleroad 	= AddRecipe2("turf_cobbleroad", {Ingredient("cutstone", 1), Ingredient("flint", 2)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_cobbleroad.tex",
	},
	{"DECOR"}
)
SortAfter("turf_cobbleroad", "turf_fungus_green", "DECOR")

local Foundation 	= AddRecipe2("turf_foundation", {Ingredient("cutstone", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_foundation.tex",
	},
	{"DECOR"}
)
SortAfter("turf_foundation", "turf_cobbleroad", "DECOR")

local Lawn 			= AddRecipe2("turf_lawn", {Ingredient("cutgrass", 2), Ingredient("nitre", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_lawn.tex",
	},
	{"DECOR"}
)
SortAfter("turf_lawn", "turf_foundation", "DECOR")

local Pigruins 		= AddRecipe2("turf_pigruins", {Ingredient("cutstone", 1), Ingredient("flint", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_pigruins.tex",
	},
	{"DECOR"}
)
SortAfter("turf_pigruins", "turf_lawn", "DECOR")

local Fields 		= AddRecipe2("turf_fields", {Ingredient("turf_rainforest", 1, TurfsAtlas), Ingredient("ash", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_fields.tex",
	},
	{"DECOR"}
)
SortAfter("turf_fields", "turf_pigruins", "DECOR")

local Mossy 		= AddRecipe2("turf_mossy_blossom", {Ingredient("turf_deciduous", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_mossy_blossom.tex",
	},
	{"DECOR"}
)
SortAfter("turf_mossy_blossom", "turf_fields", "DECOR")

local Rainforest 	= AddRecipe2("turf_rainforest", {Ingredient("turf_grass", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_rainforest.tex",
	},
	{"DECOR"}
)
SortAfter("turf_rainforest", "turf_mossy_blossom", "DECOR")

local Deepjungle 	= AddRecipe2("turf_deepjungle", {Ingredient("turf_forest", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_deepjungle.tex",
	},
	{"DECOR"}
)
SortAfter("turf_deepjungle", "turf_rainforest", "DECOR")

local Gasjungle 	= AddRecipe2("turf_gasjungle", {Ingredient("turf_deepjungle", 1, TurfsAtlas), Ingredient("spoiled_food", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_gasjungle.tex",
	},
	{"DECOR"}
)
SortAfter("turf_gasjungle", "turf_deepjungle", "DECOR")

local Plains 		= AddRecipe2("turf_plains", {Ingredient("turf_savanna", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_plains.tex",
	},
	{"DECOR"}
)
SortAfter("turf_plains", "turf_gasjungle", "DECOR")

local Bog 			= AddRecipe2("turf_bog", {Ingredient("turf_desertdirt", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_bog.tex",
	},
	{"DECOR"}
)
SortAfter("turf_bog", "turf_plains", "DECOR")

local Antcave 		= AddRecipe2("turf_antcave", {Ingredient("turf_mud", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_antcave.tex",
	},
	{"DECOR"}
)
SortAfter("turf_antcave", "turf_bog", "DECOR")

local Batcave 		= AddRecipe2("turf_batcave", {Ingredient("turf_cave", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_batcave.tex",
	},
	{"DECOR"}
)
SortAfter("turf_batcave", "turf_antcave", "DECOR")

local Magmafield 	= AddRecipe2("turf_magmafield", {Ingredient("turf_underrock", 1), Ingredient("charcoal", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_magmafield.tex",
	},
	{"DECOR"}
)
SortAfter("turf_magmafield", "turf_batcave", "DECOR")

local Volcano 		= AddRecipe2("turf_volcano", {Ingredient("turf_magmafield", 1, TurfsAtlas), Ingredient("rocks", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_volcano.tex",
	},
	{"DECOR"}
)
SortAfter("turf_volcano", "turf_magmafield", "DECOR")

local Volcanorock 	= AddRecipe2("turf_volcano_rock", {Ingredient("turf_volcano", 1, TurfsAtlas), Ingredient("rocks", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_volcano_rock.tex",
	},
	{"DECOR"}
)
SortAfter("turf_volcano_rock", "turf_volcano", "DECOR")

local Ashy 			= AddRecipe2("turf_ash", {Ingredient("ash", 2)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_ash.tex",
	},
	{"DECOR"}
)
SortAfter("turf_ash", "turf_volcano_rock", "DECOR")

local Beachy 		= AddRecipe2("turf_beach", {Ingredient("turf_desertdirt", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_beach.tex",
	},
	{"DECOR"}
)
SortAfter("turf_beach", "turf_ash", "DECOR")

local Meadow 		= AddRecipe2("turf_meadow", {Ingredient("turf_grass", 1), Ingredient("cutgrass", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_meadow.tex",
	},
	{"DECOR"}
)
SortAfter("turf_meadow", "turf_beach", "DECOR")

local Jungler 		= AddRecipe2("turf_jungle", {Ingredient("turf_forest", 1), Ingredient("twigs", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_jungle.tex",
	},
	{"DECOR"}
)
SortAfter("turf_jungle", "turf_meadow", "DECOR")

local Tidalmarsh 	= AddRecipe2("turf_tidalmarsh", {Ingredient("turf_mud", 1), Ingredient("ice", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_tidalmarsh.tex",
	},
	{"DECOR"}
)
SortAfter("turf_tidalmarsh", "turf_jungle", "DECOR")

local Snakeskin 	= AddRecipe2("turf_snakeskinfloor", {Ingredient("turf_carpetfloor", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_snakeskinfloor.tex",
	},
	{"DECOR"}
)
SortAfter("turf_snakeskinfloor", "turf_tidalmarsh", "DECOR")

local Pinkstone 	= AddRecipe2("turf_pinkstone", {Ingredient("cutstone", 1), Ingredient("flint", 2)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_pinkstone.tex",
	},
	{"DECOR"}
)
SortAfter("turf_pinkstone", "turf_snakeskinfloor", "DECOR")

local Stonecity 	= AddRecipe2("turf_stonecity", {Ingredient("cutstone", 1), Ingredient("flint", 2)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_stonecity.tex",
	},
	{"DECOR"}
)
SortAfter("turf_stonecity", "turf_pinkstone", "DECOR")

local Pinkpark 		= AddRecipe2("turf_pinkpark", {Ingredient("turf_deciduous", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_pinkpark.tex",
	},
	{"DECOR"}
)
SortAfter("turf_pinkpark", "turf_stonecity", "DECOR")

local Greyforest 	= AddRecipe2("turf_greyforest", {Ingredient("turf_forest", 1), Ingredient("twigs", 2)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_greyforest.tex",
	},
	{"DECOR"}
)
SortAfter("turf_greyforest", "turf_pinkpark", "DECOR")

local Soilcarpet 	= AddRecipe2("turf_browncarpet", {Ingredient("poop", 2), Ingredient("seeds", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_browncarpet.tex",
	},
	{"DECOR"}
)
SortAfter("turf_browncarpet", "turf_greyforest", "DECOR")

local Forgerock 	= AddRecipe2("turf_forgerock", {Ingredient("turf_underrock", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_forgerock.tex",
	},
	{"DECOR"}
)
SortAfter("turf_forgerock", "turf_browncarpet", "DECOR")

local Forgeroad 	= AddRecipe2("turf_forgeroad", {Ingredient("turf_forgerock", 1, TurfsAtlas), Ingredient("redgem", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_forgeroad.tex",
	},
	{"DECOR"}
)
SortAfter("turf_forgeroad", "turf_forgerock", "DECOR")

local Legacyforest 	= AddRecipe2("turf_legacyrainforest", {Ingredient("turf_rainforest", 1, TurfsAtlas)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_legacyrainforest.tex",
	},
	{"DECOR"}
)
SortAfter("turf_legacyrainforest", "turf_forgeroad", "DECOR")

local Legacyjungle 	= AddRecipe2("turf_legacydeepjungle", {Ingredient("turf_deepjungle", 1, TurfsAtlas)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_legacydeepjungle.tex",
	},
	{"DECOR"}
)
SortAfter("turf_legacydeepjungle", "turf_legacyrainforest", "DECOR")

local Snowfall 		= AddRecipe2("turf_snowfall", {Ingredient("ice", 2)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_snowfall.tex",
	},
	{"DECOR"}
)
SortAfter("turf_snowfall", "turf_legacydeepjungle", "DECOR")

local Redcarpet 	= AddRecipe2("turf_redcarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("feather_robin", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_redcarpet.tex",
	},
	{"DECOR"}
)
SortAfter("turf_redcarpet", "turf_snowfall", "DECOR")

local Pinkcarpet	= AddRecipe2("turf_pinkcarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("spidergland", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_pinkcarpet.tex",
	},
	{"DECOR"}
)
SortAfter("turf_pinkcarpet", "turf_redcarpet", "DECOR")

local Cyancarpet	= AddRecipe2("turf_cyancarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("cutlichen", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_cyancarpet.tex",
	},
	{"DECOR"}
)
SortAfter("turf_cyancarpet", "turf_pinkcarpet", "DECOR")

local Whitecarpet	= AddRecipe2("turf_whitecarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("silk", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_whitecarpet.tex",
	},
	{"DECOR"}
)
SortAfter("turf_whitecarpet", "turf_cyancarpet", "DECOR")

local Yellowcarpet	= AddRecipe2("turf_yellowcarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("cutgrass", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_yellowcarpet.tex",
	},
	{"DECOR"}
)
SortAfter("turf_yellowcarpet", "turf_whitecarpet", "DECOR")

local Greencarpet	= AddRecipe2("turf_greencarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("succulent_picked", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_greencarpet.tex",
	},
	{"DECOR"}
)
SortAfter("turf_greencarpet", "turf_yellowcarpet", "DECOR")

local Orangecarpet	= AddRecipe2("turf_orangecarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("pumpkin", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_orangecarpet.tex",
	},
	{"DECOR"}
)
SortAfter("turf_orangecarpet", "turf_greencarpet", "DECOR")

local Blueyellow	= AddRecipe2("turf_blueyellow", {Ingredient("turf_carpetfloor", 1), Ingredient("cutgrass", 1), Ingredient("cutlichen", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_blueyellow.tex",
	},
	{"DECOR"}
)
SortAfter("turf_blueyellow", "turf_orangecarpet", "DECOR")

local MCobblestones = AddRecipe2("turf_modern_cobblestones", {Ingredient("turf_road", 1), Ingredient("flint", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_modern_cobblestones.tex",
	},
	{"DECOR"}
)
SortAfter("turf_modern_cobblestones", "turf_blueyellow", "DECOR")

local Copacabana 	= AddRecipe2("turf_copacabana", {Ingredient("charcoal", 1), Ingredient("marble", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_copacabana.tex",
	},
	{"DECOR"}
)
SortAfter("turf_copacabana", "turf_modern_cobblestones", "DECOR")

local Driftwood     = AddRecipe2("turf_driftwoodfloor", {Ingredient("boards", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_driftwoodfloor.tex",
	},
	{"DECOR"}
)
SortAfter("turf_driftwoodfloor", "turf_woodfloor", "DECOR")

local Leakproof 	= AddRecipe2("turf_leakproofcarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("cutlichen", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_leakproofcarpet.tex",
	},
	{"DECOR"}
)
SortAfter("turf_leakproofcarpet", "turf_copacabana", "DECOR")

local Legacybog 	= AddRecipe2("turf_legacybog", {Ingredient("turf_bog", 1, TurfsAtlas), Ingredient("turf_marsh", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_legacybog.tex",
	},
	{"DECOR"}
)
SortAfter("turf_legacybog", "turf_leakproofcarpet", "DECOR")

local Greenmarsh 	= AddRecipe2("turf_greenmarsh", {Ingredient("turf_marsh", 1), Ingredient("turf_grass", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_greenmarsh.tex",
	},
	{"DECOR"}
)
SortAfter("turf_greenmarsh", "turf_legacybog", "DECOR")

local Ivygrass 		= AddRecipe2("turf_ivygrass", {Ingredient("turf_grass", 1), Ingredient("turf_forest", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_ivygrass.tex",
	},
	{"DECOR"}
)
SortAfter("turf_ivygrass", "turf_greenmarsh", "DECOR")

local Swirlgrass 	= AddRecipe2("turf_swirlgrass", {Ingredient("turf_forest", 1), Ingredient("cutgrass", 2)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_swirlgrass.tex",
	},
	{"DECOR"}
)
SortAfter("turf_swirlgrass", "turf_ivygrass", "DECOR")

local Swirlgrass2 	= AddRecipe2("turf_swirlgrassmono", {Ingredient("turf_grass", 1), Ingredient("twigs", 2)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_swirlgrassmono.tex",
	},
	{"DECOR"}
)
SortAfter("turf_swirlgrassmono", "turf_swirlgrass", "DECOR")

local WebbedGround	= AddRecipe2("turf_webcreep", {Ingredient("silk", 3)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_webcreep.tex",
	},
	{"DECOR"}
)
SortAfter("turf_webcreep", "turf_swirlgrassmono", "DECOR")

local VaultMossy	= AddRecipe2("turf_vaultmossy", {Ingredient("thulecite_pieces", 1), Ingredient("moonrocknugget", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_vaultmossy.tex",
	},
	{"DECOR"}
)
SortAfter("turf_vaultmossy", "turf_vault", "DECOR")

local Woodpanel 	= AddRecipe2("turf_woodpanel", {Ingredient("turf_woodfloor", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_woodpanel.tex",
	},
	{"DECOR"}
)
SortAfter("turf_woodpanel", "turf_webcreep", "DECOR")

local Marbletile 	= AddRecipe2("turf_marbletile", {Ingredient("marble", 1), Ingredient("cutstone", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_marbletile.tex",
	},
	{"DECOR"}
)
SortAfter("turf_marbletile", "turf_woodpanel", "DECOR")

local Chessy 		= AddRecipe2("turf_chess", {Ingredient("marble", 1), Ingredient("turf_rocky", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_chess.tex",
	},
	{"DECOR"}
)
SortAfter("turf_chess", "turf_marbletile", "DECOR")

local Slate 		= AddRecipe2("turf_slate", {Ingredient("marble", 1), Ingredient("rocks", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_slate.tex",
	},
	{"DECOR"}
)
SortAfter("turf_slate", "turf_chess", "DECOR")

local Metalsheet 	= AddRecipe2("turf_metalsheet", {Ingredient("cutstone", 1), Ingredient("rocks", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_metalsheet.tex",
	},
	{"DECOR"}
)
SortAfter("turf_metalsheet", "turf_slate", "DECOR")

local Gardeny 		= AddRecipe2("turf_garden", {Ingredient("turf_grass", 1), Ingredient("cutstone", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_garden.tex",
	},
	{"DECOR"}
)
SortAfter("turf_garden", "turf_metalsheet", "DECOR")

local Geometrik 	= AddRecipe2("turf_geometric", {Ingredient("turf_checkerfloor", 1), Ingredient("bluegem", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_geometric.tex",
	},
	{"DECOR"}
)
SortAfter("turf_geometric", "turf_garden", "DECOR")

local Shagcarpet 	= AddRecipe2("turf_shagcarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("silk", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_shagcarpet.tex",
	},
	{"DECOR"}
)
SortAfter("turf_shagcarpet", "turf_geometric", "DECOR")

local Transitional 	= AddRecipe2("turf_transitional", {Ingredient("boards", 1), Ingredient("marble", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_transitional.tex",
	},
	{"DECOR"}
)
SortAfter("turf_transitional", "turf_shagcarpet", "DECOR")

local Herring 		= AddRecipe2("turf_herring", {Ingredient("turf_rocky", 1), Ingredient("boneshard", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_herring.tex",
	},
	{"DECOR"}
)
SortAfter("turf_herring", "turf_transitional", "DECOR")

local Thexagon 		= AddRecipe2("turf_hexagon", {Ingredient("charcoal", 1), Ingredient("marble", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_hexagon.tex",
	},
	{"DECOR"}
)
SortAfter("turf_hexagon", "turf_herring", "DECOR")

local Hoof 			= AddRecipe2("turf_hoof", {Ingredient("cutstone", 1), Ingredient("pigskin", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_hoof.tex",
	},
	{"DECOR"}
)
SortAfter("turf_hoof", "turf_hexagon", "DECOR")

local Toctagon 		= AddRecipe2("turf_octagon", {Ingredient("charcoal", 1), Ingredient("cutstone", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr 	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= TurfsAtlas,
		image		= "turf_octagon.tex",
	},
	{"DECOR"}
)
SortAfter("turf_octagon", "turf_hoof", "DECOR")

local WagpunkFloor  = AddRecipe2("turf_wagpunkfloor", {Ingredient("cutstone", 1), Ingredient("wagpunk_bits", 1)}, TECH.TURFMAKER_ONE,
	{
		nounlock	= false,
		actionstr	= "TERRAFORMER2",
		numtogive	= AMOUNT_GIVEN_MOD,
		atlas		= DefaultAtlas3,
		image		= "wagpunk_floor_kit.tex",
	},
	{"DECOR"}
)
SortAfter("turf_wagpunkfloor", "turf_octagon", "DECOR")
end

-- Base Game Turfs Tweak.
local AMOUNT_GIVEN_NATURAL = GetModConfigData("amount_given2")

local BASE_GAME_TURFS =
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

for k, turf in pairs(BASE_GAME_TURFS) do
	AddRecipePostInit(turf, function(recipe)
		recipe.numtogive = AMOUNT_GIVEN_NATURAL
	end)
end