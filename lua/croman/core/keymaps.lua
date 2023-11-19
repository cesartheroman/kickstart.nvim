-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- [[ Kickstart Keymaps ]]
  -- Keymaps for better default experience
  -- See `:help vim.keymap.set()`
  keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

  -- Remap for dealing with word wrap
  keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
  keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

  -- Diagnostic keymaps
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
  vim.keymap.set('n', '<leader>sd', vim.diagnostic.open_float, { desc = '[S]earch [D]iagnostics' })
  vim.keymap.set('n', '<leader>dl', vim.diagnostic.open_float, { desc = '[D]iagnostics [L]ist' })

-- [[ Josean's Keymaps ]]
  -- use jk to exit insert mode
  keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

  -- clear search highlights
  keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })

  -- delete single character without copying into register
  keymap.set('n', 'x', '"_x"')

-- [[ Prime's Keymaps ]] 
  -- move down while keeping cursor in middle of page
  keymap.set('n', '<C-d>', '<C-d>zz') 

  -- move up while keeping cursor in middle of page
  keymap.set('n', '<C-u>', '<C-u>zz') 

-- [[ NvChad Keymaps ]]
  -- Insert Mode
    -- Navigation
    keymap.set('i', '<C-h>', '<Left>', { desc = 'Move Left' }) 
    keymap.set('i', '<C-l>', '<Right>', { desc = 'Move Right' })
    keymap.set('i', '<C-j>', '<Down>', { desc = 'Move Down' })
    keymap.set('i', '<C-k>', '<Up>', { desc = 'Move Up' })

  -- Normal Mode
    -- Switch between windows
    keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
    keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Window right' })
    keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
    keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Window up' })

    -- Window management
    keymap.set('n', 'sv', '<C-w>v', { desc = 'Spit window vertically' })
    keymap.set('n', 'sh', '<C-w>s', { desc = 'Spit window horizontally' })
    keymap.set('n', 'se', '<C-w>=', { desc = 'Make splits equal size' })
    keymap.set('n', 'sx', '<cmd>close<CR>', { desc = 'Close current split' })

    -- Tab management
    keymap.set('n', '<leader>to', ':tabnew<CR>', { desc = 'Open new tab' })
    keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close current tab' })
    keymap.set('n', '<leader>tn', ':tabn<CR>', { desc = 'Go to next tab' })
    keymap.set('n', '<leader>tp', ':tabp<CR>', { desc = 'Go to prev tab' })
    keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })

    -- Copy all
    keymap.set('n', '<C-c>', '<cmd> %y+ <CR>', { desc = 'Copy whole file' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
