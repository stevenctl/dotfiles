local colorscheme = "spacedark"

if vim.fn.has("termguicolors") == 1 then
	vim.cmd("set termguicolors")
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " failed!")
	return
end
