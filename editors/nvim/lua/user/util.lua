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

function _G.find_first_buf_of_type(buftype)
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].buftype == buftype then
			return bufnr
		end
	end
	return nil -- Return nil if no terminal buffer is found
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
		-- op pending
		o = function(k, a, d, o)
			map("o", k, a, d, o)
		end,
		-- normal
		n = function(k, a, d, o)
			map("n", k, a, d, o)
		end,
		-- terminal
		t = function(k, a, d, o)
			map("t", k, a, d, o)
		end,
		-- visual
		v = function(k, a, d, o)
			map("v", k, a, d, o)
		end,
		-- visual block
		x = function(k, a, d, o)
			map("x", k, a, d, o)
		end
	},

}
