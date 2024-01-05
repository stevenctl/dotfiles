local colorscheme = "everforest"
local enable_transparency = true
vim.o.termguicolors = true

-- Installed themes
local themes = {
    "sainnhe/edge",
    { "gbprod/nord.nvim" },
    { "rmehri01/onenord.nvim" },
    { "sainnhe/everforest",        name = "everforest" },
    { "catppuccin/nvim",           name = "catppuccin" },
    { 'AlphaTechnolog/pywal.nvim', name = 'wal' }
}

-- Everforest
vim.g.everforest_transparent_background = 1
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
        "Normal",
        "SignColumn",
        "NormalNC",
        "TelescopeBorder",
        "NvimTreeNormal",
        "NvimTreeNormalNC",
        "EndOfBuffer",
        "MsgArea",
      }
      for _, name in ipairs(hl_groups) do
        vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
      end
    end,
  })
  vim.opt.fillchars = "eob: "
end

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
