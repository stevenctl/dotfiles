local ok, alpha = pcall(require, "alpha")
if not ok then
	return
end

local ok, dashboard = pcall(require, "alpha.themes.dashboard")
if not ok then
	return
end
local button = dashboard.button

dashboard.section.buttons.val = {
	button("e", "  New file", "<cmd>ene <CR>"),
	button("SPC o", " Open file"),
	button("SPC O", "  Open recent file"),
	button("SPC f f", "  Find text"),
	button("SPC p", "ﮛ Open project"),
	-- button("SPC f r", "  Frecency/MRU"),
	-- button("SPC f m", "  Jump to bookmarks"),
	-- button("SPC s l", "  Open last session"),
	-- 
}

alpha.setup(dashboard.config)
