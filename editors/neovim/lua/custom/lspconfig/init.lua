local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
print("3")
local lspconfig = require("lspconfig")

print("4")
local mason_items = require("core.utils").load_override({}, "williamboman/mason.nvim").ensure_installed
print("5")
local mapping = require("custom.lspconfig.mapping").package_to_lspconfig;

print("6")
for _, package_name in ipairs(mason_items) do
  local lsp = mapping[package_name]
  if lsp then
    local cfg = {
      on_attach = on_attach,
      capabilities = capabilities,
    }
    local cfg_path = "custom.lspconfig."..lsp
    local settings_ok, settings = pcall(require, cfg_path)
    if settings_ok then
      cfg.settings = settings
    end
    lspconfig[lsp].setup(cfg)
  end
end
