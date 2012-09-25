--- Create a centered window
-- @param width The width of the window
-- @param heigth The height of the window
-- @param title The window title
-- @return The window element
function createCenteredWindow(width, height, title)
	local screenWidth, screenHeight = guiGetScreenSize()
	local x = screenWidth / 2 - width / 2
	local y = screenHeight / 2 - height / 2
	return guiCreateWindow(x, y, width, height, title, false)
end