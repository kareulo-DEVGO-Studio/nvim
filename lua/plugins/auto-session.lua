return {
  'rmagatti/auto-session',
  lazy = false,
  config = function()
    require('auto-session').setup {
      log_level = 'error',
      auto_save_enable = true,
      auto_session_allowed_dirs = { '~/Codebase/*' },
    }
  end,
}
