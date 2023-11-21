return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    -- set keymaps
    local mark = require 'harpoon.mark'
    local ui = require 'harpoon.ui'
    local keymap = vim.keymap -- for conciseness

    -- For adding file and opening up Harpoon UI
    keymap.set('n', '<leader>a', mark.add_file, { desc = 'Add file to Harpoon' })
    keymap.set('n', '<leader>h', ui.toggle_quick_menu)

    -- For navigating through Harpooned files
    keymap.set('n', '<C-i>', function()
      ui.nav_file(1)
    end)
    keymap.set('n', '<C-o>', function()
      ui.nav_file(2)
    end)
    keymap.set('n', '<C-p>', function()
      ui.nav_file(3)
    end)
    keymap.set('n', '<C-y>', function()
      ui.nav_file(4)
    end)
  end,
}
