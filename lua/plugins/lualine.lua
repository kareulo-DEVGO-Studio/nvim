return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    options = {
      theme = 'catppuccin',
      component_separators = '',
      section_separators = '',
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        'mode',
      },
      lualine_b = {
        'branch',
        'diff',
      },
      lualine_c = {
        {
          'diagnostics',
          symbols = {
            error = ' ',
            hint = ' ',
            info = ' ',
            warn = ' ',
          },
          always_visible = true,
        },
      },
      lualine_x = {
        'encoding',
        {
          'fileformat',
          icons_enabled = false,
        },
        {
          'filetype',
          icons_enabled = false,
        },
      },
      lualine_y = {
        'progress',
      },
      lualine_z = {
        'location',
      },
    },
  },
}
