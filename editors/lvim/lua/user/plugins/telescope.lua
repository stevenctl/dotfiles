---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.plugins, {
  "nvim-telescope/telescope-live-grep-args.nvim",
})
-- lvim.builtin.telescope.defaults.pickers.colorscheme = { enable_preview = true } -- TODO this doesn't work

lvim.builtin.telescope.pickers.oldfiles = { cwd_only = true }

lvim.builtin.telescope.on_config_done = function()
  require("telescope").load_extension "live_grep_args"
end
