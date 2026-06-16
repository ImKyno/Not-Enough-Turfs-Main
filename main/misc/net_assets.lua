local _G              = GLOBAL
local require         = _G.require
local resolvefilepath = _G.resolvefilepath

Assets =
{
	Asset("ANIM", "anim/kyno_turfs_shipwrecked.zip"),
	Asset("ANIM", "anim/kyno_turfs_hamlet.zip"),
	Asset("ANIM", "anim/kyno_turfs_interior.zip"),
	Asset("ANIM", "anim/kyno_turfs_events.zip"),
	Asset("ANIM", "anim/kyno_turfs_custom.zip"),

	Asset("IMAGE", "images/tabimages/net_tabimages.tex"),
	Asset("ATLAS", "images/tabimages/net_tabimages.xml"),

	Asset("IMAGE", "images/minimapimages/net_minimapimages.tex"),
	Asset("ATLAS", "images/minimapimages/net_minimapimages.xml"),

	Asset("IMAGE", "images/inventoryimages/net_inventoryimages.tex"),
	Asset("ATLAS", "images/inventoryimages/net_inventoryimages.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/net_inventoryimages.xml", 256),
}

AddMinimapAtlas("images/minimapimages/net_minimapimages.xml")

local NET_ICONS =
{
	"kyno_terraformer",

	"turf_magmafield",
	"turf_volcano",
	"turf_volcano_rock",
	"turf_ash",
	"turf_beach",
	"turf_meadow",
	"turf_jungle",
	"turf_tidalmarsh",
	"turf_snakeskinfloor",

	"turf_cobbleroad",
	"turf_foundation",
	"turf_lawn",
	"turf_pigruins",
	"turf_fields",
	"turf_mossy_blossom",
	"turf_rainforest",
	"turf_deepjungle",
	"turf_gasjungle",
	"turf_plains",
	"turf_bog",
	"turf_antcave",
	"turf_batcave",

	"turf_pinkstone",
	"turf_stonecity",
	"turf_pinkpark",
	"turf_greyforest",
	"turf_browncarpet",
	"turf_forgerock",
	"turf_forgeroad",

	"turf_legacyrainforest",
	"turf_legacydeepjungle",
	"turf_legacybog",
	"turf_greenmarsh",
	"turf_ivygrass",
	"turf_swirlgrass",
	"turf_swirlgrassmono",
	"turf_snowfall",
	"turf_redcarpet",
	"turf_pinkcarpet",
	"turf_cyancarpet",
	"turf_whitecarpet",
	"turf_yellowcarpet",
	"turf_greencarpet",
	"turf_orangecarpet",
	"turf_blueyellow",
	"turf_leakproofcarpet",
	"turf_modern_cobblestones",
	"turf_copacabana",
	"turf_driftwoodfloor",
	"turf_vaultmossy",
	"turf_chilledfloor",

	"turf_woodpanel",
	"turf_marbletile",
	"turf_chess",
	"turf_slate",
	"turf_metalsheet",
	"turf_garden",
	"turf_geometric",
	"turf_shagcarpet",
	"turf_transitional",
	"turf_herring",
	"turf_hexagon",
	"turf_hoof",
	"turf_octagon",
}

for k, v in pairs(NET_ICONS) do
	RegisterInventoryItemAtlas("images/inventoryimages/net_inventoryimages.xml", v..".tex")
end

-- Hack for mod items not appearing in Mini Signs.
local _GetInventoryItemAtlas = _G.GetInventoryItemAtlas
_G.GetInventoryItemAtlas = function(name, ...)
	local myatlas = resolvefilepath("images/inventoryimages/net_inventoryimages.xml")

	if _G.TheSim:AtlasContains(myatlas, name) then
		return myatlas
	end

	return _GetInventoryItemAtlas(name, ...)
end