--- onMoveCamera event handler
-- Primary used to let the server move the players camera
addEvent("onMoveCamera", true)
addEventHandler("onMoveCamera", getRootElement(),
	function(startPosX, startPosY, startPosZ, startLookX, startLookY, startLookZ, endPosX, endPosY, endPosZ, endLookX, endLookY, endLookZ, time, easingType, fadeInTime, fadeOutTime, extraData)
		if extraData == nil then
			extraData = {}
		end
		extraData.triggeredByServer = true
		moveCamera(startPosX, startPosY, startPosZ, startLookX, startLookY, startLookZ, endPosX, endPosY, endPosZ, endLookX, endLookY, endLookZ, time, easingType, fadeInTime, fadeOutTime, extraData)
	end
)