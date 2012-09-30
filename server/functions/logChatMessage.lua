--- Log the chat message in the database table 'chatogs'
-- @param userId The ID of the user which sent the message
-- @param targetUserId If the message was a private message set this to the user ID of the target player, otherwise set to 0 or nil
-- @param channel The name of the channel to which the message has been sent (e.g. ALL or RANGE)
-- @param message The message
function logChatMessage(userId, targetUserId, channel, message)
	if not targetUserId then
		targetUserId = 0
	end
	userId = tonumber(userId)
	targetUserId = tonumber(targetUserId)
	channel = string.upper(channel)
	mysqlConnection:query("INSERT INTO `chatlog` (`userId`, `targetUserId`, `channel`, `time`, `text`) VALUES('" .. userId .. "', '" .. targetUserId .. "', '" .. mysqlConnection:escape_string(channel) .. "', NOW(), '" .. mysqlConnection:escape_string(message) .. "')")
end