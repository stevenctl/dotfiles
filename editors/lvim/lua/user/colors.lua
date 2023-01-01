---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.plugins, {
  {"sainnhe/edge"},
  {"gbprod/nord.nvim"},
  -- {""},
})
vim.g.edge_transparent_background  = 1
lvim.colorscheme = "edge"

