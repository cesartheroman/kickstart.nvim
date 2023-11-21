-- See `:help nvim-treesitter`
return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'windwp/nvim-ts-autotag',
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require 'nvim-treesitter.configs'

      -- configure treesitter
      treesitter.setup { -- enable syntax highlighting
        highlight = {
          enable = true,
        },
        -- enable indentation
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {
          enable = true,
        },
        -- ensure these language parsers are installed
        ensure_installed = {
          -- defaults
          'vim',
          'lua',
          'help',
          --web dev
          'html',
          'css',
          'javascript',
          'typescript',
          'tsx',
          'json',
          -- Backend
          'go',
          'prisma',
          'graphql',
          'bash',
          'query',
          -- low level
          'cpp',
          -- Docker
          'yaml',
          'dockerfile',
          -- Other
          'markdown',
          'markdown_inline',
          'gitignore',
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-space>',
            node_incremental = '<C-space>',
            scope_incremental = false,
            node_decremental = '<bs>',
          },
        },
      }
    end,
  },
}
