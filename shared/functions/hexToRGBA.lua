--- Convert the given hexadecimal string to a RGBA color
-- The string can either be in #RRGGBBAA or #RRGGBB format
-- @param hex The hex string
-- @return 4 values for red, green, blue and alpha
function hexToRGBA(hex)
	hex = hex:gsub("#","")
	local red = tonumber("0x" .. hex:sub(1, 2))
	local green = tonumber("0x" .. hex:sub(3, 4))
	local blue = tonumber("0x" .. hex:sub(5, 6))
	local alpha = 0
	local alphaHex = hex:sub(7, 8)
	if #alphaHex then
		alpha = tonumber("0x" .. alphaHex)
	end
	return red, green, blue, alpha
end