--- Check if the specified is already registered
-- This function will either show the register window or the login window to the player
-- @param player The player which should be checked
function registerCheck(player)
	local playerName = getPlayerName(player)
	local basicUserData = {language = playerVariables[playerName].language}
	local mysqlResult = mysqlConnection:query("SELECT `language` FROM `users` WHERE `username` = '" .. mysqlConnection:escape_string(playerName) .. "'")
	if mysqlResult then
		if mysqlResult:num_rows() > 0 then
			basicUserData = mysqlResult:fetch_assoc() -- Load some basic user data like language
			triggerClientEvent(player, "onLoginRequest", player, basicUserData) -- Trigger onLoginRequest on client side and send basic user data
		else
			triggerClientEvent(player, "onRegisterRequest", player, basicUserData) -- Trigger onRegisterRequest on client side and send basic user data
		end
	end
end