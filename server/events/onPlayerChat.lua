--- onPlayerChat event handler
addEventHandler("onPlayerChat", getRootElement(),
	function(message, messageType)
		cancelEvent() -- We want to handle chat messages in our own way
		
		local playerName = getPlayerName(source)
		local chatChannel = string.upper(getElementData(source, "chatChannel")) -- Get the current selected chat channel
		
		if messageType == 1 then -- Action message (/me)
			chatChannel = "ACTION" -- An action message is just another chat channel
		elseif messageType == 2 then -- Team message
			chatChannel = "TEAM" -- A team message is just another chat channel
		end
		
		local formatStrings = {}
		formatStrings.channel = chatChannel
		formatStrings.playername = playerName
		formatStrings.message = message
		
		logChatMessage(getElementData(source, "userId"), nil, chatChannel, message) -- Log the message
		
		if chatChannel == "ACTION" then -- Send to all players as action message
			sendFormattedMessage(readConfig("chat.format.action"), formatStrings)
		elseif chatChannel == "ALL" then -- Send to all players
			sendFormattedMessage(readConfig("chat.format.all"), formatStrings)
		elseif chatChannel == "RANGE" then -- Send to all players in range
			local posX, posY, posZ = getElementPosition(source)
			
			local chatSphere = createColSphere(posX, posY, posZ, readConfig("chat.rangeRadius"))
			local playersInRange = getElementsWithinColShape(chatSphere, "player")
			
			destroyElement(chatSphere)
			
			-- Send the message to each player in range
			for index, nearbyPlayer in ipairs(playersInRange) do
				sendFormattedMessage(readConfig("chat.format.range"), formatStrings, nearbyPlayer)
			end
		elseif chatChannel == "TEAM" then -- Send to all players in the same team
			-- Not used yet
		else
			outputDebugString("Invalid chat channel: " .. chatChannel, 1)
		end
	end
)