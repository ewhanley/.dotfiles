-- [[ Install Plugins ]]
local lazy = require('lazy')

lazy.setup('plugins')

-- Keybinding for Lazy access
require('helpers.keys').map('n', '<leader>L', lazy.show, "Show lazy interface")

-- vim: ts=2 sts=2 sw=2 et
