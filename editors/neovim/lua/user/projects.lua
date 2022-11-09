local ok, projects = pcall(require, "project_nvim")
if not ok then
	return
end

projects.setup({
	silent_chdir = false,
	detection_methods = { "pattern" }, -- lsp is annoying with multiple langs
	patterns = {
		"Cargo.toml",
		"go.mod",
		"requirements.txt",
		".git",
		"_darcs",
		".hg",
		".bzr",
		".svn",
		"Makefile",
		"package.json",
	},
})
