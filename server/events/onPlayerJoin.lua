--- onPlayerJoin event handler
addEventHandler("onPlayerJoin", getRootElement(),
	function()
		handlePlayerJoin(source) -- handle player joining
	end
)