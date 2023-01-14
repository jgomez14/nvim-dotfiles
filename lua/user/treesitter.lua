require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all"
	ensure_installed = {
		'c',
		'lua',
		'vim',
		'help',
		'typescript',
		'python',
		'rust' 
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	-- Setup highlight module config
	highlight = {
		enable = true,

		additional_vim_regex_highlighting = false
	}
}
