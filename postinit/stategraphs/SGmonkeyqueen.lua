local _G            = GLOBAL
local require       = _G.require
local UpvalueHacker = require("tools/net_upvaluehacker")

AddStategraphPostInit("monkeyqueen", function(sg)
	local getitem = sg.states.getitem
	local _BLUEPRINT_LOOTS = UpvalueHacker.GetUpvalue(getitem.onenter, "BLUEPRINT_LOOTS")

	if _BLUEPRINT_LOOTS then
		table.insert(_BLUEPRINT_LOOTS, "dock_kit_driftwood_blueprint")
		table.insert(_BLUEPRINT_LOOTS, "dock_kit_cobblestones_blueprint")
	end
end)