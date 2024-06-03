return {
  'nvim-telescope/telescope.nvim',
  version = false,
  keys = {
    {
      '<Leader>fb',
      '<CMD>Telescope buffers<CR>',
    },
    {
      '<Leader>ff',
      '<CMD>Telescope find_files<CR>',
    },
    {
      '<Leader>fg',
      '<CMD>Telescope live_grep<CR>',
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  config = function()
    local actions = require 'telescope.actions'

    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-d>'] = false,
            ['<C-u>'] = false,
            ['<Esc>'] = actions.close,
          },
        },
      },
      pickers = {
        buffers = {
          mappings = {
            i = {
              ['<C-d>'] = actions.delete_buffer + actions.move_to_top,
            },
          },
        },
      },
    }

    require('telescope').load_extension 'fzf'
  end,
}
