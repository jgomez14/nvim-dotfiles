require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "angularls",
        "bashls",
        "cssls",
        "dockerls",
        "docker_compose_language_service",
        "html",
        "helm_ls",
        "jsonls",
        "tsserver",
        "lua_ls",
        "marksman",
        "pyright",
        "rust_analyzer",
        "sqlls",
        "yamlls"
    }
})

local lsp_cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local function on_attach_mappings()
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
end

require('mason-lspconfig').setup_handlers({
    function (server_name)
        require("lspconfig")[server_name].setup({
            capabilities = lsp_cmp_capabilities,
            on_attach = on_attach_mappings
        })
    end,

    ["lua_ls"] = function ()
        require("lspconfig")["lua_ls"].setup({
            capabilities = lsp_cmp_capabilities,
            on_attach = on_attach_mappings,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {
                            "vim",
                            -- Globals for awesomewm
                            "awesome",
                            "client",
                            "screen",
                            "root"
                        }
                    }
                }
            }
        })
    end,

    ["helm_ls"] = function ()
        require("lspconfig")["helm_ls"].setup({
            settings = {
                ["helm-ls"] = {
                    yamlls = {
                        path = "yaml-language-server"
                    }
                }
            }
        })
    end
})
