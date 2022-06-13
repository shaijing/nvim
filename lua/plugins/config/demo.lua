local status, demo = pcall(require, "demo")
if not status then
  vim.notify("没有找到 demo")
  return
end


demo.setup({
  options = {
    plugin_name = "successful!"
  }
})
