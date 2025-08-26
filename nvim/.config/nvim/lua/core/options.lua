local opt = vim.opt

-- Indent and whitespace
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

-- UI
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.wrap = false
opt.showmode = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false

-- Files
opt.undofile = true
opt.swapfile = false
opt.backup = false

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Misc
opt.mouse = "a"
opt.updatetime = 200
opt.timeoutlen = 400
opt.clipboard = "unnamedplus" -- Use system clipboard

-- vim: ts=2 sts=2 sw=2 et
