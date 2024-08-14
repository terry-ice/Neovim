return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- enable comment
    comment.setup({
      -- for commenting tsx, jsx, svelte, html files
      pre_hook = ts_context_commentstring.create_pre_hook(),
      -- 注释操作的映射
      toggler = {
        line = "<leader>c", -- 切换行注释
        block = "<leader>b", -- 切换块注释
      },
      -- 可视模式下的映射
      opleader = {
        line = "<leader>c",
        block = "<leader>b",
      },
      -- Extra mappings
      extra = {
        above = "<leader>cO", -- 在上方插入注释
        below = "<leader>co", -- 在下方插入注释
        eol = "<leader>cA", -- 在行尾插入注释
      },
    })
  end,
}
