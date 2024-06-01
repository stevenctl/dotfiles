local function mappings(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set('n', 'h', api.node.navigate.parent, opts('Expand'))
	vim.keymap.set('n', 'l', api.node.open.edit, opts('Expand'))
	vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

return {
	"nvim-tree/nvim-tree.lua",
	config = true,
	opts = {
		on_attach = mappings,
		update_focused_file = {
			enable = true,
			update_root = true,
		},
		renderer = {
			highlight_git = true,
			icons = {
				show = {
					git = false,
				},
			},
		},
	},
}
