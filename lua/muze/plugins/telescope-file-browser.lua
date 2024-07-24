return {
  "akinsho/toggleterm.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    require("telescope").load_extension("file_browser") -- 加载 Telescope 扩展
    vim.api.nvim_set_keymap("n", "<leader>t", ":ToggleTerm<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', "<C-1>", ":Telescope file_browser<CR>", { noremap = true })
    -- 自定义函数打开指定目录
    -- local builtin = require("telescope").extensions.file_browser.file_browser

    -- function OpenSpecificDir(dir)
    --   return function()
    --     builtin({
    --       prompt_title = "< File Browser >",
    --       cwd = dir,
    --     })
    --   end
    -- end

    -- 绑定快捷键调用自定义函数
    -- vim.api.nvim_set_keymap("n",'<leader>fb', ":Telescope file_browser<CR>", { noremap = true, silent = true })
  end,
}
