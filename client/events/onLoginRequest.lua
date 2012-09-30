--- onLoginRequest event handler
-- Triggered as soon as the player should login
addEvent("onLoginRequest", true)
addEventHandler("onLoginRequest", getRootElement(),
	function()
		createLoginWindow()
	end
)