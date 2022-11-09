local opts = { noremap = true, silent = true }
-- local term_opts = { slient = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Make space the leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable Arrow Keys --
for _, mode in ipairs({ "n", "i", "v" }) do
	for _, key in ipairs({ "<Left>", "<Right>", "<Up>", "<Down>" }) do
		keymap(mode, key, "<ESC>", opts)
	end
end
-- Easy Exit Term
keymap("t", "<S-ESC>", "<C-\\><C-N>", opts)

-- Normal --
-- Jetbrains-like formatting
keymap("n", "<M-C-L>", ":doautocmd BufWritePre<cr>", opts)
keymap("n", "<C-S-O>", ":echoerr 'This is not Jetbrains (try SPC o)'<cr>", opts) -- old habits..
-- Better Redo
keymap("n", "U", "<C-r>", opts)

-- Better Window Navigation (C-hjkl)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Tabs (really buffers)
keymap("n", "<M-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<M-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<M-w>", ":bdelete<CR>", opts)
keymap("n", "<M-W>", ":bdelete!<CR>", opts)

-- Normal Mode Quick Indent (requires using visual mode to do multi-line)
keymap("n", "<", "<<", opts)
keymap("n", ">", ">>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<M-j>", ":m .+1<CR>==", opts)
keymap("v", "<M-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<M-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<M-k>", ":move '<-2<CR>gv-gv", opts)

-- Fix the use of snippets where we type p in some section
keymap("s", "p", "p", opts)

local wk_ok, wk = pcall(require, "which-key")
if not wk_ok then
	print("Warning: which-key not found!")
end

-- Anything starting with <leader> goes here!
wk.setup({
	plugins = {
		-- consider setting registers = false
		presets = {
			operators = false, -- dyc etc
			motions = false, -- hjkl etc
			nav = false, -- window nav is easy
		},
	},
})
wk.register({
	e = { "<cmd>NvimTreeFocus<cr>", "Explorer" },
	-- o = { "<cmd>Telescope find_files<cr>", "Open File" },
	o = { "<cmd>Telescope find_files<cr>", "Open File" },
	O = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
	p = { "<cmd>Telescope projects<cr>", "Open Project" },
	w = { "<cmd>w<cr>", "Write File" },
	b = { "<cmd>Telescope buffers<cr>", "Buffer Pick" },
	f = {
		name = "Find...",
		f = { "<cmd>Telescope live_grep_args<cr>", "Text" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		h = { "<cmd>Telescope help_tags<cr>", "Help" },
		c = { "<cmd>Telescope commands", "Commands" },
		t = { "<cmd>Telescope<cr>", "Telescope" },
	},
	t = {
		name = "Test...",
		t = { ":TestNearest<cr>", "Run" },
		f = { ":TestFile<cr>", "Run File" },
		s = { ":TestSuite<cr>", "Run Suite" },
	},
	d = {
		name = "Debug...",
		b = { ":lua require('dap').toggle_breakpoint()<cr>", "Breakpoint" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
		D = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
		g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
		u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
		p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
		s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
		q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
		U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
	},
	q = { "<cmd>TroubleToggle<cr>", "Trouble" },
	-- TODO n create files/scratch files
	s = {
		name = "Split...",
		h = { "<C-w>s", "Horizontal" },
		v = { "<C-w>v", "Vertical" },
	},
	g = {
		name = "Git...",
		s = { "<cmd>Telescope git_status<cr>", "Status" },
		f = { "<cmd>Telescope git_files<cr>", "Files" },
		b = { "<cmd>Telescope git_branches<cr>", "Branches" },
		l = { "<cmd>Telescope git_commits<cr>", "Log (commits)" },
	},
	h = { "<cmd>nohl<cr>", "which_key_ignore" },
	["<CR>"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "" },
}, { prefix = "<leader>" })
