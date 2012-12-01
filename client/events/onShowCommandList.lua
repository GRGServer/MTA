addEvent("onShowCommandList", true)
addEventHandler("onShowCommandList", getRootElement(),
	function()
		local screenWidth, screenHeight = guiGetScreenSize()
		
		local windowWidth = 800
		local windowHeight = 600
		local gridColumns = {}
		
		local commandListWindow = guiCreateWindow(screenWidth / 2 - windowWidth / 2, screenHeight / 2 - windowHeight / 2, windowWidth, windowHeight, translateString("Command list"), false)
		local gridList = guiCreateGridList(10, 10, windowWidth - 20, windowHeight - 60, false, commandListWindow)
		local closeButton = guiCreateButton(windowWidth - 110, windowHeight - 40, 100, 30, translateString("Close"), false, commandListWindow)
		
		-- Add columns
		gridColumns.command = guiGridListAddColumn(gridList, translateString("Command"), 0.3)
		gridColumns.description = guiGridListAddColumn(gridList, translateString("Description"), 0.7)
		
		-- Add items
		for command in pairs(commandTable.commandList) do
			local row = guiGridListAddRow(gridList)
			guiGridListSetItemText(gridList, row, gridColumns.command, command, false, false)
			guiGridListSetItemText(gridList, row, gridColumns.description, commandTable.commandList[command].description, false, false)
		end
		
		-- Add event handlers
		addEventHandler("onClientGUIClick", closeButton,
			function()
				destroyElement(commandListWindow)
				showCursor(false)
				guiSetInputEnabled(false)
			end
		, false)
		
		-- Allow the player to use the window
		showCursor(true)
		guiSetInputEnabled(true)
	end
)