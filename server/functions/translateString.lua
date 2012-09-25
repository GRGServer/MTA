--- Translate the string to the language selected by the player
-- @param player The player which should be used to select the language
-- @param englishString The original english string
-- @return The translated string or the english string if the translated string is empty or the player has not defined the language
function translateString(player, englishString)
	local playerName = getPlayerName(player)
	return translateStringToLanguage(englishString, playerVariables[playerName].language)
end