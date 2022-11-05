-- Install with mason-lspconfig
local servers = {
	"sumneko_lua",
	"pyright",
	"jsonls",
	"rust_analyzer",
	"gopls",
	"bashls",
}

-- Install with mason-null-ls and then configure with null-ls
local null_ls_tools = {
	formatting = {
		"gofumpt",
		"goimports",
		"stylua",
		"rustfmt",
		"fixjson",
	},
	diagnostics = {
		"shellcheck",
		"buf",
		"golangci_lint",
		"luacheck",
		"markdownlint",
		"misspell",
		"protoc_gen_lint",
		"pylint",
		"zsh",
	},
}

-- General Mason Settings
local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

------------------
-- Installation --
------------------

require("mason").setup(settings)

-- LSP
local function lsp_setup()
	require("mason-lspconfig").setup({
		ensure_installed = servers,
		automatic_installation = true,
	})

	local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
	if not lspconfig_status_ok then
		return
	end

	local opts = {}
	for _, server in pairs(servers) do
		opts = {
			on_attach = require("user.lsp.handlers").on_attach,
			capabilities = require("user.lsp.handlers").capabilities,
		}

		server = vim.split(server, "@")[1]

		local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", conf_opts, opts)
		end

		lspconfig[server].setup(opts)
	end
end
lsp_setup()

-- Formatters & Linters
local function formatters_and_linters()
	local status_ok, null_ls = pcall(require, "null-ls")
	if not status_ok then
		print("Warning: null-ls is missing")
		return
	end
	local all_null_ls = {}
	for _, l in pairs(null_ls_tools) do
		for _, v in pairs(l) do
			table.insert(all_null_ls, v)
		end
	end
	require("mason-null-ls").setup({
		ensure_installed = all_null_ls,
		automatic_installation = true,
	})

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	local config = {
		-- format on save
		on_attach = function(curent_client, bufnr)
			if curent_client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({
							bufnr = bufnr,
							filter = function(client)
								-- only use null-ls, don't use lsp server TODO (why though?)
								return client.name == "null-ls"
							end,
						})
					end,
				})
			end
		end,
		sources = {},
	}
	for k, list in pairs(null_ls_tools) do
		for _, tool in ipairs(list) do
			table.insert(config.sources, null_ls.builtins[k][tool])
		end
	end
	null_ls.setup(config)
end
formatters_and_linters()
