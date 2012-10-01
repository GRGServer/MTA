--- Get the group ID by the name of the group
-- @param name The name of the group
-- @return The ID of the group or false if not found
function getGroupIdByName(name)
	if not name then
		return false
	end
	local mysqlResult = mysqlConnection:query("SELECT `id` FROM `groups` WHERE `name` = '" .. mysqlConnection:escape_string(name) .. "'")
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