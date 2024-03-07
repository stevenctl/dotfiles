vim.g.mapleader = " "
vim.opt.scrolloff = 12
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.undofile = true
vim.opt.signcolumn = "yes:1"

-- TODO install treesitter for folds?
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Powershell on Windows
if string.find(vim.loop.os_uname().sysname, "Windows") then
  vim.opt.shell = vim.fn.executable "pwsh" and "pwsh" or "powershell"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
end
