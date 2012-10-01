--- onRegisterDone event handler
-- Triggered as soon as the player register process has been completed
-- A parameter gets passed to this event saying if the register was successful (true) or not (false)
addEvent("onRegisterDone", true)
addEventHandler("onRegisterDone", getRootElement(),
	function(successful)
		if successful then
			destroyElement(registerWindow)
			guiSetInputEnabled(false)
			showCursor(false)
			stopGroupCameraMovements = true
			fadeCamera(false, 2)
			setTimer(
				function()
					stopCamera()
					stopGroupCameraMovements = nil
					triggerServerEvent("onLoginReady", localPlayer)
				end
			, 2000, 1)
		else
			createMessageBox(translateString("Register error"), translateString("Something goes wrong... Try it again."), nil, registerWindow)
		end
	end
)