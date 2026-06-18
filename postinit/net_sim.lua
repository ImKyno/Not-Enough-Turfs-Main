local _G                = GLOBAL
local require           = _G.require
local WORLD_TILES       = _G.WORLD_TILES

local ancienttree_defs  = require("prefabs/ancienttree_defs")
local TREE_DEFS         = ancienttree_defs.TREE_DEFS

local NIGHTVISION_TILES =
{
	"TIDALMARSH",
	"GREENMARSH",
	"PURPLERAINFOREST",
	"SINKHOLEPURPLE",
}

local GEM_TILES         =
{
	"MAGMAFIELD",
	"VOLCANO",
	"VOLCANO_ROCK",
	"ASH",
	"STONECITY",
	"FORGEROCK",
	"COAL",
	"HOTCOAL",
	"ARIDROCKY",
}

local TREE_TILES       =
{
	nightvision        = NIGHTVISION_TILES,
	gem                = GEM_TILES,
}

-- Ancient Trees can grow on these turfs too.
local function AncientTreeSimPostInit()
	for tree_type, tiles in pairs(TREE_TILES) do
		local constraint = TREE_DEFS[tree_type].GROW_CONSTRAINT.TILE

		for _, tile_name in ipairs(tiles) do
			local tile = WORLD_TILES[tile_name]

			if tile ~= nil then
				constraint[tile] = true
			end
		end
	end
end

AddSimPostInit(AncientTreeSimPostInit)