--- onRegisterDone
-- Triggered as soon as the player register process has been completed
-- A parameter gets passed to this event saying if the register was successful (true) or not (false)
addEvent("onRegisterDone", true)
addEventHandler("onRegisterDone", getRootElement(),
	function(successful)
		if (successful) then
			destroyElement(registerWindow)
			guiSetInputEnabled(false)
			showCursor(false)
		else
			createMessageBox(translateString("Register error"), translateString("Something goes wrong... Try it again."), nil, registerWindow)
		end
	end
)