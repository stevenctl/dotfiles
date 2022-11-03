local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end

autopairs.setup({
	check_ts = true, -- enable treesitter integration
	ts_config = {}, -- TODO maybe we want something here?
})

-- make it work with completion (cmp)
local status_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not status_ok then
	return
end

local status_ok, cmp = pcall(require, "")
if not status_ok then
	return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
