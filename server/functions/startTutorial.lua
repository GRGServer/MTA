--- Starts the tutorial for the specified player
-- @param player The player for which the tutorial should start
function startTutorial(player)
	local playerName = getPlayerName(player)
	spawnPlayer(player, -785.2, 500, 1371.7, 180, playerVariables[playerName].skin, 1)
	setCameraTarget(player)
	fadeCamera(player, true, 2)
	setPedAnimation(player, "ped", "IDLE_chat", -1, true, false, false)
	setPedAnimation(getMapElement("maps/lc_marcos_bistro.map", "bistroMen"), "ped", "IDLE_chat", -1, true, false, false)
end