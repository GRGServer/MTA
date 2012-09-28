function loadLanguageStrings()
	local xml = xmlLoadFile("shared/languageStrings.xml")
	local stringNodes = xmlNodeGetChildren(xml)
	for stringIndex,stringNode in pairs(stringNodes) do
		local englishString = xmlNodeGetValue(xmlFindChild(stringNode, "en", 0))
		languageStrings[englishString] = {}
		local languageNodes = xmlNodeGetChildren(stringNode)
		for languageIndex,languageNode in pairs(languageNodes) do
			local translationNodeName = xmlNodeGetName(languageNode)
			if (translationNodeName ~= "en") then
				languageStrings[englishString][translationNodeName] = xmlNodeGetValue(languageNode)
			end
		end
	end
	xmlUnloadFile(xml)
end