--- Starts the tutorial for the specified player
-- @param player The player for which the tutorial should start
function startTutorial(player)
	local playerName = getPlayerName(player)
	spawnPlayer(player, 1.6918, 26.2581, 1199.5938, 0, playerVariables[playerName].skin, 1)
	setCameraTarget(player)
	fadeCamera(player, true, 3)
end