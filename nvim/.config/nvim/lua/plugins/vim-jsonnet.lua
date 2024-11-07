-- File: ~/.config/nvim/lua/plugins/vim-jsonnet.lua

return {
	"google/vim-jsonnet",
	ft = { "jsonnet", "libsonnet" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
			pattern = { "*.jsonnet", "*.libsonnet" },
			command = "setfiletype jsonnet",
		})

		-- Set up folding for Jsonnet files using Treesitter
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "jsonnet",
			callback = function()
				vim.wo.foldmethod = "expr"
				vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
				vim.wo.foldenable = true
				vim.wo.foldlevel = 99

				-- Custom folding text
				vim.wo.foldtext =
					[[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
			end,
		})
	end,
}
