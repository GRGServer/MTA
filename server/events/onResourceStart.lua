--- onResourceStart event handler
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()),
	function()
		-- Init global variables
		languageStrings = {} -- Table used for language strings (One sub table for each translated string)
		cameraLocationsTable = {} -- Table used for camera locations (One sub table for each location containing camera position and lookat position)
		
		configXmlRootNode = xmlLoadFile("shared/config.xml") -- Load shared configuration
		loadLanguageStrings() -- Load language strings
		loadCameraLocations() -- Load camera locations
		loadNPCTasks() -- Load NPC tasks
		
		-- Check if the server is running in development mode
		if isDevMode() then
			outputServerLog("Running in development mode")
		else
			outputServerLog("Running in public mode")
		end
		
		connectMySQL() -- Connect MySQL
		
		-- Set real time
		local realtime = getRealTime()
		setTime(realtime.hour, realtime.minute)
		setMinuteDuration(60000)
		
		-- handle player join for already connected players
		for index,player in ipairs(getElementsByType("player")) do
			handlePlayerJoin(player)
		end
	end
)