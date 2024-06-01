return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufNewFile', 'BufReadPost', 'BufWritePost' },
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
}
