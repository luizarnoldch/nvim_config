return {
	"mhartington/formatter.nvim",
	config = function()
		local formatter = require("formatter")
		local formatter_lua = require("formatter.filetypes.lua")
		local formatter_util = require("formatter.util")

		local shiftwidth = vim.o.shiftwidth or 2
		local tabstop = vim.o.tabstop or 2
		local expandtab = vim.o.expandtab and "--expand-tab" or "--no-expand-tab"

		formatter.setup({
			logging = false,
			log_level = vim.log.levels.WARN,
			filetype = {
				lua = {
					formatter_lua.stylua,
					function()
						if formatter_util.get_current_buffer_file_name() == "special.lua" then
							return nil
						end

						return {
							exe = "stylua",
							args = {
								"--search-parent-directories",
								"--stdin-filepath",
								formatter_util.escape_path(formatter_util.get_current_buffer_file_path()),
								"--",
								"-",
								"--indentt-width",
								tostring(shiftwidth),
								expandtab,
							},
							stdin = true,
						}
					end,
				},
				javascript = {
					function()
						return {
							exe = "prettier",
							args = {
								"--stdin-filepath",
								formatter_util.escape_path(formatter_util.get_current_buffer_file_path()),
								"--tab-width",
								tostring(tabstop),
								"--use-tabs",
								not expandtab,
							},
							stdin = true,
						}
					end,
				},
				typescript = {
					function()
						return {
							exe = "prettier",
							args = {
								"--stdin-filepath",
								formatter_util.escape_path(formatter_util.get_current_buffer_file_path()),
								"--tab-width",
								tostring(tabstop),
								"--use-tabs",
								not expandtab,
							},
							stdin = true,
						}
					end,
				},
				javascriptreact = {
					function()
						return {
							exe = "prettier",
							args = {
								"--stdin-filepath",
								formatter_util.escape_path(formatter_util.get_current_buffer_file_path()),
								"--tab-width",
								tostring(tabstop),
								"--use-tabs",
								not expandtab,
							},
							stdin = true,
						}
					end,
				},
				typescriptreact = {
					function()
						return {
							exe = "prettier",
							args = {
								"--stdin-filepath",
								formatter_util.escape_path(formatter_util.get_current_buffer_file_path()),
								"--tab-width",
								tostring(tabstop),
								"--use-tabs",
								not expandtab,
							},
							stdin = true,
						}
					end,
				},
			},
		})

		local au_format_on_save = vim.api.nvim_create_augroup("__formatter__", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePost", {
			group = au_format_on_save,
			pattern = { "*.lua", "*.js", "*.jsx", "*.ts", "*.tsx" },
			command = "FormatWrite",
		})
	end,
}
