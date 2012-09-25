--- Create login window with it's widget controls
function createLoginWindow()
	local screenWidth, screenHeight = guiGetScreenSize()
	
	-- Create the window
	loginWindow = guiCreateWindow(screenWidth / 2 - 150, screenHeight / 2 - 75, 300, 150, translateString("Login"), false)
	guiWindowSetMovable(loginWindow, false)
	guiWindowSetSizable(loginWindow, false)
	
	-- Header
	guiCreateLabel(10, 30, 280, 25, translateString("Enter the password of your account."), false, loginWindow)
	
	-- Password label
	local passwordLabel = guiCreateLabel(10, 70, 0, 25, translateString("Password") .. ":", false, loginWindow)
	local passwordLabelWidth = guiLabelGetTextExtent(passwordLabel)
	guiSetSize(passwordLabel, passwordLabelWidth, 25, false)
	
	-- Password field
	local passwordField = guiCreateEdit(passwordLabelWidth + 20, 70, 300 - passwordLabelWidth - 10 * 3, 25, "", false, loginWindow)
	guiEditSetMasked(passwordField, true) --  Make it masked (Show * instead of the cleartext password)
	
	-- Buttons
	local loginButton = guiCreateButton(120, 110, 80, 30, translateString("Login"), false, loginWindow)
	local cancelButton = guiCreateButton(210, 110, 80, 30, translateString("Cancel"), false, loginWindow)
	
	-- Add event handlers
	addEventHandler("onClientGUIClick", loginButton,
		function()
			if (guiGetText(passwordField) == "") then
				createMessageBox(translateString("Login error"), translateString("You have to enter your password!"), nil, loginWindow)
				return
			end
			triggerServerEvent("onSubmitLogin", localPlayer, guiGetText(passwordField))
		end
	, false)
	addEventHandler("onClientGUIClick", cancelButton, kickMe, false)
	
	-- Allow the player to use the window
	showCursor(true)
	guiSetInputEnabled(true)
end