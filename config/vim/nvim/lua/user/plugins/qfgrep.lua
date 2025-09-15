local function QFgrepFilter(pattern)
	local inverse = string.match(pattern, '^-v ')
	local pat = inverse and string.sub(pattern, 4) or pattern

	local qflist = vim.fn.getqflist()
	local filtered = {}

	for _, item in ipairs(qflist) do
		local bufname = vim.fn.bufname(item.bufnr)
		local text = item.text or ""

		if inverse then
			if not (string.match(bufname, pat) or string.match(text, pat)) then
				table.insert(filtered, item)
			end
		else
			if string.match(bufname, pat) or string.match(text, pat) then
				table.insert(filtered, item)
			end
		end
	end

	vim.fn.setqflist(filtered)
end

vim.api.nvim_create_user_command('QFgrep', function(opts)
	QFgrepFilter(opts.args)
end, { nargs = 1 })
