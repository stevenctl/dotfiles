return {
	"nvimdev/lspsaga.nvim",
	config = true,
	opts = {
		symbol_in_winbar = { enable = false },
		lightbulb = { sign = false },
		ui = {
			devicon = false,
			code_action = "󱐋",
		},
	},
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
}
