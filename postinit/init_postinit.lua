local _G = GLOBAL

local INIT_POSTINIT =
{
	"strings",
}

local INIT_POSTINIT_PREFABS =
{
	"turfs",
	"wurt",
}

for _, v in pairs(INIT_POSTINIT) do
	modimport("postinit/net_"..v)
end

for _, v in pairs(INIT_POSTINIT_PREFABS) do
	modimport("postinit/prefabs/"..v)
end