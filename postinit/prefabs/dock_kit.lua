local _G          = GLOBAL
local WORLD_TILES = _G.WORLD_TILES

local DOCK_TILES =
{
	[WORLD_TILES.DOCKS_DRIFTWOOD]    = true,
	[WORLD_TILES.DOCKS_COBBLESTONES] = true,
}

local _CLIENT_CanDeployDockKit = nil
local function CLIENT_CanDeployDockKit(inst, pt, mouseover, deployer, rotation, ...)
	if _CLIENT_CanDeployDockKit(inst, pt, mouseover, deployer, rotation, ...) then
		return true
	end

	local map = _G.TheWorld.Map
	local x, y, z = pt:Get()
	local tile = map:GetTileAtPoint(x, 0, z)

	if tile ~= WORLD_TILES.OCEAN_COASTAL_SHORE and tile ~= WORLD_TILES.OCEAN_COASTAL then
		return false
	end

	local tx, ty = map:GetTileCoordsAtPoint(x, 0, z)
	local founddock = false

	for dx = -1, 1 do
		for dy = -1, 1 do
			if math.abs(dx) + math.abs(dy) == 1 then
				local adjtile = map:GetTile(tx + dx, ty + dy)

				if DOCK_TILES[adjtile] then
					founddock = true
					break
				end
			end
		end

		if founddock then
			break
		end
	end

	if not founddock then
		return false
	end

	local center_pt = _G.Vector3(map:GetTileCenterPoint(tx, ty))
	return map:CanDeployDockAtPoint(center_pt, inst, mouseover)
end

local function DockKitPostInit(inst)
	if not _CLIENT_CanDeployDockKit then
		_CLIENT_CanDeployDockKit = inst._custom_candeploy_fn
	end

	inst._custom_candeploy_fn = CLIENT_CanDeployDockKit
end

AddPrefabPostInit("dock_kit", DockKitPostInit)