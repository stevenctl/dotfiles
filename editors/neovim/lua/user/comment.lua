local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

local config = {}
for _, k in ipairs({"opleader", "toggler"}) do
	config[k] = {
		line = "<C-_>",
	}
end

comment.setup(config)

