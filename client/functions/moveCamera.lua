--- Move the camera to the specific position
-- onCameraMoved will be triggered as soon as the camera has been moved to the target position
-- @param startPosX Start position X-coordinate (Set to nil to use current camera position)
-- @param startPosY Start position Y-coordinate (Set to nil to use current camera position)
-- @param startPosZ Start position Z-coordinate (Set to nil to use current camera position)
-- @param startLookX Start loook at X-coordinate (Set to nil to use current camera look at)
-- @param startLookY Start loook at Y-coordinate (Set to nil to use current camera look at)
-- @param startLookZ Start loook at Z-coordinate (Set to nil to use current camera look at)
-- @param endPosX End position X-coordinate
-- @param endPosY End position Y-coordinate
-- @param endPosZ End position Z-coordinate
-- @param endLookX End loook at X-coordinate
-- @param endLookY End loook at Y-coordinate
-- @param endLookZ End loook at Z-coordinate
-- @param time The time in which the camera should move from the start position to the end position
-- @param easingType Easing function to use (Set to nil to use Linear)
-- @param fadeInTime The time in milliseconds counted from the start how long the screen should take to fade in (Set to nil to disable)
-- @param fadeOutTime The time in milliseconds counted from the end where the screen should fade out (Set to nil to disable)
-- @param extraData Additional data which will be passed to the onCameraMoved event
function moveCamera(startPosX, startPosY, startPosZ, startLookX, startLookY, startLookZ, endPosX, endPosY, endPosZ, endLookX, endLookY, endLookZ, time, easingType, fadeInTime, fadeOutTime, extraData)
	local currentPosX, currentPosY, currentPosZ, currentLookX, currentLookY, currentLookZ = getCameraMatrix() -- Get current camera position and look at
	
	-- Use current position if start position coordinates are nil
	if startPosX == nil or startPosY == nil or startPosZ == nil then
		startPosX = currentPosX
		startPosY = currentPosY
		startPosZ = currentPosZ
	end
	
	-- Use current look at if start look at coordinates are nil
	if startLookX == nil or startLookY == nil or startLookZ == nil then
		startLookX = currentLookX
		startLookY = currentLookY
		startLookZ = currentLookZ
	end
	
	-- Check if the required parameters have been defined
	if endPosX == nil or endPosY == nil or endPosZ == nil or endLookX == nil or endLookY == nil or endLookZ == nil or time == nil then
		error("[moveCamera] Not all required parameters were defined!")
		return
	end
	
	stopCamera() -- Stop the camera if it is curently moving
	moveCameraValues = {}
	
	if fadeInTime then
		fadeCamera(true, fadeInTime / 1000)
	end
	
	-- Create dummy objects
	moveCameraValues.positionObject = createObject(1598, startPosX, startPosY, startPosZ, 0, 0, 0)
	moveCameraValues.lookAtObject = createObject(1598, startLookX, startLookY, startLookZ, 0, 0, 0)
	setElementDimension(moveCameraValues.positionObject, 10000)
	setElementDimension(moveCameraValues.lookAtObject, 10000)
	
	-- Move dummy objects
	moveObject(moveCameraValues.positionObject, time, endPosX, endPosY, endPosZ, 0, 0, 0, easingType or "Linear")
	moveObject(moveCameraValues.lookAtObject, time, endLookX, endLookY, endLookZ, 0, 0, 0, easingType or "Linear")
	
	-- Set timers
	if fadeOutTime then
		moveCameraValues.fadeOutTimer = setTimer(fadeCamera, time - fadeOutTime, 1, false, fadeOutTime / 1000)
	end
	moveCameraValues.timer = setTimer(
		function()
			destroyElement(moveCameraValues.positionObject)
			destroyElement(moveCameraValues.lookAtObject)
			moveCameraValues = nil
			triggerEvent("onCameraMoved", getRootElement(), extraData)
		end
	, time, 1)
end