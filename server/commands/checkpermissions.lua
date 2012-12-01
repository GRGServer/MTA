addCommandHandler("checkpermission",
	function(player, command, permissionString)
		if not checkPlayerPermission(player, "checkpermission", true) then
			return
		end
		if not permissionString then
			showCommandUsageMessage(player, command, "permissionString")
			return
		end
	end
)