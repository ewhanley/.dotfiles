 -- install lazy.nvim if not already installed
 local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
 if not vim.loop.fs_stat(lazypath) then
	 vim.fn.system({
		 "git",
		 "clone",
		 "--filter=blob:none",
		 "https://github.com/folke/lazy.nvim.git",
		 "--branch=stable", -- latest stable release
		 lazypath,
	 })
 end
 vim.opt.rtp:prepend(lazypath)

 -- use a protected call so we don't error on first use
 local ok, lazy = pcall(require, "lazy")
 if not ok then
	 return
 end

 -- set leader key for lazy.nvim to work
 require("helpers.keys").set_leader(" ")

 -- load plugins
 lazy.setup("plugins")

 -- set up keybinding for Lazy access
 require("helpers.keys").map("n", "<leader>L", lazy.show, "Show lazy interface")
