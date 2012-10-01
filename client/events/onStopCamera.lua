--- onStopCamera event handler
-- Primary used to let the server stop the camera from moving started using the moveCamera function
addEvent("onStopCamera", true)
addEventHandler("onStopCamera", getRootElement(),
	function()
		stopCamera()
	end
)