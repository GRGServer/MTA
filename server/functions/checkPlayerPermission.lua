--- Check if the player has the permission
-- @param player The player which should be checked
-- @param permission The permission which should be checked
-- @param showErrorMessage Set to true to show the permission denied error message to the player if the player does not have the permission, otherwise set to false or leave nil
-- @return true if the player has the permission, false otherwise
function checkPlayerPermission(player, permission)
	if player and permission then
		local userId = getElementData(player, "userId")
		if userId then
			local objectId = getObjectByLinkId("user", tonumber(userId))
			if objectId and checkObjectPermission(tonumber(objectId), permission) then
				return true
			end
		end
	end
	if showErrorMessage then
		outputChatBox(translateString(player, "You have not the permission to use this function!"), player)
	end
	return false
end