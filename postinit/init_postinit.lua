local _G = GLOBAL

local INIT_POSTINIT_PREFABS =
{
	"turfs",
	"wurt",
}

for _, v in pairs(INIT_POSTINIT_PREFABS) do
	modimport("postinit/prefabs/"..v)
end