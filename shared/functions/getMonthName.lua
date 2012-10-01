--- Get a month name by the month number (e.g. 1 = January, 2 = February, 3 = March, ...)
-- @param month The month number
function getMonthName(month)
	local months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}
	return months[month]
end