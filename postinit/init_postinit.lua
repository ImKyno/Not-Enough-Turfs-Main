local _G = GLOBAL

local INIT_POSTINIT =
{
	"sim",
	"actions",
	"strings",
}

local INIT_POSTINIT_COMPONENTS =
{
	"ambientsound",
	"birdspawner",
	"dockmanager",
	"locomotor",
	"map",
}

local INIT_POSTINIT_PREFABS =
{
	"turfs",
	"dock_kit",
	"player",
	"webber",
	"wurt",
}

local INIT_POSTINIT_STATEGRAPHS =
{
	"monkeyqueen",
}

for _, v in pairs(INIT_POSTINIT) do
	modimport("postinit/net_"..v)
end

for _, v in pairs(INIT_POSTINIT_COMPONENTS) do
	modimport("postinit/components/"..v)
end

for _, v in pairs(INIT_POSTINIT_PREFABS) do
	modimport("postinit/prefabs/"..v)
end

for _, v in pairs(INIT_POSTINIT_STATEGRAPHS) do
	modimport("postinit/stategraphs/SG"..v)
end