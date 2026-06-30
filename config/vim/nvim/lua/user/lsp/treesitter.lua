vim.opt.smartindent = false
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local ts = require("nvim-treesitter")
		ts.setup({})

		local function start(buf, lang)
			vim.treesitter.start(buf, lang)
			vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.wo[0][0].foldmethod = "expr"
		end

		-- main branch has no modules; enable highlighting/folds per buffer,
		-- auto-installing missing parsers (replaces auto_install = true)
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("user.treesitter", { clear = true }),
			callback = function(ev)
				local lang = vim.treesitter.language.get_lang(ev.match)
				if not lang then
					return
				end
				if vim.tbl_contains(ts.get_installed(), lang) then
					start(ev.buf, lang)
				elseif vim.tbl_contains(ts.get_available(), lang) then
					ts.install(lang):await(function(err)
						if not err and vim.api.nvim_buf_is_valid(ev.buf) then
							vim.api.nvim_buf_call(ev.buf, function()
								start(ev.buf, lang)
							end)
						end
					end)
				end
			end,
		})
	end,
}
