-- Create an augroup for yank highlighting
local yank_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

-- Set up an autocommand for TextYankPost
vim.api.nvim_create_autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
  end,
})
