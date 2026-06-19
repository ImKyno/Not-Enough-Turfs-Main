local _G               = GLOBAL
local require          = _G.require
local WORLD_TILES      = _G.WORLD_TILES
local UpvalueHacker    = require("tools/net_upvaluehacker")

local CUSTOM_DOCKS     =
{
	[WORLD_TILES.DOCKS_COBBLESTONES] =
	{
		main           = "rocks",
		extra          = "cutstone",
		main_chance    = 0.40,
		extra_chance   = 0.20,
	},

	[WORLD_TILES.DOCKS_DRIFTWOOD] =
	{
		main           = "driftwood_log",
		extra          = "driftwood_log",
		main_chance    = 0.40,
		extra_chance   = 0.20,
	},
}

-- Same as toss_debris from dockmanager.lua
local function TossDebris(prefab, x, z)
	local loot = _G.SpawnPrefab(prefab)

	if loot ~= nil and loot.Physics ~= nil then
		loot.Physics:Teleport(x, 0.1, z)

		local angle = _G.TWOPI * math.random()
		local speed = 2.5 + 2 * math.random()

		loot.Physics:SetVel(speed * math.cos(angle), 10, speed * math.sin(angle))
	end
end

AddComponentPostInit("dockmanager", function(self)
	local _DestroyDockAtPoint = self.DestroyDockAtPoint

	function self:DestroyDockAtPoint(x, y, z, dont_toss_loot)
		local tx, ty   = _G.TheWorld.Map:GetTileCoordsAtPoint(x, y, z)
		local tile     = _G.TheWorld.Map:GetTile(tx, ty)
		local lootdata = CUSTOM_DOCKS[tile]

		if lootdata ~= nil then
			local under_tile = _G.TheWorld.components.undertile:GetTileUnderneath(tx, ty)

			-- We replace the custom docks with regular ones while breaking because the stupid component
			-- is hardcoded and we can't add tiles without hacky methods.
			_G.TheWorld.Map:SetTile(tx, ty, WORLD_TILES.MONKEY_DOCK)
			_G.TheWorld.components.undertile:SetTileUnderneath(tx, ty, under_tile)

			local result = _DestroyDockAtPoint(self, x, y, z, true)

			_G.SpawnPrefab("fx_dock_pop").Transform:SetPosition(x, 0, z)

			if math.random() <= lootdata.main_chance then
				TossDebris(lootdata.main, x, z)
			end

			TossDebris(lootdata.main, x, z)

			if math.random() <= lootdata.extra_chance then
				TossDebris(lootdata.extra, x, z)
			end

			return result
		end

		return _DestroyDockAtPoint(self, x, y, z, dont_toss_loot)
	end
end)