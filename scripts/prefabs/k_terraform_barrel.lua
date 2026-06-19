require("prefabutil")

local WORLDTILE_DEFS = require("worldtiledefs")

local assets =
{
	Asset("ANIM", "anim/kyno_terraform_barrel.zip"),

	Asset("IMAGE", "images/minimapimages/net_minimapimages.tex"),
	Asset("ATLAS", "images/minimapimages/net_minimapimages.xml"),
}

local assets_item =
{
	Asset("ANIM", "anim/kyno_terraform_barrel.zip"),

	Asset("IMAGE", "images/inventoryimages/net_inventoryimages.tex"),
	Asset("ATLAS", "images/inventoryimages/net_inventoryimages.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/net_inventoryimages.xml", 256),
}

local prefabs =
{
	"dirt_puff",
}

local prefabs_item =
{
	"tile_outline",
	"kyno_terraform_barrel",
	"kyno_terraform_barrel_placer",
}

local function GetTerraformTile()
	if TheWorld:HasTag("cave") then
		return WORLD_TILES.IMPASSABLE
	end

	-- Shipwrecked (Island Adventures).
	if TheWorld:HasTag("island") then
		return WORLD_TILES.OCEAN_SHALLOW
	end

	-- Hamlet (Island Adventures / Above the Clouds).
	if TheWorld:HasTag("porkland") then
		return WORLD_TILES.LILYPOND
	end

	return WORLD_TILES.OCEAN_COASTAL
end

local function OnHammered(inst)
	local x, y, z = inst.Transform:GetWorldPosition()

	local fx = SpawnPrefab("collapse_small")
	fx.Transform:SetPosition(x, y, z)

	if inst.components.lootdropper ~= nil then
		inst.components.lootdropper:DropLoot()
	end

	inst:Remove()
end

local function DoTerraformFX(inst, cx, cy, cz)
	SpawnPrefab("collapse_small").Transform:SetPosition(cx, 0, cz)
	SpawnPrefab("explode_small_slurtlehole").Transform:SetPosition(cx, 0, cz)

	if not TheWorld:HasTag("cave") then
		SpawnPrefab("splash_green").Transform:SetPosition(cx + math.random() + 1, cy, cz + math.random() + 1)
		SpawnPrefab("splash_green").Transform:SetPosition(cx - math.random() - 1, cy, cz + math.random() + 1)
		SpawnPrefab("splash_green").Transform:SetPosition(cx + math.random() + 1, cy, cz - math.random() - 1)
		SpawnPrefab("splash_green").Transform:SetPosition(cx - math.random() - 1, cy, cz - math.random() - 1)
	end
end

local function OnTerraform(inst, pt, old_tile_type, old_tile_turf_prefab)
	local cx, cy, cz = TheWorld.Map:GetTileCenterPoint(pt:Get())
	local tile_x, tile_y = TheWorld.Map:GetTileCoordsAtPoint(cx, cy, cz)

	local new_tile = GetTerraformTile()
	TheWorld.Map:SetTile(tile_x, tile_y, new_tile)

	local turf_prefab = WORLDTILE_DEFS.turf[old_tile_type]

	if turf_prefab ~= nil then
		local turf = SpawnPrefab("turf_"..turf_prefab.name)

		if turf ~= nil then
			LaunchAt(turf, inst, nil, 1, 1)
		end
	end

	DoTerraformFX(inst, cx, cy, cz)
end

-- Case for turfs that can't be dug i.e: WORLD_TILES.DIRT WORLD_TILES.BEACH
local function OnForceTerraform(inst, pt, old_tile_type)
	local cx, cy, cz = TheWorld.Map:GetTileCenterPoint(pt:Get())
	local tile_x, tile_y = TheWorld.Map:GetTileCoordsAtPoint(cx, cy, cz)

	local new_tile = GetTerraformTile()
	TheWorld.Map:SetTile(tile_x, tile_y, new_tile)

	DoTerraformFX(inst, cx, cy, cz)
end

local function OnIgnite(inst)
	inst.SoundEmitter:PlaySound("dontstarve/common/blackpowder_fuse_LP", "hiss")

	if inst.components.pickable ~= nil then
		inst.components.pickable.caninteractwith = false
	end

	DefaultBurnFn(inst)
end

local function OnExtinguish(inst)
	inst.SoundEmitter:KillSound("hiss")

	if inst.components.pickable ~= nil then
		inst.components.pickable.caninteractwith = true
	end

	DefaultExtinguishFn(inst)
end

local function OnExplode(inst)
	inst.SoundEmitter:KillSound("hiss")

	local pt = inst:GetPosition()
	local tile = TheWorld.Map:GetTileAtPoint(pt.x, pt.y, pt.z)

	if tile == WORLD_TILES.DIRT then
		OnForceTerraform(inst, pt, tile)
	elseif TheWorld:HasTag("island") and tile == WORLD_TILES.BEACH then -- Our beach turf can be dug.
		OnForceTerraform(inst, pt, tile)
	else
		if inst.components.terraformer ~= nil then
			inst.components.terraformer:Terraform(inst:GetPosition())
		end
	end
end

local function OnPicked(inst)
	if inst.components.burnable ~= nil and not inst.components.burnable:IsBurning() then
		inst:Remove()
	end
end

-- Item function.
local function OnDeploy(inst, pt, deployer)
	local cx, cy, cz = TheWorld.Map:GetTileCenterPoint(pt:Get())

	local obj = SpawnPrefab("kyno_terraform_barrel")
	obj.Transform:SetPosition(cx, cy, cz)

	if deployer ~= nil and deployer.SoundEmitter ~= nil then
		deployer.SoundEmitter:PlaySound("yotb_2021/common/shrine/place")
	end

	if inst.components.stackable ~= nil then
		inst.components.stackable:Get():Remove()
	end
end

-- Item function.
local function OnCanTerraformTile(inst, pt, mouseover, deployer)
	local x, z = pt.x, pt.z
	local map = TheWorld.Map
	local tile = map:GetTileAtPoint(x, 0, z)

	-- Same bypass as above to place on turfs that can't be dug.
	if tile == WORLD_TILES.DIRT then
		return true
	end

	if TheWorld:HasTag("island") and tile == WORLD_TILES.BEACH then
		return true
	end

	if not map:CanTerraformAtPoint(x, 0, z)
	or tile == WORLD_TILES.FARMING_SOIL
	or tile == WORLD_TILES.MONKEY_DOCK
	or tile == WORLD_TILES.DOCKS_DRIFTWOOD
	or tile == WORLD_TILES.DOCKS_COBBLESTONES then
		return false
	end

	local ents = TheWorld.Map:GetEntitiesOnTileAtPoint(x, 0, z)

	for _, ent in ipairs(ents) do
		if ent ~= inst and ent ~= deployer
		and not (ent:HasTag("NOBLOCK")
		or ent:HasTag("locomotor")
		or ent:HasTag("NOCLICK")
		or ent:HasTag("FX")
		or ent:HasTag("DECOR")) then
			return false
		end
	end

	return true
end

local function PlacerTestFn(player, placer)
	if player ~= nil and player.components.talker ~= nil then
		player.components.talker:Say(GetString(player, "ANNOUNCE_CANTBUILDHERE_THRONE"))
	end
end

local function GetStatus(inst, viewer)
	return (inst.components.burnable ~= nil
	and inst.components.burnable:IsBurning() and "IGNITED") or "GENERIC"
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("kyno_terraform_barrel.tex")

	inst:SetDeploySmartRadius(1)
	MakeObstaclePhysics(inst, 0.5)

	inst.AnimState:SetBank("kyno_terraform_barrel")
	inst.AnimState:SetBuild("kyno_terraform_barrel")
	inst.AnimState:PlayAnimation("idle", true)

	inst:AddTag("explosive")
	inst:AddTag("dockjammer")
	inst:AddTag("scarytoprey")
	inst:AddTag("terraform_barrel")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("inspectable")
	inst.components.inspectable.getstatus = GetStatus

	inst:AddComponent("lootdropper")
	inst.components.lootdropper:SetLoot({"gunpowder", "boards", "rope"})

	inst:AddComponent("terraformer")
	inst.components.terraformer.onterraformfn = OnTerraform
	inst.components.terraformer.plow = false

	inst:AddComponent("pickable")
	inst.components.pickable.picksound = "yotb_2021/common/shrine/place"
	inst.components.pickable:SetUp("kyno_terraform_barrel_item")
	inst.components.pickable.onpickedfn = OnPicked

	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(OnHammered)
	inst.components.workable:SetWorkLeft(TUNING.NET_TERRAFORM_BARREL_WORKLEFT)

	inst:AddComponent("explosive")
	inst.components.explosive:SetOnExplodeFn(OnExplode)
	inst.components.explosive.explosiverange = TUNING.NET_TERRAFORM_BARREL_RANGE
	inst.components.explosive.explosivedamage = TUNING.NET_TERRAFORM_BARREL_DAMAGE
	inst.components.explosive.lightonexplode = false -- Don't burn anything afterwards.

	MakeMediumBurnable(inst, 5 + math.random() * 5)
	MakeSmallPropagator(inst)
	inst.components.burnable:SetOnBurntFn(nil)
	inst.components.burnable:SetOnIgniteFn(OnIgnite)
	inst.components.burnable:SetOnExtinguishFn(OnExtinguish)

	return inst
end

local function itemfn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "med", 0.1, 0.8)

	inst.AnimState:SetBank("kyno_terraform_barrel")
	inst.AnimState:SetBuild("kyno_terraform_barrel")
	inst.AnimState:PlayAnimation("idle", true)

	inst:AddTag("tile_deploy")
	inst:AddTag("usedeploystring")
	inst:AddTag("terraform_barrel")

	inst.scrapbook_proxy = "kyno_terraform_barrel"

	inst.pickupsound = "wood"
	inst._custom_candeploy_fn = OnCanTerraformTile

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("inspectable")
	inst:AddComponent("inventoryitem")

	inst:AddComponent("deployable")
	inst.components.deployable:SetDeployMode(DEPLOYMODE.CUSTOM)
	inst.components.deployable.ondeploy = OnDeploy

	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_LARGEITEM

	MakeHauntableLaunch(inst)

	return inst
end

local function placerfn()
	local inst = CreateEntity()

	inst:AddTag("CLASSIFIED")
	inst:AddTag("NOCLICK")
	inst:AddTag("placer")

	inst.entity:SetCanSleep(false)
	inst.persists = false

	inst.entity:AddTransform()
	inst.entity:AddAnimState()

	inst.AnimState:SetBank("kyno_terraform_barrel")
	inst.AnimState:SetBuild("kyno_terraform_barrel")
	inst.AnimState:PlayAnimation("idle", true)
	inst.AnimState:SetLightOverride(1)

	inst:AddComponent("placer")
	inst.components.placer.snap_to_tile = true

	inst.outline = SpawnPrefab("tile_outline")
	inst.outline.entity:SetParent(inst.entity)

	inst.components.placer:LinkEntity(inst.outline)

	return inst
end

return Prefab("kyno_terraform_barrel", fn, assets, prefabs),
Prefab("kyno_terraform_barrel_item", itemfn, assets_item, prefabs_item),
Prefab("kyno_terraform_barrel_item_placer", placerfn)