return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.install').prefer_git = true

    --@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'c', 'lua', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      sync_install = true,
      auto_install = true,
      ignore_install = { 'tmux' },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    }
  end,
}
