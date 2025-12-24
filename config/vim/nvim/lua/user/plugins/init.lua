-- Install lazy.nvim plugin manager
require("user.plugins.lazy-install")
local ok, lazy = pcall(require, "lazy")
if not ok then
	print("lazy.nvim not installed")
	return
end

-- my custom "plugins"
require("user.plugins.qfgrep")

-- Install plugins
lazy.setup(flatten_plugin_list(
	{

		-- AI
		require("user.plugins.ai"),

		-- General Editing
		require("user.plugins.todo"),
		require("user.plugins.bqf"),
		-- { "lukas-reineke/indent-blankline.nvim",     main = "ibl",  opts = {} },
		{ "nmac427/guess-indent.nvim",               config = true },
		{ "nvim-treesitter/nvim-treesitter-context", config = true },
		{ "LunarVim/bigfile.nvim",                   config = true },


		-- snacks! from folke
		{
			"folke/snacks.nvim",
			priority = 1000,
			lazy = false,
			---@type snacks.Config
			opts = {
				animate = { enabled = true },
				bigfile = { enabled = true },
				bufdelete = { enabled = true },
				explorer = {
					enabled = true,
					diagnostics = false,
					auto_close = true
				},
				git = { enabled = true },
				gitbrowse = { enabled = true },
				gh = { enabled = true },
				image = { enabled = true },
				indent = { enabled = true },
				input = { enabled = true },
				picker = {
					enabled = true,
					formatters = {
						file = {
							filename_first = true,
						},
					},
					layout = function()
						if vim.o.columns >= 160 then
							return { preset = "telescope", cycle = true }
						elseif vim.o.columns >= 100 then
							return {
								cycle = true,
								reverse = true,
								layout = {
									backdrop = false,
									width = 0.5,
									height = 0.6,
									box = "vertical",
									border = true,
									title = "{title}",
									title_pos = "center",
									{ win = "preview", title = "{preview}", height = 0.5,   border = "bottom" },
									{ win = "list",    border = "bottom" },
									{ win = "input",   height = 1,          border = "none" },
								},
							}
						else
							return {
								cycle = true,
								reverse = true,
								layout = {
									backdrop = false,
									width = 0.9,
									height = 0.9,
									box = "vertical",
									border = true,
									title = "{title}",
									title_pos = "center",
									{ win = "list",  border = "bottom" },
									{ win = "input", height = 1,       border = "none" },
								},
							}
						end
					end,
					win = {
						input = {
							keys = {
								["<Tab>"] = { "list_down", mode = { "i", "n" } },
								["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
								["<C-p>"] = { "toggle_preview", mode = { "i", "n" } },
							},
						},
					},
					sources = {
						-- no preview for file pickers
						buffers = { layout = { preset = "select" } },
						files = { preview = false },
						smart = { preview = false },
						recent = { preview = false },
						-- preview for search/git pickers
						grep = {
							preview = true,
							actions = {
								filter_filetype = function(picker)
									vim.ui.input({ prompt = "Filetype (-t, empty to clear): " }, function(ft)
										if ft == nil then return end -- cancelled
										picker.opts.ft = ft ~= "" and ft or nil
										picker:find({ refresh = true })
									end)
								end,
							},
							win = {
								input = {
									keys = {
										["<c-t>"] = { "filter_filetype", mode = { "n", "i" } },
									},
								},
							},
						},
						grep_word = { preview = true },
						lines = { preview = true },
						git_status = { preview = true },
						git_log = { preview = true },
						git_log_file = { preview = true },
						git_log_line = { preview = true },
						git_diff = { preview = true },
					},
				},
				rename = { enabled = true },
				scope = { enabled = true },
				words = { enabled = true },
				zen = { enabled = true },
			},
			keys = {
				-- file explorer
				{ "<leader>e",       function() Snacks.explorer({ diagnostics = false }) end,   desc = "File Explorer" },

				-- close current buffer
				{ "<leader>x",       function() Snacks.bufdelete() end,                         desc = "Close Buffer" },
				{ "<leader>X",       function() Snacks.bufdelete.all() end,                     desc = "Close all buffers" },

				-- pickers
				{ "<leader>o",       function() Snacks.picker.smart() end,                      desc = "Open File" },
				{ "<leader>O",       function() Snacks.picker.recent() end,                     desc = "Recent Files" },
				{ "<leader>:",       function() Snacks.picker.commands() end,                   desc = "Commands",                      mode = { "n", "v", "x" } },
				-- big TODO: ff is not fuzzy enough!
				{ "<leader>ff",      function() Snacks.picker.grep() end,                       desc = "Find in Files (Grep)" },
				{ "<leader>/",       function() Snacks.picker.lines() end,                      desc = "Find in current file" },
				{ "<leader>fw",      function() Snacks.picker.grep_word() end,                  desc = "Find Word or Selection (Grep)", mode = { "n", "v", "x" } },
				{ "<leader><tab>",   function() Snacks.picker.buffers() end,                    desc = "Buffer Picker" },
				{ "<leader>fh",      function() Snacks.picker.help() end,                       desc = "Help Tags" },
				{ "<leader>fk",      function() Snacks.picker.keymaps() end,                    desc = "Keymaps Finder" },
				{ "<leader><space>", function() Snacks.picker.resume() end,                     desc = "Resume last picker" },
				{ "<leader>fq",      function() Snacks.picker.qflist() end,                     desc = "Find in Quickfix List" },

				-- LSP
				-- TODO consider definitionsreferences using the picker
				{ "gy",              function() Snacks.picker.lsp_type_definitions() end,       desc = "Goto T[y]pe Definition" },
				{ "gai",             function() Snacks.picker.lsp_incoming_calls() end,         desc = "C[a]lls Incoming" },
				{ "gao",             function() Snacks.picker.lsp_outgoing_calls() end,         desc = "C[a]lls Outgoing" },

				-- git
				{ "<leader>vs",      function() Snacks.picker.git_status() end,                 desc = "Git Status" },
				{ "<leader>vb",      function() Snacks.picker.git_branches() end,               desc = "Git Branches" },
				{ "<leader>vl",      function() Snacks.picker.git_log() end,                    desc = "Git Commits" },
				{ "<leader>vL",      function() Snacks.picker.git_log_line() end,               desc = "Git Buffer Commits" },
				{ "<leader>vH",      function() Snacks.picker.git_log_file() end,               desc = "Git Buffer Commits" },
				{ "<leader>vd",      function() Snacks.picker.git_diff({ staged = false }) end, desc = "Git Diff" },




				-- map.n("<leader>vA", "<cmd>:Gitsigns stage_hunk<cr>", "Git stage hunk")
				-- map.n("<leader>vs", "<cmd>Telescope git_status<cr>", "Git status")
				-- map.n("<leader>vb", "<cmd>Telescope git_branches<cr>", "Git branches")
				-- map.n("<leader>vl", "<cmd>Telescope git_commits<cr>", "Git commits")
				-- map.n("<leader>vL", "<cmd>Telescope git_bcommits<cr>", "Git commits (current buffer)")
				-- map.n("<leader>vd", "<cmd>Gitsigns diffthis HEAD<cr>", "Git diff")

				-- map.n("<leader>ff", "<cmd> Telescope live_grep_args <CR>", "Find in files")
				-- map.n("<leader>fb", "<cmd> Telescope buffers <CR>", "Buffer pick")
				-- map.n("<leader>fh", "<cmd> Telescope help_tags <CR>", "Help")
				-- map.n("<leader>fk", "<cmd> Telescope keymaps <CR>", "Keymaps finder")
			}

		},



		-- Mini QoL
		{ 'echasnovski/mini.ai',         version = '*', config = true }, -- extra text objects
		{ 'echasnovski/mini.surround',   version = '*', config = true }, -- edit surrounding area
		{ 'echasnovski/mini.pairs',      version = '*', config = true }, -- autopairs
		{ 'echasnovski/mini.move',       version = '*', config = true }, -- use alt-hjkl to move text
		{ 'echasnovski/mini.splitjoin',  version = '*', config = true }, -- gS toggles arguments on one or separate line
		{ 'echasnovski/mini.trailspace', version = '*', config = true }, -- fix trailing spaces (keymapped with formatting)

		-- what is happening in the background
		{
			"j-hui/fidget.nvim",
			opts = {
				progress = { display = { render_limit = 8 } },
				notification = { window = { align = "top" } },
			}
		},

		-- Keymapping
		require("user.plugins.clue"),


		-- Colorschemes and beautification
		require("user.colors"),
		require("user.plugins.lualine"),
		{
			'rcarriga/nvim-notify',
			config = true,
			opts = {
				background_colour = "#000000",
			}
		},

		-- File navigation
		-- require("user.plugins.nvimtree"),
		-- require("user.plugins.telescope"),

		-- LSP, completion, etc
		require("user.plugins.cmp"),
		require("user.lsp"),

		-- Git
		{ "lewis6991/gitsigns.nvim", config = true },
		{ "sindrets/diffview.nvim",  config = true },

		-- Kubernetes
		{ "ramilito/kubectl.nvim",   config = true },

		{
			"mistricky/codesnap.nvim",
			build = "make",
			opts = {
				watermark = "",
				bg_padding = 0,
			}
		},

		-- Database
		{
			"kndndrj/nvim-dbee",
			requires = {
				"MunifTanjim/nui.nvim",
			},
			run = function()
				require("dbee").install()
			end,
			config = function()
				require("dbee").setup( --[[optional config]])
			end
		},
	}
))
