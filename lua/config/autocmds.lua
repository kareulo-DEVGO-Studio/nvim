vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('WinResized', {
  desc = 'Equalize splits when windows resize',
  group = vim.api.nvim_create_augroup('equalize-splits', { clear = true }),
  callback = function()
    vim.cmd 'wincmd ='
  end,
})
