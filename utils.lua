local M = {}

function M.add_keys(config, keys)
	for _, k in ipairs(keys) do
		table.insert(config.keys, k)
	end
end

return M
