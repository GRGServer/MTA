--- onPlayerQuit event handler
addEventHandler("onPlayerQuit", getRootElement(),
	function(quitType, reason, responsibleElement)
		local playerName = getPlayerName(source)
		for index, thisPlayer in ipairs(getElementsByType("player")) do
			if thisPlayer ~= source then
				outputChatBox(string.format(translateString(thisPlayer, "%s left the server"), playerName), thisPlayer, 0, 200, 0, true)
			end
		end
	end
)