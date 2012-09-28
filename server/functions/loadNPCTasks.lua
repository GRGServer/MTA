--- Load all tasks for all NPCs
function loadNPCTasks()
	npcTasks = {}
	local xml = xmlLoadFile("npcTasks.xml")
	local sequences = xmlNodeGetChildren(xml)
	for sequenceNodeIndex, sequenceNode in ipairs(sequences) do
		local name = xmlNodeGetAttribute(sequenceNode, "name")
		npcTasks[name] = {}
		local taskNodes = xmlNodeGetChildren(sequenceNode)
		for taskNodeIndex, taskNode in ipairs(taskNodes) do
			local taskId = tonumber(xmlNodeGetAttribute(taskNode, "id"))
			local taskParameters = {}
			local parameterNodes = xmlNodeGetChildren(taskNode)
			for parameterNodeIndex, parameterNode in ipairs(parameterNodes) do
				local parameterId = tonumber(xmlNodeGetAttribute(parameterNode, "id"))
				local parameterType = xmlNodeGetAttribute(parameterNode, "type")
				local parameterValue = xmlNodeGetAttribute(parameterNode, "value")
				if parameterType == "number" then
					parameterValue = tonumber(parameterValue)
				end
				taskParameters[parameterId] = parameterValue
			end
			npcTasks[name][taskId] = taskParameters
		end
	end
	xmlUnloadFile(xml)
end