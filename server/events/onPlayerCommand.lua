--- onPlayerCommand event handler
addEventHandler("onPlayerCommand", getRootElement(),
	function(command)
		if command == "say" then
			return
		end
		print("Player executed: " .. command)
	end
)