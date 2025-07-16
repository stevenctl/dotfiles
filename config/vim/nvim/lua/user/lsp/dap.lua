local function get_last_test()
	local path = vim.fn.stdpath("data") .. "/dap_go_last_test.txt"
	local file = io.open(path, "r")
	if file then
		local content = file:read("*a")
		file:close()
		return content:gsub("\n", "")
	end
	return ""
end

local function save_last_test(test_name)
	local path = vim.fn.stdpath("data") .. "/dap_go_last_test.txt"
	local file = io.open(path, "w")
	if file then
		file:write(test_name)
		file:close()
	end
end

local golang = {
	-- :help dap-configuration
	dap_configurations = {
		{
			-- Must be "go" or it will be ignored by the plugin
			type = "go",
			name = "Attach remote",
			mode = "remote",
			request = "attach",
		},
		{
			type = "go",
			name = "Debug specific test",
			request = "launch",
			mode = "test",
			program = "./${relativeFileDirname}",
			outputMode = "remote",
			args = function()
				local test_name = vim.fn.input('Test name: ', get_last_test())
				if test_name ~= "" then
					save_last_test(test_name)
				end
				return { "-test.run", test_name }
			end,
		}
	},
	-- delve configurations
	delve = {
		port = "40000",
		args = {},
		build_flags = "",
		detached = true,
		cwd = nil,
	},
}

return {
	{ 'mfussenegger/nvim-dap' },
	{
		'leoluz/nvim-dap-go',
		dependencies = { 'mfussenegger/nvim-dap' },
		config = golang,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = true,
	},
}
