local map = require("user.util").map

-- QoL
map.n("U", "<C-R>", {})    -- sane redo
map.n("<ESC>", ":noh<CR>", {})

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
map.v("p", 'p:let @+=@0<CR>:let @"=@0<CR>', { silent = true })
map.x("p", 'p:let @+=@0<CR>:let @"=@0<CR>', { silent = true })

-- File browsing
map.n("<leader>e", ":NvimTreeFocus<CR>", {})
map.n("<C-F>", ":FindIn<CR>", {})

-- cycle through buffers
map.n("<TAB>", ":BufferLineCycleNext<CR>", {})
map.n("<S-TAB>", ":BufferLineCyclePrev<CR>", {})

-- Comments
map.n("<leader>/", "<Plug>(comment_toggle_linewise_current)", {})
map.v("<leader>/", "<Plug>(comment_toggle_linewise_current)", {})

-- LSP related
map.n("<M-C-L>", vim.lsp.buf.format, {})
map.n("<leader><CR>", vim.lsp.buf.code_action, {})
map.n("[d", vim.diagnostic.goto_prev, {})
map.n("d]", vim.diagnostic.goto_next, {})
map.n("<leader>q", vim.diagnostic.setloclist, {})


-- Register this later with the plugin
local M = {}

M.which_keys = {
	-- preserved built-in
	-- l = lvim.builtin.which_key.mappings.l, -- lsp
	-- b = lvim.builtin.which_key.mappings.b, -- buffers

	-- frequent
	o = { "<cmd> Telescope find_files <CR>", "open file" },
	O = { "<cmd> Telescope oldfiles <CR>", "recent file" },
	x = { ":BufferKill<CR>", "buffer kill" },
	["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle" },

	-- splits
	s = {
		name = "Splits",
		v = { ":vsplit<cr>", "Vertical Split" },
		h = { ":split<cr>", "Vertical Split" },
	},

	-- find
	f = {
		name = "Find",
		f = { "<cmd> Telescope live_grep_args <CR>", "live grep" },
		b = { "<cmd> Telescope buffers <CR>", "buffers" },
		h = { "<cmd> Telescope help_tags <CR>", "help pages" },
		a = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "all files" },
		k = { "<cmd> Telescope keymaps <CR>", "find key mappings" },
		t = { "<cmd> Telescope terms <CR>", "find terminal" },
		T = { "<cmd> Telescope themes <CR>", "nvchad themes" },
	},

	-- git
	v = {
		name = "VCS",
		j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
		B = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		h = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>Telescope git_status<cr>", "Git status" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		l = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		L = {
			"<cmd>Telescope git_bcommits<cr>",
			"Checkout commit(for current file)",
		},
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Git Diff",
		},
	},

	-- DAP
	d = {
		name = "Debug",

		b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },

		-- flow control
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
		O = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
		p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },

		-- UI
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
		u = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },

		-- lifecycle
		d = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
		q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
		t = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
		D = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
		g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
	},

	-- Code (mostly customized per-LSP)
	c = {
		name = "Code",
		s = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
	}
}

return M
