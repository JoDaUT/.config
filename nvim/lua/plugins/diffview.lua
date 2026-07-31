return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  -- lazy = false ensures keybind registers instantly
  lazy = false,
  config = function()
    require("diffview").setup({
      enhanced_diff_hl = true, -- Better syntax highlighting colors
      view = {
        default = {
          layout = "diff2_horizontal", -- Traditional side-by-side IDE view
        },
      },
    })
  end,
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
    { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
  },
}
