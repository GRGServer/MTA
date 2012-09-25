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
end