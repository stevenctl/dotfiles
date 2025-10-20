local handlers = {
	function(server_name) -- default handler (optional)
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		vim.lsp.config(server_name).setup {
			capabilities = capabilities,
		}
	end,
	["gopls"] = function()
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		vim.lsp.config("gopls").setup {
			capabilities = capabilities,
			settings = {
				gopls = {
					env = { GOFLAGS = "-tags=integ" },
					usePlaceholders = true,
					gofumpt = true,
					codelenses = {
						generate = false,
						gc_details = true,
						test = true,
						tidy = true,
					},
				},
			},
		}
	end
}

local navbuddy =
{
	"SmiteshP/nvim-navbuddy",
	dependencies = {
		"SmiteshP/nvim-navic",
		"MunifTanjim/nui.nvim"
	},
	opts = { lsp = { auto_attach = true } }
}

-- Fix gdshader stuff
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.gdshader", "*.gdshaderinc" },
	callback = function()
		vim.bo.filetype = "gdshader"
	end
})


return flatten_plugin_list {
	{ 'mhartington/formatter.nvim', config = function()
		local util = require("formatter.util")
		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				gdscript = {
					function()
						return {
							exe = "gdformat",
							args = { util.escape_path(util.get_current_buffer_file_path()) },
						}
					end
				},
			},
		})
	end },
	-- { "neovim/nvim-lspconfig", config = function()
	-- 	vim.lsp.config("gdscript").setup({})
	-- end },
	require("user.lsp.treesitter"),

	{ "folke/lazydev.nvim",                config = true,                 priority = 1000, },
	{ "williamboman/mason.nvim",           config = true },
	{ "williamboman/mason-lspconfig.nvim", opts = { handlers = handlers } },
	{ "neovim/nvim-lspconfig",             dependencies = { navbuddy } },
	require("user.lsp.lspsaga"),
	require("user.lsp.dap"),
	{ 'akinsho/flutter-tools.nvim', config = true, dependencies = { 'nvim-lua/plenary.nvim', lazy = false } },
}
