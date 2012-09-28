--- Stops the camera from moving started using the moveCamera function
-- Note: This will not automatically set the camera back behind the player!
function stopCamera(player)
	triggerClientEvent(player, "onStopCamera", player)
end