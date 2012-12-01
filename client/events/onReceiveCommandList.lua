--- onReceiveCommandList event handler
addEvent("onReceiveCommandList", true)
addEventHandler("onReceiveCommandList", getRootElement(),
	function(newCommandTable)
		commandTable = newCommandTable
	end
)