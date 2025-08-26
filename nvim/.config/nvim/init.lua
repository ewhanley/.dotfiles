-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ System clipboard ]]
vim.opt.clipboard = "unnamedplus"

-- [[ Setting options ]]
require("core.options")

-- [[ Basic keymaps ]]
require("core.keymaps")

-- [[ Install `lazy.nvim` plugin manager ]]
require("core.lazy")

-- [[ Commands ]]
-- require("core.commands")

vim.schedule(function()
	if not pcall(require, "lazy") then
		vim.notify("lazy.nvim failed to load", vim.log.levels.WARN)
	end
end)

-- Copilot highlights are now handled in lua/plugins/copilot_mode.lua
-- vim: ts=2 sts=2 sw=2 et
