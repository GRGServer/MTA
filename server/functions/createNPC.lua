--- Create a Ped and assign tasks
-- @param sequenceName The sequence of tasks which should be executed by the Ped
-- @param modelId Model ID for the Ped
-- @param posX Position X-coordinate for the initial spawn (Only used for tasks without start position)
-- @param posY Position Y-coordinate for the initial spawn (Only used for tasks without start position)
-- @param posZ Position Z-coordinate for the initial spawn (Only used for tasks without start position)
-- @param vehicleId Vehicle to spawn for the Ped (Set to nil to spawn without a vehicle)
-- @return The Ped element
function createNPC(sequenceName, modelId, posX, posY, posZ, rotation, vehicleId)
	-- Make sure that all required parameters have valid values
	if posX == nil then
		posX = 0
	end
	if posY == nil then
		posY = 0
	end
	if posZ == nil then
		posZ = 0
	end
	if rotation == nil then
		rotation = 0
	end
	
	-- Create Ped and add npc_hlc:onNPCTaskDone event handler (Triggered by npc_hlc resource)
	local ped = createPed(modelId, posX, posY, posZ, rotation)
	addEventHandler("npc_hlc:onNPCTaskDone", ped,
		function()
			local sequenceName = getElementData(source, "npcSequence")
			local taskId = getElementData(source, "npc_hlc:thistask") - 1
			
			if taskId == #npcTasks[sequenceName] then -- End of sequence reached
				triggerEvent("onNPCSequenceDone", source, sequenceName)
			end
		end
	)
	
	-- Create the vehicle if required
	if vehicleId then
		local vehicle = createVehicle(vehicleId, posX, posY, posZ, 0, 0, rotation, "GRG")
		warpPedIntoVehicle(ped, vehicle)
		setElementData(ped, "npcVehicle", vehicle, false)
	end
	
	-- Start the NPC
	exports.npc_hlc:enableHLCForNPC(ped, "walk", 1, 40/180)
	setNPCTaskSequence(ped, sequenceName)
	
	return ped
end