--- Starts the tutorial for the specified player
-- @param player The player for which the tutorial should start
function startTutorial(player)
	local playerName = getPlayerName(player)
	local ped = createNPC("LC_Drive", playerVariables[playerName].skin, 0, 0, 0, 270, 516)
	local vehicle = getPedOccupiedVehicle(ped)
	setElementInterior(ped, 1)
	setElementInterior(vehicle, 1)
	setElementInterior(player, 1)
	setElementDimension(ped, playerVariables[playerName].userId)
	setElementDimension(vehicle, playerVariables[playerName].userId)
	setElementDimension(player, playerVariables[playerName].userId)
	setElementData(ped, "npcCloneOfPlayer", player, false)
	moveCameraToLocation(player, "lc_drive1", 0)
	moveCameraToLocation(player, "lc_drive2", 13000, "Linear", 3000, 1000)
end