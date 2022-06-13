local status, vimtex = pcall(require, "vimtex")
if not status then
  vim.notify("没有找到 vimtex")
  return
end
