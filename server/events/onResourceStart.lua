﻿-- onResourceStart event handler
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()),
	function()
		-- Init global variables
		languageStrings = {} -- Table used for language strings (One sub table for each translated string)
		playerVariables = {} -- Table used for player specific data like userId or language (One sub table for each player)
		
		configXmlRootNode = xmlLoadFile("shared/config.xml") -- Load shared configuration
		loadLanguageStrings() -- Load language strings
		
		-- Check if the server is running in development mode
		if (isDevMode()) then
			print("Running in development mode")
		else
			print("Running in public mode")
		end
		
		connectMySQL() -- Connect MySQL
		
		-- handle player join for already connected players
		for index,player in ipairs(getElementsByType("player")) do
			handlePlayerJoin(player)
		end
	end
)