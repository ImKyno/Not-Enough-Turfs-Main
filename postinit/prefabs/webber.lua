local _G          = GLOBAL
local WORLD_TILES = _G.WORLD_TILES

local function WebberPostinit(inst)
	if not _G.TheWorld.ismastersim then
		return inst
	end

	if inst.components.locomotor ~= nil then
		inst.components.locomotor:SetFasterOnGroundTile(WORLD_TILES.STICKYWEBBING, true)
	end
end

AddPrefabPostInit("webber", WebberPostinit)