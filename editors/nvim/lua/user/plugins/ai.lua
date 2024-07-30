return {
	"robitx/gp.nvim",
	config = function()
		local default_chat_system_prompt = "You are a general AI assistant.\n\n"
				.. "The user provided the additional info about how they would like you to respond:\n\n"
				.. "- If you're unsure don't guess and say you don't know instead.\n"
				.. "- Ask question if you need clarification to provide better answer.\n"
				.. "- Think deeply and carefully from first principles step by step.\n"
				.. "- Zoom out first to see the big picture and then zoom in to details.\n"
				.. "- Use Socratic method to improve your thinking and coding skills.\n"
				.. "- Don't elide any code from your output if the answer requires coding.\n"
				.. "- Take a deep breath; You've got this!\n"

		local default_code_system_prompt = "You are an AI working as a code editor.\n\n"
				.. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
				.. "START AND END YOUR ANSWER WITH:\n\n```"
		local cfg = {
			chat_user_prefix = "You:",
			providers = {
				openai = {
					disable = false,
					endpoint = "https://api.openai.com/v1/chat/completions",
				},
				ollama = {
					disable = false,
					endpoint = "http://localhost:11434/v1/chat/completions",
				},
			},
			agents = {
				-- ChatGPT
				{
					name = "ChatGPT4o",
					chat = true,
					command = false,
					model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
					system_prompt = default_chat_system_prompt,
				},
				{
					provider = "openai",
					name = "CodeGPT4o",
					chat = false,
					command = true,
					model = { model = "gpt-4o", temperature = 0.8, top_p = 1 },
					system_prompt = default_code_system_prompt,
				},
				-- ollama (codegemma)
				{
					provider = "ollama",
					name = "ChatGemma",
					chat = true,
					command = true,
					model = { model = "codegemma" },
					system_prompt = default_chat_system_prompt,
				},
				{
					provider = "ollama",
					name = "CodeGemma",
					chat = false,
					command = true,
					model = { model = "codegemma" },
					system_prompt = default_code_system_prompt,
				},
				-- disable default ollama
				{
					provider = "ollama",
					name     = "ChatOllamaLlama3",
					disable  = true,
				},
				{
					provider = "ollama",
					name     = "CodeOllamaLlama3",
					disable  = true,
				},
			}
		}
		local gpt_ok, gpt_api_key = pcall(require, "user.plugins.openai_api_key")
		if gpt_ok then
			cfg.openai_api_key = gpt_api_key
		end
		require("gp").setup(cfg)
	end,
}
