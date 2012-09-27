--- Move the camera to the next location in the group or another random group if the last location has been already shown (Or no location was shown yet)
-- @param groups Table containing all location groups with their locations as sub elements
-- @param ... Additional parameters which will be passed to the onCameraMoved event
function moveCameraToNextGroupLocation(groups, ...)
	local fadeInTime
	local fadeOutTime
	if moveCameraGroupIndex == nil or moveCameraGroupLocationIndex == nil or moveCameraGroupLocationIndex >= #groups[moveCameraGroupIndex] then -- This is the first location in the group or no location/group has been selected yet
		local newGroupIndex
		for try = 1, 10 do
			newGroupIndex = math.random(#groups)
			if newGroupIndex ~= moveCameraGroupIndex or #groups == 1 then
				moveCameraGroupIndex = newGroupIndex
				break
			end
		end
		moveCameraGroupLocationIndex = 1
		fadeInTime = 1000
	else
		moveCameraGroupLocationIndex = moveCameraGroupLocationIndex + 1
	end
	if moveCameraGroupLocationIndex >= #groups[moveCameraGroupIndex] then -- This is the last location in the group
		fadeOutTime = 1000
	end
	if stopGroupCameraMovements and (fadeInTime or fadeOutTime) then
		return
	end
	moveCameraToLocation(groups[moveCameraGroupIndex][moveCameraGroupLocationIndex].name, groups[moveCameraGroupIndex][moveCameraGroupLocationIndex].time, groups[moveCameraGroupIndex][moveCameraGroupLocationIndex].easingType, fadeInTime, fadeOutTime, "moveCameraToNextGroupLocation", groups, ...)
end