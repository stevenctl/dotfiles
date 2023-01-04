local user_plugins = {
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
  },
  {
    "tpope/vim-surround",
  },
}

---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.plugins, user_plugins)
