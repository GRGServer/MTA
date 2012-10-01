--- Check if the group has the permission
-- @param groupId The group which should be checked
-- @param permission The permission which should be checked
-- @return true if the group has the permission, false otherwise
function checkGroupPermission(groupId, permission)
	if not groupId or not permission then
		return false
	end
	groupId = tonumber(groupId)
	local objectId = getObjectByLinkId("group", groupId)
	if not objectId then
		return false
	end
	return checkObjectPermission(tonumber(objectId), permission)
end