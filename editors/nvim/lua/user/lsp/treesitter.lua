vim.opt.smartindent = false
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		---@diagnostic disable-next-line: missing-fields
		configs.setup({
			auto_install = true,
			sync_install = false,
			highlight = { enable = true },
			-- indent = { enable = true },
			fold = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn", -- set to `false` to disable one of the mappings
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
		})
	end
}
