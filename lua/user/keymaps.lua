-- Set leader key to <space> key
vim.g.mapleader = ' '

-- Keymap to open file explorer
vim.keymap.set('n', '<leader>pv', function ()
    vim.cmd('Lex 12')
end)

-- Telescope keymaps ----------------------

local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local actionState = require('telescope.actions.state')

local function openInTab(promptBuf)
    actions.select_default:replace(function ()
        actions.close(promptBuf)

        local selection = actionState.get_selected_entry()

        vim.cmd([[tabedit ]]..selection[1])
    end)

    return true
end

-- local opts = { attach_mappings = openInTab }
local opts = {}

-- Search files in the project
vim.keymap.set('n', '<leader>pf', function ()
    builtin.find_files(opts)
end)
-- Search files using git
vim.keymap.set('n', '<leader>pg', function ()
    builtin.git_files(opts)
end)

local function searchStrTelescope(pattern)
	-- Requires ripgrep to work properly (https://github.com/BurntSushi/ripgrep)
	builtin.grep_string({
        search = pattern,
    })
end

-- Grep/Search pattern in all project files
vim.keymap.set('n', '<leader>ps', function()
	searchStrTelescope(vim.fn.input('Grep > '))
end)

-------------------------------------------

-- Harpoon keymaps ------------------------

vim.keymap.set('n', '<leader>h', require("harpoon.ui").toggle_quick_menu, {})
vim.keymap.set('n', '<leader>ah', require("harpoon.mark").add_file, {})
vim.keymap.set('n', '<leader>1h', function ()
	require("harpoon.ui").nav_file(1)
end)
vim.keymap.set('n', '<leader>2h', function ()
	require("harpoon.ui").nav_file(2)
end)
vim.keymap.set('n', '<leader>3h', function ()
	require("harpoon.ui").nav_file(3)
end)
vim.keymap.set('n', '<leader>4h', function ()
	require("harpoon.ui").nav_file(4)
end)

-- Mason keymaps --------------------------

vim.keymap.set('n', '<leader>m', vim.cmd.Mason)

-------------------------------------------

-- Close automatically brackets, quotes...

vim.keymap.set('i', "'", "''<Left>", { silent = true })
vim.keymap.set('i', '"', '""<Left>', { silent = true })
vim.keymap.set('i', '[', '[]<Left>', { silent = true })
vim.keymap.set('i', '{', '{}<Left>', { silent = true })
vim.keymap.set('i', '(', '()<Left>', { silent = true })
