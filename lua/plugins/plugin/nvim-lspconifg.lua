return {
    'neovim/nvim-lspconfig',
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "clangd"
            },
            automatic_installation = true,
        })
        local lspconfig = require('lspconfig')
        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace"
                    }
                }
            }
        }
        lspconfig.clangd.setup {
            "clangd",
            "--background-index",
            "--compile-commands-dir=build",
            "-j=12",
            "--all-scopes-completion",
            "--completion-style=detailed",
            "--header-insertion=never",
            "--pch-storage=memory",
            "--enable-config",
            "--fallback-style=google",
            "--pretty",
            "--clang-tidy",
            "--query-driver=D:/ProgramData/msys64/ucrt64/bin",
        }
    end
}
