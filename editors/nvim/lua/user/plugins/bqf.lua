return {
	"kevinhwang91/nvim-bqf",
	event = { "BufRead", "BufNew" },
	config = function()
		require("bqf").setup({
			magic_window = true,
			auto_resize_height = true,
			auto_enable = true,
			preview = {
				win_height = 12,
				win_vheight = 12,
				delay_syntax = 80,
				border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
			},
			func_map = {
				vsplit = "",
				ptogglemode = "z,",
				stoggleup = "",
			},
			filter = {
				fzf = {
					action_for = { ["ctrl-s"] = "split" },
					extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
				},
			},
		})
	end,
}
