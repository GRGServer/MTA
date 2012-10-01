--- Send a formatted message
-- @param text The text containing format strings
-- @param formatStrings A table containing all format strings (formatstring = text to replace)
-- @param visibleTo This specifies who can see the message
function sendFormattedMessage(text, formatStrings, visibleTo)
	-- Check function parameters
	if not text then
		error("No text specified")
	end
	if not formatStrings then
		formatStrings = {}
	end
	if not visibleTo then
		visibleTo = getRootElement()
	end
	
	-- Format text
	for index, string in pairs(formatStrings) do
		text = replaceString(text, "%" .. index .. "%", string)
	end
	outputChatBox(text, visibleTo, 0, 0, 0, true)
end