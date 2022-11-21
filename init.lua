-- Set everything up.

-- Set up plugins first since subsequent code might require some setup from the
-- plugins.
require('plugins')
-- Options have to be loaded before maps since the leader key is set in options
-- and maps references it.
require('options')
require('maps')
require('autocommands')
require('lsp')

-- Configure treesitter
local ts = require 'nvim-treesitter.configs'
ts.setup {
  ensure_installed = "all",
  auto_install = true,
  highlight = {enable = true}
}
