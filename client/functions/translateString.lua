--- Translate the string to the language selected by the player
-- @param englishString The original english string
-- @return The translated string or the english string if the translated string is empty or the player has not defined the language
function translateString(englishString)
	return translateStringToLanguage(englishString, getElementData(localPlayer, "language"))
end