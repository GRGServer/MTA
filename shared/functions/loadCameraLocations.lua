--- Load all camera locations from shared/cameraLocations.map
function loadCameraLocations()
	local xml = xmlLoadFile("shared/cameraLocations.map")
	local xmlNodes = xmlNodeGetChildren(xml)
	for index, node in pairs(xmlNodes) do
		local attributes = xmlNodeGetAttributes(node)
		local name
		if string.sub(attributes.id, -9) == "_position" then
			name = string.sub(attributes.id, 1, -10)
			if cameraLocationsTable[name] == nil then
				cameraLocationsTable[name] = {}
			end
			cameraLocationsTable[name].posX = attributes.posX
			cameraLocationsTable[name].posY = attributes.posY
			cameraLocationsTable[name].posZ = attributes.posZ
			cameraLocationsTable[name].interior = attributes.interior
		elseif string.sub(attributes.id, -7) == "_lookat" then
			name = string.sub(attributes.id, 1, -8)
			if cameraLocationsTable[name] == nil then
				cameraLocationsTable[name] = {}
			end
			cameraLocationsTable[name].lookX = attributes.posX
			cameraLocationsTable[name].lookY = attributes.posY
			cameraLocationsTable[name].lookZ = attributes.posZ
			cameraLocationsTable[name].interior = attributes.interior
		end
	end
	xmlUnloadFile(xml)
end