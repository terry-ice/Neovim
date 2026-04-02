return {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local mason_tool_installer = require("mason-tool-installer")

      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      -- mason-lspconfig v2: disable automatic_enable to avoid race condition
      -- with nvim-lspconfig (which is lazy-loaded on BufReadPre).
      -- Servers are enabled via mason_lspconfig.setup_handlers() in lspconfig.lua instead.
      mason_lspconfig.setup({
        automatic_enable = false,
      })

      -- Use mason-tool-installer to install both LSP servers and formatters/linters
      mason_tool_installer.setup({
        ensure_installed = {
          -- LSP servers
          "ts_ls",
          "html",
          "cssls",
          "tailwindcss",
          "svelte",
          "lua_ls",
          "graphql",
          "emmet_ls",
          "prismals",
          "pyright",
          -- Formatters & linters
          "prettier",
          "stylua",
          "isort",
          "black",
          "pylint",
          "eslint_d",
        },
      })
    end,
  }