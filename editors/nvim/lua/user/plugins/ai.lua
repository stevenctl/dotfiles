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
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
		opts = {
			-- add any opts here
			-- for example
			provider = "claude",
			auto_suggestions_provider = "openai",
			openai = {
				endpoint = "https://api.openai.com/v1",
				model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
				timeout = 30000, -- timeout in milliseconds
				temperature = 0, -- adjust if needed
				max_tokens = 4096,
			},
			behaviour = {
				auto_suggestions = false,
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

			}
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
	-- {
	-- 	"robitx/gp.nvim",
	-- 	config = function()
	-- 		local default_chat_system_prompt = "You are a general AI assistant.\n\n"
	-- 				.. "The user provided the additional info about how they would like you to respond:\n\n"
	-- 				.. "- If you're unsure don't guess and say you don't know instead.\n"
	-- 				.. "- Ask question if you need clarification to provide better answer.\n"
	-- 				.. "- Think deeply and carefully from first principles step by step.\n"
	-- 				.. "- Zoom out first to see the big picture and then zoom in to details.\n"
	-- 				.. "- Use Socratic method to improve your thinking and coding skills.\n"
	-- 				.. "- Don't elide any code from your output if the answer requires coding.\n"
	-- 				.. "- Take a deep breath; You've got this!\n"
	--
	-- 		local default_code_system_prompt = "You are an AI working as a code editor.\n\n"
	-- 				.. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
	-- 				.. "START AND END YOUR ANSWER WITH:\n\n```"
	-- 		local cfg = {
	-- 			chat_user_prefix = "You:",
	-- 			providers = {
	-- 				openai = {
	-- 					disable = false,
	-- 					endpoint = "https://api.openai.com/v1/chat/completions",
	-- 				},
	-- 				ollama = {
	-- 					disable = false,
	-- 					endpoint = "http://localhost:11434/v1/chat/completions",
	-- 				},
	-- 			},
	-- 			agents = {
	-- 				-- ChatGPT
	-- 				{
	-- 					name = "ChatGPT4o",
	-- 					chat = true,
	-- 					command = false,
	-- 					model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
	-- 					system_prompt = default_chat_system_prompt,
	-- 				},
	-- 				{
	-- 					provider = "openai",
	-- 					name = "CodeGPT4o",
	-- 					chat = false,
	-- 					command = true,
	-- 					model = { model = "gpt-4o", temperature = 0.8, top_p = 1 },
	-- 					system_prompt = default_code_system_prompt,
	-- 				},
	-- 				-- ollama (codegemma)
	-- 				{
	-- 					provider = "ollama",
	-- 					name = "ChatGemma",
	-- 					chat = true,
	-- 					command = true,
	-- 					model = { model = "codegemma" },
	-- 					system_prompt = default_chat_system_prompt,
	-- 				},
	-- 				{
	-- 					provider = "ollama",
	-- 					name = "CodeGemma",
	-- 					chat = false,
	-- 					command = true,
	-- 					model = { model = "codegemma" },
	-- 					system_prompt = default_code_system_prompt,
	-- 				},
	-- 				-- disable default ollama
	-- 				{
	-- 					provider = "ollama",
	-- 					name     = "ChatOllamaLlama3",
	-- 					disable  = true,
	-- 				},
	-- 				{
	-- 					provider = "ollama",
	-- 					name     = "CodeOllamaLlama3",
	-- 					disable  = true,
	-- 				},
	-- 			}
	-- 		}
	-- 		if gpt_ok then
	-- 			cfg.openai_api_key = gpt_api_key
	-- 		end
	-- 		require("gp").setup(cfg)
	-- 	end,
	-- }
}
