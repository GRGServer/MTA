--- onCameraMoved event handler
addEvent("onCameraMoved")
addEventHandler("onCameraMoved", getRootElement(),
	function(extraData)
		if extraData == nil then
			return
		end
		if extraData.moveCameraToNextGroupLocation then
			moveCameraToNextGroupLocation(extraData.moveCameraToNextGroupLocation)
		elseif extraData.triggeredByServer then
			triggerServerEvent("onCameraMoved", getRootElement(), extraData)
		end
	end
)