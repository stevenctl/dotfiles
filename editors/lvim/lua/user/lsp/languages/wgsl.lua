local wgsl_cmd = {
  pattern = { "*.wgsl" },
  command = "setfiletype wgsl",
}
vim.api.nvim_create_autocmd("BufNewFile", wgsl_cmd)
vim.api.nvim_create_autocmd("BufRead", wgsl_cmd)

local lsp_manager = require "lvim.lsp.manager"
lsp_manager.setup("wgsl_analyzer")
