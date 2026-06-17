local _G         = GLOBAL
local require    = _G.require
local TechTree   = require("techtree")

-- Mod Tunings.
TUNING.NET_DEBUG_MODE = true

TUNING.NET_IS_HOF_ENABLED = _G.KnownModIndex:IsModEnabled("workshop-2334209327") -- Heap of Foods.
TUNING.NET_IS_ABC_ENABLED = _G.KnownModIndex:IsModEnabled("workshop-3322803908") -- Above the Clouds.
TUNING.NET_IS_IAS_ENABLED = _G.KnownModIndex:IsModEnabled("workshop-1467214795") or _G.KnownModIndex:IsModEnabled("workshop-3435352667") -- Island Adventures.

TUNING.PROTOTYPER_TREES.TURFMAKER     = TechTree.Create({ TURFMAKER = 1 })
TUNING.PROTOTYPER_TREES.TURFMAKER_ONE = TechTree.Create({ TURFMAKER = 1 })
TUNING.PROTOTYPER_TREES.TURFMAKER_TWO = TechTree.Create({ TURFMAKER = 2 })