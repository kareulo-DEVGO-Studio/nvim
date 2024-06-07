if vim.opt.wrap then
  vim.keymap.set('n', 'j', "v:count ? 'j' : 'gj'", { expr = true })
  vim.keymap.set('n', 'k', "v:count ? 'k' : 'gk'", { expr = true })
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

vim.keymap.set({ 'n', 'x' }, '<Leader>D', [["+D]])
vim.keymap.set({ 'n', 'x' }, '<Leader>d', [["+d]])
vim.keymap.set({ 'n', 'x' }, '<Leader>P', [["+P]])
vim.keymap.set({ 'n', 'x' }, '<Leader>p', [["+p]])
vim.keymap.set({ 'n', 'x' }, '<Leader>Y', [["+Y]])
vim.keymap.set({ 'n', 'x' }, '<Leader>y', [["+y]])
