local ok, dressing = pcall(require, "dressing")
if not ok then
	return
end
dressing.setup({
	select = {
		enabled = true,
		-- TODO figure out how to "merge" with
		telescope = { initial_mode = "normal", layout_strategy = "cursor" },
	},
})
