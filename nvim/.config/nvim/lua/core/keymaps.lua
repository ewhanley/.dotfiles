local map = require("helpers.keys").map

-- back to netrw
map("n", "<leader>pv", vim.cmd.Ex)

-- fast insert toggle
map("i", "jk", "<esc>")

-- move windows
map("n", "<S-Left>", "<C-w><S-h>", "Move window to the left")
map("n", "<S-Down>", "<C-w><S-j>", "Move window down")
map("n", "<S-Up>", "<C-w><S-k>", "Move window up")
map("n", "<S-Right>", "<C-w><S-l>", "Move window to the right")


-- resize windows
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

-- delete buffers
local buffers = require("helpers.buffers")
map("n", "<leader>db", buffers.delete_this, "Current buffer")
map("n", "<leader>do", buffers.delete_others, "Other buffers")
map("n", "<leader>da", buffers.delete_all, "All buffers")

-- navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- toggle light and dark modes
map("n", "<leader>ut", function()
	if vim.o.background == "dark" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
end, "Toggle between light and dark themes")

-- clear after search
map("n", "<leader>ur", "<cmd>nohl<cr>", "Clear highlighting")

-- from the Primeagen
map({"n", "v"}, "<leader>y", '"+y', "Copy to system clipboard")
map("n", "<leader>Y", '"+Y', "Copy to system clipboard")
map("n", "<leader>f", vim.lsp.buf.format)
