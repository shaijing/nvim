require("core")
require("plugins")
-- local map = vim.keymap.set
-- function CompileRun()
--     vim.cmd('w')
--     local filetype = vim.bo.filetype
--     local filename_ext = vim.fn.expend("%:p:t")
--     local filename = vim.fn.expend("%:t:r")
--     if filetype == 'c' then
--         vim.cmd('!gcc % -o %<')
--         vim.cmd('!time %<')
--     elseif filetype == 'lua' then
--         vim.cmd('!time lua %<')
--     elseif filetype == 'cpp' then
--         vim.cmd('!g++ % -o %<')
--         vim.cmd('!time %<')
--     elseif filetype == 'java' then
--         vim.cmd('!javac %')
--         vim.cmd('!time java %<')
--     elseif filetype == 'sh' then
--         vim.cmd('!time sh %')
--     elseif filetype == 'python' then
--         vim.cmd('!time python %')
--     elseif filetype == 'html' then
--         vim.cmd('!firefox % &')
--     elseif filetype == 'markdown' or filetype == 'vimwiki' then
--         vim.cmd('MarkdownPreview')
--     end
-- end


-- map("","r",':lua CompileRun()<CR>')
