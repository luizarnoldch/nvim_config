return {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      sidebars = "dark",
      floats = "dark",
    },
  },
  config = function(_, opts)
    require("solarized-osaka").setup(opts)
    vim.cmd("colorscheme solarized-osaka")
  end,
}
