-- onSubmitLogin event handler
addEvent("onSubmitLogin", true)
addEventHandler("onSubmitLogin", getRootElement(),
	function(password)
		local playerName = getPlayerName(source)
		local mysqlResult = mysqlConnection:query("SELECT `id` FROM `users` WHERE `username` = '" .. mysqlConnection:escape_string(playerName) .. "' AND `password` = MD5('" .. mysqlConnection:escape_string(password) .. "')")
		local row = mysqlResult:fetch_assoc()
		if (row) then
			mysqlConnection:query("UPDATE `users` SET `loginTime` = NOW() WHERE `id` = '" .. row.id .. "'")
			triggerClientEvent(source, "onLoginDone", getRootElement(), true)
			loadPlayer(source)
		else
			triggerClientEvent(source, "onLoginDone", getRootElement(), false)
		end
	end
)