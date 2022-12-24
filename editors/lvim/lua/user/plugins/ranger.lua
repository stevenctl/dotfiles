---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.plugins, {
  {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_pick_enable = 1
      vim.g.rnvimr_bw_enable = 1
    end,
  },
})
lvim.keys.normal_mode["<C-n>"] = { ":RnvimrToggle<cr>" }
