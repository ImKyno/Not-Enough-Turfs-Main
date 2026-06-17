-- Client-side checks for Island Adventures and Above the Couds Mods.
function NETRecipeAlreadyExists(...)
	for _, recipe in ipairs({...}) do
		if AllRecipes[recipe] ~= nil then
			return true
		end
	end

	return false
end