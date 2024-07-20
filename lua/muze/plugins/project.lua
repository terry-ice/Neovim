return {
   "ahmedkhalf/project.nvim",
   event = "VimEnter",
   cmd = "Telescope projects",
   config = function()
   local auto_session = require("project_nvim")

   auto_session.setup({
    options = {
        numbers = "ordinal",
        close_command = "bdelete! %d",       -- 可以关闭缓冲区的命令
        right_mouse_command = "bdelete! %d", -- 右键关闭
        left_mouse_command = "buffer %d",    -- 左键切换
        middle_mouse_command = nil,          -- 中键
        -- 其他配置选项
      }
   })

   vim.api.nvim_set_keymap('n', '<leader>bn', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
   vim.api.nvim_set_keymap('n', '<leader>bp', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
   vim.api.nvim_set_keymap('n', '<leader>bc', ':BufferLinePickClose<CR>', { noremap = true, silent = true })

   end,
 }
