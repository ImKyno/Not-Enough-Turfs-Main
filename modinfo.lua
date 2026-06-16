name                         = "Not Enough Turfs"
version                      = "1.0-B"

description                  =
[[
󰀪 Adds brand new Turfs to craft and use in your world!

󰀌 Mod Version: 1.0-B
󰀧 Update: Returfed
]]

author                       = "Kyno 󰀃"
api_version                  = 10

dst_compatible               = true
all_clients_require_mod      = true
client_only_mod              = false

server_filter_tags           = {"Not Enough Turfs", "NET", "Turfs", "Entertainment", "Kyno"}

icon                         = "ModiconNET.tex"
icon_atlas                   = "ModiconNET.xml"

local NONE_LABEL             = ""
local NONE_OPTIONS           =
{
	{
		description          = "",
		data                 = false
	}
}

local TOGGLE_OPTIONS         =
{
	{
		description          = "Disabled",
		data                 = false
	},
	{
		description          = "Enabled",
		data                 = true
	},
}

local AMOUNT_GIVEN_LABEL     = "Crafting Amount (Vanilla)"
local AMOUNT_GIVEN_MOD_LABEL = "Crafting Amount (Modded)"

local AMOUNT_GIVEN_HOVER     = "Choose the amount given when crafting turfs. (Vanilla Turfs)."
local AMOUNT_GIVEN_MOD_HOVER = "Choose the amount given when crafting turfs. (Modded Turfs)."

local AMOUNT_GIVEN_OPTIONS   =
{
	{
		description          = "1",
		hover                = "One turf for each craft.",
		data                 = 1
	},
	{
		description          = "4",
		hover                = "Four turfs for each craft.",
		data                 = 4
	},
	{
		description          = "8",
		hover                = "Eight turfs for each craft.",
		data                 = 8
	},
	{
		description          = "10",
		hover                = "Ten turfs for each craft.",
		data                 = 10
	},
	{
		description          = "20",
		hover                = "Twenty turfs for each craft.",
		data                 = 20
	}
}

configuration_options        =
{
	{
		name                 = "AMOUNT_GIVEN_VANILLA",
		label                = AMOUNT_GIVEN_LABEL,
		hover                = AMOUNT_GIVEN_HOVER,
		options              = AMOUNT_GIVEN_OPTIONS,
		default              = 4
	},
	{
		name                 = "AMOUNT_GIVEN_MODDED",
		label                = AMOUNT_GIVEN_MOD_LABEL,
		hover                = AMOUNT_GIVEN_MOD_HOVER,
		options              = AMOUNT_GIVEN_OPTIONS,
		default              = 4
	}
}