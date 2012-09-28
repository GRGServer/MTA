--- Move the players camera to a location
-- @param player The player for which the camera should be moved
-- @param name The location name
-- @param time Time in milliseconds to move to the new position
-- @param easingType Easing function to use (Set to nil to use Linear)
-- @param fadeInTime The time in milliseconds counted from the start how long the screen should take to fade in (Set to nil to disable)
-- @param fadeOutTime The time in milliseconds counted from the end where the screen should fade out (Set to nil to disable)
-- @param extraData Additional data which will be passed to the onCameraMoved event
-- Note: The location name must have a suffix _position (Position of the camera) and _lookat (Look at position of the camera)
-- Example: Two objects with IDs camera1_position and camera1_lookat
-- Note: The minimum value for time is 50 ms. Set the time to a lower value to directly set the new position instead of moving to the new position
-- Note: fadeOutTime have no effect if time is lower than 50 milliseconds
-- For more informations about the camera moving see the documentation for the moveCamera function.
function moveCameraToLocation(player, name, time, easingType, fadeInTime, fadeOutTime, extraData)
	local position
	local lookAt
	local time = tonumber(time)
	if time < 50 then
		setCameraMatrix(player, cameraLocationsTable[name].posX, cameraLocationsTable[name].posY, cameraLocationsTable[name].posZ, cameraLocationsTable[name].lookX, cameraLocationsTable[name].lookY, cameraLocationsTable[name].lookZ)
		if fadeInTime then
			fadeCamera(true, fadeInTime / 1000)
		end
	else
		if extraData == nil then
			extraData = {}
		end
		extraData.moveCameraToLocation = name
		moveCamera(player, nil, nil, nil, nil, nil, nil, cameraLocationsTable[name].posX, cameraLocationsTable[name].posY, cameraLocationsTable[name].posZ, cameraLocationsTable[name].lookX, cameraLocationsTable[name].lookY, cameraLocationsTable[name].lookZ, time, easingType, fadeInTime, fadeOutTime, extraData)
	end
end