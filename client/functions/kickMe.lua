--- Send a kick request to the server
function kickMe()
	triggerServerEvent("onClientKickRequest", localPlayer) -- Triggers kickPlayer on the serverside
end