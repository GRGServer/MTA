--- Stops the camera from moving started using the moveCamera function
-- Note: This will not automatically set the camera back behind the player!
function stopCamera()
	if moveCameraValues ~= nil then
		if moveCameraValues.timer ~= nil then
			killTimer(moveCameraValues.timer)
		end
		if moveCameraValues.fadeOutTimer ~= nil then
			killTimer(moveCameraValues.fadeOutTimer)
		end
		if isElement(moveCameraValues.positionObject) then
			destroyElement(moveCameraValues.positionObject)
		end
		if isElement(moveCameraValues.lookAtObject) then
			destroyElement(moveCameraValues.lookAtObject)
		end
	end
	moveCameraValues = nil
end