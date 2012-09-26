--- Handle the player joining event
-- @param player The player which joined the server
function handlePlayerJoin(player)
	local playerName = getPlayerName(player)
	playerVariables[playerName] = {}
	playerVariables[playerName].language = readConfig("defaultlanguage")
	for index,thisPlayer in ipairs(getElementsByType("player")) do
		if (thisPlayer ~= player) then
			outputChatBox(playerName .. " joined the server", thisPlayer, 0, 200, 0, true)
		end
	end
	showPlayerHudComponent(player, "all", false)
	setCameraMatrix(player, 1468.8785400391, -919.25317382813, 100.153465271, 1468.388671875, -918.42474365234, 99.881813049316)
	fadeCamera(player, true, 5)
end