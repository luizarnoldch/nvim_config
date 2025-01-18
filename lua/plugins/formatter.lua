return {
	"mhartington/formatter.nvim",
	config = function()
		local formatter = require("formatter")
		local formatter_lua = require("formatter.filetypes.lua")
		local formatter_util = require("formatter.util")

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
