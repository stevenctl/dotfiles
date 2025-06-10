local map = require("user.util").map
local toggle_term = require("user.terminals")
local gh_link = require("user.githublink")


-- QoL
map.n("U", "<C-R>", "Undo")
map.n("<ESC>", ":noh<cr>", "No Highlight")
map.n("<leader>cn", ":Navbuddy<CR>", "Navbuddy")
map.n("<M-K>", vim.diagnostic.open_float, "Diangostic float")

-- start/end jump
map.n("H", "^", "Start of line")
map.n("L", "$", "End of line")
map.v("H", "^", "Start of line")
map.v("L", "$", "End of line")
map.o("H", "^", "Start of line")
map.o("L", "$", "End of line")

-- AI
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'Avante', 'AvanteInput', 'AvanteSelectedFiles' },
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = false }
		map.n("q", ":AvanteToggle<cr>", "AI Toggle", opts)
		map.n("<esc>", "<nop>", "noop", opts)
	end
})
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'Avante', 'AvanteSelectedFiles' },
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = false }
		local function focus_prompt()
			for _, win in ipairs(vim.api.nvim_list_wins()) do
				local buf = vim.api.nvim_win_get_buf(win)
				local filetype = vim.api.nvim_buf_get_option(buf, 'filetype')
				if filetype == 'AvanteInput' then
					vim.api.nvim_set_current_win(win)
					vim.api.nvim_command('startinsert')
					break
				end
			end
		end
		map.n("i", focus_prompt, "noop", opts)
	end
})
map.n("<leader>aC", ":AvanteClear<cr>:AvanteRefresh<CR>", "avante: clear")
map.n("<leader>aR", ":AvanteRefresh<cr>", "avante: refresh")
map.n("<leader>aP", ":AvanteSwitchProvider<cr>", "avante: provider")
map.v("<leader>ar", function() require("avante.api").edit() end, "avante: edit")
map.x("<leader>ar", function() require("avante.api").edit() end, "avante: edit")

-- map.n("<leader>ar", ":GpRewrite<cr>", "AI rewrite inplace")
-- map.v("<leader>ar", ":GpRewrite<cr>", "AI rewrite inplace")
-- map.n("<leader>aw", ":GpVnew<cr>", "AI rewrite in vsplit")
-- map.v("<leader>aw", ":GpVnew<cr>", "AI rewrite in vsplit")
-- map.n("<leader>ai", ":GpImplement<cr>", "AI implement based on comments")
-- map.v("<leader>ai", ":GpImplement<cr>", "AI implement based on comments")
-- map.n("<leader>aa", ":GpNextAgent<cr>", "AI next agent")

-- k8s
map.n("<leader>k", require("kubectl").toggle, "kubectl")

-- Quickfix
map.n("<leader>q", ":copen<cr>", "Quickfix toggle")
map.n("<leader>Q", vim.diagnostic.setloclist, "Diagnostic loclist")

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
map.v("p", 'p:let @+=@0<CR>:let @"=@0<CR>', "paste")
map.x("p", 'p:let @+=@0<CR>:let @"=@0<CR>', "paste (before)")

-- File browsing
local function open_file()
	local ok, _ = pcall(vim.api.nvim_command, "Telescope smart_open")
	if not ok then
		vim.notify("smart-open failed.. fallback to Telescope git_files")
		vim.api.nvim_command("Telescope git_files")
	end
end

map.n("<leader>e", ":NvimTreeFocus<CR>", "NVIMTree")
map.n("<C-F>", ":FindIn<CR>", "Find in Tree")
map.n("<leader>o", open_file, "Open file")
map.n("<leader>O", "<cmd> Telescope oldfiles <CR>", "Open recent file")

-- Terminal
map.n("<C-\\>", toggle_term, "Terminal toggle")
map.t("<C-\\>", "<C-\\><C-n>", "Terminal normal mode")

-- cycle through buffers
map.n("<TAB>", ":bnext<CR>", "Buffer next")
map.n("<S-TAB>", ":bprev<CR>", "Buffer prev")
map.n("<M-TAB>", ":b#<CR>", "Buffer last")
map.n("<leader><TAB>",
	":Telescope buffers path_display={'smart'} theme=get_cursor previewer=false initial_mode=normal<CR>", "Buffer pick")
map.n("<leader>x", ":bd<CR>", "Buffer delete")

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
map.n("<leader>vA", "<cmd>:Gitsigns stage_hunk<cr>", "Git stage hunk")
map.n("<leader>vs", "<cmd>Telescope git_status<cr>", "Git status")
map.n("<leader>vb", "<cmd>Telescope git_branches<cr>", "Git branches")
map.n("<leader>vl", "<cmd>Telescope git_commits<cr>", "Git commits")
map.n("<leader>vL", "<cmd>Telescope git_bcommits<cr>", "Git commits (current buffer)")
map.n("<leader>vd", "<cmd>Gitsigns diffthis HEAD<cr>", "Git diff")
map.n("<leader>vu", gh_link, "Github URL")

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
map.n("<leader>/", "gcc", "Comment toggle", { noremap = false })
map.v("<leader>/", "gc", "Comment toggle")
map.x("<leader>/", "gc", "Comment toggle")

-- LSP related
local function fix_trail()
	local ts_ok, MiniTrailspace = pcall(require, "mini.trailspace")
	if ts_ok then
		MiniTrailspace.trim()
		MiniTrailspace.trim_last_lines()
	end
end
local function format()
	fix_trail()
	vim.lsp.buf.format()
	vim.cmd("Format")
end

map.n("<M-F>", fix_trail, "fix whitespace")
map.n("<leader>cd", vim.diagnostic.open_float, "Diagnostic float")
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'


		local opts = { buffer = ev.buf, silent = false }
		map.n("<M-F>", format, "Format code", opts)
		map.n("<leader>ca", ":Lspsaga code_action<CR>", "Code action", opts)
		map.n("[d", vim.diagnostic.goto_prev, "Diagnostic prev", opts)
		map.n("d]", vim.diagnostic.goto_next, "Diagnostic next", opts)
		map.n("<leader>d", vim.diagnostic.open_float, "Diagnostic info", opts)
		map.n("K", vim.lsp.buf.hover, "Hover info", opts)
		map.n("gd", vim.lsp.buf.definition, "Goto definition", opts)
		map.n("gr", vim.lsp.buf.references, "Goto references", opts)
		map.n("gt", vim.lsp.buf.type_definition, "Goto type definition", opts)
		map.n("gD", vim.lsp.buf.declaration, "Goto declaration", opts)
		map.n("gI", vim.lsp.buf.implementation, "Goto implementation", opts)
		map.n("<leader>lr", ":Lspsaga rename<CR>", "rename", opts)
		map.n("<leader>lR", ":Lspsaga project_replace<CR>", "project replace", opts)
		map.n("<leader>lo", ":Lspsaga outline<CR>", "outline code", opts)
	end
})
