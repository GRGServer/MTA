-- onClientResourceStart event handler
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()),
	function()
		-- Init global variables
		languageStrings = {} -- Table used for language strings (One sub table for each translated string)
		
		configXmlRootNode = xmlLoadFile("shared/config.xml") -- Load shared configuration
		loadLanguageStrings() -- Load language strings
		language = readConfig("defaultlanguage") -- Read default language
		triggerServerEvent("onClientResourceStarted", localPlayer) -- Send the "I'm ready" event back to the server
	end
)