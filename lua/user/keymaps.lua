local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Short function name

local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes cheatsheet

-- -- Normal mode = "n"
-- -- Insert mode = "i"
-- -- Visual mode = "v"
-- -- Visual block mode = "x"
-- -- Terminal mode = "t"
-- -- Command mode = "c"

-- Keymaps for normal mode

-- Better window navigation

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<Leader>e", ":Lex 30<Return>", opts)
