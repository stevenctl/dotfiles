local ok, alpha = pcall(require, "alpha")
if not ok then
	return
end

local ok, dashboard = pcall(require, "alpha.themes.dashboard")
if not ok then
	return
end

local function button(key, text, cmd)
	local btn = dashboard.button(key, text, cmd)
	btn.opts.hl_shortcut = "Function"
	return btn
end

dashboard.section.buttons.val = {
	button("e", " New file", "<cmd>ene <CR>"),
	button("SPC o", " Open file"),
	button("SPC O", " Open recent file"),
	button("SPC p", "ﮛ Open project"),
	button("SPC f f", " Find text"),
	-- button("SPC f r", "  Frecency/MRU"),
	-- button("SPC f m", "  Jump to bookmarks"),
	-- button("SPC s l", "  Open last session"),
	-- 
}

dashboard.section.header.opts.hl = "Number"
dashboard.section.header.val = {
	[[    n           (∩｀-´) ⊃━ ☆ ﾟ. * ･｡ ﾟ                    ]],
	[[   / `\                                                   ]],
	[[  (___:)                                                  ]],
	[[   """"                                     .-'~~~-.      ]],
	[[    ||                                   .'o  oOOOo`.     ]],
	[[    ||            __     _   ___        :~~~-.oOo   o`.   ]],
	[[    ))       ___ / /____| | / (_)_ _    `. \ ~-.  oOOo.   ]],
	[[   //       (_-</ __/ -_) |/ / /  ' \     `.; / ~.  OO:   ]],
	[[  ((       /___/\__/\__/|___/_/_/_/_/     .'  ;-- `.o.'   ]],
	[[   \\                  __               ,'  ; ~~--'~      ]],
	[[    ))                (__)   ◠          ;  ;              ]],
	[[   //_\|/____\|/_______||____▮_______\\;_\\//___\|/       ]],
}
local fortune = require("alpha.fortune")
dashboard.section.footer.val = fortune({ fortune_list = require("user.quotes") })
dashboard.section.footer.opts.hl = "Keyword"
alpha.setup(dashboard.config)
