---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.plugins, {
  "nvim-telescope/telescope-live-grep-args.nvim",
})
-- lvim.builtin.telescope.defaults.pickers.colorscheme = { enable_preview = true } -- TODO this doesn't work

lvim.builtin.telescope.pickers.oldfiles = { cwd_only = true }

lvim.builtin.telescope.on_config_done = function()
  require("telescope").load_extension "live_grep_args"
end

function get_hovered_directory()
    local lib = require("nvim-tree.lib")
    local node = lib.get_node_at_cursor()

    if node and node.type == "directory" then
        return node.absolute_path
    end

    return nil
end

function find_in()
  local dir = get_hovered_directory()
  if dir then
    vim.cmd(":Telescope live_grep search_dirs="..dir)
  else
    print("No dir.")
  end
end

vim.api.nvim_command("command! FindIn lua find_in()")
