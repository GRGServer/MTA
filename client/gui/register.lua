--- Create register window with it's widget controls
function createRegisterWindow()
	local screenWidth, screenHeight = guiGetScreenSize()
	
	-- Create the window
	local windowWidth = 450
	registerWindow = guiCreateWindow(screenWidth / 2 - 175, screenHeight / 2 - 135, windowWidth, 240, translateString("Login"), false)
	guiWindowSetMovable(registerWindow, false)
	guiWindowSetSizable(registerWindow, false)
	
	-- Header
	guiCreateLabel(10, 30, windowWidth, 20, translateString("Create an account to play on this server."), false, registerWindow)
	
	-- Field labels
	local passwordLabel = guiCreateLabel(10, 70, 0, 25, translateString("Password") .. ":", false, registerWindow)
	local passwordVerifyLabel = guiCreateLabel(10, 100, 0, 25, translateString("Password (verify)") .. ":", false, registerWindow)
	local birthDateLabel = guiCreateLabel(10, 130, 0, 25, translateString("Birth date") .. ":", false, registerWindow)
	local genderLabel = guiCreateLabel(10, 160, 0, 25, translateString("Gender") .. ":", false, registerWindow)
	
	-- Get label widths
	local passwordLabelWidth = guiLabelGetTextExtent(passwordLabel)
	local passwordVerifyLabelWidth = guiLabelGetTextExtent(passwordVerifyLabel)
	local birthDateLabelWidth = guiLabelGetTextExtent(birthDateLabel)
	local genderLabelWidth = guiLabelGetTextExtent(genderLabel)
	
	-- Set full label widths
	guiSetSize(passwordLabel, passwordLabelWidth, 25, false)
	guiSetSize(passwordVerifyLabel, passwordVerifyLabelWidth, 25, false)
	guiSetSize(birthDateLabel, birthDateLabelWidth, 25, false)
	guiSetSize(genderLabel, genderLabelWidth, 25, false)
	
	-- Find longes label
	local maxLabelWidth = passwordLabelWidth
	if passwordVerifyLabelWidth > maxLabelWidth then
		maxLabelWidth = passwordVerifyLabelWidth
	end
	if birthDateLabelWidth > maxLabelWidth then
		maxLabelWidth = birthDateLabelWidth
	end
	if genderLabelWidth > maxLabelWidth then
		maxLabelWidth = genderLabelWidth
	end
	
	-- Password fields
	local passwordField = guiCreateEdit(maxLabelWidth + 20, 70, windowWidth - maxLabelWidth - 30, 25, "", false, registerWindow)
	local passwordVerifyField = guiCreateEdit(maxLabelWidth + 20, 100, windowWidth - maxLabelWidth - 30, 25, "", false, registerWindow)
	
	-- Set masked password fields
	guiEditSetMasked(passwordField, true)
	guiEditSetMasked(passwordVerifyField, true)
	
	-- Set maximum password length to 50 characters
	guiEditSetMaxLength(passwordField, 50)
	guiEditSetMaxLength(passwordVerifyField, 50)
	
	-- Birth date fields
	local birthDateFieldWidths = (windowWidth - maxLabelWidth - 30) / 3
	local birthDateDayField = guiCreateComboBox(maxLabelWidth + 20, 130, birthDateFieldWidths, 200, translateString("Day"), false, registerWindow)
	for day = 1, 31 do
		guiComboBoxAddItem(birthDateDayField, day)
	end
	local birthDateMonthField = guiCreateComboBox(maxLabelWidth + birthDateFieldWidths + 20, 130, birthDateFieldWidths, 200, translateString("Month"), false, registerWindow)
	for month = 1, 12 do
		guiComboBoxAddItem(birthDateMonthField, translateString(getMonthName(month)))
	end
	local time = getRealTime()
	local birthDateYearField = guiCreateComboBox(maxLabelWidth + birthDateFieldWidths * 2 + 20, 130, birthDateFieldWidths, 200, translateString("Year"), false, registerWindow)
	local birthDateStartingYear = 1900 + time.year - 100
	local currentYear = 1900 + time.year
	for year = currentYear, birthDateStartingYear, -1 do
		guiComboBoxAddItem(birthDateYearField, year)
	end
	
	-- Gender selection
	local genderField = guiCreateComboBox(maxLabelWidth + 20, 160, windowWidth - maxLabelWidth - 30, 70, translateString("Please select"), false, registerWindow)
	guiComboBoxAddItem(genderField, translateString("Male"))
	guiComboBoxAddItem(genderField, translateString("Female"))
	
	-- Buttons
	local registerButton = guiCreateButton(windowWidth - 180, 200, 80, 30, translateString("Register"), false, registerWindow)
	local backButton = guiCreateButton(windowWidth - 90, 200, 80, 30, translateString("Back"), false, registerWindow)
	
	-- Add event handlers
	addEventHandler("onClientGUIClick", registerButton,
		function()
			if guiGetText(passwordField) == "" then
				createMessageBox(translateString("Register error"), translateString("You have to enter a password!"), nil, registerWindow)
				return
			end
			if guiComboBoxGetSelected(birthDateDayField) == -1 or guiComboBoxGetSelected(birthDateMonthField) == -1 or guiComboBoxGetSelected(birthDateYearField) == -1 then
				outputChatBox("Day: " .. guiComboBoxGetSelected(birthDateDayField), localPlayer)
				outputChatBox("Month: " .. guiComboBoxGetSelected(birthDateMonthField), localPlayer)
				outputChatBox("Year: " .. guiComboBoxGetSelected(birthDateYearField), localPlayer)
				createMessageBox(translateString("Register error"), translateString("You have to enter your birth date!"), nil, registerWindow)
				return
			end
			if guiComboBoxGetSelected(genderField) == -1 then
				createMessageBox(translateString("Register error"), translateString("You have to select your gender!"), nil, registerWindow)
				return
			end
			if guiGetText(passwordField) ~= guiGetText(passwordVerifyField) then
				createMessageBox(translateString("Register error"), translateString("The entered passwords do not match!"), nil, registerWindow)
				return
			end
			local gender
			if guiComboBoxGetSelected(genderField) == 0 then
				gender = "male"
			elseif guiComboBoxGetSelected(genderField) == 1 then
				gender = "female"
			end
			triggerServerEvent("onSubmitRegister", localPlayer, language, guiGetText(passwordField), guiComboBoxGetSelected(birthDateDayField) + 1, guiComboBoxGetSelected(birthDateMonthField) + 1, currentYear - guiComboBoxGetSelected(birthDateYearField), gender)
		end
	, false)
	addEventHandler("onClientGUIClick", backButton,
		function()
			destroyElement(registerWindow)
			createLanguageSelectionWindow("onRegisterLanguageSelected")
		end
	, false)
	
	-- Allow the player to use the window
	showCursor(true)
	guiSetInputEnabled(true)
end