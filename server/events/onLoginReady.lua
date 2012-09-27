--- onLoginReady event handler
addEvent("onLoginReady", true)
addEventHandler("onLoginReady", getRootElement(),
	function()
		loadPlayer(source)
	end
)