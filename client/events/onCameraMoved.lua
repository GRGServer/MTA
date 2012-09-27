--- onCameraMoved event handler
addEvent("onCameraMoved")
addEventHandler("onCameraMoved", getRootElement(),
	function(...)
		if arg[1] ~= nil then
			if arg[1] == "moveCameraToNextGroupLocation" then
				moveCameraToNextGroupLocation(arg[2])
			end
		end
	end
)