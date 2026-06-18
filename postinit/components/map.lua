GLOBAL.setfenv(1, GLOBAL)

local TileGroups       = TileGroups
local TileGroupManager = TileGroupManager
local WORLD_TILES      = WORLD_TILES

require("components/map")

local DOCK_TILES =
{
    [WORLD_TILES.MONKEY_DOCK]        = true,
    [WORLD_TILES.DOCKS_DRIFTWOOD]    = true,
    [WORLD_TILES.DOCKS_COBBLESTONES] = true,
}

local _IsLandTileNoDocksAtPoint = Map.IsLandTileNoDocksAtPoint
function Map:IsLandTileNoDocksAtPoint(x, y, z)
    local tile = self:GetTileAtPoint(x, y, z)

    if DOCK_TILES[tile] then
        return false
    end

    return _IsLandTileNoDocksAtPoint(self, x, y, z)
end

local _IsDockAtPoint = Map.IsDockAtPoint
function Map:IsDockAtPoint(x, y, z)
    local tile = self:GetTileAtPoint(x, y, z)

    if DOCK_TILES[tile] then
        return true
    end

    return _IsDockAtPoint(self, x, y, z)
end

local _IsTileLandNoDocks = Map.IsTileLandNoDocks
function Map:IsTileLandNoDocks(tile)
    if DOCK_TILES[tile] then
        return false
    end

    return _IsTileLandNoDocks(tile)
end