return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      ensure_installed = {
        "csv",
        "dockerfile",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "javascript",
        "json",
        "lua",
        "markdown",
        "proto",
        "python",
        "rego",
        "ruby",
        "sql",
        "svelte",
        "yaml",
        "php",
        "tsx",
        "typescript",
        "html",
        "css",
        "lua",
      },
      indent = { enable = true },
      auto_install = true,
      sync_install = false,
      highlight = {
        enable = true,
        --disable = {"csv"} -- preferring chrisbra/csv.vim
        additional_vim_regex_highlighting = false,
      },
      ignore_install = {},
      incremental_selection = {
        enable = true,
      },
      textobjects = {
        enable = true,
      },
      modules = {},
    })
  end,
}
