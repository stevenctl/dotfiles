-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "lunar"
vim.opt.scrolloff = 12

-- Monorepo root dirs
lvim.builtin.project.patterns = {
  ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml",
  "project.godot", "go.mod", "Cargo.toml"
}

-- User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.api.nvim_create_autocmd("BufReadPost,FileReadPost", {
--   pattern = { "*.json", "*.jsonc" },
--   command = "zR",
-- })
--

-- Powershell on Windows

if string.find(vim.loop.os_uname().sysname, "Windows") then
  vim.opt.shell = vim.fn.executable "pwsh" and "pwsh" or "powershell"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
end
