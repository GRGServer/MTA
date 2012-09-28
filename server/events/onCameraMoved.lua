--- onCameraMoved
-- Triggered by the client once the camera movement finished (Only if triggered by the server)
addEvent("onCameraMoved", true)
addEventHandler("onCameraMoved", getRootElement(),
	function(extraData)
		local player = source
		if extraData then
			if extraData.moveCameraToLocation == "lc_drive2" then
				moveCameraToLocation(player, "lc_walktobistro1", 0)
				moveCameraToLocation(player, "lc_walktobistro2", 37000, "Linear", 5000, 1000)
			end
		end
	end
)