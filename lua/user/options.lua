-- Set number of line
vim.opt.number = true
-- Set relative number
vim.opt.relativenumber = true
-- Set cursor line
vim.opt.cursorline = true

-- Set no permanent search highlighting
vim.opt.hlsearch = false
-- Set incremental search
vim.opt.incsearch = true

-- Disable line wrapping
vim.opt.wrap = false

-- Set scroll options
vim.opt.scrolloff = 8

-- Set tab behaviour
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Disable auto comment. Every time a file is opened formatoptions is set
vim.cmd [[autocmd FileType * setlocal formatoptions-=ro]]
