local _G = GLOBAL

local INIT_POSTINIT =
{
	"sim",
	"strings",
}

local INIT_POSTINIT_COMPONENTS =
{
	"birdspawner",
	"locomotor",
}

local INIT_POSTINIT_PREFABS =
{
	"turfs",
	"player",
	"webber",
	"wurt",
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