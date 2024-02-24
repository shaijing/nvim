return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    -- or                              , branch = '0.1.x',
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-ui-select.nvim" },
    },
    config = function()
        -- local con = require("plugins.config").telescope
        require("telescope").setup({
            defaults = {
                -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
                initial_mode = "insert",
                -- vertical , center , cursor
                layout_strategy = "horizontal",
                -- 窗口内快捷键
                mappings = require("core.keybindings").telescopeList,
            },
            pickers = {
                find_files = {
                    -- theme = "dropdown", -- 可选参数： dropdown, cursor, ivy
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        -- even more opts
                    }),
                },
            },
        })
    end,
}
