local opts = { noremap = true, silent = true }
local term_opts = { slient = true }

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

-- Normal --

-- Sane redo
keymap("n", "U", "<C-r>", opts)

-- Ctrl + hjkl to move windows (instead of Ctrl-w; k)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-w>", "<C-w>c", opts)

-- Split windows
keymap("n", "<leader>sv", "<C-w>v", opts)
keymap("n", "<leader>sh", "<C-w>s", opts)

-- Tabs
keymap("n", "<leader>to", ":tabnew<CR>", opts)
keymap("n", "<leader>tx", ":tabclose<CR>", opts) -- can just use <C-w> to close all the windows
keymap("n", "<S-Tab>", ":tabp<CR>", opts)
keymap("n", "<Tab>", ":tabn<CR>", opts)

-- Open file browser (30 chars wide)
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>E", ":NvimTreeFocus<cr>", opts)

-- Cycle buffers
-- keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
-- keymap("n", "<Tab>", ":bnext<CR>", opts)

-- Increment/Decrement numbers
-- keymap("n", "<leader>+", "<C-a>", opts)
-- keymap("n", "<leader>-", "<C-x>", opts)

-- Quick Indent (requires using visual mode to do multi-line)

keymap("n", "<", "<<", opts)
keymap("n", ">", ">>", opts)

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
keymap("n", "<C-O>", "<cmd>Telescope git_files<cr>", opts) -- jetbrains-like
keymap("n", "<C-S-O>", "<cmd>Telescope git_files<cr>", opts) -- jetbrains-like (dupe that fixes iterm2 on mac)
keymap("n", "<leader>ff", "<cmd>Telescope live_grep<cr>", opts) -- sort of jetbrains-like
keymap("n", "<leader>faf", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<C-A-O>", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<C-F>", "<cmd>Telescope live_grep<cr>", opts) -- jetbrains-like
keymap("n", "<C-S-F>", "<cmd>Telescope live_grep<cr>", opts) -- jetbrains-like
keymap("n", "<leader>tt", "<cmd>Telescope<cr>", opts)
keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", opts)
keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
