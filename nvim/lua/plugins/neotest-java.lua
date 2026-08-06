return {
  -- Java adapter
  -- Source: https://github.com/rcasia/neotest-java
  {
    "rcasia/neotest-java",
    ft = "java",
    dependencies = {
      "mfussenegger/nvim-jdtls",
      "mfussenegger/nvim-dap", -- for debugging (optional)
      "rcarriga/nvim-dap-ui", -- recommended
      "theHamsta/nvim-dap-virtual-text", -- recommended
    },
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = function(_, opts)
      -- See all config options with :h neotest.Config

      -- Keep any adapters already configured by LazyVim
      opts.adapters = opts.adapters or {}
      table.insert(
        opts.adapters,
        require("neotest-java")({
          -- Optional configuration here
        })
      )

      opts.discovery = vim.tbl_deep_extend("force", opts.discovery or {}, {
        -- Drastically improve performance in ginormous projects by
        -- only AST-parsing the currently opened buffer.
        --
        -- See:
        -- https://github.com/nvim-neotest/neotest/issues/453
        enabled = false,

        -- Number of workers to parse files concurrently.
        -- A value of 0 automatically assigns number based on CPU.
        -- Set to 1 if experiencing lag.
        concurrent = 1,
      })

      opts.running = vim.tbl_deep_extend("force", opts.running or {}, {
        -- Run tests concurrently when an adapter provides multiple commands to run.
        concurrent = true,
      })

      opts.summary = vim.tbl_deep_extend("force", opts.summary or {}, {
        -- Enable/disable animation of icons.
        animated = false,
      })
    end,
  },
}
