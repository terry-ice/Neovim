return {
   "akinsho/toggleterm.nvim",
   config = function()
   require("toggleterm").setup{
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '1',
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'horizontal', -- 方向可以是 'vertical', 'horizontal', 'tab', 'float'
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = 'curved',
      winblend = 3,
    }
  }
    -- 映射快捷键来打开和关闭终端
    vim.api.nvim_set_keymap("n", "<leader>t", ":ToggleTerm<CR>", { noremap = true, silent = true })

    -- 自定义浮动终端
    local Terminal = require('toggleterm.terminal').Terminal
    local float_term = Terminal:new({ direction = 'float' })

    function _FLOAT_TERM_TOGGLE()
    float_term:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>lua _FLOAT_TERM_TOGGLE()<CR>", { noremap = true, silent = true })
   end,
}
