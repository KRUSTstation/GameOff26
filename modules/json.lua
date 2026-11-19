local Json = {}

---@param filename string
---@return table|boolean
function Json.load_file(filename)
	--[[if type(filename) ~= "string" then
		return nil, "filename must be a string"
	end]]

	local data, err = sys.load_resource('/data/'..filename)
	if not data then
		assert(err or ("could not load " .. filename))
		return nil
	end

	local ok, result = pcall(json.decode, data)
	if not ok then
		assert("invalid JSON in " .. filename .. ": " .. tostring(result))
		return nil
	end

	return result
end

return Json