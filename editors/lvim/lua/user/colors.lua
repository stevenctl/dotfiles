---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.plugins, {
  { "sainnhe/edge" },
  { "gbprod/nord.nvim" },
  { "rmehri01/onenord.nvim" },
  { "sainnhe/everforest", name = "everforest" },
  { "catppuccin/nvim", name = "catppuccin" }
})
lvim.transparent_window = true

-- lvim.colorscheme = "edge"
-- vim.g.edge_transparent_background = 1

vim.g.everforest_transparent_background = 1
vim.g.everforest_background = "hard"
lvim.colorscheme        = "everforest"


vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.cmd("highlight Comment cterm=italic ctermfg=250 gui=italic guifg=#c5cdd9")
  end
})
