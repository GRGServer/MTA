--- onLoginDone
-- Triggered as soon as the player register process has been completed
-- A parameter gets passed to this event saying if the register was successful (true) or not (false)
addEvent("onLoginDone", true)
addEventHandler("onLoginDone", getRootElement(),
	function(successful)
		if (successful) then
			destroyElement(loginWindow)
			guiSetInputEnabled(false)
			showCursor(false)
		else
			createMessageBox(translateString("Login error"), translateString("Login failed!\n\nPlease check your password!"), nil, loginWindow)
		end
	end
)