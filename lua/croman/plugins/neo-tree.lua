return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function() 
      -- set keymaps
      local keymap = vim.keymap -- for conciseness

      keymap.set('n', '<leader>ee', '<cmd>Neotree toggle<CR>', { desc = 'Toggle file explorer' })
      keymap.set('n', '<leader>ef', '<cmd>Neotree reveal_force_cwd<CR>', { desc = 'Toggle file explorer on current file' })
    end,
}
