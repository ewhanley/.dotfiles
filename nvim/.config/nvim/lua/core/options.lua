local opts = {
	shiftwidth = 4,
	tabstop = 4,
	expandtab = true,
	wrap = false,
	termguicolors = true,
	number = true,
	relativenumber = true,
	mouse = "a",
	showmode = false,
	breakindent = true,
	undofile = true,
	ignorecase = true,
	smartcase = true,
	updatetime = 250,
	timeoutlen = 300,
	list = true,
	--listchars = { tab = '» ', trail = '·', nbsp = '␣' },
	inccommand = "split",
	cursorline = true,
	scrolloff = 10,
}

-- set options from table
for opt, val in pairs(opts) do
	vim.o[opt] = val
end

vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Specific settings for Typescript
vim.api.nvim_create_autocmd("FileType", {
	pattern = "typescript",
	callback = function()
		vim.bo.shiftwidth = 2
		vim.bo.tabstop = 2
		vim.bo.expandtab = true
	end,
})

-- vim: ts=2 sts=2 sw=2 et
