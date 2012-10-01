--- Check if the object is in the group
-- @param objectId The object which should be checked
-- @param groupId The ID of the group
-- @return true if the object is in the group or any of its child groups, false otherweise
function isObjectInGroup(objectId, groupId)
	if not objectId or not groupId then
		return false
	end
	objectId = tonumber(objectId)
	groupId = tonumber(groupId)
	local mysqlResult = mysqlConnection:query("SELECT `objectId` FROM `groupmembers` WHERE `groupId` = '" .. groupId .. "'")
	if not mysqlResult then
		return false
	end
	local rows = mysqlResult:num_rows()
	if rows > 0 then
		for rowIndex = 1, rows do
			local row = mysqlResult:fetch_assoc()
			row.objectId = tonumber(row.objectId)
			if row.objectId == objectId then
				return true -- The object is in the group
			end
			local objectRow = getLinkIdByObject(row.objectId) -- Table contains linkId (userId or groupId) and type (user or group)
			if objectRow.type == "group" and isObjectInGroup(objectId, objectRow.linkId) then
				return true -- The object is in a parent group
			end
		end
	else
		return false -- The group has no members
	end
end