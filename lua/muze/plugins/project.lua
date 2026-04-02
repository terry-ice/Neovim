return {
  "ahmedkhalf/project.nvim",
  event = "VimEnter",
  config = function()
    local project = require("project_nvim")

    project.setup({
      -- Detection methods: "lsp" or "pattern"
      detection_methods = { "lsp", "pattern" },
      -- Patterns used to detect root dir
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
      silent_chdir = true,
      scope_chdir = "global",
    })

    -- Integrate with telescope
    require("telescope").load_extension("projects")

    -- Bufferline navigation keymaps (previously misplaced here from barbar config)
    vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
    vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true, desc = "Prev buffer" })
    vim.keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", { noremap = true, silent = true, desc = "Pick close buffer" })
  end,
}
