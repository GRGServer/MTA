--- Load all commands to the command table
function loadCommandList()
	commandTable = {}
	commandTable.commandList = {}
	commandTable.groupList = {}
	
	-- Get commands
	local xml = xmlLoadFile("commands.xml")
	local commandListNode = xmlFindChild(xml, "commandList", 0)
	local nodes = xmlNodeGetChildren(commandListNode)
	for index, node in pairs(nodes) do
		local commandData = {}
		local subNode
		
		subNode = xmlFindChild(node, "description", 0)
		if subNode then
			commandData.description = xmlNodeGetValue(subNode)
		end
		
		commandTable.commandList[xmlNodeGetName(node)] = commandData
	end
	xmlUnloadFile(xml)
	
	-- Compare commands with command scripts available in meta.xml
	local xml = xmlLoadFile("meta.xml")
	local nodes = xmlNodeGetChildren(xml)
	for index, node in pairs(nodes) do
		if xmlNodeGetName(node) == "script" then
			local scriptFile = xmlNodeGetAttribute(node, "src") -- The file path of the script file
			if string.find(scriptFile, "/commands/") then
				local fileParts = split(scriptFile, "/")
				local fileName = split(fileParts[#fileParts], ".")
				table.remove(fileName)
				local name = fileName[1]
				if commandTable.commandList[name] then
					commandTable.commandList[name].foundInMetaXml = true
				else
					outputDebugString("Command '" .. name .. "' not found in command list!", 2)
				end
			end
		end
	end
	xmlUnloadFile(xml)
	
	for name in pairs(commandTable.commandList) do
		if commandTable.commandList[name].foundInMetaXml then
			commandTable.commandList[name].foundInMetaXml = nil
		else
			outputDebugString("Command '" .. name .. "' not found in meta.xml!", 2)
		end
	end
end