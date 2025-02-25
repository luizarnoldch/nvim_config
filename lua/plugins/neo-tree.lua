return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    --"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    local neo_tree = require("neo-tree")
    neo_tree.setup({
      window = { position = "right" },
      filesystem = {
        filtered_items = {
          hide_gitignored = false,
          always_show = {
            ".gitignore",
          },
          always_show_by_pattern = {
            ".env*",
          },
        },
      },
    })
  end,
}
