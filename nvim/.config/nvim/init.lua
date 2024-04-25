-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Setting options ]]
require 'core.options'

-- [[ Basic keymaps ]]
require 'core.keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'core.lazy'

-- [[ Configure and install plugins ]]
require 'core.lazy-plugins'

-- vim: ts=2 sts=2 sw=2 et
