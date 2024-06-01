return {
  'nvim-telescope/telescope.nvim',
  version = false,
  event = 'VimEnter',
  keys = {
    { '<Leader><Leader>', '<CMD>Telescope buffers<CR>' },
    { '<Leader>f.', '<CMD>Telescope oldfiles<CR>' },
    { '<Leader>fd', '<CMD>Telescope diagnostics<CR>' },
    { '<Leader>ff', '<CMD>Telescope find_files<CR>' },
    { '<Leader>fg', '<CMD>Telescope live_grep<CR>' },
    { '<Leader>fw', '<CMD>Telescope grep_string<CR>' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
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
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
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
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    require('telescope').load_extension 'fzf'
    require('telescope').load_extension 'ui-select'
  end,
}
