-- Easyclose for a lot of things
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"checkhealth",
		"fugitive*",
		"git",
		"help",
		"lspinfo",
		"netrw",
		"notify",
		"qf",
		"query",
	},
	callback = function()
		vim.keymap.set("n", "q", vim.cmd.close, { desc = "Close the current buffer", buffer = true })
	end,
})

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
