addCommandHandler("cmds",
	function(player)
		print("called cmds")
		triggerClientEvent(player, "onShowCommandList", player)
	end
)