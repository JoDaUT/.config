return {
  -- 1. Configure the theme plugin options
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night", -- sets the specific style variation
    },
  },

  -- 2. Force LazyVim to load it as the default on startup
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
