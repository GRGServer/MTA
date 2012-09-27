﻿--- Handle the player joining event
-- @param player The player which joined the server
function handlePlayerJoin(player)
	local playerName = getPlayerName(player)
	playerVariables[playerName] = {}
	playerVariables[playerName].language = readConfig("defaultlanguage")
	for index, thisPlayer in ipairs(getElementsByType("player")) do
		if thisPlayer ~= player then
			outputChatBox(string.format(translateString(thisPlayer, "%s joined the server"), playerName), thisPlayer, 0, 200, 0, true)
		end
	end
	showPlayerHudComponent(player, "all", false)
end