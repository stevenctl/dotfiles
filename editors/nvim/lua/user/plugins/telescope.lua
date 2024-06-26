function _G.get_hovered_directory()
	local tree_ok, tree_lib = pcall(require, "nvim-tree.lib")
	if not tree_ok then
		print("nvim-tre is required")
		return
	end
	local node = tree_lib.get_node_at_cursor()

	if node and node.type == "directory" then
		return node.absolute_path
	end

	return nil
end

function _G.find_in_hovered()
	local dir = get_hovered_directory()
	if dir then
		vim.cmd(":Telescope live_grep search_dirs=" .. dir)
	else
		print("No hovered dir.")
	end
end

vim.api.nvim_command("command! FindIn lua find_in_hovered()")

local function del_buf(bufnr)
	require('telescope.actions').delete_buffer(bufnr)
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		{
			"danielfalk/smart-open.nvim",
			branch = "0.2.x",
			config = true,
			dependencies = {
				"nvim-lua/plenary.nvim",
				"kkharji/sqlite.lua",
				-- Only required if using match_algorithm fzf
				{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
				-- Optional.  If installed, native fzy will be used when match_algorithm is fzy
				{ "nvim-telescope/telescope-fzy-native.nvim" },
			},
		}
	},
	opts = {
		extensions = { live_grep_args = {}, smart_open = {} },
		pickers = {
			buffers = { sort_mru = true, ignore_current_buffer = true, theme = "cursor", previewer = false },
			oldfiles = { cwd_only = true },
		},
		defaults = {
			mappings = {
				n = {
					['<c-x>'] = del_buf
				},
				i = {
					['<c-x>'] = del_buf
				},
			},
		},
	},
}
