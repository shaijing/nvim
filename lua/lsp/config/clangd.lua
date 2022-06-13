local util = require("lspconfig.util")
local root_pattern = util.root_pattern("compile_commands.json", "compile_flags.txt", ".git", "CMakeLists.txt", "src");
local opts = {
	cmd = {
		"clangd", -- NOTE: 只支持clangd 13.0.0 及其以下版本，新版本会有问题
		"--background-index", -- 后台建立索引，并持久化到disk
		"--clang-tidy", -- 开启clang-tidy
		-- 指定clang-tidy的检查参数， 摘抄自cmu15445. 全部参数可参考 https://clang.llvm.org/extra/clang-tidy/checks
		"--clang-tidy-checks=bugprone-*, clang-analyzer-*, google-*, modernize-*, performance-*, portability-*, readability-*, -bugprone-too-small-loop-variable, -clang-analyzer-cplusplus.NewDelete, -clang-analyzer-cplusplus.NewDeleteLeaks, -modernize-use-nodiscard, -modernize-avoid-c-arrays, -readability-magic-numbers, -bugprone-branch-clone, -bugprone-signed-char-misuse, -bugprone-unhandled-self-assignment, -clang-diagnostic-implicit-int-float-conversion, -modernize-use-auto, -modernize-use-trailing-return-type, -readability-convert-member-functions-to-static, -readability-make-member-function-const, -readability-qualified-auto, -readability-redundant-access-specifiers,",
		"--completion-style=detailed",
		"--cross-file-rename=true",
		"--header-insertion=iwyu",
		"--pch-storage=memory",
		-- 启用这项时，补全函数时，将会给参数提供占位符，键入后按 Tab 可以切换到下一占位符
		"--function-arg-placeholders=false",
		"--log=verbose",
		"--ranking-model=decision_forest",
		-- 输入建议中，已包含头文件的项与还未包含头文件的项会以圆点加以区分
		"--header-insertion-decorators",
		"-j=12",
		"--pretty",
	},
	filetypes = {
		"c", "cpp", "objc", "objcpp", "cuda"
	},
	single_file_support = true,
	root_dir = function(fname)
		local filename = util.path.is_absolute(fname) and fname or util.path.join(vim.loop.cwd(), fname)
		return root_pattern(filename)
	end,
	on_attach = function(client, bufnr)
		-- 禁用格式化功能，交给专门插件插件处理
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false

		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end

		-- 绑定快捷键
		require('basic.keybindings').mapLSP(buf_set_keymap)
		-- 保存时自动格式化
		--vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
	end,
}

-- 查看目录等信息
return {
	on_setup = function(server)
		server:setup(opts)
	end,
}
