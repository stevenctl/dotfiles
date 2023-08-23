------------------------
-- Treesitter
------------------------
---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.builtin.treesitter.ensure_installed, {
  "go",
  "gomod",
})

------------------------
-- Plugins
------------------------
---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.plugins, {
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
})

------------------------
-- Formatting
------------------------
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "goimports", filetypes = { "go" } },
  { command = "gofumpt", filetypes = { "go" } },
}

------------------------
-- Dap
------------------------
local dap_ok, dapgo = pcall(require, "dap-go")
if not dap_ok then
  return
end

dapgo.setup()

------------------------
-- LSP
------------------------
---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "gopls" })
---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.lsp.installer.setup.ensure_installed, { "gopls" })

local lsp_manager = require "lvim.lsp.manager"
-- lsp_manager.setup("golangci_lint_ls", {
--   on_init = require("lvim.lsp").common_on_init,
--   capabilities = require("lvim.lsp").common_capabilities(),
-- })

lsp_manager.setup("gopls", {
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)
    local _, _ = pcall(vim.lsp.codelens.refresh)
    local map = function(mode, lhs, rhs, desc)
      if desc then
        desc = desc
      end

      vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
    end
    map("n", "<leader>ci", "<cmd>GoInstallDeps<Cr>", "Install Go Dependencies")
    map("n", "<leader>ct", "<cmd>GoMod tidy<cr>", "Tidy")
    map("n", "<leader>ca", "<cmd>GoTestAdd<Cr>", "Add Test")
    map("n", "<leader>cA", "<cmd>GoTestsAll<Cr>", "Add All Tests")
    map("n", "<leader>ce", "<cmd>GoTestsExp<Cr>", "Add Exported Tests")
    map("n", "<leader>cg", "<cmd>GoGenerate<Cr>", "Go Generate")
    map("n", "<leader>cf", "<cmd>GoGenerate %<Cr>", "Go Generate File")
    map("n", "<leader>cc", "<cmd>GoCmt<Cr>", "Generate Comment")
  end,
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
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
})

local status_ok, gopher = pcall(require, "gopher")
if not status_ok then
  return
end

gopher.setup {
  commands = {
    go = "go",
    gomodifytags = "gomodifytags",
    gotests = "gotests",
    impl = "impl",
    iferr = "iferr",
  },
}
