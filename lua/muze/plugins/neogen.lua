return {
  "danymat/neogen",
  config = function()
    require("neogen").setup({
      enabled = true,
      languages = {
        lua = {
          template = {
            annotation_convention = "ldoc", -- 可更改为 "emmylua" 或其他风格
          },
        },
        -- 其他语言配置...
      },
    })
    -- 设置快捷键
    -- •	<leader>ng 用于生成注释（根据当前上下文自动选择适当的模板）。
    -- •	<leader>nc 用于为类生成注释。
    -- •	<leader>nf 用于为函数生成注释。
    -- •	<leader>nt 用于为类型生成注释。
    vim.api.nvim_set_keymap("n", "<leader>ng", ":Neogen<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>nc", ":Neogen class<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>nf", ":Neogen func<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>nt", ":Neogen type<CR>", { noremap = true, silent = true })
  end,
  dependencies = "nvim-treesitter/nvim-treesitter",
  cmd = "Neogen",
  keys = { "<leader>ng", "<leader>nc", "<leader>nf", "<leader>nt" },
}

