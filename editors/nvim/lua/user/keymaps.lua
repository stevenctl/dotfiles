local map = require("user.util").map


-- QoL
map.n("U", "<C-R>", "Undo")
map.n("<leader>cn", ":Navbuddy<CR>", "Navbuddy")
map.n("<leaderq", vim.diagnostic.setloclist, "diagnostic loclist")

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
map.v("p", 'p:let @+=@0<CR>:let @"=@0<CR>', "paste")
map.x("p", 'p:let @+=@0<CR>:let @"=@0<CR>', "paste (before)")

-- File browsing
map.n("<leader>e", ":NvimTreeFocus<CR>", "NVIMTree")
map.n("<C-F>", ":FindIn<CR>", "Find in Tree")
map.n("<leader>o", "<cmd> Telescope find_files <CR>", "Open file")
map.n("<leader>O", "<cmd> Telescope oldfiles <CR>", "Open recent file")

-- cycle through buffers
map.n("<TAB>", ":bnext<CR>", "Buffer next")
map.n("<S-TAB>", ":bprev<CR>", "Buffer prev")
map.n("<leader><TAB>", ":Telescope buffers<CR>", "Buffer pick")
map.n("<leader>x", ":BufferKill<CR>", "Buffer kill")

-- window nav
map.n("<C-h>", "<C-w>h", "Window left")
map.n("<C-j>", "<C-w>j", "Window down")
map.n("<C-k>", "<C-w>k", "Window up")
map.n("<C-l>", "<C-w>l", "Window right")

-- splits
map.n("<leader>sv", ":vsplit<cr>", "Split vertical")
map.n("<leader>sh", ":split<cr>", "Split horizontal")


-- find
map.n("<leader>ff", "<cmd> Telescope live_grep_args <CR>", "Find in files")
map.n("<leader>fb", "<cmd> Telescope buffers <CR>", "Buffer pick")
map.n("<leader>fh", "<cmd> Telescope help_tags <CR>", "Help")
map.n("<leader>fk", "<cmd> Telescope keymaps <CR>", "Keymaps finder")
-- map.n("<leader>ft", "<cmd> Telescope terms <CR>", "terminals")
-- map.n("<leader>fT", "<cmd> Telescope themes <CR>", { silent = true })

-- git
map.n("<leader>vj", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "")
map.n("<leader>vk", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "")
map.n("<leader>vB", "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Git blame")
map.n("<leader>vh", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Git hunk")
map.n("<leader>vr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Git revert hunk")
map.n("<leader>vR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Git revert buffer")
map.n("<leader>vs", "<cmd>Telescope git_status<cr>", "Git status")
map.n("<leader>vb", "<cmd>Telescope git_branches<cr>", "Git branches")
map.n("<leader>vl", "<cmd>Telescope git_commits<cr>", "Git commits")
map.n("<leader>vL", "<cmd>Telescope git_bcommits<cr>", "Git commits (current buffer)")
map.n("<leader>vd", "<cmd>Gitsigns diffthis HEAD<cr>", "Git diff")

-- dap
map.n("<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "DAP Breakpoint")

-- dap -- flow control
map.n("<leader>dc", "<cmd>lua require'dap'.continue()<cr>", "DAP Continue")
map.n("<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", "DAP Continue to cursor")
map.n("<leader>di", "<cmd>lua require'dap'.step_into()<cr>", "DAP step into")
map.n("<leader>do", "<cmd>lua require'dap'.step_over()<cr>", "DAP step over")
map.n("<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", "DAP step out")
map.n("<leader>dp", "<cmd>lua require'dap'.pause()<cr>", "DAP pause")

-- dap -- UI
map.n("<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", "DAP repl")
map.n("<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", "DAP toggle UI")

-- dap -- lifecycle
map.n("<leader>dd", "<cmd>lua require'dap'.continue()<cr>", "DAP continue")
map.n("<leader>dq", "<cmd>lua require'dap'.close()<cr>", "DAP close")
map.n("<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", "DAP terminate")
map.n("<leader>dD", "<cmd>lua require'dap'.disconnect()<cr>", "DAP disconnect")
map.n("<leader>dg", "<cmd>lua require'dap'.session()<cr>", "DAP session")


-- Comments
map.n("<leader>/", "<Plug>(comment_toggle_linewise_current)", "Comment toggle")
map.v("<leader>/", "<Plug>(comment_toggle_linewise_current)", "Comment toggle")
map.x("<leader>/", "<Plug>(comment_toggle_linewise_current)", "Comment toggle")

-- LSP related
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'


		local opts = { buffer = ev.buf }
		map.n("<M-C-L>", vim.lsp.buf.format, "Format code", opts)
		map.n("<leader><CR>", ":Lspsaga code_action<CR>", "Code action", opts)
		map.n("[d", vim.diagnostic.goto_prev, "Diagnostic prev", opts)
		map.n("d]", vim.diagnostic.goto_next, "Diagnostic next", opts)
		map.n("<leader>d", vim.diagnostic.open_float, "Diagnostic info", opts)
		map.n("K", vim.lsp.buf.hover, "Hover info", opts)
		map.n("gd", vim.lsp.buf.definition, "Goto definition", opts)
		map.n("gr", vim.lsp.buf.references, "Goto references", opts)
		map.n("gt", vim.lsp.buf.type_definition, "Goto type definition", opts)
		map.n("gD", vim.lsp.buf.declaration, "Goto declaration", opts)
		map.n("gI", vim.lsp.buf.implementation, "Goto implementation", opts)
		map.n("lr", ":Lspsaga rename<CR>", "rename", opts)
		map.n("lR", ":Lspsaga project_replace<CR>", "project replace", opts)
		map.n("lo", ":Lspsaga outline<CR>", "outline code", opts)
	end
})
