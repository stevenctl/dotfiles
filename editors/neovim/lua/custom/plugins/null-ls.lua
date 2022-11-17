local present, null_ls = pcall(require, "null-ls")
if not present then
   return
end

-- Enables anything null-ls related that was installed via mason
local mason_items = require("core.utils").load_override({}, "williamboman/mason.nvim").ensure_installed
local mapping = require("mason-null-ls.mappings.source").package_to_null_ls;
local source_types = {"formatting", "diagnostics", "hover", "completion", "code_actions"}
local sources = {}
for _, package_name in ipairs(mason_items) do
  local source_name = mapping[package_name]
  if source_name then
    for _, srcs in ipairs(source_types) do
      local source_ok, source = pcall(require, "null-ls.builtins."..srcs.."."..source_name)
      if source_ok then
        table.insert(sources, source)
      end
    end
  end
end

null_ls.setup({sources=sources})
