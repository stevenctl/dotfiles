---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.plugins, {
  { "sainnhe/edge" },
  { "gbprod/nord.nvim" },
  { "rmehri01/onenord.nvim" },
  { "catppuccin/nvim", as = "catppuccin" }
})
lvim.transparent_window = true
-- vim.g.edge_transparent_background = 1
lvim.colorscheme        = "catppuccin"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.cmd("highlight Comment cterm=italic ctermfg=250 gui=italic guifg=#c5cdd9")
  end
})
