--- Get the object ID of the link ID and type
-- @param linkType The type of the link (e.g. user or group)
-- @param linkId The ID of the link (e.g. userId or groupId)
-- @return The ID of the object or false if not found
function getObjectByLinkId(linkType, linkId)
	if not linkType or not linkId then
		return false
	end
	local mysqlResult = mysqlConnection:query("SELECT `id` FROM `objects` WHERE `linkid` = '" .. tonumber(linkId) .. "' AND `type` = '" .. mysqlConnection:escape_string(linkType) .. "'")
	if not mysqlResult then
		return false
	end
	local row = mysqlResult:fetch_assoc()
	row.id = tonumber(row.id)
	if row.id > 0 then
		return row.id
	end
	return false
end