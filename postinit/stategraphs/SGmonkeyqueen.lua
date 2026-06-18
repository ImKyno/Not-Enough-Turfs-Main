local _G            = GLOBAL
local require       = _G.require
local UpvalueHacker = require("tools/net_upvaluehacker")

AddStategraphPostInit("monkeyqueen", function(sg)
	if TUNING.NET_DEBUG_MODE then
		print("Not Enough Turfs Mod - Searching for Monkey Queen Loot Pool...")
		print("Not Enough Turfs Mod - Monkey Queen: state", sg.states["getitem"])
		print("Not Enough Turfs Mod - Monkey Queen: events", sg.states["getitem"].events)
		print("Not Enough Turfs Mod - Monkey Queen: type", type(sg.states["getitem"].events))

		for k,v in pairs(sg.states["getitem"].events) do
			print("KEY =", k)
			print("VALUE =", v)

			if type(v) == "table" then
				print("name =", v.name)
				print("fn =", v.fn)
			end
		end

		local fn = sg.states["getitem"].events.animover.fn
		print("Not Enough Turfs Mod - Monkey Queen: getitem fn", fn)

		local loots = UpvalueHacker.GetUpvalue(fn, "BLUEPRINT_LOOTS")
		print("Not Enough Turfs Mod - Monkey Queen: BLUEPRINT_LOOTS", loots)
	end

	local fn = sg.states["getitem"].events.animover.fn
	local BLUEPRINT_LOOTS = UpvalueHacker.GetUpvalue(fn, "BLUEPRINT_LOOTS")

	if BLUEPRINT_LOOTS then
		table.insert(BLUEPRINT_LOOTS, "dock_kit_driftwood")
		table.insert(BLUEPRINT_LOOTS, "dock_kit_cobblestones")

		if TUNING.NET_DEBUG_MODE then
			print("Not Enough Turfs Mod - Added New blueprints for Monkey Queen Loot Pool.")
		end
	end
end)