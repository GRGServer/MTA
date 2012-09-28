--- onRegisterRequest event handler
-- Triggered as soon as the player should register
addEvent("onRegisterRequest", true)
addEventHandler("onRegisterRequest", getRootElement(),
	function(basicUserData)
		localConfiguration = basicUserData
		createLanguageSelectionWindow("onRegisterLanguageSelected")
	end
)