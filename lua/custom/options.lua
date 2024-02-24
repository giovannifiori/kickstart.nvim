-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = true
vim.o.incsearch = true

-- Make line numbers default
vim.o.number = true
-- Show relative line numbers
vim.o.relativenumber = true
-- Hide mode as statusline already shows it
vim.o.showmode = false

-- Enable mouse mode
vim.o.mouse = 'a'

vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- highlight current line
vim.o.cursorline = true

-- lines above/below cursor
vim.o.scrolloff = 12

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- How new splits open
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.inccommand = 'split'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
