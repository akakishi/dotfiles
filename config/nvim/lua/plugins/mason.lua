return {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    config = function()
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "tsserver",
                "eslint",
                "lua_ls",
                "rust_analyzer",
                "bashls",
                "cssls"
            },
            handlers = {
                lsp.default_setup,
                lua_ls = function()
                    local lua_opts = lsp.nvim_lua_ls()
                    require("lspconfig").lua_ls.setup(lua_opts)
                end
            }
        })
    end
}
