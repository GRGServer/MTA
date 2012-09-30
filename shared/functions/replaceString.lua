--- Replace a string without regular expressions
function replaceString(string, searchString, replacementString)
	searchString = searchString:gsub("(%W)", "%%%1")
	return string:gsub(searchString, replacementString)
end