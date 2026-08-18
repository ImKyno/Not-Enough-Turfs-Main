local _G            = GLOBAL
local require       = _G.require
local WORLD_TILES   = _G.WORLD_TILES
local ENABLE_PIGEON = _G.TUNING.NET_IS_ABC_ENABLED or _G.TUNING.NET_IS_HOF_ENABLED
local UpvalueHacker = require("tools/net_upvaluehacker")

local function AddBirdsToTile(BIRD_TYPES, tile, birds)
	if tile == nil or birds == nil then
		return
	end

	local tilebirds = BIRD_TYPES[tile]

	if tilebirds == nil then
		tilebirds = {}
		BIRD_TYPES[tile] = tilebirds
	end

	for _, bird in ipairs(birds) do
		if _G.Prefabs[bird] ~= nil then
			local exists = false

			for _, existing in ipairs(tilebirds) do
				if existing == bird then
					exists = true
					break
				end
			end

			if not exists then
				table.insert(tilebirds, bird)
			end
		end
	end
end

local function AddBirdsWithPigeon(BIRD_TYPES, tile, birds)
	if ENABLE_PIGEON then
		table.insert(birds, "quagmire_pigeon")
	end

	AddBirdsToTile(BIRD_TYPES, tile, birds)
end

AddClassPostConstruct("components/birdspawner", function(self)
	local BIRD_TYPES = UpvalueHacker.GetUpvalue(self.SpawnBird, "PickBird", "BIRD_TYPES")

	if BIRD_TYPES ~= nil then
		-- Shipwrecked Tiles.
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.MAGMAFIELD,          { "toucan", "toucan_chubby"                    })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.VOLCANO,             { "toucan", "toucan_chubby"                    })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.VOLCANO_ROCK,        { "toucan", "toucan_chubby"                    })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.ASH,                 { "toucan", "toucan_chubby"                    })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.BEACH,               { "puffin", "toucan", "toucan_chubby"          })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.MEADOW,              { "robin", "toucan", "toucan_chubby"           })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.JUNGLE,              { "robin", "toucan", "toucan_chubby"           })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.TIDALMARSH,          { "robin", "toucan", "toucan_chubby"           })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.SNAKESKINFLOOR,      { "robin", "toucan", "toucan_chubby"           })

		-- Hamlet Tiles.
		AddBirdsWithPigeon(BIRD_TYPES, WORLD_TILES.COBBLEROAD,      { "crow"                                       })
		AddBirdsWithPigeon(BIRD_TYPES, WORLD_TILES.FOUNDATION,      { "crow"                                       })
		AddBirdsWithPigeon(BIRD_TYPES, WORLD_TILES.LAWN,            { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.PIGRUINS,            { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.PIGRUINS_BLUE,       { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.FIELDS,              { "robin", "kingfisher"                        })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.MOSSY_BLOSSOM,       { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.RAINFOREST,          { "robin", "kingfisher"                        })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.DEEPJUNGLE,          { "robin", "kingfisher"                        })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.GASJUNGLE,           { "robin", "kingfisher"                        })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.PLAINS,              { "robin", "kingfisher"                        })

		-- Events Tiles.
		AddBirdsWithPigeon(BIRD_TYPES, WORLD_TILES.PINKSTONE,       { "crow"                                       })
		AddBirdsWithPigeon(BIRD_TYPES, WORLD_TILES.STONECITY,       { "crow"                                       })
		AddBirdsWithPigeon(BIRD_TYPES, WORLD_TILES.PINKPARK,        { "robin"                                      })
		AddBirdsWithPigeon(BIRD_TYPES, WORLD_TILES.GREYFOREST,      { "crow"                                       })
		AddBirdsWithPigeon(BIRD_TYPES, WORLD_TILES.BROWNCARPET,     { "crow"                                       })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.FORGEROCK,           { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.FORGEROAD,           { "robin"                                      })

		-- Custom Tiles.
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.LEGACYRAINFOREST,    { "robin", "kingfisher", "parrot_blue"         })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.LEGACYDEEPJUNGLE,    { "robin", "kingfisher", "parrot_blue"         })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.IVYGRASS,            { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.SWIRLGRASS,          { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.SWIRLGRASSMONO,      { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.SNOWFALL,            { "robin_winter"                               })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.COPACABANA,          { "robin", "puffin", "toucan", "toucan_chubby" })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.DRIFTWOODFLOOR,      { "robin", "puffin", "toucan", "toucan_chubby" })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.CHILLEDFLOOR,        { "robin_winter"                               })
		AddBirdsWithPigeon(BIRD_TYPES, WORLD_TILES.REDLAWN,         { "robin"                                      })
		AddBirdsWithPigeon(BIRD_TYPES, WORLD_TILES.BLUELAWN,        { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.PURPLERAINFOREST,    { "robin", "kingfisher", "parrot_blue"         })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.BLUEPLAINS,          { "robin", "kingfisher", "parrot_blue"         })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.MEADOWYELLOW,        { "robin", "parrot", "toucan", "toucan_chubby" })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.ARIDGRASS,           { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.SINKHOLEYELLOW,      { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.SINKHOLERED,         { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.SINKHOLEBLUE,        { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.SINKHOLEPINK,        { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.SINKHOLEPURPLE,      { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.SAVANNAGREEN,        { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.REDGRASS,            { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.PURPLEGRASS,         { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.TURQUOISE_DECIDUOUS, { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.FLOWERCARPET,        { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.FLOWERED,            { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.FLOWERED2,           { "robin"                                      })

		-- Interior Tiles.
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.DRIFTWOODPANEL,      { "robin", "puffin", "toucan", "toucan_chubby" })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.GARDENPATH,          { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.GARDEN,              { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.CLOVERTILES,         { "robin"                                      })
		AddBirdsToTile(BIRD_TYPES, WORLD_TILES.CHECKERMOSAIC,       { "robin"                                      })
	end
end)