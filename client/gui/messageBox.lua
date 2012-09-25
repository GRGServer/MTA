--- Show a message box
-- @title title The title of the window
-- @param content The content wich should be shown
-- @param event The event which should be triggered as soon as the player closes the message box
-- @param parentWindow The parent window which should be disabled while the message box is visible
function createMessageBox(title, content, event, parentWindow)
	if (parentWindow) then
		guiSetEnabled(parentWindow, false) -- Disable parent window
	end
	
	-- Open the window
	local windowWidth = 0
	local widthHeight = 30
	local window = guiCreateWindow(0, 0, 0, 0, title, false)
	guiWindowSetMovable(window, false)
	guiWindowSetSizable(window, false)
	guiSetAlpha(window, 1)
	
	-- Create content label
	content = split(content, "\n")
	for index, line in pairs(content) do
		local contentLabel = guiCreateLabel(10, widthHeight, 0, 0, content[index], false, window)
		local width = guiLabelGetTextExtent(contentLabel)
		local height = guiLabelGetFontHeight(contentLabel)
		guiSetSize(contentLabel, width, height, false)
		if (width > windowWidth) then
			windowWidth = width
		end
		widthHeight = widthHeight + height + 10
	end
	
	-- Set window position and size
	local screenWidth, screenHeight = guiGetScreenSize()
	local windowWidth = windowWidth + 20
	local windowHeight = widthHeight + 40
	guiSetPosition(window, screenWidth / 2 - windowWidth / 2, screenHeight / 2 - windowHeight / 2, false)
	guiSetSize(window, windowWidth, windowHeight, false)
	
	-- Create OK button
	local okButton = guiCreateButton(windowWidth /2 - 25, windowHeight - 40, 50, 30, "OK", false, window)
	addEventHandler("onClientGUIClick", okButton,
		function()
			destroyElement(window)
			if (parentWindow) then
				guiSetEnabled(parentWindow, true) -- Enable parent window
			end
			if (event) then
				triggerEvent(event, getRootElement())
			end
		end
	, false)
end