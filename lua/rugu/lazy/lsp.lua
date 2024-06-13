return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    config = function ()
        local servers = { 'eslint', 'lua_ls', 'rust_analyzer', 'gopls' }

        require('mason').setup()
        require('mason-lspconfig').setup({ ensure_installed = servers })

        local on_attach = function(_, _)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        end

        local lspconfig = require('lspconfig')

        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup {on_attach = on_attach}
        end
    end
}
