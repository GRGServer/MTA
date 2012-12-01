--- onClientResourceStarted event handler
addEvent("onClientResourceStarted", true)
addEventHandler("onClientResourceStarted", getRootElement(),
	function()
		triggerClientEvent(source, "onReceiveCommandList", source, commandTable) -- Send command table to the player
		local playerName = getPlayerName(source) -- Get the player name of which the resource has been started
		registerCheck(source) -- Trigger register check which shows login or register window
	end
)