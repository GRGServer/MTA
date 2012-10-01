--- Add the object to the group
-- @param groupId The ID of the group
-- @param objectId The ID of the object which should be added as a member to the group
function addObjectToGroup(groupId, objectId)
	if not groupId or not objectId then
		return false
	end
	groupId = tonumber(groupId)
	objectId = tonumber(objectId)
	mysqlConnection:query("INSERT INTO `groupmembers` (`groupId`, `objectId`) VALUES('" .. groupId .. "', '" .. objectId .. "')")
end