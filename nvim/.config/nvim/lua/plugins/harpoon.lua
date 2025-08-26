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
			vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon add file" })
			vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, { desc = "Harpoon menu" })

			-- Navigate to files
			vim.keymap.set("n", "<leader>1", function()
				ui.nav_file(1)
			end, { desc = "Harpoon file 1" })
			vim.keymap.set("n", "<leader>2", function()
				ui.nav_file(2)
			end, { desc = "Harpoon file 2" })
			vim.keymap.set("n", "<leader>3", function()
				ui.nav_file(3)
			end, { desc = "Harpoon file 3" })
			vim.keymap.set("n", "<leader>4", function()
				ui.nav_file(4)
			end, { desc = "Harpoon file 4" })
			vim.keymap.set("n", "<leader>5", function()
				ui.nav_file(4)
			end, { desc = "Harpoon file 5" })
		end,
	},
}
