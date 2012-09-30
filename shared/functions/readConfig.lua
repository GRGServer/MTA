--- Read a configuration string from the shared configuration file
-- @param path The dotted path to the configuration value (e.g. myConfigNode.subNode.myValue)
-- @return The configuration value
function readConfig(path)
	path = split(path, ".")
	local node = configXmlRootNode
	for index, pathPart in pairs(path) do
		node = xmlFindChild(node, pathPart, 0)
		if not node then
			return
		end
	end
	return xmlNodeGetValue(node)
end