-- Scrapbook code done by LeWasp: https://steamcommunity.com/id/mpinheiro19
local _G               = GLOBAL
local require          = _G.require
local ScrapbookPrefabs = require("scrapbook_prefabs")
local ScrapbookData    = require("screens/redux/scrapbookdata")

local NET_SCRAPBOOK_STUFF =
{
	kyno_terraformer =
	{
		name          = "kyno_terraformer",
		type          = "thing",
		subcat        = "craftingstation",
		tex           = "kyno_terraformer.tex",
		prefab        = "kyno_terraformer",
		workable      = "HAMMER",
		bank          = "kyno_terraformer",
		build         = "kyno_terraformer",
		anim          = "idle",
		animoffsetbgy = -50,
		deps          = { "moonrocknugget", "cutstone", "pitchfork", "researchlab2" },
		specialinfo   = "TERRAFORMER",
	},

	dock_kit_driftwood =
	{
		name          = "dock_kit_driftwood",
		speechname    = "turf_type_wood",
		type          = "item",
		subcat        = "modturf",
		tex           = "dock_kit_driftwood.tex",
		prefab        = "dock_kit_driftwood",
		stacksize     = TUNING.STACK_SIZE_MEDITEM,
		bank          = "kyno_dock_kit_driftwood",
		build         = "kyno_dock_kit_driftwood",
		anim          = "idle",
		deps          = { "driftwood_log", "cutstone", "stinger", "palmcone_scale", "monkeyqueen" },
	},

	dock_kit_cobblestones =
	{
		name          = "dock_kit_cobblestones",
		speechname    = "turf_type_road",
		type          = "item",
		subcat        = "modturf",
		tex           = "dock_kit_cobblestones.tex",
		prefab        = "dock_kit_cobblestones",
		stacksize     = TUNING.STACK_SIZE_MEDITEM,
		bank          = "kyno_dock_kit_cobblestones",
		build         = "kyno_dock_kit_cobblestones",
		anim          = "idle",
		deps          = { "boards", "cutstone", "flint", "palmcone_scale", "monkeyqueen" },
	},
}

-- Only add Gunpowder Barrel if it's enabled.
if _G.NETRecipeAlreadyExists("kyno_terraform_barrel_item") then
	NET_SCRAPBOOK_STUFF["kyno_terraform_barrel"] =
	{
		name          = "kyno_terraform_barrel",
		type          = "thing",
		tex           = "kyno_terraform_barrel.tex",
		prefab        = "kyno_terraform_barrel",
		weapondamage  = TUNING.NET_TERRAFORM_BARREL_DAMAGE,
		workable      = "HAMMER",
		pickable      = true,
		burnable      = true,
		bank          = "kyno_terraform_barrel",
		build         = "kyno_terraform_barrel",
		anim          = "idle",
		deps          = { "gunpowder", "boards", "rope", "researchlab2" },
		specialinfo   = "TERRAFORM_BARREL",
	}
end

local NET_SCRAPBOOK_TURFS = {}

local SHIPWRECKED_TURFS =
{
	["turf_magmafield"]          = { tiletype = "ROCKY"  },
	["turf_volcano"]             = { tiletype = "ROCKY"  },
	["turf_volcano_rock"]        = { tiletype = "ROCKY"  },
	["turf_ash"]                 = { tiletype = "SAND"   },
	["turf_beach"]               = { tiletype = "SAND"   },
	["turf_meadow"]              = { tiletype = "GRASS"  },
	["turf_jungle"]              = { tiletype = "FOREST" },
	["turf_tidalmarsh"]          = { tiletype = "MARSH"  },
	["turf_snakeskinfloor"]      = { tiletype = "CARPET" },
}

local HAMLET_TURFS =
{
	["turf_cobbleroad"]          = { tiletype = "ROAD"    },
	["turf_foundation"]          = { tiletype = "STONE"   },
	["turf_lawn"]                = { tiletype = "CARPET"  },
	["turf_pigruins"]            = { tiletype = "ANCIENT" },
	["turf_pigruins_blue"]       = { tiletype = "ANCIENT" },
	["turf_fields"]              = { tiletype = "GRASS"   },
	["turf_mossy_blossom"]       = { tiletype = "SOIL"    },
	["turf_rainforest"]          = { tiletype = "FOREST"  },
	["turf_deepjungle"]          = { tiletype = "FOREST"  },
	["turf_gasjungle"]           = { tiletype = "FOREST"  },
	["turf_plains"]              = { tiletype = "GRASS"   },
	["turf_bog"]                 = { tiletype = "SAND"    },
	["turf_antcave"]             = { tiletype = "CAVE"    },
	["turf_batcave"]             = { tiletype = "CAVE"    },
}

local EVENTS_TURFS =
{
	["turf_pinkstone"]           = { tiletype = "STONE"  },
	["turf_stonecity"]           = { tiletype = "STONE"  },
	["turf_pinkpark"]            = { tiletype = "GRASS"  },
	["turf_greyforest"]          = { tiletype = "FOREST" },
	["turf_browncarpet"]         = { tiletype = "SOIL"   },
	["turf_forgerock"]           = { tiletype = "ROCKY"  },
	["turf_forgeroad"]           = { tiletype = "ROAD"   },
}

local CUSTOM1_TURFS =
{
	["turf_legacyrainforest"]    = { tiletype = "FOREST"  },
	["turf_legacydeepjungle"]    = { tiletype = "FOREST"  },
	["turf_legacybog"]           = { tiletype = "MARSH"   },
	["turf_greenmarsh"]          = { tiletype = "MARSH"   },
	["turf_ivygrass"]            = { tiletype = "GRASS"   },
	["turf_swirlgrass"]          = { tiletype = "GRASS"   },
	["turf_swirlgrassmono"]      = { tiletype = "GRASS"   },
	["turf_snowfall"]            = { tiletype = "SNOW"    },
	["turf_redcarpet"]           = { tiletype = "CARPET"  },
	["turf_pinkcarpet"]          = { tiletype = "CARPET"  },
	["turf_cyancarpet"]          = { tiletype = "CARPET"  },
	["turf_whitecarpet"]         = { tiletype = "CARPET"  },
	["turf_yellowcarpet"]        = { tiletype = "CARPET"  },
	["turf_greencarpet"]         = { tiletype = "CARPET"  },
	["turf_orangecarpet"]        = { tiletype = "CARPET"  },
	["turf_blueyellow"]          = { tiletype = "CARPET"  },
	["turf_leakproofcarpet"]     = { tiletype = "CARPET"  },
	["turf_modern_cobblestones"] = { tiletype = "ROAD"    },
	["turf_copacabana"]          = { tiletype = "MARBLE"  },
	["turf_driftwoodfloor"]      = { tiletype = "WOOD"    },
	["turf_lunarrift"]           = { tiletype = "LUNAR"   },
	["turf_vaultmossy"]          = { tiletype = "ANCIENT" },
	["turf_wagpunkfloor"]        = { tiletype = "WOOD"    },
	["turf_chilledfloor"]        = { tiletype = "FROZEN"  },
}

local CUSTOM2_TURFS =
{
	["turf_circlescarpet"]       = { tiletype = "CARPET"  },
	["turf_moroccarpet"]         = { tiletype = "CARPET"  },
	["turf_whitecracked"]        = { tiletype = "ROCKY"   },
	["turf_coal"]                = { tiletype = "ROCKY"   },
	["turf_hotcoal"]             = { tiletype = "ROCKY"   },
	["turf_livinglog"]           = { tiletype = "WOOD"    },
	["turf_greyroad"]            = { tiletype = "ROAD"    },
	["turf_whitebrick"]          = { tiletype = "ROAD"    },
	["turf_bluelawn"]            = { tiletype = "CARPET"  },
	["turf_redlawn"]             = { tiletype = "CARPET"  },
	["turf_purplerainforest"]    = { tiletype = "FOREST"  },
	["turf_blueplains"]          = { tiletype = "GRASS"   },
	["turf_gloomycarpet"]        = { tiletype = "CARPET"  },
	["turf_upholdercarpet"]      = { tiletype = "CARPET"  },
	["turf_meadowyellow"]        = { tiletype = "GRASS"   },
	["turf_hardwood"]            = { tiletype = "WOOD"    },
	["turf_aridrocky"]           = { tiletype = "ROCKY"   },
	["turf_aridgrass"]           = { tiletype = "GRASS"   },
	["turf_sinkholeyellow"]      = { tiletype = "CAVE"    },
	["turf_sinkholered"]         = { tiletype = "CAVE"    },
	["turf_sinkholeblue"]        = { tiletype = "CAVE"    },
	["turf_sinkholepink"]        = { tiletype = "CAVE"    },
	["turf_sinkholepurple"]      = { tiletype = "CAVE"    },
	["turf_savannagreen"]        = { tiletype = "GRASS"   },
}

local CUSTOM3_TURFS =
{
	["turf_stickywebbing"]       = { tiletype = "WEBBED"  },
	["turf_stickyhoney"]         = { tiletype = "STICKY"  },
	["turf_stickyicker"]         = { tiletype = "STICKY"  },
	["turf_fakedocks"]           = { tiletype = "WOOD"    },
	["turf_fakedocks_driftwood"] = { tiletype = "WOOD"    },
}

local INTERIOR_TURFS =
{
	["turf_woodpanel"]           = { tiletype = "WOOD"    },
	["turf_driftwoodpanel"]      = { tiletype = "WOOD"    },
	["turf_marbletile"]          = { tiletype = "MARBLE"  },
	["turf_chess"]               = { tiletype = "MARBLE"  },
	["turf_slate"]               = { tiletype = "MARBLE"  },
	["turf_metalwood"]           = { tiletype = "METAL"   },
	["turf_metalsheet"]          = { tiletype = "METAL"   },
	["turf_gardenpath"]          = { tiletype = "GARDEN"  },
	["turf_garden"]              = { tiletype = "GARDEN"  },
	["turf_geometric"]           = { tiletype = "MARBLE"  },
	["turf_redgeometric"]        = { tiletype = "MARBLE"  },
	["turf_yellowgeometric"]     = { tiletype = "MARBLE"  },
	["turf_greengeometric"]      = { tiletype = "MARBLE"  },
	["turf_bwgeometric"]         = { tiletype = "MARBLE"  },
	["turf_shagcarpet"]          = { tiletype = "CARPET"  },
	["turf_transitional"]        = { tiletype = "WOOD"    },
	["turf_herring"]             = { tiletype = "STONE"   },
	["turf_hexagon"]             = { tiletype = "MARBLE"  },
	["turf_hoof"]                = { tiletype = "MARBLE"  },
	["turf_octagon"]             = { tiletype = "MARBLE"  },
}

local HOF_TURFS =
{
	["turf_tidalmarsh"]          = { tiletype = "MARSH", bankbuild = "SHIPWRECKED" },
	["turf_fields"]              = { tiletype = "GRASS", bankbuild = "HAMLET"      },
	["turf_stonecity"]           = { tiletype = "STONE", bankbuild = "EVENTS"      },
	["turf_pinkpark"]            = { tiletype = "GRASS", bankbuild = "EVENTS"      },
}

if not _G.NETRecipeAlreadyExists("chiminea", "limestone") then
	for name, data in pairs(SHIPWRECKED_TURFS) do
		NET_SCRAPBOOK_TURFS[name] =
		{
			name        = name,
			speechname  = "turf_type_"..string.lower(data.tiletype),
			type        = "item",
			subcat      = "modturf",
			tex         = name..".tex",
			prefab      = name,
			fueltype    = "BURNABLE",
			fuelvalue   = TUNING.TINY_FUEL,
			stacksize   = TUNING.STACK_SIZE_MEDITEM,
			burnable    = true,
			bank        = "kyno_turfs_shipwrecked",
			build       = "kyno_turfs_shipwrecked",
			anim        = name:gsub("^turf_", ""),
			deps        = { "kyno_terraformer" },
			specialinfo = "TURF",
		}
	end
end

if not _G.NETRecipeAlreadyExists("cork_bat", "corkchest") then
	for name, data in pairs(HAMLET_TURFS) do
		NET_SCRAPBOOK_TURFS[name] =
		{
			name        = name,
			speechname  = "turf_type_"..string.lower(data.tiletype),
			type        = "item",
			subcat      = "modturf",
			tex         = name..".tex",
			prefab      = name,
			fueltype    = "BURNABLE",
			fuelvalue   = TUNING.TINY_FUEL,
			stacksize   = TUNING.STACK_SIZE_MEDITEM,
			burnable    = true,
			bank        = "kyno_turfs_hamlet",
			build       = "kyno_turfs_hamlet",
			anim        = name:gsub("^turf_", ""),
			deps        = { "kyno_terraformer" },
			specialinfo = "TURF",
		}
	end
end

if not _G.NETRecipeAlreadyExists("kyno_mealgrinder", "kyno_dailyrecipe_sign") then
	for name, data in pairs(HOF_TURFS) do
		NET_SCRAPBOOK_TURFS[name] =
		{
			name        = name,
			speechname  = "turf_type_"..string.lower(data.tiletype),
			type        = "item",
			subcat      = "modturf",
			tex         = name..".tex",
			prefab      = name,
			fueltype    = "BURNABLE",
			fuelvalue   = TUNING.TINY_FUEL,
			stacksize   = TUNING.STACK_SIZE_MEDITEM,
			burnable    = true,
			bank        = "kyno_turfs_"..string.lower(data.bankbuild),
			build       = "kyno_turfs_"..string.lower(data.bankbuild),
			anim        = name:gsub("^turf_", ""),
			deps        = { "kyno_terraformer" },
			specialinfo = "TURF",
		}
	end
end

for name, data in pairs(EVENTS_TURFS) do
	NET_SCRAPBOOK_TURFS[name] =
	{
		name        = name,
		speechname  = "turf_type_"..string.lower(data.tiletype),
		type        = "item",
		subcat      = "modturf",
		tex         = name..".tex",
		prefab      = name,
		fueltype    = "BURNABLE",
		fuelvalue   = TUNING.TINY_FUEL,
		stacksize   = TUNING.STACK_SIZE_MEDITEM,
		burnable    = true,
		bank        = "kyno_turfs_events",
		build       = "kyno_turfs_events",
		anim        = name:gsub("^turf_", ""),
		deps        = { "kyno_terraformer" },
		specialinfo = "TURF",
	}
end

for name, data in pairs(CUSTOM1_TURFS) do
	NET_SCRAPBOOK_TURFS[name] =
	{
		name        = name,
		speechname  = "turf_type_"..string.lower(data.tiletype),
		type        = "item",
		subcat      = "modturf",
		tex         = name..".tex",
		prefab      = name,
		fueltype    = "BURNABLE",
		fuelvalue   = TUNING.TINY_FUEL,
		stacksize   = TUNING.STACK_SIZE_MEDITEM,
		burnable    = true,
		bank        = "kyno_turfs_custom",
		build       = "kyno_turfs_custom",
		anim        = name:gsub("^turf_", ""),
		deps        = { "kyno_terraformer" },
		specialinfo = "TURF",
	}
end

for name, data in pairs(CUSTOM2_TURFS) do
	NET_SCRAPBOOK_TURFS[name] =
	{
		name        = name,
		speechname  = "turf_type_"..string.lower(data.tiletype),
		type        = "item",
		subcat      = "modturf",
		tex         = name..".tex",
		prefab      = name,
		fueltype    = "BURNABLE",
		fuelvalue   = TUNING.TINY_FUEL,
		stacksize   = TUNING.STACK_SIZE_MEDITEM,
		burnable    = true,
		bank        = "kyno_turfs_custom2",
		build       = "kyno_turfs_custom2",
		anim        = name:gsub("^turf_", ""),
		deps        = { "kyno_terraformer" },
		specialinfo = "TURF",
	}
end

for name, data in pairs(CUSTOM3_TURFS) do
	NET_SCRAPBOOK_TURFS[name] =
	{
		name        = name,
		speechname  = "turf_type_"..string.lower(data.tiletype),
		type        = "item",
		subcat      = "modturf",
		tex         = name..".tex",
		prefab      = name,
		fueltype    = "BURNABLE",
		fuelvalue   = TUNING.TINY_FUEL,
		stacksize   = TUNING.STACK_SIZE_MEDITEM,
		burnable    = true,
		bank        = "kyno_turfs_custom3",
		build       = "kyno_turfs_custom3",
		anim        = name:gsub("^turf_", ""),
		deps        = { "kyno_terraformer" },
		specialinfo = "TURF",
	}
end

for name, data in pairs(INTERIOR_TURFS) do
	NET_SCRAPBOOK_TURFS[name] =
	{
		name        = name,
		speechname  = "turf_type_"..string.lower(data.tiletype),
		type        = "item",
		subcat      = "modturf",
		tex         = name..".tex",
		prefab      = name,
		fueltype    = "BURNABLE",
		fuelvalue   = TUNING.TINY_FUEL,
		stacksize   = TUNING.STACK_SIZE_MEDITEM,
		burnable    = true,
		bank        = "kyno_turfs_interior",
		build       = "kyno_turfs_interior",
		anim        = name:gsub("^turf_", ""),
		deps        = { "kyno_terraformer" },
		specialinfo = "TURF",
	}
end

-- Incosistencies...
local OVERRIDES_TURFS =
{
	turf_wagpunkfloor =
	{
		bank  = "wagpunk_floor_kit",
		build = "wagpunk_floor_kit",
		anim  = "idle",
	},
}

if GetModConfigData("TURF1_SLOWDOWN") then
	OVERRIDES_TURFS.turf_stickywebbing =
	{
		specialinfo = "TURF_STICKY",
	}
end

if GetModConfigData("TURF2_SLOWDOWN") then
	OVERRIDES_TURFS.turf_stickyhoney =
	{
		specialinfo = "TURF_STICKY",
	}
end

if GetModConfigData("TURF3_SLOWDOWN") then
	OVERRIDES_TURFS.turf_stickyicker =
	{
		specialinfo = "TURF_STICKY",
	}
end

if GetModConfigData("TURF1_TEMPERATURE") then
	OVERRIDES_TURFS.turf_snowfall =
	{
		specialinfo = "TURF_TEMP_DECREASE",
	}
end

if GetModConfigData("TURF2_TEMPERATURE") then
	OVERRIDES_TURFS.turf_hotcoal =
	{
		specialinfo = "TURF_TEMP_INCREASE",
	}
end

for prefab, data in pairs(OVERRIDES_TURFS) do
	if NET_SCRAPBOOK_TURFS[prefab] then
		for k, v in pairs(data) do
			NET_SCRAPBOOK_TURFS[prefab][k] = v
		end
	end
end

-- Register the entries in the Scrapbook.
local function AddExtraScrapBookItem(sbdata, sbprefab, sbtable)
	for k, v in pairs(sbtable) do
		sbprefab[k] = true
		sbdata[k] = v
	end
end

-- Add our entries to the Scrapbook.
AddExtraScrapBookItem(ScrapbookData, ScrapbookPrefabs, NET_SCRAPBOOK_STUFF)
AddExtraScrapBookItem(ScrapbookData, ScrapbookPrefabs, NET_SCRAPBOOK_TURFS)