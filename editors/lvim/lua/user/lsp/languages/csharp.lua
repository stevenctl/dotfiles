------------------------
-- Treesitter
------------------------
---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.builtin.treesitter.ensure_installed, {
  "c_sharp",
})

------------------------
-- Plugins
------------------------
---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.plugins, {
  { "OmniSharp/omnisharp-vim" },
  { 'Issafalcon/lsp-overloads.nvim' },
})
vim.g.OmniSharp_server_use_net6 = 1
vim.g.OmniSharp_highlighting = 0

------------------------
-- Formatting
------------------------
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "csharpier", filetypes = { "cs" } },
-- }


------------------------
-- LSP
------------------------
---@diagnostic disable-next-line: missing-parameter
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "omnisharp_mono" })
---@diagnostic disable-next-line: missing-parameter
-- vim.list_extend(lvim.lsp.installer.setup.automatic_installation.exclude, { "omnisharp" })
---@diagnostic disable-next-line: missing-parameter
-- vim.list_extend(lvim.lsp.installer.setup.ensure_installed, { "omnisharp_mono" })

-- require("lspconfig")
-- local lsp_manager = require "lvim.lsp.manager"
-- lsp_manager.setup("omnisharp", {
--   on_attach = function(client, bufnr)
--     require("lvim.lsp").common_on_attach(client, bufnr)
--     local _, _ = pcall(vim.lsp.codelens.refresh)
--     -- local map = function(mode, lhs, rhs, desc)
--     --   if desc then
--     --     desc = desc
--     --   end

--     --   vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
--     -- end
--     -- map("n", "<leader>ci", "<cmd>GoInstallDeps<Cr>", "Install Go Dependencies")
--   end,
--   on_init = require("lvim.lsp").common_on_init,
--   capabilities = require("lvim.lsp").common_capabilities(),
--   settings = {
--     use_mono = true,
--   },
-- })
