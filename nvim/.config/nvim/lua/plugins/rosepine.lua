return {
	{ -- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to hatever the name of that colorscheme is
		--
		--If you wan to tsee what colorschemes are already installed, you can use `:Telescope colorscheme`
		"rose-pine/neovim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all other start plugins
		config = function()
			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
