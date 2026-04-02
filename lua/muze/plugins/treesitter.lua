return {
  "nvim-treesitter/nvim-treesitter",
  -- v1.0 does NOT support lazy-loading
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- v1.0 API: setup on the main module, not nvim-treesitter.configs
    require("nvim-treesitter").setup({
      -- install_dir can be customized, default is stdpath('data')/nvim-treesitter
    })

    -- Install parsers
    require("nvim-treesitter.install").prefer_git = true
    require("nvim-treesitter").install({
      "json", "javascript", "typescript", "tsx",
      "yaml", "html", "css", "prisma",
      "markdown", "markdown_inline", "svelte", "graphql",
      "bash", "lua", "vim", "dockerfile",
      "gitignore", "query", "vimdoc", "c",
    })

    -- Highlighting: enabled via FileType autocmd (Neovim core feature)
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter_highlight", { clear = true }),
      callback = function(ev)
        pcall(vim.treesitter.start, ev.buf)
      end,
    })

    -- Indentation (experimental, opt-in per buffer)
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter_indent", { clear = true }),
      pattern = {
        "javascript", "typescript", "tsx", "jsx",
        "html", "css", "lua", "python", "bash",
        "yaml", "json", "svelte",
      },
      callback = function()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    -- Folding (optional, uncomment to enable)
    -- vim.wo.foldmethod = "expr"
    -- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

    -- Incremental selection (Neovim built-in, configure via keymap)
    vim.keymap.set("n", "<C-space>", function()
      vim.cmd("normal! vit")
    end, { desc = "Select treesitter node" })

    -- nvim-ts-autotag: standalone setup (no longer via treesitter configs)
    require("nvim-ts-autotag").setup({
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
    })
  end,
}
