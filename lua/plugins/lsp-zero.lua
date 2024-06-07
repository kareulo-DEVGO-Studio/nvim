return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = { 'L3MON4D3/LuaSnip' },
    config = function()
      local lsp_zero = require 'lsp-zero'
      lsp_zero.extend_cmp()

      local cmp = require 'cmp'
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup {
        preselect = 'item',
        mapping = {
          ['<C-y>'] = cmp.mapping.confirm { select = false },
          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
          ['<C-p>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item { behavior = 'insert' }
            else
              cmp.complete()
            end
          end),
          ['<C-n>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_next_item { behavior = 'insert' }
            else
              cmp.complete()
            end
          end),
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        formatting = lsp_zero.cmp_format { details = true },
        sources = { { name = 'nvim_lsp' } },
        view = { docs = { auto_open = false } },
        window = {
          completion = { border = 'rounded', scrollbar = false },
          documentation = { border = 'rounded', scrollbar = false },
        },
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufNewFile', 'BufReadPost', 'BufWritePost' },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', config = true },
    },
    config = function()
      local lsp_zero = require 'lsp-zero'
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(_, bufnr)
        vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
        vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr })
      end)

      require('mason-lspconfig').setup {
        ensure_installed = { 'clangd', 'eslint', 'jsonls', 'lua_ls', 'tailwindcss', 'tsserver' },
        handlers = {
          function(server)
            require('lspconfig')[server].setup {}
          end,
        },
      }
    end,
  },
}
