addCommandHandler("int",
	function()
		outputChatBox("Current interior: " .. getElementInterior(localPlayer), localPlayer)
		outputChatBox("Current dimension: " .. getElementDimension(localPlayer), localPlayer)
	end
)