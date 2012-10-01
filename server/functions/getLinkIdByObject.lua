--- Get the link ID and type of the object
-- @param objectId The ID of the object
-- @return A table containing elements linkId and type or false if not found
function getLinkIdByObject(objectId)
	if not objectId then
		return false
	end
	local mysqlResult = mysqlConnection:query("SELECT `linkId`, `type` FROM `objects` WHERE `id` = '" .. tonumber(objectId) .. "'")
	if not mysqlResult then
		return false
	end
	row = mysqlResult:fetch_assoc()
	row.linkId = tonumber(row.linkId)
	if row.linkId > 0 and #row.type then
		return row
	end
	return false
end