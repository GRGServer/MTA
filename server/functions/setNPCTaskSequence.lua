--- Set the task sequence for a NPC
-- @param ped The Ped which should execute the task sequence
-- @param sequenceName The name of the sequence
function setNPCTaskSequence(ped, sequenceName)
	-- Fix ped and vehicle position for some task types
	local firstTask = npcTasks[sequenceName][1] -- Get first task
	local firstTaskType = firstTask[1] -- Task type is always the first element
	local vehicle = getPedOccupiedVehicle(ped) -- Get current vehicle
	if firstTaskType == "walkAlongLine" then
		setElementPosition(ped, firstTask[2], firstTask[3], firstTask[4])
	elseif firstTaskType == "walkAroundBend" then
		setElementPosition(ped, firstTask[4], firstTask[5], firstTask[6])
	elseif firstTaskType == "driveAlongLine" then
		if not vehicle then
			error("The ped is not in a vehicle!")
		end
		setElementPosition(vehicle, firstTask[2], firstTask[3], firstTask[4])
	elseif firstTaskType == "driveAroundBend" then
		if not vehicle then
			error("The ped is not in a vehicle!")
		end
		setElementPosition(vehicle, firstTask[4], firstTask[5], firstTask[6])
	end
	
	setElementData(ped, "npcSequence", sequenceName, false) -- Save sequence name for later use
	
	exports.npc_hlc:clearNPCTasks(ped) -- Clear task queue
	
	-- Add tasks
	for index, task in pairs(npcTasks[sequenceName]) do
		exports.npc_hlc:addNPCTask(ped, task)
	end
end