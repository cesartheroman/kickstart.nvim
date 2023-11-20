return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { 'n', 'v' },
      [']'] = { name = '+next' },
      ['['] = { name = '+prev' },
      ['<leader>c'] = { desc = 'code action' },
      ['<leader>e'] = { desc = 'neotree' },
      ['<leader>f'] = { name = 'find/file' },
      ['<leader>g'] = { name = 'git' },
      ['<leader>gh'] = { name = '+hunks' },
      ['<leader>h'] = { name = 'harpoon' },
      ['<leader>m'] = { name = 'format' },
      ['<leader>n'] = { name = 'swap next' },
      ['<leader>p'] = { desc = 'swap previous' },
      ['<leader>r'] = { desc = 'smart rename' },
      ['<leader>s'] = { name = 'search' },
      ['<leader>t'] = { name = 'tabs' },
      ['<leader>w'] = { name = 'windows' },
      ['<leader>x'] = { name = 'diagnostics/quickfix' },
    },
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
