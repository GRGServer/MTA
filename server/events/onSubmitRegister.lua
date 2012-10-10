--- onSubmitRegister event handler
addEvent("onSubmitRegister", true)
addEventHandler("onSubmitRegister", getRootElement(),
	function(language, password, birthDateDay, birthDateMonth, birthDateYear, gender)
		local playerName = getPlayerName(source)
		local skinNodes = readConfig("defaultSkins." .. gender) -- Get all skins of the selected gender
		local skin = xmlNodeGetValue(skinNodes[math.random(#skinNodes)]) -- Get a random skin
		local mysqlResult = mysqlConnection:query("INSERT INTO `users` (`username`, `password`, `language`, `birthDate`, `gender`, `skin`, `chatChannel`, `registerTime`) VALUES('" .. mysqlConnection:escape_string(playerName) .. "', '" .. string.lower(md5(password)) .. "', '" .. mysqlConnection:escape_string(getElementData(source, "language")) .. "', '" .. mysqlConnection:escape_string(birthDateYear .. "-" .. birthDateMonth .. "-" .. birthDateDay) .. "', '" .. string.upper(string.sub(gender, 1, 1)) .. "', '" .. mysqlConnection:escape_string(skin) .. "', '" .. mysqlConnection:escape_string(readConfig("chat.defaultChannel")) .. "', NOW())")
		local userId = mysqlConnection:insert_id()
		if userId > 0 then -- Registration step 1 was successful if the userId is > 0
			mysqlResult = mysqlConnection:query("INSERT INTO `objects` (`linkId`, `type`) VALUES('" .. userId .. "', 'user')")
			local objectId = mysqlConnection:insert_id()
			if objectId > 0 then -- Registration step 2 was successful if the objectId is > 0
				addObjectToGroup(getGroupIdByName("tutorial"), objectId) -- Add the player to the tutorial group
				triggerClientEvent(source, "onRegisterDone", source, true) -- Successful
				return
			end
		end
		triggerClientEvent(source, "onRegisterDone", source, false) -- Failed
	end
)