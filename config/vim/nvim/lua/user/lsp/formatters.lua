return
{
	'mhartington/formatter.nvim',
	config = function()
		local util = require("formatter.util")
		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				gdscript = {
					function()
						return {
							exe = "gdformat",
							args = { util.escape_path(util.get_current_buffer_file_path()) },
						}
					end
				},
			},
		})
	end
}
