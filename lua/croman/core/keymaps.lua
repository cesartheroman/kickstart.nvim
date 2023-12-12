-- set leader key to space
vim.g.mapleader = ' '

local keymap = vim.keymap -- for conciseness

-- [[ Kickstart Keymaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Josean's Keymaps ]]
-- use jk to exit insert mode
keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })

-- clear search highlights
keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })

-- delete single character without copying into register
keymap.set('n', 'x', '"_x"')

-- [[ Prime's Keymaps ]]
-- move down while keeping cursor in middle of page
keymap.set('n', '<C-d>', '<C-d>zz')

-- move up while keeping cursor in middle of page
keymap.set('n', '<C-u>', '<C-u>zz')

--keep J in place
keymap.set('n', 'J', 'mzJ`z')

--allow search terms to stay in the middle
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

-- move block of text together
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

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
keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Spit window vertically' })
keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Spit window horizontally' })
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })

-- Tab management
keymap.set('n', '<leader>to', ':tabnew<CR>', { desc = 'Open new tab' })
keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close current tab' })
keymap.set('n', '<leader>tb', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })
keymap.set('n', '<Tab>', ':tabn<CR>', { desc = 'Go to next tab' })
keymap.set('n', '<S-Tab>', ':tabp<CR>', { desc = 'Go to prev tab' })

-- Copy all
keymap.set('n', '<C-c>', '<cmd> %y+ <CR>', { desc = 'Copy whole file' })

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
keymap.set('x', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = 'Dont copy replaced text' })

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

-- navigate next buffer
keymap.set('n', '<leader>b}', ':bnext<CR>', { desc = 'Buffer next' })
-- navigate previous buffer
keymap.set('n', '<leader>b{', ':bprev<CR>', { desc = 'Buffer prev' })
