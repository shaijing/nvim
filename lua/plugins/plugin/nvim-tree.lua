return {

    "nvim-tree/nvim-tree.lua",
    version = "*",
    enabled = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- set termguicolors to enable highlight groups
        vim.opt.termguicolors = true
        local function my_on_attach(bufnr)
            local api = require "nvim-tree.api"

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
            vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
            vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
        end
        require("nvim-tree").setup({
            on_attach = my_on_attach,
            auto_reload_on_write = true,
            create_in_closed_folder = false,
            -- 完全禁止内置netrw
            disable_netrw = true,
            -- project plugin 需要这样设置
            update_cwd = true,
            update_focused_file = {
                enable = true,
                update_cwd = true,
            },
            filters = {
                -- 隐藏 .文件
                dotfiles = true,
                -- 隐藏 node_modules 文件夹
                -- custom = { "node_modules" },
            },
            view = {
                -- 宽度
                width = 34,
                -- 也可以 'right'
                side = "left",
                -- 隐藏根目录
                hide_root_folder = false,
                -- 不显示行数
                number = false,
                relativenumber = false,
                -- 显示图标
                signcolumn = "yes",
            },
            git = {
                enable = true,
                ignore = true,
                timeout = 400,
            },
            actions = {
                open_file = {
                    -- 首次打开大小适配
                    resize_window = true,
                    -- 打开文件时关闭 tree
                    quit_on_open = true,
                },
            },
            -- wsl install -g wsl-open
            -- https://github.com/4U6U57/wsl-open/
            system_open = {
                -- mac
                cmd = "open",
                -- windows
                -- cmd = "wsl-open",
            },
        })
    end

}
