-- Set leader key to <space> key
vim.g.mapleader = " "

-- Set keymaps for better copying and pasting
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Telescope keymaps ----------------------

local telescope = require("telescope.builtin")

local opts = {}

-- Search files in the project
vim.keymap.set("n", "<leader>pf", function ()
    telescope.find_files(opts)
end)
-- Search files using git
vim.keymap.set("n", "<leader>pg", function ()
    telescope.git_files(opts)
end)

local function searchStrTelescope(pattern)
	-- Requires ripgrep to work properly (https://github.com/BurntSushi/ripgrep)
	telescope.grep_string({
        search = pattern,
    })
end

-- Grep/Search pattern in all project files
vim.keymap.set("n", "<leader>ps", function()
	searchStrTelescope(vim.fn.input("Grep > "))
end)
