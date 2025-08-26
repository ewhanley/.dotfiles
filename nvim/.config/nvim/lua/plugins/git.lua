-- Git plugins: gitsigns always-on, Fugitive for :Git commands
return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
			},
			current_line_blame = false,
			word_diff = false,
			linehl = false,
			numhl = false,
		},
	},

	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G", "Gdiffsplit", "Gblame", "Gread", "Gwrite" },
		keys = {
			{ "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
			{ "<leader>ga", "<cmd>Git add %<cr>", desc = "Stage current file" },
			{ "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame (fugitive)" },
			{ "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Diff split (fugitive)" },
			{ "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
		},
	},
}