local handlers = {
	function(server_name) -- default handler (optional)
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		require("lspconfig")[server_name].setup {
			capabilities = capabilities,
		}
	end,
	["gopls"] = function()
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		require("lspconfig")["gopls"].setup {
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

return flatten_plugin_list {
	require("user.lsp.treesitter"),
	{ "folke/neodev.nvim",                 config = true,                 priority = 100, },
	{ "williamboman/mason.nvim",           config = true },
	{ "williamboman/mason-lspconfig.nvim", opts = { handlers = handlers } },
	{ "neovim/nvim-lspconfig" },
	require("user.lsp.lspsaga"),
}
