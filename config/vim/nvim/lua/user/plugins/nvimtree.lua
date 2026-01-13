local function get_hovered_directory()
	local api = require("nvim-tree.api")
	local node = api.tree.get_node_under_cursor()
	if node and node.type == "directory" then
		return node.absolute_path
	end
	return nil
end

local function find_in_hovered()
	local dir = get_hovered_directory()
	if dir then
		Snacks.picker.grep({ dirs = { dir } })
	else
		vim.notify("No directory under cursor", vim.log.levels.WARN)
	end
end

vim.api.nvim_create_user_command("FindIn", find_in_hovered, {})

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
	vim.keymap.set('n', 'f', find_in_hovered, opts('Find in directory'))
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
