--- onClientKickRequest event handler
addEvent("onClientKickRequest", true)
addEventHandler("onClientKickRequest", getRootElement(),
	function()
		kickPlayer(source, "Requested by player")
	end
)