local _G            = GLOBAL
local require       = _G.require
local WORLD_TILES   = _G.WORLD_TILES
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

AddClassPostConstruct("components/birdspawner", function(self)
	local BIRD_TYPES = UpvalueHacker.GetUpvalue(self.SpawnBird, "PickBird", "BIRD_TYPES")

	-- Shipwrecked Tiles.
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.MAGMAFIELD,       { "toucan", "toucan_chubby"                    })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.VOLCANO,          { "toucan", "toucan_chubby"                    })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.VOLCANO_ROCK,     { "toucan", "toucan_chubby"                    })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.ASH,              { "toucan", "toucan_chubby"                    })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.BEACH,            { "puffin", "toucan", "toucan_chubby"          })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.MEADOW,           { "robin", "toucan", "toucan_chubby"           })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.JUNGLE,           { "robin", "toucan", "toucan_chubby"           })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.TIDALMARSH,       { "robin", "toucan", "toucan_chubby"           })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.SNAKESKINFLOOR,   { "robin", "toucan", "toucan_chubby"           })

	-- Hamlet Tiles.
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.COBBLEROAD,       { "quagmire_pigeon"                            })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.FOUNDATION,       { "quagmire_pigeon"                            })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.LAWN,             { "robin", "quagmire_pigeon"                   })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.PIGRUINS,         { "robin"                                      })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.PIGRUINS_BLUE,    { "robin"                                      })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.FIELDS,           { "robin", "kingfisher"                        })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.MOSSY_BLOSSOM,    { "robin", "quagmire_pigeon"                   })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.RAINFOREST,       { "robin", "kingfisher"                        })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.DEEPJUNGLE,       { "robin", "kingfisher"                        })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.GASJUNGLE,        { "robin", "kingfisher"                        })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.PLAINS,           { "robin", "kingfisher"                        })

	-- Events Tiles.
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.PINKSTONE,        { "quagmire_pigeon"                            })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.STONECITY,        { "quagmire_pigeon"                            })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.PINKPARK,         { "quagmire_pigeon"                            })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.GREYFOREST,       { "quagmire_pigeon"                            })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.BROWNCARPET,      { "robin", "quagmire_pigeon"                   })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.FORGEROCK,        { "robin"                                      })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.FORGEROAD,        { "robin"                                      })

	-- Custom Tiles.
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.LEGACYRAINFOREST, { "robin", "kingfisher", "parrot_blue"         })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.LEGACYDEEPJUNGLE, { "robin", "kingfisher", "parrot_blue"         })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.IVYGRASS,         { "robin"                                      })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.SWIRLGRASS,       { "robin"                                      })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.SWIRLGRASSMONO,   { "robin"                                      })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.SNOWFALL,         { "robin_winter"                               })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.COPACABANA,       { "robin", "puffin", "toucan", "toucan_chubby" })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.DRIFTWOODFLOOR,   { "robin", "puffin", "toucan", "toucan_chubby" })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.CHILLEDFLOOR,     { "robin_winter"                               })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.REDLAWN,          { "robin", "pigeon", "quagmire_pigeon"         })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.BLUELAWN,         { "robin", "pigeon", "quagmire_pigeon"         })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.PURPLERAINFOREST, { "robin", "kingfisher", "parrot_blue"         })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.BLUEPLAINS,       { "robin", "kingfisher", "parrot_blue"         })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.MEADOWYELLOW,     { "robin", "parrot", "toucan", "toucan_chubby" })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.ARIDGRASS,        { "robin"                                      })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.SINKHOLEYELLOW,   { "robin"                                      })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.SINKHOLERED,      { "robin"                                      })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.SINKHOLEBLUE,     { "robin"                                      })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.SINKHOLEPINK,     { "robin"                                      })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.SINKHOLEPURPLE,   { "robin"                                      })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.SAVANNAGREEN,     { "robin"                                      })

	-- Interior Tiles.
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.DRIFTWOODPANEL,   { "robin", "puffin", "toucan", "toucan_chubby" })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.GARDENPATH,       { "robin"                                      })
	AddBirdsToTile(BIRD_TYPES, WORLD_TILES.GARDEN,           { "robin"                                      })
end)