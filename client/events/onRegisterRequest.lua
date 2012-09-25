--- onRegisterRequest
-- Triggered as soon as the player should register
addEvent("onRegisterRequest", true)
addEventHandler("onRegisterRequest", getRootElement(),
	function()
		createLanguageSelectionWindow("onRegisterLanguageSelected")
	end
)