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
vim.opt.scrolloff = 10

-- Set tab behaviour
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true

vim.opt.tabstop = 8
vim.opt.softtabstop = 0

vim.cmd [[autocmd FileType typescriptreact setlocal ts=2 sts=2 sw=2]]
vim.cmd [[autocmd FileType markdown setlocal ts=2 sts=2 sw=2]]
vim.cmd [[autocmd FileType helm setlocal ts=2 sts=2 sw=2]]

-- Disable auto comment. Every time a file is opened formatoptions is set
vim.cmd [[autocmd FileType * setlocal formatoptions-=ro]]

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set conceal level for obsidian.nvim
vim.opt.conceallevel = 1
