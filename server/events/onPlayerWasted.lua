--- onPlayerWasted event handler
addEventHandler("onPlayerWasted", getRootElement(),
	function(totalAmmo, killer, killerWeapon, bodypart, stealth)
		local player = source
		if killer then
			if getElementType(killer) == "player" then -- The killer was a player
				local userId = getElementData(killer, "userId")
				if userId then
					mysqlConnection:query("UPDATE `users` SET `kills` = `kills` + 1 WHERE `id` = '" .. tonumber(userId) .. "'")
				end
			elseif getElementType(killer) == "vehicle" then -- The killer was a vehicle
				local driver = getVehicleOccupant(killer) -- Get the driver of this vehicle
				if driver then
					local userId = getElementData(driver, "userId")
					if userId then
						mysqlConnection:query("UPDATE `users` SET `kills` = `kills` + 1 WHERE `id` = '" .. tonumber(userId) .. "'")
					end
				end
			end
		end
		local userId = getElementData(player, "userId")
		if userId then
			mysqlConnection:query("UPDATE `users` SET `deaths` = `deaths` + 1 WHERE `id` = '" .. tonumber(userId) .. "'")
		end
		setTimer(
			function()
				fadeCamera(player, false, 2)
				setTimer(
					function()
						if isPlayerInGroup(player, getGroupIdByName("tutorial")) then -- Check if the player is still in the tutorial group
							startTutorial(player) -- Restart the tutorial
						else
							-- TODO: Respawn at the next hospital
						end
					end
				, 3000, 1)
			end
		, 2000, 1)
	end
)