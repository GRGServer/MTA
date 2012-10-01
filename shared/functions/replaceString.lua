--- Replace a string without regular expressions
-- @param string The string in which you want to replace the string
-- @param searchString The string which should be replaced
-- @param replacementString The new string which should be used to replace the searched string
-- @return The new string with the replaced string
function replaceString(string, searchString, replacementString)
	searchString = searchString:gsub("(%W)", "%%%1")
	return string:gsub(searchString, replacementString)
end