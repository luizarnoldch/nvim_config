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
                --formatter_util.escape_path(formatter_util.get_current_buffer_file_path()),
                "--indent-type=Spaces",
                "--indent-width=2",
                "--column-width=120",
                "--search-parent-directories",
                "--stdin-filepath",
                vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
                "--",
                "-",
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
                vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
                --formatter_util.escape_path(formatter_util.get_current_buffer_file_path()),
                "--tab-width",
                "2",
                "--single-quote",
                "--print-width",
                "120",
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
                vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
                --formatter_util.escape_path(formatter_util.get_current_buffer_file_path()),
                "--tab-width",
                "2",
                "--single-quote",
                "--print-width",
                "120",
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
                vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
                --formatter_util.escape_path(formatter_util.get_current_buffer_file_path()),
                "--tab-width",
                "2",
                "--single-quote",
                "--print-width",
                "120",
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
                vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
                --formatter_util.escape_path(formatter_util.get_current_buffer_file_path()),
                "--tab-width",
                "2",
                "--single-quote",
                "--print-width",
                "120",
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
