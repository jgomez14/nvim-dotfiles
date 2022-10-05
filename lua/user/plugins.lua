local fn = vim.fn

-- Automatically install packer

local installPath = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(installPath)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		installPath
	}

	print("Installing packer... Closing and reopening Neovim...")

	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever plugins.lua file is saved

vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call to packer.nvim, so we don't get an error on first use

local statusOK, packer = pcall(require, "packer")

if not statusOK then
	return
end

-- Have packer use a popup window

packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install your plugins here

return packer.startup(
	function(use)
		-- Plugins here like use "plugin/repo"

		use "wbthomason/packer.nvim"
		use "nvim-lua/popup.nvim"
		use "nvim-lua/plenary.nvim"

		-- Automatically set up configuration after cloning packer.nvim
		-- This section must be at the end, after all plugins

		if PACKER_BOOTSTRAP then
			require("packer").sync()
		end
	end
)
