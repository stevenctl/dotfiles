local user_plugins = {
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
  },
}

---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.plugins, user_plugins)
