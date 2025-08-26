local map = vim.keymap.set
local silent = { silent = true, noremap = true }

-- Window moves
map("n", "<C-h>", "<C-w>h", silent)
map("n", "<C-j>", "<C-w>j", silent)
map("n", "<C-k>", "<C-w>k", silent)
map("n", "<C-l>", "<C-w>l", silent)

-- Clear search highlights
map("n", "<esc>", "<cmd>nohlsearch<cr>", silent)

-- Diagnostics navigation (works before LSP attaches)
map("n", "[d", vim.diagnostic.goto_prev, silent)
map("n", "]d", vim.diagnostic.goto_next, silent)
map("n", "<leader>e", vim.diagnostic.open_float, silent)
