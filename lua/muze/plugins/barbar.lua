return {
   "romgrk/barbar.nvim",
   dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  config = function()
    -- barbar.nvim 配置选项
    vim.api.nvim_set_keymap('n', '<C-n>', ':BufferNext<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<C-p>', ':BufferPrevious<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<C-w>', ':BufferClose<CR>', { noremap = true, silent = true })
  end,
 }
