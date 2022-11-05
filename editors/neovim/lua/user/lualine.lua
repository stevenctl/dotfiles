local ok, lualine = pcall(require, "lualine")
if not ok then
	return
end

local config = {
	options = {
		extensions = {
			"nvim-tree",
			"quickfix",
		},
	},
}

lualine.setup(config)
