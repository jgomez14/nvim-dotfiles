-- Set number of line
vim.opt.number = true
-- Set relative number
vim.opt.relativenumber = true
-- Set cursor line
vim.opt.cursorline = true

vim.cmd [[set colorcolumn=120]]

-- Set no permanent search highlighting
vim.opt.hlsearch = false
-- Set incremental search
vim.opt.incsearch = true

-- Disable line wrapping
vim.opt.wrap = false

-- Set scroll options
vim.opt.scrolloff = 8

-- Set tab behaviour
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true

vim.opt.tabstop = 8
vim.opt.softtabstop = 0

-- Disable auto comment. Every time a file is opened formatoptions is set
vim.cmd [[autocmd FileType * setlocal formatoptions-=ro]]
