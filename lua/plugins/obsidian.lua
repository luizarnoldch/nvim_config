return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local obsidian = require("obsidian")

    obsidian.setup({
      workspaces = {
        {
          name = "personal",
          path = "~/",
        },
      },
      completion = {
        nvim_cmp = true,
      },
    })
  end,
}
