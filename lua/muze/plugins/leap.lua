return {
    url = "https://codeberg.org/andyg/leap.nvim",
    config = function()
      -- Sneak-style mappings (replaces deprecated add_default_mappings)
      vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-forward)")
      vim.keymap.set({ "n", "x", "o" }, "gS", "<Plug>(leap-backward)")
      vim.keymap.set({ "n", "x", "o" }, "gw", "<Plug>(leap-from-window)")
    end,
  }