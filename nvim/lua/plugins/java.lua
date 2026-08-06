return {
  {
    -- Target the Neovim JDTLS plugin used by LazyVim
    "mfussenegger/nvim-jdtls",
    -- Extend or overwrite the default plugin configuration options
    opts = function(_, opts)
      -- ========================================================================
      -- 1. YOUR EXISTING CUSTOM CONFIGURATION
      -- ========================================================================
      -- Disables loading the java-test bundle into JDTLS. Using rcasia/neotest-java instead.
      opts.test = false

      -- ========================================================================
      -- 2. JVM PERFORMANCE & MEMORY TUNING
      -- ========================================================================
      -- Ensure the base execution command list exists before modifying it
      opts.cmd = opts.cmd or {}
      -- Set initial memory allocation to 1GB to prevent startup resizing lag
      table.insert(opts.cmd, "--jvm-arg=-Xms1g")
      -- Set max memory to 4GB to prevent OutOfMemory crashes on large projects
      table.insert(opts.cmd, "--jvm-arg=-Xmx4g")
      -- Use G1 Garbage Collector for lower latency pauses during real-time editing
      table.insert(opts.cmd, "--jvm-arg=-XX:+UseG1GC")
      -- Optimize heap space by automatically combining identical text strings
      table.insert(opts.cmd, "--jvm-arg=-XX:+UseStringDeduplication")
    end,
  },
}
