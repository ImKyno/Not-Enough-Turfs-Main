local _G          = GLOBAL
local WORLD_TILES = _G.WORLD_TILES

local function WurtPostinit(inst)
	if not _G.TheWorld.ismastersim then
		return inst
	end
	
	if inst.components.locomotor ~= nil then
		inst.components.locomotor:SetFasterOnGroundTile(WORLD_TILES.TIDALMARSH, true)
		inst.components.locomotor:SetFasterOnGroundTile(WORLD_TILES.GREENMARSH, true)
	end
end

AddPrefabPostInit("wurt", WurtPostinit)