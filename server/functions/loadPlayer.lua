--- Load all player data from the database
-- @param player The player of which the data should be loaded
function loadPlayer(player)
	local playerName = getPlayerName(player)
	local mysqlResult = mysqlConnection:query("SELECT * FROM `users` WHERE `username` = '" .. mysqlConnection:escape_string(playerName) .. "'")
	if (mysqlResult) then
		local row = mysqlResult:fetch_assoc()
		if (row) then
			playerVariables[playerName].userId = row.id
			playerVariables[playerName].language = row.language
			playerVariables[playerName].skin = row.skin
			fadeCamera(player, false, 3)
			setTimer(
				function()
					showPlayerHudComponent(player, "all", true)
					if (tonumber(row.inTutorial) ~= 0) then
						startTutorial(player)
					else
						spawnPlayer(player, row.posX, row.posY, row.posZ, row.angle, row.skin, row.interior)
						setCameraTarget(player)
						fadeCamera(player, true, 3)
					end
				end
			, 4000, 1)
		end
	end
end