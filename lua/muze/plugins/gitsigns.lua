return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local gitsigns_session = require("gitsigns")

    gitsigns_session.setup({
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        map("n", "<leader>gl", "<cmd>lua get_git_link()<CR>", "get line link")
        -- Navigation
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")

        -- Actions
        map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
        map("v", "<leader>hs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Stage hunk")
        map("v", "<leader>hr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Reset hunk")

        map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
        map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

        map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")

        map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, "Blame line")
        map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

        map("n", "<leader>hd", gs.diffthis, "Diff this")
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end, "Diff this ~")

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
      end,
    })
    function get_git_link()
      local file = vim.fn.expand("%")
      local Job = require("plenary.job")
      local line = vim.fn.line(".")
      local repo_url, commit

      -- 获取当前文件的远程 URL
      Job:new({
        command = "git",
        args = { "config", "--get", "remote.origin.url" },
        on_exit = function(j, return_val)
          if return_val == 0 then
            repo_url = j:result()[1]
            -- 处理 git@github.com:username/repo.git 格式的 URL
            repo_url = repo_url:gsub(':', '/')
            repo_url = repo_url:gsub('^git@', 'https://')
            repo_url = repo_url:gsub('%.git$', '')
          else
            print("Error: Could not get remote URL")
          end
        end,
      }):sync()

      -- 获取当前行的 commit
      Job:new({
        command = "git",
        args = { "blame", "-L", line .. "," .. line, "--porcelain", file },
        on_exit = function(j, return_val)
          if return_val == 0 then
            commit = j:result()[1]:match("^([0-9a-f]+)")
          else
            print("Error: Could not get commit hash")
          end
        end,
      }):sync()

      -- 生成 URL
      if repo_url and commit then
        local url = string.format("%s/commit/%s#diff-%sR%s", repo_url, commit, file:gsub("/", "%%2F"), line)
        vim.fn.setreg("+", url)
        print("URL copied to clipboard: " .. url)
      else
        print("Error: Could not generate URL")
      end
    end
  end,
}
