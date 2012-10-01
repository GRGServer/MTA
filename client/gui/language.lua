--- Language selection window with it's widget controls
-- @param event The event which should be trigger once the player selected the language
function createLanguageSelectionWindow(event)
	local screenWidth, screenHeight = guiGetScreenSize()
	local languageNodes = readConfig("languages") -- Get available languages
	
	-- Create the window
	local window = guiCreateWindow(0, 0, screenWidth, screenHeight, translateString("Select language"), false)
	guiWindowSetMovable(window, false)
	guiWindowSetSizable(window, false)
	
	-- Labels
	local positionY = 30
	local maxWidth = 0
	for index,node in pairs(languageNodes) do
		local label = guiCreateLabel(10, positionY, 330, 20, translateStringToLanguage("Select the language you want to use.", xmlNodeGetName(node)), false, window)
		local labelWidth = guiLabelGetTextExtent(label)
		guiSetSize(label, labelWidth, 20, false)
		if labelWidth > maxWidth then
			maxWidth = labelWidth
		end
		positionY = positionY + 30
	end
	
	-- Language selection
	local languageSelection = guiCreateComboBox(10, positionY, maxWidth, 80, "", false, window)
	for index, node in pairs(languageNodes) do
		guiComboBoxAddItem(languageSelection, xmlNodeGetValue(node))
		if xmlNodeGetName(node) == getElementData(localPlayer, "language") then
			guiComboBoxSetSelected(languageSelection, index - 1)
		end
	end
	if (guiComboBoxGetSelected(languageSelection) == -1) then
		guiComboBoxSetSelected(languageSelection, 0)
	end
	positionY = positionY + 40
	
	local windowWidth = maxWidth + 20
	
	local okButton = guiCreateButton(windowWidth / 2 - 30, positionY, 60, 30, "OK", false, window)
	positionY = positionY + 40
	
	guiSetPosition(window, screenWidth / 2 - windowWidth / 2, screenHeight / 2 - positionY / 2, false)
	guiSetSize(window, windowWidth, positionY, false)
	
	-- Add event handlers
	addEventHandler("onClientGUIClick", okButton,
		function()
			local selectedLanguage = xmlNodeGetName(languageNodes[guiComboBoxGetSelected(languageSelection) + 1])
			destroyElement(window)
			triggerEvent(event, getRootElement(), selectedLanguage)
		end
	, false)
	
	-- Allow the player to use the window
	showCursor(true)
	guiSetInputEnabled(true)
end