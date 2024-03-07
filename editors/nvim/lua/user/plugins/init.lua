-- Install lazy.nvim plugin manager
require("user.plugins.lazy-install")
local ok, lazy = pcall(require, "lazy")
if not ok then
	print("lazy.nvim not installed")
	return
end

-- Install plugins
lazy.setup(flatten_plugin_list(
	{
		require("user.plugins.comment"),

		-- Keymapping
		require("user.plugins.whichkey"),

		-- Colorschemes
		require("user.colors"),

		-- File navigation
		require("user.plugins.nvimtree"),
		require("user.plugins.telescope"),

		-- LSP, completion, etc
		require("user.plugins.cmp"),
		require("user.lsp"),

		-- Gitsigns
		{ "lewis6991/gitsigns.nvim", config = true },
	}
))
