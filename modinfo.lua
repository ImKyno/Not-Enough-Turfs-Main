name                           = "Not Enough Turfs"
version                        = "1.1-B"

description                    =
[[
󰀪 Adds over 100 brand new Turfs to craft and use in your world!

󰀌 Mod Version: 1.1-B
󰀧 Update: Returfed!
]]

author                         = "Kyno 󰀃"
api_version                    = 10
priority                       = -20

dst_compatible                 = true
all_clients_require_mod        = true
client_only_mod                = false

server_filter_tags             = {"Not Enough Turfs", "NET", "Turfs", "Entertainment", "Kyno"}

icon                           = "ModiconNET.tex"
icon_atlas                     = "ModiconNET.xml"

local NONE_LABEL               = ""
local NONE_OPTIONS             =
{
	{
		description            = "",
		data                   = false
	}
}

local GENERAL_LABEL            = "General Options"
local GENERAL_HOVER            = "General options for the entire Mod."

local SEPARATOR_LABEL          = "- - - - - - - - - - - - - -"
local SEPARATOR_HOVER          = "- - - - - - - - - - - - - -"

local MOD_SCRAPBOOK_LABEL      = "Mod Scrapbook"
local MOD_SCRAPBOOK_HOVER      = "Choose if the Mod's contents should be added to the Scrapbook."
local MOD_SCRAPBOOK_OPTIONS    =
{
	{
		description            = "Disabled",
		hover                  = "Default Scrapbook.",
		data                   = false
	},
	{
		description            = "Enabled",
		hover                  = "Mod's contents will be added to the Scrapbook.",
		data                   = true
	}
}

local AMOUNT_GIVEN_LABEL       = "Crafting Amount (Vanilla)"
local AMOUNT_GIVEN_HOVER       = "Choose the amount given when crafting turfs. (Vanilla Turfs)."
local AMOUNT_GIVEN_OPTIONS     =
{
	{
		description            = "4 Units",
		hover                  = "Four turfs for each craft.",
		data                   = 4
	},
	{
		description            = "8 Units",
		hover                  = "Eight turfs for each craft.",
		data                   = 8
	},
	{
		description            = "10 Units",
		hover                  = "Ten turfs for each craft.",
		data                   = 10
	},
	{
		description            = "20 Units",
		hover                  = "Twenty turfs for each craft.",
		data                   = 20
	}
}

local AMOUNT_GIVEN_MOD_LABEL   = "Crafting Amount (Modded)"
local AMOUNT_GIVEN_MOD_HOVER   = "Choose the amount given when crafting turfs. (Modded Turfs)."
local AMOUNT_GIVEN_MOD_OPTIONS =
{
	{
		description            = "4 Units",
		hover                  = "Four turfs for each craft.",
		data                   = 4
	},
	{
		description            = "8 Units",
		hover                  = "Eight turfs for each craft.",
		data                   = 8
	},
	{
		description            = "10 Units",
		hover                  = "Ten turfs for each craft.",
		data                   = 10
	},
	{
		description            = "20 Units",
		hover                  = "Twenty turfs for each craft.",
		data                   = 20
	}
}

local TERRAFORMBARREL_LABEL    = "Gunpowder Barrel"
local TERRAFORMBARREL_HOVER    = "Choose if Gunpowder Barrel can be crafted and used by everyone."
local TERRAFORMBARREL_OPTIONS  =
{
	{
		description            = "Disabled",
		hover                  = "Gunpowder Barrel can't be crafted and used to terraform the world.",
		data                   = false
	},
	{
		description            = "Enabled",
		hover                  = "Gunpowder Barrel can be crafted and used to terraform the world.",
		data                   = true
	}
}

local TURFEFFECTS_LABEL        = "Turf Effects Options"
local TURFEFFECTS_HOVER        = "General options for Turf Effects."

local TURF1_SLOWDOWN_LABEL     = "Sticky Webbing Ground Slowdown"
local TURF1_SLOWDOWN_HOVER     = "Choose if Sticky Webbing Ground can slowdown entities."
local TURF1_SLOWDOWN_OPTIONS   =
{
	{
		description            = "Disabled",
		hover                  = "Sticky Webbing will not have movement speed modifier.",
		data                   = false
	},
	{
		description            = "30% Slowdown",
		hover                  = "Sticky Webbing will reduce movement speed by 30%.",
		data                   = 0.30
	},
	{
		description            = "40% Slowdown",
		hover                  = "Sticky Webbing will reduce movement speed by 40%.",
		data                   = 0.40
	},
	{
		description            = "50% Slowdown",
		hover                  = "Sticky Webbing will reduce movement speed by 50%.",
		data                   = 0.50
	}
}

local TURF2_SLOWDOWN_LABEL     = "Sticky Honey Ground Slowdown"
local TURF2_SLOWDOWN_HOVER     = "Choose if Sticky Honey Ground can slowdown entities."
local TURF2_SLOWDOWN_OPTIONS   =
{
	{
		description            = "Disabled",
		hover                  = "Sticky Honey will not have movement speed modifier.",
		data                   = false
	},
	{
		description            = "30% Slowdown",
		hover                  = "Sticky Honey will reduce movement speed by 30%.",
		data                   = 0.30
	},
	{
		description            = "40% Slowdown",
		hover                  = "Sticky Honey will reduce movement speed by 40%.",
		data                   = 0.40
	},
	{
		description            = "50% Slowdown",
		hover                  = "Sticky Honey will reduce movement speed by 50%.",
		data                   = 0.50
	}
}

local TURF3_SLOWDOWN_LABEL     = "Sticky Icker Ground Slowdown"
local TURF3_SLOWDOWN_HOVER     = "Choose if Sticky Icker Ground can slowdown entities."
local TURF3_SLOWDOWN_OPTIONS   =
{
	{
		description            = "Disabled",
		hover                  = "Sticky Icker will not have movement speed modifier.",
		data                   = false
	},
	{
		description            = "30% Slowdown",
		hover                  = "Sticky Icker will reduce movement speed by 30%.",
		data                   = 0.30
	},
	{
		description            = "40% Slowdown",
		hover                  = "Sticky Icker will reduce movement speed by 40%.",
		data                   = 0.40
	},
	{
		description            = "50% Slowdown",
		hover                  = "Sticky Icker will reduce movement speed by 50%.",
		data                   = 0.50
	}
}

local TURF1_TEMPERATURE_LABEL     = "Snowfallen Ground Temperature"
local TURF1_TEMPERATURE_HOVER     = "Choose if Snowfallen Ground can decrease the player's temperature."
local TURF1_TEMPERATURE_OPTIONS   =
{
	{
		description            = "Disabled",
		hover                  = "Snowfallen Ground will not have temperature modifier.",
		data                   = false
	},
	{
		description            = "-10 Degrees",
		hover                  = "Snowfallen Ground will decrease the temperature by 10 degrees.",
		data                   = -10
	},
	{
		description            = "-20 Degrees",
		hover                  = "Snowfallen Ground will decrease the temperature by 20 degrees.",
		data                   = -20
	},
	{
		description            = "-30 Degrees",
		hover                  = "Snowfallen Ground will decrease the temperature by 30 degrees.",
		data                   = -30
	}
}

local TURF2_TEMPERATURE_LABEL     = "Hot Coals Ground Temperature"
local TURF2_TEMPERATURE_HOVER     = "Choose if Hot Coals Ground can increase the player's temperature."
local TURF2_TEMPERATURE_OPTIONS   =
{
	{
		description            = "Disabled",
		hover                  = "Hot Coals Ground will not have temperature modifier.",
		data                   = false
	},
	{
		description            = "+10 Degrees",
		hover                  = "Hot Coals Ground will increase the temperature by 10 degrees.",
		data                   = 10
	},
	{
		description            = "+20 Degrees",
		hover                  = "Hot Coals Ground will increase the temperature by 20 degrees.",
		data                   = 20
	},
	{
		description            = "+30 Degrees",
		hover                  = "Hot Coals Ground will increase the temperature by 30 degrees.",
		data                   = 30
	}
}

configuration_options          =
{
	{
		name                   = "GENERAL",
		label                  = GENERAL_LABEL,
		hover                  = GENERAL_HOVER,
		options                = NONE_OPTIONS,
		default                = false
	},
	{
		name                   = "MOD_SCRAPBOOK",
		label                  = MOD_SCRAPBOOK_LABEL,
		hover                  = MOD_SCRAPBOOK_HOVER,
		options                = MOD_SCRAPBOOK_OPTIONS,
		default                = true
	},
	{
		name                   = "AMOUNT_GIVEN_VANILLA",
		label                  = AMOUNT_GIVEN_LABEL,
		hover                  = AMOUNT_GIVEN_HOVER,
		options                = AMOUNT_GIVEN_OPTIONS,
		default                = 4
	},
	{
		name                   = "AMOUNT_GIVEN_MODDED",
		label                  = AMOUNT_GIVEN_MOD_LABEL,
		hover                  = AMOUNT_GIVEN_MOD_HOVER,
		options                = AMOUNT_GIVEN_OPTIONS,
		default                = 4
	},
	{
		name                   = "TERRAFORM_BARREL",
		label                  = TERRAFORMBARREL_LABEL,
		hover                  = TERRAFORMBARREL_HOVER,
		options                = TERRAFORMBARREL_OPTIONS,
		default                = false
	},
	{
		name                   = "TURFEFFECTS",
		label                  = TURFEFFECTS_LABEL,
		hover                  = TURFEFFECTS_HOVER,
		options                = NONE_OPTIONS,
		default                = false
	},
	{
		name                   = "TURF1_SLOWDOWN",
		label                  = TURF1_SLOWDOWN_LABEL,
		hover                  = TURF1_SLOWDOWN_HOVER,
		options                = TURF1_SLOWDOWN_OPTIONS,
		default                = false
	},
	{
		name                   = "TURF2_SLOWDOWN",
		label                  = TURF2_SLOWDOWN_LABEL,
		hover                  = TURF2_SLOWDOWN_HOVER,
		options                = TURF2_SLOWDOWN_OPTIONS,
		default                = false
	},
	{
		name                   = "TURF3_SLOWDOWN",
		label                  = TURF3_SLOWDOWN_LABEL,
		hover                  = TURF3_SLOWDOWN_HOVER,
		options                = TURF3_SLOWDOWN_OPTIONS,
		default                = false
	},
	{
		name                   = "SEPARATOR",
		label                  = SEPARATOR_LABEL,
		hover                  = SEPARATOR_HOVER,
		options                = NONE_OPTIONS,
		default                = false
	},
	{
		name                   = "TURF1_TEMPERATURE",
		label                  = TURF1_TEMPERATURE_LABEL,
		hover                  = TURF1_TEMPERATURE_HOVER,
		options                = TURF1_TEMPERATURE_OPTIONS,
		default                = false
	},
	{
		name                   = "TURF2_TEMPERATURE",
		label                  = TURF2_TEMPERATURE_LABEL,
		hover                  = TURF2_TEMPERATURE_HOVER,
		options                = TURF2_TEMPERATURE_OPTIONS,
		default                = false
	},
}