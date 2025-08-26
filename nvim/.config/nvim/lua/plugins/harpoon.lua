-- harpoon!
return {
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("harpoon").setup()

			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			-- Harpoon keymaps
			vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Harpoon add file" })
			vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = "Harpoon menu" })

			-- Navigate to files
			vim.keymap.set("n", "<leader>h1", function()
				ui.nav_file(1)
			end, { desc = "Harpoon file 1" })
			vim.keymap.set("n", "<leader>h2", function()
				ui.nav_file(2)
			end, { desc = "Harpoon file 2" })
			vim.keymap.set("n", "<leader>h3", function()
				ui.nav_file(3)
			end, { desc = "Harpoon file 3" })
			vim.keymap.set("n", "<leader>h4", function()
				ui.nav_file(4)
			end, { desc = "Harpoon file 4" })
		end,
	},
}
