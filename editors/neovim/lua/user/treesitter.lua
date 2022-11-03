local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

---@diagnostic disable-next-line: unused-local
local specific_grammars = {
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
}

treesitter.setup({
	highlight = { enable = true },
	indent = { enable = true },
	autotag = { enable = true }, -- TODO install autotag plugin
	auto_install = true,
	sync_install = false,
	auto_update = true,
	ensure_installed = "all",
	additional_vim_regex_highlighting = true,
})
