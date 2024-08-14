return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons', "yavorski/lualine-macro-recording.nvim" },
	opts = {
		theme = 'auto',
		sections = {
			lualine_a = { 'mode' },
			lualine_b = { 'branch', 'diff', },
			lualine_c = { 'filename', 'macro_recording' },
			lualine_x = { 'filetype' },
			lualine_y = { 'diagnostics' },
			lualine_z = { 'selectioncount', 'searchcount', 'location', },
		},
	}
}
