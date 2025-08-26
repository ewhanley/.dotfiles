return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			notify_on_error = true,
			format_on_save = { timeout_ms = 500, lsp_fallback = false },
			formatters_by_ft = {
				python = { "ruff_format" },
				lua = { "stylua" },
			},
		})

		-- Add format keymap
		vim.keymap.set({ "n", "v" }, "<leader>lf", function()
			conform.format({ async = true, lsp_fallback = true })
		end, { desc = "Format buffer" })
	end,
}
