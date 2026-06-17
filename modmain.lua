local _G      = GLOBAL
local require = _G.require

require("net_util")

local INIT_STRINGS = 
{
	"strings",
	-- "strings_scrapbook",
}

local INIT_STRINGS_CHARACTERS =
{
	"wilson",
	"willow",
	"wolfgang",
	"wendy",
	"wx78",
	"wickerbottom",
	"woodie",
	"waxwell",
	"wathgrithr",
	"webber",
	"winona",
	"wortox",
	"wormwood",
	"warly",
	"wurt",
	"walter",
	"wanda",
}

for _, v in pairs(INIT_STRINGS) do
	require("strings/net_"..v)
end

for _, v in pairs(INIT_STRINGS_CHARACTERS) do
	require("strings/characters/net_speech_"..v)
end

modimport("main/init_main")
modimport("postinit/init_postinit")

-- Testing Mod Options.
if TUNING.NET_DEBUG_MODE then
	local mod_options = 
	{
		{ name = "AMOUNT_GIVEN",     default = false },
		{ name = "AMOUNT_GIVEN_MOD", default = false },
	}

	for _, option in ipairs(mod_options) do
		local value = GetModConfigData(option.name)
		print(string.format("Not Enough Turfs Mod - Config: %s = %s", option.name, tostring(value)))
	end
end	