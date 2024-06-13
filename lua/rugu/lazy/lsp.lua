return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    config = function ()
        local ensure_installed = {
            'tsserver', 'lua_ls', 'rust_analyzer', 'gopls', 'eslint'
        }

        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = ensure_installed
        })

        local on_attach = function(_, _)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        end

        local lspconfig = require('lspconfig')

        lspconfig.lua_ls.setup {on_attach = on_attach}
        lspconfig.rust_analyzer.setup {on_attach = on_attach}
        lspconfig.gopls.setup {on_attach = on_attach}

        lspconfig.tsserver.setup {
            on_attach = on_attach,
            init_options = {
                preferences = {
                    disableSuggestions = true
                }
            }
        }

        lspconfig.eslint.setup {}
    end
}
