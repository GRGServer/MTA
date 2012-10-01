--- Get the closest object
-- @param posX X-coordinate of the location
-- @param posY Y-coordinate of the location
-- @param posZ Z-coordinate of the location
-- @param type The type of the object to search for (Use nil to use any object type)
-- @param mustContainChildObjects Set to true to only search for objects which contain child objects
function getClosestObject(posX, posY, posZ, type, mustContainChildObjects)
	local distance
	local element
	local maps = getElementChildren(getResourceRootElement(getThisResource()), "map") -- Get all maps
	
	for mapIndex, mapElement in pairs(maps) do
		local mapItems = getElementChildren(mapElement) -- Get all map items of this map
		
		for mapItemIndex, mapItemElement in pairs(mapItems) do
			
			local checkObject = true
			
			if type == nil or type == getElementType(mapItemElement) then
				if mustContainChildObjects then -- Check for child objects if this condition has been set
					local childrenCheck = getElementChildren(object)
					if #childrenCheck == 0 then -- Only check this object if there are any child objects
						checkObject = false
					end
				end
				
				if checkObject then
					local elementPosX, elementPosY, elementPosZ = getElementPosition(mapItemElement)
					local thisDistance = getDistanceBetweenPoints3D(posX, posY, posZ, elementPosX, elementPosY, elementPosZ)
					if distance == nil or thisDistance < distance then
						distance = thisDistance
						element = mapItemElement
					end
				end
			end
		end
	end
	
	return distance, element
end