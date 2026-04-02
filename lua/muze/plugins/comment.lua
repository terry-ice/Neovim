return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- nvim-ts-context-commentstring v0.8+ requires explicit setup call
    require("ts_context_commentstring").setup({
      enable_autocmd = false,
    })

    local comment = require("Comment")

    comment.setup({
      -- for commenting tsx, jsx, svelte, html files
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      toggler = {
        line = "<leader>c",  -- 切换行注释
        block = "<leader>b", -- 切换块注释
      },
      opleader = {
        line = "<leader>c",
        block = "<leader>b",
      },
      extra = {
        above = "<leader>cO", -- 在上方插入注释
        below = "<leader>co", -- 在下方插入注释
        eol = "<leader>cA",   -- 在行尾插入注释
      },
    })
  end,
}
