--- Check if the server is running in public or development mode
-- This function checks the server port.
-- If the port is not 22003 (The MTA default), the server is running in development mode.
-- @return true if the server is running in development mode, false if in public mode
function isDevMode()
	return getServerPort() ~= 22003
end