return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		notify_on_error = true,
		format_on_save = { timeout_ms = 500, lsp_fallback = false },
		formatters_by_ft = {
			python = { "ruff_format" },
			lua = { "stylua" },
		},
	},
}
