function connectMySQL()
	local connectionData = {}
	if (isDevMode()) then
		connectionData.host = get("mysql_dev_host")
		connectionData.username = get("mysql_dev_username")
		connectionData.password = get("mysql_dev_password")
		connectionData.database = get("mysql_dev_database")
	else
		connectionData.host = get("mysql_public_host")
		connectionData.username = get("mysql_public_username")
		connectionData.password = get("mysql_public_password")
		connectionData.database = get("mysql_public_database")
	end
	print("Connecting to MySQL server: " .. connectionData.username .. "@" .. connectionData.host .. "/" .. connectionData.database)
	mysqlConnection = mysql_connect(connectionData.host, connectionData.username, connectionData.password, connectionData.database)
	if (not mysqlConnection) then
		print("Error while connecting to mysql server!")
	end
end