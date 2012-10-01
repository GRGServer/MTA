--- Translate the string to the language using language strings
-- @param englishString The original english string
-- @param targetLanguage The name of the target language (en, de, ...)
-- @return The translated string or the english string if the translated string is empty or the target language is not defined
function translateStringToLanguage(englishString, targetLanguage)
	if targetLanguage == nil or targetLanguage == "en" then
		return englishString
	end
	if languageStrings[englishString] == nil or languageStrings[englishString][targetLanguage] == nil then
		return englishString
	end
	return languageStrings[englishString][targetLanguage]
end