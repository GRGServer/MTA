--- Move the camera of a player using clientside camera moving functions
-- onPlayerCameraMoved will be triggered as soon as the camera has been moved to the target position
-- @param player The player for which the camera should be moved
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
function moveCamera(player, startPosX, startPosY, startPosZ, startLookX, startLookY, startLookZ, endPosX, endPosY, endPosZ, endLookX, endLookY, endLookZ, time, easingType, fadeInTime, fadeOutTime, extraData)
	triggerClientEvent(player, "onMoveCamera", player, startPosX, startPosY, startPosZ, startLookX, startLookY, startLookZ, endPosX, endPosY, endPosZ, endLookX, endLookY, endLookZ, time, easingType, fadeInTime, fadeOutTime, extraData)
end