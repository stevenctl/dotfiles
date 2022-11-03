local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter.setup({
	highlight = { enable = true },
	indent = { enable = true },
	autotag = { enable = true }, -- TODO install autotag plugin
	auto_install = true,
	-- TODO use "maintained" and see if it affects perf
	ensure_installed = {
		"markdown",
		"json",
		"yaml",
		"toml",
		"gitignore",
		"dockerfile",

		"javascript",
		"typescript",
		"tsx",
		"html",
		"css",
		"graphql",

		"bash",
		"python",
		"lua",

		"go",
		"rust",
		"c",
		"c_sharp",
		"cmake",
		"cpp",

		"proto",
		"sql",

		"hlsl",
		"wgsl",
		"glsl",
	},
})
