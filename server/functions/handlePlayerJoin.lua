--- Handle the player joining event
-- @param player The player which joined the server
function handlePlayerJoin(player)
	local playerName = getPlayerName(player)
	setElementData(player, "language", readConfig("defaultLanguage"), true)
	setElementData(player, "chatChannel", readConfig("chat.defaultChannel"), false)
	for index, thisPlayer in ipairs(getElementsByType("player")) do
		if thisPlayer ~= player then
			outputChatBox(string.format(translateString(thisPlayer, "%s joined the server"), playerName), thisPlayer, 0, 200, 0, true)
		end
	end
	showPlayerHudComponent(player, "all", false)
	setElementDimension(player, 0)
	setElementInterior(player, 0)
end