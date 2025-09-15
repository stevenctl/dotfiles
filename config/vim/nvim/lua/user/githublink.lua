local function copy_github_permalink()
	-- Ensure this function is running within Neovim; otherwise, exit
	if not vim then
		print("This script is intended to run within Neovim.")
		return
	end

	-- Identify the necessary GitHub details - Assumption: Hardcoded repo details.
	local handle = io.popen("git remote get-url origin")
	local remote_url = ""
	if handle then
		remote_url = handle:read("*a"):gsub("\n", "")
		handle:close()
	else
		print("Failed to get git remote URL")
		return
	end

	-- Get the current branch name
	local branch_handle = io.popen("git rev-parse --abbrev-ref HEAD")
	local current_branch = "main"
	if branch_handle then
		current_branch = branch_handle:read("*a"):gsub("\n", "")
		branch_handle:close()
	end
	
	local github_base_url = remote_url:gsub("%.git$", ""):gsub("^git@github.com:", "https://github.com/") .. "/blob/" .. current_branch .. "/"

	-- Get the current file's relative path within the repository
	local filepath = vim.fn.expand('%')

	-- Get the current line number
	local line_number = vim.fn.line('.')

	-- Construct the permalink URL
	local permalink = string.format("%s%s#L%d", github_base_url, filepath, line_number)

	-- Yank permalink into the system clipboard register
	vim.fn.setreg('+', permalink)

	-- Notify the user
	vim.notify(permalink)
end

return copy_github_permalink
