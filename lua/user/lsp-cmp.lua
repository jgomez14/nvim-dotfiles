-- Set up mason
require('mason').setup()

-- Set up mason-lspconfig
require('mason-lspconfig').setup({
	ensure_installed = {
		'angularls',
		'bashls',
		'cssls',
		'html',
		'jsonls',
		'tsserver',
		'sumneko_lua',
		'pyright',
		'rust_analyzer'
	}
})

-- Set autocompletions setup
local cmp = require('cmp')
local luasnip = require('luasnip')
local select_opts = { behavior = 'select' }

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },

    mapping = cmp.mapping.preset.insert({
        -- confirm selection
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<C-y>'] = cmp.mapping.confirm({select = false}),

        -- navigate items on the list
        ['<Tab>'] = cmp.mapping.select_next_item(select_opts),
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

        -- scroll up and down in the completion documentation
        ['<C-f>'] = cmp.mapping.scroll_docs(5),
        ['<C-u>'] = cmp.mapping.scroll_docs(-5),

        -- toggle completion
        ['<C-e>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.abort()
            else
                cmp.complete()
            end
        end),

        -- go to next placeholder in the snippet
        ['<C-d>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, {'i', 's'}),

        -- go to previous placeholder in the snippet
        ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'}),
    }),

    sources = {
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' }
    }
})

-- Define a variable for accesing LSP completion capabilities
local lspCmpCapabilities = require('cmp_nvim_lsp').default_capabilities()

-- Set up automatic setup handling for installed LSP servers
require('mason-lspconfig').setup_handlers {
	function(serverName)
		require('lspconfig')[serverName].setup{
            capabilities = lspCmpCapabilities
        }
	end,

    -- Specific config for sumneko_lua lang server
	['sumneko_lua'] = function()
		require('lspconfig')['sumneko_lua'].setup{
            capabilities = lspCmpCapabilities,

			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' } -- Ignore undefined warning for vim global var
					}
				}
			}
		}
	end
}
