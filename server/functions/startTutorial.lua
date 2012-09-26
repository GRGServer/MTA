--- Starts the tutorial for the specified player
-- @param player The player for which the tutorial should start
function startTutorial(player)
	local playerName = getPlayerName(player)
	spawnPlayer(player, -785.2, 500, 1371.7, 180, playerVariables[playerName].skin, 1)
	setCameraTarget(player)
	fadeCamera(player, true, 3)
end