--- onClientPreRender event handler
addEventHandler("onClientPreRender", getRootElement(),
	function()
		if moveCameraValues ~= nil and moveCameraValues.positionObject ~= nil and isElement(moveCameraValues.positionObject) and moveCameraValues.lookAtObject ~= nil and isElement(moveCameraValues.lookAtObject) then
			local posX, posY, posZ = getElementPosition(moveCameraValues.positionObject)
			local lookX, lookY, lookZ = getElementPosition(moveCameraValues.lookAtObject)
			setCameraMatrix(posX, posY, posZ, lookX, lookY, lookZ)
		end
	end
)