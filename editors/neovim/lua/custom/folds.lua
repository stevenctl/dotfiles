vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  command = "normal zR",
})

