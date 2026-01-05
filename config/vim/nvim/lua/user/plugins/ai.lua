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
		"zbirenbaum/copilot.lua",
		event = "VeryLazy",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					accept = false,
				},
				panel = { enabled = false },
				filetypes = { ["*"] = true },
			})
			vim.keymap.set("i", '<S-Tab>', function()
				if require("copilot.suggestion").is_visible() then
					require("copilot.suggestion").accept()
				end
			end)
		end
	},
	{
		"jim-at-jibba/nvim-redraft",
		dependencies = {
			{ "folke/snacks.nvim", opts = { input = {} } },
		},
		event = "VeryLazy",
		build = "cd ts && npm install && npm run build",
		opts = {
			{ provider = "copilot", model = "gpt-5-mini", label = "Copilot GPT-5-mini" },
		},
	},
}
