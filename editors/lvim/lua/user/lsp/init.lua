require("user.lsp.languages.rust")
require("user.lsp.languages.go")
require("user.lsp.languages.python")
require("user.lsp.languages.csharp")
require("user.lsp.languages.wgsl")
require("user.lsp.languages.godot")
require('lspconfig').bufls.setup {}

-- make sure server will always be installed even if the server is in skipped_servers list
---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.lsp.installer.setup.ensure_installed, {
  "lua_ls",
  "jsonls",
  "bufls",
})

-- require("lvim.lsp.null-ls.linters").setup({
--   { command = "codespell", filtypes = "markdown" }
-- })

-- change UI setting of `LspInstallInfo`
-- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"

-- EXAMPLES --
-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)
