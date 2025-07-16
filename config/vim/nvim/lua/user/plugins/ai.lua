local gpt_ok, gpt_api_key = pcall(require, "user.plugins.openai_api_key")
if gpt_ok then
	vim.fn.setenv("OPENAI_API_KEY", gpt_api_key)
end


local claude_ok, claude_key = pcall(require, "user.plugins.claude_api_key")
if claude_ok then
	vim.fn.setenv("ANTHROPIC_API_KEY", claude_key)
end


vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "",
	callback = function()
		if vim.bo.filetype == "Avante" then
			vim.cmd("stopinsert")
		end
	end,
})


return {
	{
			"ravitemer/mcphub.nvim",
			dependencies = {
					"nvim-lua/plenary.nvim",
			},
			build = "npm install -g mcp-hub@latest",  -- Installs `mcp-hub` node binary globally
			config = function()
					require("mcphub").setup()
			end
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- never set this to "*"! never! (accoring to avante's readme)
		opts = {
			provider = "claude",
			-- cursor_applying_provider = "openai",
			-- auto_suggestions_provider = "openai",
			behaviour = {
				auto_suggestions = false, -- expensive! slow! wrong!
				minimize_diff = true,
				enable_cursor_planning_mode = true,
			},
			providers = {
				openai = {
					model = "gpt-4o",
					extra_request_body = {
						-- timeout = 30000,
						temperature = 0,
						max_tokens = 16384,
						-- reasoning_effort = "medium",
					},
				},
				claude = {
					model = "claude-sonnet-4-0",
					-- extra_request_body = {
					-- 	timeout = 30000,
					-- 	temperature = 0.25,
					-- 	max_tokens = 16384,
					-- },
					-- Claude configuration is automatically set up through the API key
				},
			},
			mappings = {
				diff = {
					ours = "co",
					theirs = "ct",
					all_theirs = "ca",
					both = "cb",
					cursor = "cc",
					next = "]x",
					prev = "[x",
				},
				suggestion = {
					accept = "<M-l>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
				jump = {
					next = "]]",
					prev = "[[",
				},
				submit = {
					normal = "<CR>",
					insert = "<C-CR>",
				},
				cancel = {
					normal = { "<C-c>", "<Esc>", "q" },
					insert = { "<C-c>" },
				},
				sidebar = {
					apply_all = "A",
					apply_cursor = "a",
					retry_user_request = "r",
					edit_user_request = "e",
					switch_windows = "<Tab>",
					reverse_switch_windows = "<S-Tab>",
					remove_file = "d",
					add_file = "@",
					close = { "<Esc>", "q" },
					close_from_input = nil, -- e.g., { normal = "<Esc>", insert = "<C-d>" }
				},

			},
			-- system_prompt as function ensures LLM always has latest MCP server state
			-- This is evaluated for every message, even in existing chats
			system_prompt = function()
					local hub = require("mcphub").get_hub_instance()
					return hub and hub:get_active_servers_prompt() or ""
			end,
			-- Using function prevents requiring mcphub before it's loaded
			custom_tools = function()
					return {
							require("mcphub.extensions.avante").mcp_tool(),
					}
			end,
		},

		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"echasnovski/mini.pick",      -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp",           -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua",           -- for file_selector provider fzf
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua",     -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				'MeanderingProgrammer/render-markdown.nvim',
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}
