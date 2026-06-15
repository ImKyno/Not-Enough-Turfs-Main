name = "Not Enough Turfs"
version = "3.1-A"
local myupdate = "New Year's Turfs"

description = "󰀪 Adds over 70 brand new Turfs to craft and use in your world!\n\n󰀌 Mod Version: "..version.."\n\󰀧 Update: "..myupdate..""
author = "Kyno"

api_version = 10

dst_compatible = true
all_clients_require_mod = true
client_only_mod = false

server_filter_tags = {"Not Enough Turfs", "NET", "MMT", "Turfs", "Entertainment", "Kyno"}

icon = "ModiconNET.tex"
icon_atlas = "ModiconNET.xml"

configuration_options =
{
    {
        name = "amount_given",
        label = "Craft Amount (Modded)",
        hover = "Choose the amount given when crafting turfs. (Modded Turfs)",
        options =
        {
            {description = "1", 
			hover = "One turf for each craft.",
			data = 1},
            {description = "4", 
			hover = "Four turfs for each craft.",
			data = 4},
			{description = "8", 
			hover = "Eight turfs for each craft.",
			data = 8},
			{description = "10", 
			hover = "Ten turfs for each craft.",
			data = 10},
			{description = "20", 
			hover = "Twenty turfs for each craft.",
			data = 20},
        },
        default = 4,
    },
	{
        name = "amount_given2",
        label = "Craft Amount (Default)",
        hover = "Choose the amount given when crafting turfs. (Base Game Turfs)",
        options =
        {
            {description = "1", 
			hover = "One turf for each craft.",
			data = 1},
            {description = "4", 
			hover = "Four turfs for each craft.",
			data = 4},
			{description = "8", 
			hover = "Eight turfs for each craft.",
			data = 8},
			{description = "10", 
			hover = "Ten turfs for each craft.",
			data = 10},
			{description = "20", 
			hover = "Twenty turfs for each craft.",
			data = 20},
        },
        default = 4,
    },
	--[[
	{
        name = "planting_floor",
        label = "Plant on Turfs",
        hover = "Choose if players can plant things on Modded Turfs.",
        options =
        {
            {description = "No", 
			hover = "Saplings, Bushes, Pinecones etc. Can't be planted on turfs after placed.",
			data = true},
            {description = "Yes", 
			hover = "Saplings, Bushes, Pinecones etc. Can be planted on turfs after placed.",
			data = false},
        },
        default = true,
    },
	]]--
	{
		name = "prototyped_turfs",
		label = "Prototype Turfs",
		hover = "Choose if Turfs can be prototyped and learned forever at The Terraformer.",
		options =
		{
			{description = "No",
			hover = "Players will be not able to prototype and learn turfs from The Terraformer.",
			data = 0},
			{description = "Yes",
			hover = "Players will be able to prototype and learn turfs from The Terraformer.",
			data = 1},
		},
		default = 0,
	},
}
