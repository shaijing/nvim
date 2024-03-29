return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter').setup({
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = { "c","cpp" ,"lua" },
            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,
        })
    end
}
