local TableHelper = {}

function TableHelper.contains(table, seek)
	for _, item in pairs(table) do
		if item == seek then
			return true
		end
	end

	return false
end

return TableHelper