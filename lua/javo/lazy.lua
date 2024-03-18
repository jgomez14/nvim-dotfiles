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
    -- Colorschemes
    { "EdenEast/nightfox.nvim" },
    { "rebelot/kanagawa.nvim" },

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
                    "tsx",
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

    -- Lsp
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "saadparwaiz1/cmp_luasnip" },
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },

    -- Comments
    {
        "numToStr/Comment.nvim",
        config = function ()
            require("Comment").setup()
        end
    },

    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },

    -- Debugger
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function ()
            require("dapui").setup()
        end
    },

    {
        "mfussenegger/nvim-dap-python",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function ()
            -- Create a virtualenv to install debugpy
            -- python -m venv ~/.virtualenvs/debugpy
            -- ~/.virtualenvs/debugpy/bin/python -m pip install debugpy

            local debug_env = os.getenv("HOME") .. "/.virtualenvs/debugpy"
            local debug_bin = debug_env .. "/bin/python"
            local code, _, _ = os.execute("ls " .. debug_bin)

            if code ~= 0 then
                os.execute("python -m venv " .. debug_env)
                os.execute(debug_bin .. " -m pip install debugpy")
            end

            require("dap-python").setup(debug_bin)
        end
    },

    -- Nvim Tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },

    -- Diagnostics and more
    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        }
    },

    -- Database client
    {
        "kndndrj/nvim-dbee",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        build = function()
            -- Install tries to automatically detect the install method.
            -- if it fails, try calling it with one of these parameters:
            --    "curl", "wget", "bitsadmin", "go"
            require("dbee").install()
        end,
        config = function()
            require("dbee").setup(--[[optional config]])
        end,
    },

    -- Obsidian
    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        lazy = true,
        event = {
          -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
          -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
          "BufReadPre " .. vim.fn.expand("~") .. "/documents/obsidian/**.md",
          "BufNewFile " .. vim.fn.expand("~") .. "/documents/obsidian/**.md",
        },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
        opts = {
            workspaces = {
                {
                    name = "personal",
                    path = "~/documents/obsidian/personal",
                },
            },

            detect_cwd = true

            -- see below for full list of options 👇
        },
    }
})
