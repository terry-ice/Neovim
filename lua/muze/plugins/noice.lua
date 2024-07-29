return {
    {
		"folke/noice.nvim",
		opts = function(_, opts)
			opts.commands = {
				all = {
					-- options for the message history that you get with `:Noice`
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {},
				},
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function(event)
					vim.schedule(function()
						require("noice.text.markdown").keys(event.buf)
					end)
				end,
			})

		end,
},
{
    "rcarriga/nvim-notify",
    opts = {
        timeout = 5000,
    },
},
}