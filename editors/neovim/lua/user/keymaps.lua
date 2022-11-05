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

-- Note on macs (maybe an automated warning is possible?)
-- Mac with iTerm2 treats Ctrl+Letter as C-CAPITAL always.
-- To differentiate, we use C-S-LETTER
-- Also, Ctrl+A looks too much like Ctrl+Alt so we use M-C
-- Use this search to find these things:
-- 		C-[A-Z]

-- Normal --

-- Format
keymap("n", "<M-C-L>", ":doautocmd BufWritePre<cr>", opts)
-- Sane redo
keymap("n", "U", "<C-r>", opts)

-- Unhighlight
keymap("n", "<leader>hh", ":nohl<cr>", opts)

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
local bufferline, _ = pcall(require, "bufferline")
if bufferline then
	-- note these are doing buffer stuff because of barbar
	keymap("n", "<M-h>", ":BufferLineCyclePrev<CR>", opts)
	keymap("n", "<M-l>", ":BufferLineCycleNext<CR>", opts)
	keymap("n", "<M-w>", ":bdelete<CR>", opts)
	keymap("n", "<M-W>", ":bdelete!<CR>", opts)
else
	keymap("n", "<leader>to", ":tabnew<CR>", opts)
	keymap("n", "<leader>tx", ":tabclose<CR>", opts) -- i'll probably just ctrl+w each window :/
	keymap("n", "<M-h>", ":tabp<CR>", opts)
	keymap("n", "<M-l>", ":tabn<CR>", opts)
end

-- Open file browser
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
keymap("v", "<M-j>", ":m .+1<CR>==", opts)
keymap("v", "<M-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<M-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<M-k>", ":move '<-2<CR>gv-gv", opts)
-- TODO make it so out of range dosn't break visual mode

-- Select --
keymap("s", "p", "p", opts) -- fix writing the letter P in function name

-- Telescope --

if vim.fn.has("mac") == 0 then
	keymap("n", "<C-O>", "<cmd>Telescope find_files<cr>", opts)
	keymap("n", "<C-M-O>", "<cmd>Telescope git_filescr>", opts)
	keymap("n", "<C-F>", "<cmd>Telescope live_grep<cr>", opts)
end
keymap("n", "<C-S-O>", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<M-C-S-O>", "<cmd>Telescope git_filescr>", opts)
keymap("n", "<C-S-F>", "<cmd>Telescope live_grep<cr>", opts)

keymap("n", "<leader>faf", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>ff", "<cmd>Telescope git_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>tt", "<cmd>Telescope<cr>", opts)
keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", opts)
keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
