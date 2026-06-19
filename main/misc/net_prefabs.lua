local _G               = GLOBAL
local TERRAFORM_BARREL = GetModConfigData("TERRAFORM_BARREL")

PrefabFiles =
{
	"k_dock_kits",
	"k_terraformer",
}

if TERRAFORM_BARREL then
	table.insert(PrefabFiles, "k_terraform_barrel")
end