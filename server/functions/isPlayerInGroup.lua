--- Check if the player is in the group
-- @param player The player which should be checked
-- @param groupId The ID of the group
-- @return true if the player is in the group or any of its child groups, false otherweise
function isPlayerInGroup(player, groupId)
	if not player or not groupId then
		return false
	end
	local userId = getElementData(player, "userId")
	if not userId then
		return false
	end
	local objectId = getObjectByLinkId("user", tonumber(userId))
	if not objectId then
		return false
	end
	return isObjectInGroup(tonumber(objectId), tonumber(groupId))
end