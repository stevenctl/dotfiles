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

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim"
	},
	opts = {
		extensions = { live_grep_args = {} },
		defaults = {
			pickers = {
				buffers = { previwer = false },
			},
		},
	},
}
