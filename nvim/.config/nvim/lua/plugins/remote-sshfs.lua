return {
	"nosduco/remote-sshfs.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	opts = {},
	config = function()
		require("remote-sshfs").setup()

		-- keymaps
		local api = require("remote-sshfs.api")
		local map = require("helpers.keys").map
		map("n", "<leader>rc", api.connect, "Connect to remote host")
		map("n", "<leader>rd", api.disconnect, "Disconnect from remote host")
		map("n", "<leader>re", api.edit, "Edit hosts")
	end,
}
