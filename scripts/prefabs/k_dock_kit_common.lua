local NET_DOCK_KIT_COMMON = {}

NET_DOCK_KIT_COMMON.TYPES =
{
	DRIFTWOOD        =
	{
		tile         = WORLD_TILES.DOCKS_DRIFTWOOD,
		anim         = "kyno_dock_kit_driftwood",
		build        = "kyno_dock_kit_driftwood",
		sound        = "turnoftides/common/together/boat/damage",
		pickupsound  = "wood",
		nameoverride = "DOCK_KIT",
	},

	COBBLESTONES     =
	{
		tile         = WORLD_TILES.DOCKS_COBBLESTONES,
		anim         = "kyno_dock_kit_cobblestones",
		build        = "kyno_dock_kit_cobblestones",
		sound        = "dontstarve/common/place_structure_stone",
		pickupsound  = "rock",
		nameoverride = nil,
	},
}

return NET_DOCK_KIT_COMMON