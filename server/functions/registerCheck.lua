--- Check if the specified is already registered
-- This function will either show the register window or the login window to the player
-- @param player The player which should be checked
function registerCheck(player)
	local playerName = getPlayerName(player)
	local mysqlResult = mysqlConnection:query("SELECT `id` FROM `users` WHERE `username` = '" .. mysqlConnection:escape_string(playerName) .. "'")
	if (mysqlResult) then
		if (mysqlResult:num_rows() > 0) then
			triggerClientEvent(player, "onLoginRequest", getRootElement())
		else
			triggerClientEvent(player, "onRegisterRequest", getRootElement())
		end
	end
end