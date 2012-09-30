--- onClientResourceStart event handler
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()),
	function()
		-- Init global variables
		languageStrings = {} -- Table used for language strings (One sub table for each translated string)
		cameraLocationsTable = {} -- Table used for camera locations (One sub table for each location containing camera position and lookat position)
		
		configXmlRootNode = xmlLoadFile("shared/config.xml") -- Load shared configuration
		loadLanguageStrings() -- Load language strings
		
		loadCameraLocations() -- Load camera locations
		triggerServerEvent("onClientResourceStarted", localPlayer) -- Send the "I'm ready" event back to the server
		
		-- Random camera movements while login/register
		local locationGroups = {}
		local groups = xmlNodeGetChildren(xmlFindChild(configXmlRootNode, "logincameramovements", 0))
		for groupIndex, groupNode in pairs(groups) do
			locationGroups[groupIndex] = {}
			local locations = xmlNodeGetChildren(groupNode)
			for locationIndex, locationNode in pairs(locations) do
				table.insert(locationGroups[groupIndex], {name = xmlNodeGetValue(locationNode), time = xmlNodeGetAttribute(locationNode, "time"), easingType = xmlNodeGetAttribute(locationNode, "easingType")})
			end
		end
		moveCameraToNextGroupLocation(locationGroups, {loginRegisterMovements = true})
	end
)