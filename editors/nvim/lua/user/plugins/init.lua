-- Install lazy.nvim plugin manager
require("user.plugins.lazy-install")
local ok, lazy = pcall(require, "lazy")
if not ok then
	print("lazy.nvim not installed")
	return
end

-- local jnhl = { delay = { highlight = 100000 } }
-- 		{ 'echasnovski/mini.jump',               version = '*', config = jnhl }, -- make f/F better

-- Install plugins
lazy.setup(flatten_plugin_list(
	{
		-- General Editing
		require("user.plugins.todo"),
		require("user.plugins.bqf"),
		{ "lukas-reineke/indent-blankline.nvim", main = "ibl",  opts = {} },
		{ "nmac427/guess-indent.nvim",           config = true },

		-- Mini QoL
		{ 'echasnovski/mini.ai',                 version = '*', config = true }, -- extra text objects
		{ 'echasnovski/mini.surround',           version = '*', config = true }, -- edit surrounding area
		{ 'echasnovski/mini.pairs',              version = '*', config = true }, -- autopairs
		{ 'echasnovski/mini.move',               version = '*', config = true }, -- use alt-hjkl to move text
		{ 'echasnovski/mini.splitjoin',          version = '*', config = true }, -- gS toggles arguments on one or separate line
		{ 'echasnovski/mini.trailspace',         version = '*', config = true }, -- fix trailing spaces (keymapped with formatting)

		-- Keymapping
		require("user.plugins.clue"),

		-- Colorschemes and beautification
		require("user.colors"),
		require("user.plugins.lualine"),
		{ 'rcarriga/nvim-notify',    config = true },

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
