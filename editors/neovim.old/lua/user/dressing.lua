local ok, dressing = pcall(require, "dressing")
if not ok then
	return
end
dressing.setup({
	select = {
		enabled = true,
		-- TODO figure out how to "merge" with default layout opts... this is ugly when overriding
		-- telescope = {
		-- 	initial_mode = "normal",
		-- 	layout_strategy = "cursor",
		-- },
	},
})
