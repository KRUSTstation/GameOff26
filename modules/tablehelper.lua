local TableHelper = {}

function TableHelper.contains(tab, seek)
	for _, item in pairs(tab) do
		if item == seek then
			return true
		end
	end

	return false
end

function TableHelper.index(tab, seek)
	for i, item in pairs(tab) do
		if item == seek then
			return i
		end
	end

	return -1
end

function TableHelper.remove_by_name(tab, seek)
	for i, item in pairs(tab) do
		if item == seek then
			table.remove(tab, i)
			return item
		end
	end

	return nil
end

return TableHelper