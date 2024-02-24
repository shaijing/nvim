local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.notify("Installing Lazy.nvim, please wait a minute...")
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
    vim.notify("Lazy.nvim installed!")
end
vim.opt.rtp:prepend(lazypath)
-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    vim.notify("No Lazy.nvim")
    return
end

local plugins = "plugins.plugin"

local opts = {
    git = {
        url_format = "git@github.com:%s.git"
    }
}

return lazy.setup(plugins, opts)
