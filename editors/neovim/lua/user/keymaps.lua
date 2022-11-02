local opts = { noremap = true, silent = true }
local term_opts = { slient = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Make space the leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable Arrow Keys --
for i, mode in ipairs({"n", "i", "v"}) do
	for j, key in ipairs({"<Left>", "<Right>", "<Up>", "<Down>"}) do
		keymap(mode, key, "<ESC>", opts)
	end
end

-- Normal --

-- Sane redo
keymap("n", "U", "<C-r>", opts)

-- Ctrl + hjkl to move windows (instead of Ctrl-w; k)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-w>", "<C-w>c", opts)

-- Open file browser (30 chars wide)
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Cycle buffers
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<Tab>", ":bnext<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
-- TODO make it so out of range dosn't break visual mode

-- Select --
keymap("s", "p", "p", opts) -- fix writing the letter P in function name

-- Telescope --
keymap("n", "<leader>ff", "<cmd>Telescope git_files<cr>", opts)
keymap("n", "<leader>faf", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>tt", "<cmd>Telescope<cr>", opts)
keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", opts)

