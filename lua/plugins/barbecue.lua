return {
  'utilyre/barbecue.nvim',
  version = '*',
  event = 'VeryLazy',
  dependencies = {
    'SmiteshP/nvim-navic',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local mocha = require('catppuccin.palettes').get_palette 'mocha'

    require('barbecue').setup {
      attach_navic = false,
      create_autocmd = false,
      theme = {
        normal = { bg = mocha.mantle },
      },
    }

    vim.api.nvim_create_autocmd({ 'WinScrolled', 'BufWinEnter', 'CursorHold', 'InsertLeave' }, {
      group = vim.api.nvim_create_augroup('barbecue.updater', {}),
      callback = function()
        require('barbecue.ui').update()
      end,
    })
  end,
}
