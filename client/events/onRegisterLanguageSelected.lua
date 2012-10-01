--- onRegisterLanguageSelected event handler
-- Trigger as soon as the user has selected the language
addEvent("onRegisterLanguageSelected")
addEventHandler("onRegisterLanguageSelected", getRootElement(),
	function(language)
		setElementData(localPlayer, "language", language, true)
		createRegisterWindow()
	end
)