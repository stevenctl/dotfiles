local ok, projects = pcall(require, "project_nvim")
if not ok then
	return
end

projects.setup({
	silent_chdir = false,
})
