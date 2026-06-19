require("net_util")

local DOCK_KIT_COMMON = require("prefabs/k_dock_kit_common")

local assets =
{
	Asset("ANIM", "anim/kyno_dock_kit_driftwood.zip"),
	Asset("ANIM", "anim/kyno_dock_kit_cobblestones.zip"),

	Asset("IMAGE", "images/inventoryimages/net_inventoryimages.tex"),
	Asset("ATLAS", "images/inventoryimages/net_inventoryimages.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/net_inventoryimages.xml", 256),
}

local prefabs =
{
	"gridplacer",
	"dock_damage",
}

local function IsPermanentOrDockFilterFn(tileid)
	if tileid == nil then
		return false
	end

	return IsLandTile(tileid) and (not TileGroupManager:IsTemporaryTile(tileid) or NET_VALID_DOCK_TILES[tileid])
end

local function CLIENT_CanDeployDockKit(inst, pt, mouseover, deployer, rotation)
	local x, y, z = pt:Get()
	local tile = TheWorld.Map:GetTileAtPoint(x, 0, z)

	-- if tile ~= WORLD_TILES.OCEAN_COASTAL_SHORE and tile ~= WORLD_TILES.OCEAN_COASTAL then
	if tile == nil or not NET_VALID_DOCK_TILES[tile] then
		return false
	end

	local tx, ty = TheWorld.Map:GetTileCoordsAtPoint(x, 0, z)
	if not TheWorld.Map:HasAdjacentTileFiltered(tx, ty, IsPermanentOrDockFilterFn) then
		return false
	end

	local center_pt = Vector3(TheWorld.Map:GetTileCenterPoint(tx, ty))
	return TheWorld.Map:CanDeployDockAtPoint(center_pt, inst, mouseover)
end

local function OnDeploy(inst, pt, deployer)
	local tile_type = inst._tile_type
	local dockdata = DOCK_KIT_COMMON.TYPES[tile_type]

	if dockdata == nil then
		return
	end

	if TheWorld.components.dockmanager ~= nil then
		if deployer ~= nil and deployer.SoundEmitter ~= nil then
			deployer.SoundEmitter:PlaySoundWithParams(DOCK_KIT_COMMON.TYPES[tile_type].sound, { intensity = 0.8 })
		end

		TheWorld.components.dockmanager:CreateDockAtPoint(pt.x, pt.y, pt.z, DOCK_KIT_COMMON.TYPES[tile_type].tile)

		-- Since this tile was player-deployed, let's see if it can actually hold its position.
		local dock_unsafe = TheWorld.components.dockmanager:ResolveDockSafetyAtPoint(pt.x, pt.y, pt.z)

		if dock_unsafe and deployer.components.talker ~= nil then
			deployer.components.talker:Say(GetString(deployer, "ANNOUNCE_BOAT_SINK"))
		end
	end

	if inst.components.stackable ~= nil then
		inst.components.stackable:Get():Remove()
	end
end

local function MakeDockKit(tile_type)
	local dockdata = DOCK_KIT_COMMON.TYPES[tile_type]

	local function fn()
		local inst = CreateEntity()

		inst.entity:AddTransform()
		inst.entity:AddAnimState()
		inst.entity:AddSoundEmitter()
		inst.entity:AddNetwork()

		MakeInventoryPhysics(inst)
		MakeInventoryFloatable(inst, "med", 0.2, 0.75)

		inst.AnimState:SetBank(dockdata.anim)
		inst.AnimState:SetBuild(dockdata.build)
		inst.AnimState:PlayAnimation("idle")

		inst:AddTag("groundtile")
		inst:AddTag("deploykititem")
		inst:AddTag("usedeployspacingasoffset")

		inst.pickupsound = dockdata.pickupsound

		inst._custom_candeploy_fn = CLIENT_CanDeployDockKit

		inst.entity:SetPristine()

		if not TheWorld.ismastersim then
			return inst
		end

		inst._tile_type = tile_type

		inst:AddComponent("inventoryitem")

		inst:AddComponent("inspectable")
		inst.components.inspectable.nameoverride = dockdata.nameoverride or nil

		inst:AddComponent("deployable")
		inst.components.deployable:SetDeployMode(DEPLOYMODE.CUSTOM)
		inst.components.deployable:SetUseGridPlacer(true)
		inst.components.deployable.ondeploy = OnDeploy

		inst:AddComponent("stackable")
		inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM

		return inst
	end

	return Prefab("dock_kit_" .. string.lower(tile_type), fn, assets, prefabs)
end

local function MakeDockRegistrator(tile_type)
	local function OnLoadRegistrator(inst, data, newents)
		if data ~= nil and data.undertile ~= nil then
			inst._loaded_undertile = WORLD_TILES[data.undertile]
		end
	end

	local function OnPostPassRegistrator(inst)
		local x, y, z = inst.Transform:GetWorldPosition()

		if TheWorld.components.dockmanager ~= nil then
			TheWorld.components.dockmanager:CreateDockAtPoint(x, y, z, DOCK_KIT_COMMON.TYPES[tile_type].tile)
		end

		if TheWorld.components.undertile ~= nil then
			local tx, ty = TheWorld.Map:GetTileCoordsAtPoint(x, y, z)
			TheWorld.components.undertile:SetTileUnderneath(tx, ty, inst._loaded_undertile)
		end

		inst.persists = false
	end

	local function registratorfn()
		local inst = CreateEntity()

		inst.entity:AddTransform()

		inst:AddTag("CLASSIFIED")

		inst._loaded_undertile = nil
		inst.OnLoad = OnLoadRegistrator

		inst:DoTaskInTime(1 * FRAMES, OnPostPassRegistrator)

		return inst
	end

	return Prefab("dock_tile_registrator_" .. string.lower(tile_type), registratorfn)
end

return MakeDockKit("DRIFTWOOD"),
MakeDockKit("COBBLESTONES"),
MakeDockRegistrator("DRIFTWOOD"),
MakeDockRegistrator("COBBLESTONES")