local function is_array(t)
	if type(t) ~= "table" then
		return false
	end
	local i = 0
	for _ in pairs(t) do
		i = i + 1
		if t[i] == nil then return false end
	end
	return true
end

-- TODO non-global
function _G.flatten_plugin_list(...)
	local out = {}
	for _, v in ipairs({ ... }) do
		if is_array(v) then
			if #v == 1 and type(v[1]) == "string" then
				-- something like '{ "author/plugin.nvim" }'
				table.insert(out, v)
			else
				vim.list_extend(out, v)
			end
		else
			table.insert(out, v)
		end
	end
	return out
end

return {
	is_array = is_array,
	flatten_plugin_list = flatten_plugin_list,
	map = {
		n = function(k, a, o)
			vim.keymap.set("n", k, a, o)
		end,
		v = function(k, a, o)
			vim.keymap.set("v", k, a, o)
		end,
		x = function(k, a, o)
			vim.keymap.set("x", k, a, o)
		end
	},

}
