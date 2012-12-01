addCommandHandler("maptp",
	function(player, command)
		if not checkPlayerPermission(player, "teleport.map", true) then
			return
		end
		triggerClientEvent(player, "onShowMap", player, "teleport")
	end
)