require("user.keymaps")
require("user.plugins")
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
local opts = require("user.options")

---@diagnostic disable-next-line: lowercase-global
function polish()
	opts.set_user_opts()
end
