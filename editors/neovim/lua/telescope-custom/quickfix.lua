local from_entry = require("telescope.from_entry")
local action_state = require("telescope.actions.state")

local entry_to_qf = function(entry)
	local text = entry.text

	if not text then
		if type(entry.value) == "table" then
			text = entry.value.text
		else
			text = entry.value
		end
	end

	return {
		bufnr = entry.bufnr,
		filename = from_entry.path(entry, false, false),
		lnum = vim.F.if_nil(entry.lnum, 1),
		col = vim.F.if_nil(entry.col, 1),
		text = text,
	}
end

-- Differs with the original by:
-- Not closing the prompt buffer TODO does this matter? what does that mean? closing the picker?
-- Don't append an empty ().
local custom_send_all_to_qf = function(prompt_bufnr)
	local picker = action_state.get_current_picker(prompt_bufnr)
	for k, v in pairs(picker) do
		if type(k) == "string" and type(v) == "string" then
			print(k .. " => " .. v)
		end
	end
	local manager = picker.manager
	local qf_entries = {}
	for entry in manager:iter() do
		table.insert(qf_entries, entry_to_qf(entry))
	end

	local prompt = picker:_get_prompt()
	-- Might want to save the entries for later
	-- Actually.. can we make all the LSP stuff just always use quickfix?
	-- actions.close(prompt_bufnr)

	vim.fn.setqflist(qf_entries)
	local qf_title = picker.prompt_title
	if prompt.len() > 0 then
		qf_title = string.format([[%s (%s)]], picker.prompt_title, prompt)
	end
	vim.fn.setqflist({}, "a", { title = qf_title })
end

return custom_send_all_to_qf
