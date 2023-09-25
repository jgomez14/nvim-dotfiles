local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Colorscheme
    {
        "EdenEast/nightfox.nvim"
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.3",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- Harpoon
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local ts_config = require("nvim-treesitter.configs")

            ts_config.setup({
                ensure_installed = {
                    "bash",
                    "css",
                    "csv",
                    "dockerfile",
                    "gitignore",
                    "html",
                    "javascript",
                    "json",
                    "lua",
                    "python",
                    "rust",
                    "sql",
                    "typescript",
                    "vim",
                    "vimdoc",
                    "yaml"
                },

                highlight = { enable = true },

                indent = { enable = true }
            })
        end
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        config = function ()
            require("nvim-autopairs").setup({ check_ts = true })
        end
    },

    {
        "windwp/nvim-ts-autotag",
        config = function ()
            require("nvim-ts-autotag").setup()
        end
    },
})
