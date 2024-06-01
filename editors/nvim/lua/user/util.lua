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

-- params: mode, keys, action, desc (optional), opts (optional)
local function map(m, k, a, d, o)
	if o == nil then
		o = { silent = true, noremap = true }
	end
	if type(d) == "table" then
		o = d
	end
	if type(d) == "string" then
		o.desc = d
	elseif type(a) == "string" then
		o.desc = a
	end
	vim.keymap.set(m, k, a, o)
end

return {
	is_array = is_array,
	flatten_plugin_list = flatten_plugin_list,
	-- TODO hint support
	map = {
		n = function(k, a, d, o)
			map("n", k, a, d, o)
		end,
		v = function(k, a, d, o)
			map("v", k, a, d, o)
		end,
		x = function(k, a, d, o)
			map("x", k, a, d, o)
		end
	},

}
