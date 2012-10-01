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
	local childNodes = xmlNodeGetChildren(node)
	if childNodes and #childNodes > 0 then -- Check if there are child nodes
		return childNodes -- Return table containing all child nodes
	else
		return xmlNodeGetValue(node) -- Return node value
	end
end