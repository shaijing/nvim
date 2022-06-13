-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
    vim.notify("Installing Pakcer.nvim, please wait a minute...")
    paccker_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        -- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
        install_path,
    })

    -- https://github.com/wbthomason/packer.nvim/issues/750
    local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
    if not string.find(vim.o.runtimepath, rtp_addition) then
        vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
    end
    vim.notify("Pakcer.nvim installed!")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("No Packer.nvim")
    return
end



return packer.startup({
    function()
        -- Packer 可以升级自己
        use("wbthomason/packer.nvim")
        -------------------------- plugins -------------------------------------------
        -- nvim-tree
        use({
            "kyazdani42/nvim-tree.lua",
            requires = "kyazdani42/nvim-web-devicons",
            config = require("plugins.config.nvim-tree")
        })
        -- bufferline
        use({
            'akinsho/bufferline.nvim',
            tag = "v2.*",
            requires = 'kyazdani42/nvim-web-devicons',
            config = require("plugins.config.bufferline")
        })
        -- lualine
        use({
            "nvim-lualine/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons" },
        })
        use("arkav/lualine-lsp-progress")

        -- treesitter
        use({
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
        })
        -- nvim-autopairs
        use("windwp/nvim-autopairs")

        -- Comment
        use("numToStr/Comment.nvim")
        -- telescope
        use({
            "nvim-telescope/telescope.nvim",
            requires = { "nvim-lua/plenary.nvim" },
        })
        -- telescope extensions
        use("LinArcX/telescope-env.nvim")
        use("nvim-telescope/telescope-ui-select.nvim")

        -- project
        use("ahmedkhalf/project.nvim")

        use { 'glepnir/dashboard-nvim' }

        -- indent-blankline
        use("lukas-reineke/indent-blankline.nvim")

        use { "akinsho/toggleterm.nvim", tag = 'v1.*' }
        -- demo
        use("/opt/wkspace/demo.nvim")

        --------------------- LSP --------------------
        use("williamboman/nvim-lsp-installer")
        -- Lspconfig
        use("neovim/nvim-lspconfig")
        -- 补全引擎
        use("hrsh7th/nvim-cmp")
        -- 补全源
        use("hrsh7th/cmp-vsnip")
        use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
        use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
        use("hrsh7th/cmp-path") -- { name = 'path' }
        use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
        use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
        -- Snippet 引擎
        use("hrsh7th/vim-vsnip")
        -- 常见编程语言代码段
        use("rafamadriz/friendly-snippets")

        -- UI 增强
        use("onsails/lspkind-nvim")
        use("tami5/lspsaga.nvim")

        -- Lua 增强
        use("folke/lua-dev.nvim")


        --------------------- colorschemes --------------------

        -- tokyonight
        use("folke/tokyonight.nvim")


        if paccker_bootstrap then
            packer.sync()
        end
    end,
    config = {
        -- 锁定插件版本在snapshots目录
        -- snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
        -- 这里锁定插件版本在v1，不会继续更新插件
        -- snapshot = "plugins.v1",

        -- 最大并发数
        max_jobs = 16,
        -- 自定义源
        git = {
            default_url_format = "git@github.com:%s"
            -- default_url_format = "https://hub.fastgit.xyz/%s",
            -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
            -- default_url_format = "https://gitcode.net/mirrors/%s",
            -- default_url_format = "https://gitclone.com/github.com/%s",
        },
        -- display = {
        -- 使用浮动窗口显示
        --   open_fn = function()
        --     return require("packer.util").float({ border = "single" })
        --   end,
        -- },
    },

})

-- 每次保存 plugins.lua 自动安装插件
-- move to autocmds.lua
-- pcall(
--   vim.cmd,
--   [[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins.lua source <afile> | PackerSync
-- augroup end
-- ]]
-- )
