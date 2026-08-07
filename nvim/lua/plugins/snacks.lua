return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      -- 1. Global settings (Fixes standard file searches)
      hidden = true,
      ignored = true,

      sources = {
        -- 2. Explicit source settings (Fixes the <leader>e file explorer tree)
        explorer = {
          hidden = true,
          ignored = true,
          win = {
            list = {
              wo = {
                number = true,
                relativenumber = true,
              },
            },
          },
        },
        files = {
          hidden = true,
          ignored = true,
        },
      },
    },
  },
}
