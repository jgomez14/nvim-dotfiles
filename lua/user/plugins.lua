vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Manage packer with packer
	use 'wbthomason/packer.nvim'

	-- Colorschemes
	use 'navarasu/onedark.nvim'
    use 'lunarvim/darkplus.nvim'
    use { 'catppuccin/nvim', as = 'catppuccin' }

    -- Autopairs
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    -- Harpoon
    use 'nvim-lua/plenary.nvim'
    use 'ThePrimeagen/harpoon'

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end
	}

	-- LSP and Mason
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- Comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Beutiful status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
        'folke/trouble.nvim',
        requires = {{'nvim-tree/nvim-web-devicons'}}
    }
end)
