-- onClientKickRequest event handler
addEvent("onClientKickRequest", true)
addEventHandler("onClientKickRequest", getRootElement(),
	function()
		print("Player requested kick")
		kickPlayer(source, "Requested by player")
	end
)