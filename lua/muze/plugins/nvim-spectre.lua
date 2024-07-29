return {
    "windwp/nvim-spectre",
    dependencies = {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim'},
    config = function()
      require('spectre').setup()
    -- 定义快捷键
    vim.api.nvim_set_keymap('n', '<leader>sp', ":lua require('spectre').open()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>sf', ":lua require('spectre').open_file_search({select_word=true})<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>sw', ":lua require('spectre').open_visual({select_word=true})<CR>", { noremap = true, silent = true })
    end,
  }