vim.api.nvim_create_autocmd("BufNewFile,BufRead", {
  pattern = { "*.wgsl" },
  command = "setfiletype wgsl",
})

local lsp_manager = require "lvim.lsp.manager"
lsp_manager.setup("wgsl_analyzer")
