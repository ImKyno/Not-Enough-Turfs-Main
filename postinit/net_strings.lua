local _G         = GLOBAL
local STRINGS    = _G.STRINGS
local AllRecipes = _G.AllRecipes

-- Shipwrecked Turfs.
if not _G.NETRecipeAlreadyExists("chiminea", "limestone") and not TUNING.NET_IS_IAS_ENABLED then
    STRINGS.NAMES.TURF_MAGMAFIELD = "Magma Turf"
    STRINGS.RECIPE_DESC.TURF_MAGMAFIELD = "It's filled with magma."

    STRINGS.NAMES.TURF_VOLCANO = "Volcano Turf"
    STRINGS.RECIPE_DESC.TURF_VOLCANO = "Warm to the touch."

    STRINGS.NAMES.TURF_VOLCANO_ROCK = "Volcano Rocky Turf"
    STRINGS.RECIPE_DESC.TURF_VOLCANO_ROCK = "Rock bits from the top of a volcano."

    STRINGS.NAMES.TURF_ASH = "Ashy Turf"
    STRINGS.RECIPE_DESC.TURF_ASH = "Ashes to ashes."

    STRINGS.NAMES.TURF_BEACH = "Beach Turf"
    STRINGS.RECIPE_DESC.TURF_BEACH = "Take a break and enjoy some summer vibes."

    STRINGS.NAMES.TURF_MEADOW = "Meadow Turf"
    STRINGS.RECIPE_DESC.TURF_MEADOW = "Green meadows for a pleasant view."

    STRINGS.NAMES.TURF_JUNGLE = "Jungle Turf"
    STRINGS.RECIPE_DESC.TURF_JUNGLE = "Welcome to the jungle!"

    STRINGS.NAMES.TURF_TIDALMARSH = "Tidal Marsh Turf"
    STRINGS.RECIPE_DESC.TURF_TIDALMARSH = "Flooded swamp grounds."

    STRINGS.NAMES.TURF_SNAKESKINFLOOR = "Snakeskin Rug"
    STRINGS.RECIPE_DESC.TURF_SNAKESKINFLOOR = "Really ties the room together."
end

-- Hamlet Turfs.
if not _G.NETRecipeAlreadyExists("cork_bat", "corkchest") and not TUNING.NET_IS_ABC_ENABLED then
    STRINGS.NAMES.TURF_COBBLEROAD = "Stone Road Turf"
    STRINGS.RECIPE_DESC.TURF_COBBLEROAD = "The life of a thriving village."

    STRINGS.NAMES.TURF_FOUNDATION = "Flat Stone Turf"
    STRINGS.RECIPE_DESC.TURF_FOUNDATION = "The foundation of a solid village."

    STRINGS.NAMES.TURF_LAWN = "Lawn Turf"
    STRINGS.RECIPE_DESC.TURF_LAWN = "Fully tamed grass."

    STRINGS.NAMES.TURF_PIGRUINS = "Ancient Ruins Stonework"
    STRINGS.RECIPE_DESC.TURF_PIGRUINS = "An ancient stone flooring."

    STRINGS.NAMES.TURF_PIGRUINS_BLUE = "Ancient Ruins Blue Stonework"
    STRINGS.RECIPE_DESC.TURF_PIGRUINS_BLUE = "An ancient blue stone flooring."

    STRINGS.NAMES.TURF_FIELDS = "Cultivated Turf"
    STRINGS.RECIPE_DESC.TURF_FIELDS = "A civilized patch of dirt."

    STRINGS.NAMES.TURF_MOSSY_BLOSSOM = "Mossy Turf"
    STRINGS.RECIPE_DESC.TURF_MOSSY_BLOSSOM = "Perfect for planting things."

    STRINGS.NAMES.TURF_RAINFOREST = "Rainforest Turf"
    STRINGS.RECIPE_DESC.TURF_RAINFOREST = "Tropical rainy grounds."

    STRINGS.NAMES.TURF_DEEPJUNGLE = "Dense Turf"
    STRINGS.RECIPE_DESC.TURF_DEEPJUNGLE = "As dense as the jungle can be."

    STRINGS.NAMES.TURF_GASJUNGLE = "Toxic Rainforest Turf"
    STRINGS.RECIPE_DESC.TURF_GASJUNGLE = "There is a deadly venom on it."

    STRINGS.NAMES.TURF_PLAINS = "Wild Plains Turf"
    STRINGS.RECIPE_DESC.TURF_PLAINS = "As wild as it can be."

    STRINGS.NAMES.TURF_BOG = "Painted Sandy Turf"
    STRINGS.RECIPE_DESC.TURF_BOG = "Painted sand for ornamentation."

    STRINGS.NAMES.TURF_ANTCAVE = "Mant Cave Turf"
    STRINGS.RECIPE_DESC.TURF_ANTCAVE = "The pathing of mants."

    STRINGS.NAMES.TURF_BATCAVE = "Batilisk Cave Turf"
    STRINGS.RECIPE_DESC.TURF_BATCAVE = "Smells like nitre."
end