-- harpoon!
return {
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("harpoon").setup()

			local map = require("helpers.keys").map

			map("n", "<leader>hm", require("harpoon.mark").add_file, "Mark file in harpoon")
			map("n", "<leader>ht", require("harpoon.ui").toggle_quick_menu, "Toggle harpoon menu")
		end,
	},
}
