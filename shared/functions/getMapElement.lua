--- Get a map element by map file path and element ID
-- @param mapFilePath The file path to the map
-- @param elementId The ID of the element
function getMapElement(mapFilePath, elementId)
	local maps = getElementChildren(getResourceRootElement(getThisResource()), "map")
	for index, mapElement in pairs(maps) do
		if getElementID(mapElement) == mapFilePath then
			local mapItems = getElementChildren(mapElement)
			for mapItemIndex, mapItemElement in pairs(mapItems) do
				if getElementID(mapItemElement) == elementId then
					return mapItemElement
				end
			end
		end
	end
end