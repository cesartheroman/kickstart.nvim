-- See `:help vim.o`
local opt = vim.opt -- for conciseness

-- [[ Kickstart Options ]]
  -- Set highlight on search
  vim.o.hlsearch = false

  -- Make line numbers default
  vim.wo.number = true

  -- Enable mouse mode
  vim.o.mouse = 'a'

  -- Enable break indent
  vim.o.breakindent = true

  -- Save undo history
  vim.o.undofile = true

  -- Case-insensitive searching UNLESS \C or capital in search
  vim.o.ignorecase = true
  vim.o.smartcase = true

  -- Keep signcolumn on by default
  vim.wo.signcolumn = 'yes'
  
  -- Decrease update time
  vim.o.updatetime = 250
  vim.o.timeoutlen = 300

  -- Set completeopt to have a better completion experience
  vim.o.completeopt = 'menuone,noselect'

  -- Set terminal colors support
  vim.o.termguicolors = true

-- [[ Josean Options ]]
  local opt = vim.opt -- for conciseness

  -- line numbers
  opt.relativenumber = true -- show relative line numbers
  opt.number = true -- shows absolute line number on cursor line (when relative number is on)

  -- tabs & indentation
  opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
  opt.shiftwidth = 2 -- 2 speces for indent width
  opt.expandtab = true -- expand tab to space
  opt.autoindent = true -- copy indent from current line when starting new one

  -- cursor line
  opt.cursorline = true -- highlight the current cursor line

  -- backspace
  opt.backspace = 'indent,eol,start' -- sllow backspace on indent, end of line or insert mode start position
  
  -- Sync clipboard between OS and Neovim, use as register
  opt.clipboard:append("unnamedplus")

  -- split windows
  opt.splitright = true -- split vertical window to the right
  opt.splitbelow = true -- split horizontal window to the bottom

  -- turn off swapfile
  opt.swapfile = false
