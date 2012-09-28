--- onNPCSequenceDone event handler
addEvent("onNPCSequenceDone")
addEventHandler("onNPCSequenceDone", getRootElement(),
	function(sequence)
		local ped = source
		if sequence == "LC_Drive" then
			setTimer(
				function()
					removePedFromVehicle(ped)
					setNPCTaskSequence(ped, "LC_WalkToBistro")
				end
			, 1000, 1)
		elseif sequence == "LC_WalkToBistro" then
			local player = getElementData(ped, "npcCloneOfPlayer")
			fadeCamera(player, false, 2)
			setTimer(
				function()
					stopCamera(player)
					local bistroMen = createPed(189, -785, 498, 1371.7, 0, false) -- Create the bistro men ped
					destroyElement(getElementData(ped, "npcVehicle"))
					setPedAnimation(bistroMen, "ped", "IDLE_chat", -1, true, false, false)
					setElementPosition(ped, -785, 500, 1371.7, true)
					setElementRotation(ped, 0, 0, 180)
					setElementDimension(bistroMen, getElementDimension(player))
					setCameraMatrix(player, -780.00793457031, 503.42364501953, 1373.6978759766, -786.19665527344, 496.2265625, 1371.3931884766)
					fadeCamera(player, true, 1)
				end
			, 2000, 1)
		end
	end
)