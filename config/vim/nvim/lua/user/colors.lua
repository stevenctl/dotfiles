local colorscheme = "kanagawa-dragon"
-- local colorscheme = "everforest"
local enable_transparency = true
vim.o.termguicolors = true
-- vim.o.background = "kanagawa-dragon"

-- Installed themes
local themes = {
  "sainnhe/edge",
  { "gbprod/nord.nvim" },
  { "rmehri01/onenord.nvim" },
  { "sainnhe/everforest",        name = "everforest" },
  { "catppuccin/nvim",           name = "catppuccin" },
  { 'AlphaTechnolog/pywal.nvim', name = 'wal' },
  { "rebelot/kanagawa.nvim",     opts = { transparent = true } },
}

-- Everforest
vim.g.everforest_transparent_background = enable_transparency and 1 or 0
vim.g.everforest_background = "hard"

-- Edge
vim.g.edge_transparent_background = 1

-- Fix comments
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.cmd("highlight Comment cterm=italic ctermfg=250 gui=italic guifg=#c5cdd9")
  end
})

-- Transparency
if enable_transparency then
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
      local hl_groups = {
        "LineNr",
        "Normal",
        "SignColumn",
        "NormalNC",
        "TelescopeBorder",
        "NvimTreeNormal",
        "NvimTreeNormalNC",
        "EndOfBuffer",
        "MsgArea",
        "GitSignsAdd",
        "GitSignsChange",
        "GitSignsDelete",

        "DiagnosticVirtualTextError",
        "DiagnosticError",
        "DiagnosticSignError",
        "DiagnosticSignHint",
        "DiagnosticSignInfo",
        "DiagnosticSignWarn",
      }
      for _, name in ipairs(hl_groups) do
        vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
      end
    end,
  })
  vim.opt.fillchars = "eob: "
end

-- Recover old scheme when leaving without confirmation
-- vim.api.nvim_create_autocmd("CmdlineLeave", {
--   callback = function()
--     local cmd_type = vim.fn.getcmdtype()
--     local cmdline = vim.fn.getcmdline()
--
--     if cmdline ~= nil and cmd_type == ":" and not cmdline:match("^colorscheme%s+") then
--       -- If the command was not confirmed, rollback to the original colorscheme
--       vim.cmd("colorscheme " .. original_colorscheme)
--     else
--       original_colorscheme = vim.g.colors_name
--     end
--   end,
-- })
--
--


-- local original_colorscheme = vim.g.colors_name
--
-- vim.api.nvim_create_autocmd("CmdlineEnter", {
--   callback = function()
--     original_colorscheme = vim.g.colors_name
--   end
-- })
--
--
-- vim.api.nvim_create_autocmd("CmdlineLeave", {
--   callback = function()
--     vim.api.nvim_command("colorscheme " .. original_colorscheme)
--   end
-- })

-- As the user changes their command, immediately show the colorscheme
vim.api.nvim_create_autocmd("CmdlineChanged", {
  callback = function()
    local cmd_type = vim.fn.getcmdtype()
    local cmdline = vim.fn.getcmdline()


    if cmdline ~= nil and cmd_type == ":" and cmdline:match("^colorscheme%s+") then
      pcall(vim.api.nvim_command, cmdline)
    end
  end
})



return {
  themes[1],
  -- HACK: install all but one theme as deps
  -- so they can share a config func
  dependencies = vim.list_slice(themes, 2, #themes),
  lazy = false,
  priority = 1000,
  config = function(_, _)
    _, _ = pcall(vim.cmd.colorscheme, colorscheme)
  end
}
