require("user.plugins")
require("user.keymaps")
require("user.colorscheme")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.comment")
require("user.nvim-tree")
require("user.autopairs")
require("user.treesitter")
require("user.bufferline")
require("user.lualine")
require("user.dressing")
require("user.dashboard")
require("user.projects")
require("user.dap")
local opts = require("user.options")

---@diagnostic disable-next-line: lowercase-global
function polish()
	opts.set_user_opts()
end