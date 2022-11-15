local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

local config = {}
local leader = "<C-_>" -- this is what I got using gnome term
if vim.fn.has("mac") == 1 then
	leader = "<C-/>" -- on iterm2 in mac
end
for _, k in ipairs({ "opleader", "toggler" }) do
	config[k] = {
		line = leader,
	}
end

comment.setup(config)
