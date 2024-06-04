local notify = require("notify")

-- Table to store the last visited time for each terminal buffer
local terminal_buffers = {}

-- Function to update the last visited time for a terminal buffer
local function update_terminal_buffer_time()
	local bufnr = vim.api.nvim_get_current_buf()
	if vim.bo[bufnr].buftype == 'terminal' then
		terminal_buffers[bufnr] = os.time()
	end
end

-- Autocommand to update the last visited time when entering a terminal buffer
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "term://*",
	callback = update_terminal_buffer_time,
})
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = update_terminal_buffer_time,
})

-- Function to find the most recently visited terminal buffer
local function find_most_recent_terminal_buffer()
	local most_recent_bufnr = nil
	local most_recent_time = 0
	for bufnr, last_visited in pairs(terminal_buffers) do
		if last_visited > most_recent_time then
			most_recent_time = last_visited
			most_recent_bufnr = bufnr
		end
	end
	return most_recent_bufnr
end

local function toggle_term()
	-- TODO automatically find a good window that's not a qflist or filebrowser or dap

	-- Case 1: No existing terminal, create a new one
	local bufnr = find_most_recent_terminal_buffer()
	if bufnr == nil or not vim.api.nvim_buf_is_loaded(bufnr) then
		notify("New terminal")
		vim.api.nvim_command("terminal")
		vim.api.nvim_command("startinsert")
		return
	end

	-- Case 2: Currently in a terminal, go back to previously edited buffer
	if vim.bo[vim.api.nvim_get_current_buf()].buftype == 'terminal' then
		vim.api.nvim_command("b#")
		return
	end

	-- Case 3: In a non-terminal, go to the most recent terminal
	vim.api.nvim_set_current_buf(bufnr)
end

return toggle_term
