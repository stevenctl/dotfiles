-- local dap = require("dap")
--
-- -- dap.configurations.python = {
-- -- 	{
-- -- 		type = "python",
-- -- 		request = "launch",
-- -- 		name = "Launch file",
-- -- 		program = "${file}",
-- -- 		pythonPath = function()
-- -- 			return "/opt/homebrew/bin/python3"
-- -- 		end,
-- -- 	},
-- -- }
--
-- dap.configurations.rust = { {
-- 	name = "Launch rust",
-- 	type = "lldb",
-- 	request = "launch",
-- 	program = "${file}",
-- } }