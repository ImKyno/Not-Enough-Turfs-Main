-- Client-side checks for Island Adventures and Above the Couds Mods.
function NETRecipeAlreadyExists(...)
	for _, recipe in ipairs({...}) do
		if AllRecipes[recipe] ~= nil then
			return true
		end
	end

	return false
end

-- Valid tiles for placing docks.
NET_VALID_DOCK_TILES = {}

function NETAddDockTile(tile)
	if tile ~= nil then
		NET_VALID_DOCK_TILES[tile] = true
	end
end

NETAddDockTile(WORLD_TILES.OCEAN_COASTAL)
NETAddDockTile(WORLD_TILES.OCEAN_COASTAL_SHORE)
NETAddDockTile(WORLD_TILES.FARMING_SOIL)
NETAddDockTile(WORLD_TILES.MONKEY_DOCK)
NETAddDockTile(WORLD_TILES.DOCKS_DRIFTWOOD)
NETAddDockTile(WORLD_TILES.DOCKS_COBBLESTONES)

-- Island Adventures Tiles.
if NETRecipeAlreadyExists("chiminea", "limestone") then
	NETAddDockTile(WORLD_TILES.OCEAN_CORAL)
	NETAddDockTile(WORLD_TILES.OCEAN_CORAL_SHORE)
	NETAddDockTile(WORLD_TILES.OCEAN_SHALLOW)
	NETAddDockTile(WORLD_TILES.OCEAN_SHALLOW_SHORE)
	NETAddDockTile(WORLD_TILES.MANGROVE)
	NETAddDockTile(WORLD_TILES.MANGROVE_SHORE)
end

-- Above the Clouds Tiles.
if NETRecipeAlreadyExists("cork_bat", "corkchest") then
	NETAddDockTile(WORLD_TILES.LILYPOND)
	NETAddDockTile(WORLD_TILES.LILYPOND_SHORE)
end