return {
	"numToStr/Comment.nvim",
	config = true,
	opts = {
		padding = true,
		sticky = true,
		ignore = "^$",
		opleader = {
			---Line-comment keymap
			line = ' /',
			---Block-comment keymap
			block = 'gb',
		},
	}
}
