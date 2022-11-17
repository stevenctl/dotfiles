local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
---@diagnostic disable-next-line: different-requires
local lspconfig = require "lspconfig"
local mason_items = require("core.utils").load_override({}, "williamboman/mason.nvim").ensure_installed
local mapping = require("custom.lspconfig.mapping").package_to_lspconfig

for _, package_name in ipairs(mason_items) do
  local lsp = mapping[package_name]
  if lsp then
    local cfg = {
      on_attach = on_attach,
      capabilities = capabilities,
    }
    local cfg_path = "custom.lspconfig." .. lsp
    local settings_ok, settings = pcall(require, cfg_path)
    if settings_ok then
      cfg.settings = settings
    end
    lspconfig[lsp].setup(cfg)
  end
end
