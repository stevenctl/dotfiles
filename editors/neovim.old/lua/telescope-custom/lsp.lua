local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
	return
end

local M = {
	lsp_references = builtin.lsp_references,
	lsp_incoming_calls = builtin.lsp_incoming_calls,
	lsp_outgoing_calls = builtin.lsp_outgoing_calls,
	lsp_definitions = builtin.lsp_definitions,
	lsp_type_definitions = builtin.lsp_type_definitions,
	lsp_implementations = builtin.lsp_implementations,
	lsp_document_symbols = builtin.lsp_document_symbols,
	lsp_workspace_symbols = builtin.lsp_workspace_symbols,
	lsp_dynamic_workspace_symbols = builtin.lsp_dynamic_workspace_symbols,
}

-- Modifies the built-in LSP pickers to include the highlighted word in the title.
-- TODO maybe include the filename or directory or something. Can get advanced and
-- handle things like "package fn, show directory for Go, module/file for Rust" or things
-- like "module name.type_name.propertyOrMethodName"
for k, v in pairs(M) do
	M[k] = function(opts)
		if opts == nil then
			opts = {}
		end
		local title_underscored = k:sub(5)
		local title = ""
		for _, part in ipairs(vim.fn.split(title_underscored, "_")) do
			title = title .. (part:gsub("^%l", string.upper))
		end
		opts["prompt_title"] = title .. " (" .. vim.fn.expand("<cword>") .. ")"
		v(opts)
	end
end

return M
