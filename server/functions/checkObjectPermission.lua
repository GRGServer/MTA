--- Check if the object (Player, group, etc.) has the permission
-- @param objectId The ID of the object which should be checked
-- @param permission The permission which should be checked
-- @return true if the object has the permission, false otherwise
function checkObjectPermission(objectId, permission)
	-- Check if all required parameters are set
	if not objectId or not permission then
		return false
	end
	
	objectId = tonumber(objectId)
	
	-- Check if any directly assigned permission matches
	local permissionParts = split(permission, ".") -- Example: teleport, toCoordinate, self
	local permissionPartLength = #permissionParts
	
	-- Check permissions from child to root (teleport.toCoordinate.self -> teleport.toCoordinate.* -> teleport.* -> *)
	for length = permissionPartLength, 0, -1 do -- Element 0 is the root permission node (*) which is not part of the table
		local permissionString
		if length == 0 then -- We reached element 0 which is not part of the table (Table index starts at 1)
			permissionString = "*" -- This is the root permission node
		else
			permissionString = table.concat(permissionParts, ".")
			if length < permissionPartLength then
				permissionString = permissionString .. ".*"
			end
		end
		local mysqlResult = mysqlConnection:query("SELECT * FROM `permissions` WHERE `objectId` = '" .. objectId .. "' AND `name` = '" .. mysqlConnection:escape_string(permissionString) .. "'")
		if mysqlResult and mysqlResult:num_rows() > 0 then
			return true -- The object has the permission
		end
		table.remove(permissionParts) -- Remove the last permission node
	end
	
	-- Check if the object is member of any group which has the permission
	local mysqlResult = mysqlConnection:query("SELECT `objects`.`id` FROM `groupmembers` LEFT JOIN `objects` ON `objects`.`linkId` = `groupmembers`.`groupId` WHERE `objects`.`type` = 'group' AND `groupmembers`.`objectId` = '" .. objectId .. "'")
	if not mysqlResult then
		return false
	end
	local rows = mysqlResult:num_rows()
	if rows > 0 then
		for rowIndex = 1, rows do
			local row = mysqlResult:fetch_assoc()
			if row and checkObjectPermission(tonumber(row.id), permission) then
				return true
			end
		end
	else
		return false -- The object has not the permission
	end
end