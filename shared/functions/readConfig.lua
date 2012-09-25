--- Read a configuration string from the shared configuration file
-- @param name The configuration string name
-- @return The configuration value
function readConfig(name)
	local node = xmlFindChild(configXmlRootNode, name, 0)
	if (node == nil) then
		return ""
	end
	return xmlNodeGetValue(node)
end