local _G          = GLOBAL
local WORLD_TILES = _G.WORLD_TILES
local KEY         = "NET_TURF_SLOWDOWN"

-- Tags that are ignored by the slowdown.
local IGNORE_SLOWDOWN_TAGS =
{
	FX          = true,
	DECOR       = true,
	outofreach  = true,
	playerghost = true,
	flying      = true,
	invisible   = true,
	nohit       = true,
	noattack    = true,
}

-- Tags that are less affected by the slowdown.
local REDUCED_SLOWDOWN_TAGS =
{
	epic      = TUNING.NET_WORLD_TILES_SLOWDOWN_MULT_SMALL, -- Bosses only receive 50% of the slowdown.
	smallepic = TUNING.NET_WORLD_TILES_SLOWDOWN_MULT_LARGE, -- Mini Bosses receive 75% of the slowdown.
}

-- Tags that are immune by the slowdown. (Tile specific).
local IMMUNE_SLOWDOWN_TAGS =
{
	[WORLD_TILES.STICKYWEBBING] =
	{
		spider          = true,
		spiderwhisperer = true,
		shadowminion    = true,
		shadowcreature  = true,
	},

	[WORLD_TILES.STICKYHONEY] =
	{
		shadowminion    = true,
		shadowcreature  = true,
	},

	[WORLD_TILES.STICKYICKER] =
	{
		shadowminion    = true,
		shadowcreature  = true,
	},
}

local WORLD_TILES_CONFIG =
{
	{ WORLD_TILES.STICKYWEBBING, "TURF1_SLOWDOWN" },
	{ WORLD_TILES.STICKYHONEY,   "TURF2_SLOWDOWN" },
	{ WORLD_TILES.STICKYICKER,   "TURF3_SLOWDOWN" },
}

local SLOWDOWN_WORLD_TILES = {}

for _, v in ipairs(WORLD_TILES_CONFIG) do
	local tile, config = _G.unpack(v)
	local slowdown = GetModConfigData(config)

	if tile ~= nil and slowdown ~= false then
		SLOWDOWN_WORLD_TILES[tile] = 1 - slowdown
	end
end

local function GetSlowdownMultiplier(inst, mult)
	for tag in pairs(IGNORE_SLOWDOWN_TAGS) do
		if inst:HasTag(tag) then
			return nil
		end
	end

	for tag, reduction in pairs(REDUCED_SLOWDOWN_TAGS) do
		if inst:HasTag(tag) then
			local slowdown = 1 - mult

			slowdown = slowdown * reduction

			return 1 - slowdown
		end
	end

	return mult
end

local function IsImmuneToTileSlowdown(inst, tile)
	local tags = IMMUNE_SLOWDOWN_TAGS[tile]

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

AddComponentPostInit("locomotor", function(inst)
	local _UpdateGroundSpeedMultiplier = inst.UpdateGroundSpeedMultiplier
	
	inst.UpdateGroundSpeedMultiplier = function(self)
		if _UpdateGroundSpeedMultiplier ~= nil then
			_UpdateGroundSpeedMultiplier(self)
		end

		local x, y, z = self.inst.Transform:GetWorldPosition()
		local tile = _G.TheWorld.Map:GetTileAtPoint(x, y, z)
		local mult = SLOWDOWN_WORLD_TILES[tile]

		if mult == nil or IsImmuneToTileSlowdown(self.inst, tile) then
			self:RemoveExternalSpeedMultiplier(_G.TheWorld, KEY)
			return
		end

		mult = GetSlowdownMultiplier(self.inst, mult)

		if mult ~= nil then
			self:SetExternalSpeedMultiplier(_G.TheWorld, KEY, mult)
		else
			self:RemoveExternalSpeedMultiplier(_G.TheWorld, KEY)
		end
	end
end)