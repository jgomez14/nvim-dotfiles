vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd.filetype("plugin indent on")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1
vim.opt.expandtab = true

vim.keymap.set("n", "<leader>-", ":Ex<CR>")

require("config.lazy")
