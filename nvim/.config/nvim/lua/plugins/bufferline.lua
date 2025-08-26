-- See current buffers at the top of the editor
return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {},
		config = function(_, opts)
			require("bufferline").setup(opts)
			
			-- Tab navigation keymaps
			vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Next tab", silent = true })
			vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Previous tab", silent = true })
			vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Close buffer", silent = true })
			vim.keymap.set("n", "<leader>X", ":bdelete!<CR>", { desc = "Force close buffer", silent = true })
		end,
	},
}
