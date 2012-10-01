--- Load all player data from the database
-- @param player The player of which the data should be loaded
function loadPlayer(player)
	local playerName = getPlayerName(player)
	local mysqlResult = mysqlConnection:query("SELECT * FROM `users` WHERE `username` = '" .. mysqlConnection:escape_string(playerName) .. "'")
	if mysqlResult then
		local row = mysqlResult:fetch_assoc()
		if row then
			setElementData(player, "userId", row.id, false)
			setElementData(player, "language", row.language, true)
			setElementData(player, "chatChannel", row.chatChannel, false)
			setElementData(player, "skin", row.skin, false)
			showPlayerHudComponent(player, "all", true)
			if isPlayerInGroup(player, getGroupIdByName("tutorial")) then
				startTutorial(player)
			else
				spawnPlayer(player, row.posX, row.posY, row.posZ, row.angle, row.skin, row.interior)
				setCameraTarget(player)
				fadeCamera(player, true, 2)
			end
		end
	end
end