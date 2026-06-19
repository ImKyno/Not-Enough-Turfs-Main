local _G      = GLOBAL
local ACTIONS = _G.ACTIONS
local STRINGS = _G.STRINGS

-- Don't play the farming music when deploying Gunpowder Barrel.
ACTIONS.DEPLOY_TILEARRIVE.theme_music = nil
ACTIONS.DEPLOY_TILEARRIVE.theme_music_fn = function(act)
	if act.invobject:HasTag("terraform_barrel") then
		return nil
	end

	return "farming"
end

ACTIONS.PICK.stroverridefn = function(act)
	if act.target.prefab == "kyno_terraform_barrel" then
		return string.format(STRINGS.KYNO_TERRAFORM_BARREL_ACTION, act.target:GetBasicDisplayName())
	end
end