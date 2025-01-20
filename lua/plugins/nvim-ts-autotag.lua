return {
  "windwp/nvim-ts-autotag",
  config = function()
    require("nvim-ts-autotag").setup({
      filetypes = {
        "html",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "vue",
        "tsx",
        "jsx",
        "xml",
      },
      did_setup = {},
      setup = {},
      get_opts = {},
    })
  end,
}
