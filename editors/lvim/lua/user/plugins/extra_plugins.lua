local user_plugins = {
  -- {
  --   "j-hui/fidget.nvim",
  --   version = "legacy",
  --   config = function()
  --     require("fidget").setup()
  --   end,
  -- },
  {
    "echasnovski/mini.surround",
    config = function()
      require("mini.surround").setup()
    end,
  },
  { "sindrets/diffview.nvim" }
}

---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.plugins, user_plugins)
