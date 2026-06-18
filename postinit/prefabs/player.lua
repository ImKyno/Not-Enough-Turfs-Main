local _G          = GLOBAL
local WORLD_TILES = _G.WORLD_TILES

local WORLD_TILES_SLOWDOWN_CONFIG =
{
	{ WORLD_TILES.STICKYWEBBING, "TURF1_SLOWDOWN" },
	{ WORLD_TILES.STICKYHONEY,   "TURF2_SLOWDOWN" },
	{ WORLD_TILES.STICKYICKER,   "TURF3_SLOWDOWN" },
}

local CAREFUL_WALKING_TILES = {}

for _, v in ipairs(WORLD_TILES_SLOWDOWN_CONFIG) do
	local tile, config = _G.unpack(v)

	if GetModConfigData(config) ~= false then
		CAREFUL_WALKING_TILES[tile] = true
	end
end

local IMMUNE_CAREFULWALKING_TAGS =
{
	[WORLD_TILES.STICKYWEBBING] =
	{
		spiderwhisperer = true,
	},
}

local function IsImmuneToCarefulWalking(inst, tile)
	local tags = IMMUNE_CAREFULWALKING_TAGS[tile]

	if tags == nil then
		return false
	end

	for tag in pairs(tags) do
		if inst:HasTag(tag) then
			return true
		end
	end

	return false
end

local function CarefulWalkingPostInit(inst)
	local _IsCarefulWalking = inst.IsCarefulWalking

	inst.IsCarefulWalking = function(inst, ...)
		local tile = inst:GetCurrentTileType()

		if CAREFUL_WALKING_TILES[tile] and not IsImmuneToCarefulWalking(inst, tile) then
			return true
		end

		return _IsCarefulWalking ~= nil and _IsCarefulWalking(inst, ...) or false
	end
end

AddPlayerPostInit(CarefulWalkingPostInit)

local WORLD_TILES_TEMPERATURE_CONFIG =
{
	{ WORLD_TILES.SNOWFALL, "TURF1_TEMPERATURE" },
	{ WORLD_TILES.HOTCOAL,  "TURF2_TEMPERATURE" },
}

local TILE_TEMP_MODIFIERS = {}

for _, v in ipairs(WORLD_TILES_TEMPERATURE_CONFIG) do
	local tile, config = _G.unpack(v)
	local modifier = GetModConfigData(config)

	if modifier ~= false and modifier ~= 0 then
		TILE_TEMP_MODIFIERS[tile] = modifier
	end
end

local function TileTemperaturePostInit(inst)
	if not _G.TheWorld.ismastersim then
		return inst
	end

	-- Uhhh dock tiles doesn't get speed boost from tile roadways, have to manually add them...
	if inst.components.locomotor ~= nil then
		inst.components.locomotor:SetFasterOnGroundTile(WORLD_TILES.DOCKS_DRIFTWOOD,    true)
		inst.components.locomotor:SetFasterOnGroundTile(WORLD_TILES.DOCKS_COBBLESTONES, true)
	end

	if inst.components.areaaware ~= nil then
		for tile, modifier in pairs(TILE_TEMP_MODIFIERS) do
			inst.components.areaaware:StartWatchingTile(tile)

			inst:ListenForEvent("on_" .. _G.INVERTED_WORLD_TILES[tile] .. "_tile", function(inst, entered)
				local temperature = inst.components.temperature

				if temperature == nil then
					return
				end

				local key = "tile_temperature_" .. tostring(tile)

				if entered then
					temperature:SetModifier(key, modifier)
				else
					temperature:RemoveModifier(key)
				end
			end)
		end
	end
end

AddPlayerPostInit(TileTemperaturePostInit)