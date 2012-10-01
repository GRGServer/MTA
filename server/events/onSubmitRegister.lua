--- onSubmitRegister event handler
addEvent("onSubmitRegister", true)
addEventHandler("onSubmitRegister", getRootElement(),
	function(language, password, birthDateDay, birthDateMonth, birthDateYear, gender)
		local playerName = getPlayerName(source)
		local skinNodes = readConfig("defaultSkins." .. gender) -- Get all skins of the selected gender
		local skin = xmlNodeGetValue(skinNodes[math.random(#skinNodes)]) -- Get a random skin
		local mysqlResult = mysqlConnection:query("INSERT INTO `users` (`username`, `password`, `language`, `birthDate`, `gender`, `skin`, `chatChannel`, `registerTime`, `inTutorial`) VALUES('" .. mysqlConnection:escape_string(playerName) .. "', '" .. string.lower(md5(password)) .. "', '" .. mysqlConnection:escape_string(getElementData(source, "language")) .. "', '" .. mysqlConnection:escape_string(birthDateYear .. "-" .. birthDateMonth .. "-" .. birthDateDay) .. "', '" .. string.upper(string.sub(gender, 1, 1)) .. "', '" .. mysqlConnection:escape_string(skin) .. "', '" .. mysqlConnection:escape_string(readConfig("chat.defaultChannel")) .. "', NOW(), '1')")
		if mysqlConnection:insert_id() > 0 then -- Registration was successful if the insert id is > 0
			triggerClientEvent(source, "onRegisterDone", getRootElement(), true) -- Successful
		else
			triggerClientEvent(source, "onRegisterDone", getRootElement(), false) -- Failed
		end
	end
)