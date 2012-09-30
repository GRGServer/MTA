--- Check if the specified is already registered
-- This function will either show the register window or the login window to the player
-- @param player The player which should be checked
function registerCheck(player)
	local playerName = getPlayerName(player)
	local mysqlResult = mysqlConnection:query("SELECT `language` FROM `users` WHERE `username` = '" .. mysqlConnection:escape_string(playerName) .. "'")
	if mysqlResult then
		if mysqlResult:num_rows() > 0 then
			local userData = mysqlResult:fetch_assoc()
			
			-- Set basic user data
			setElementData(player, "language", userData.language, true) -- Set the player language
			
			triggerClientEvent(player, "onLoginRequest", player) -- Trigger onLoginRequest on client side and send basic user data
		else
			triggerClientEvent(player, "onRegisterRequest", player) -- Trigger onRegisterRequest on client side and send basic user data
		end
	end
end