local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

local config = {
	-- enable virtual text
	virtual_text = true,
	-- show signs
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

local rounded_borders = {
	["textDocument/hover"] = vim.lsp.handlers.hover,
	["textDocument/signatureHelp"] = vim.lsp.handlers.signatureHelp,
}

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }

	-- Quick Jumps
	local present, _ = pcall(require, "telescope")
	if present then
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", ":Trouble lsp_type_definitions<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":Trouble lsp_definitions<cr>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":Trouble lsp_implementations<cr>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":Trouble lsp_references<cr>", opts)
	else
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	end

	-- Code Actions
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader><CR>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<M-CR>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

	-- Get some info about current hovered item
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

	if vim.fn.has("mac") == 1 then
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-S-K>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts) -- iterm2 fix
	else
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-K>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	end

	-- diagnosic navigation
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"gl",
		'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

-- Highlights keywords you're hovered on
local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.documentHighlight then
		vim.api.nvim_exec(
			[[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

local M = {}

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
else
	print("Warning: cmp_nvim_lsp not installed.")
end

M.setup = function()
	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end
	vim.diagnostic.config(config)
	for k, v in ipairs(rounded_borders) do
		vim.lsp.handlers[k] = vim.lsp.with(v, { border = "rounded" })
	end
end

M.on_attach = function(client, bufnr)
	-- TODO check `client.name` to do customize per-server capabilities
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

return M