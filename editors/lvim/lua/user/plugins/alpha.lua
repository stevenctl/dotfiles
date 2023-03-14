lvim.builtin.alpha.dashboard.section.header.val = {
  "Shall we play a game?",
  "                     ",
  "        x┃x┃o        ",
  "       ━━╋━╋━━       ",
  "        o┃x┃         ",
  "       ━━╋━╋━━       ",
  "        x┃o┃o        ",
  "                     ",
}

-- lvim.builtin.alpha.dashboard.section.header.val = {
--   -- "Shall we play a game?",
--   "░█▀▀▀█ █  █ █▀▀█ █   █   　 █   █ █▀▀ 　 █▀▀█ █   █▀▀█ █  █ 　 █▀▀█ 　 █▀▀▀ █▀▀█ █▀▄▀█ █▀▀ ▀█ ",
--   " ▀▀▀▄▄ █▀▀█ █▄▄█ █   █   　 █▄█▄█ █▀▀ 　 █  █ █   █▄▄█ █▄▄█ 　 █▄▄█ 　 █ ▀█ █▄▄█ █ ▀ █ █▀▀ █▀ ",
--   "░█▄▄▄█ ▀  ▀ ▀  ▀ ▀▀▀ ▀▀▀ 　  ▀ ▀  ▀▀▀ 　 █▀▀▀ ▀▀▀ ▀  ▀ ▄▄▄█ 　 ▀  ▀ 　 ▀▀▀▀ ▀  ▀ ▀   ▀ ▀▀▀ ▄  ",
-- }

local status_ok, dashboard = pcall(require, "alpha.themes.dashboard")
if not status_ok then
  print("no alpha.themes.dashboard")
  return
end

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl_shortcut = "Include"
  return b
end

local tnw = ":lua print('A strange game. The only winning move is not to play. How about a nice game of chess?')<CR>"
lvim.builtin.alpha.dashboard.section.buttons = {
  val = {
    button("f", lvim.icons.ui.FindFile .. "  Find File", "<CMD>Telescope find_files<CR>"),
    button("n", lvim.icons.ui.NewFile .. "  New File", "<CMD>ene!<CR>"),
    button("p", lvim.icons.ui.Project .. "  Projects ", "<CMD>Telescope projects<CR>"),
    button("r", lvim.icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>"),
    button("t", lvim.icons.ui.FindText .. "  Find Text", "<CMD>Telescope live_grep<CR>"),
    button("x", "" .. "  Global Thermonuclear War", tnw),
    button(
      "c",
      lvim.icons.ui.Gear .. "  Configuration",
      "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>"
    ),
  },
}

-- "⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣶⣿⣿⣿⣿⣿⣿⣿⣶⣦⣀⠀⠀⠀⠀⠀⠀⠀",
-- "⠀⠀⠀⠀⠀⠀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀",
-- "⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀ ",
-- "⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣛⣻⣿⣿⣟⣿⣿⣿⣷⠀⠀⠀",
-- "⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣫⣽⣾⣻⣾⣿⣿⣿⣿⡿⣿⣿⠀⠀⠀",
-- "⠀⠀⠀⢰⣿⣿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠻⡿⠿⠟⠛⣟⣿⣽⠀⠀⠀",
-- "⠀⠀⠀⠸⣿⣿⣿⣷⣿⣿⣿⣿⡿⠍⠈⠀⠁⣴⡆⠀⠀⠠⢭⣮⣿⡶⠀⠀",
-- "⠀⡴⠲⣦⢽⣿⣿⣿⣿⣿⣟⣩⣨⣀⡄⣐⣾⣿⣿⣇⠠⣷⣶⣿⣿⡠⠁⠀",
-- "⠀⠃⢀⡄⠀⢻⣿⣿⣿⣿⣽⢿⣿⣯⣾⣿⣿⣿⣿⣿⢿⣿⣿⡟⣿⠀⠀⠀",
-- "⠀⠀⠣⠧⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢸⣿⠿⠿⠿⣧⠙⣿⣿⡿⠀⠀⠀",
-- "⠀⠀⠀⠁⠼⣒⡿⣿⣿⣿⣿⣿⣿⣿⣠⣬⠀⠀⠀⠀⣾⣷⡈⣿⡇⠀⠀⠀",
-- "⠀⠀⠀⠀⠀⠉⢳⣿⣿⣿⣿⣿⣿⣿⢟⠗⠼⠖⠒⠔⠉⠉⠻⣿⠇⠀⠀⠀",
-- "⠀⠀⠀⠀⠀⠀⠈⣻⡿⣿⣿⣿⣿⡿⡀⣤⡄⠸⣰⣾⡒⣷⣴⣿⠀⠀⠀⠀",
-- "⠀⠀⠀⠀⠀⠀⠂⢸⡗⡄⠘⠭⣭⣷⣿⣮⣠⣌⣫⣿⣷⣿⣿⠃⠀⠈⠀⠀",
-- "⠀⠀⠀⠀⠀⠈⠀⢸⣿⣾⣷⣦⡿⣿⣿⣿⡿⢻⠞⣹⣿⣿⠏⠀⠀⠀⠀⠀",
-- "⠀⠀⠀⠀⠀⢘⠀⠘⢻⡿⢿⣋⣤⣤⠌⠉⠛⠛⠀⠈⠉⠁⠀⠀⠀⠀⠀⡀",
