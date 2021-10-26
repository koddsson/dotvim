-- Set everything up.

-- Set up plugins first since subsequent code might require some setup from the
-- plugins.
require('plugins')
-- Options have to be loaded before maps since the leader key is set in options
-- and maps references it.
require('options')
require('maps')
require('autocommands')

-- Set up LSP servers
require'lspconfig'.tsserver.setup{}
require'lspconfig'.eslint.setup{}
require'lspconfig'.html.setup{}

-- TODO: I want deno only to be configured when we're in a deno project. Maybe
-- even turn off the tsserver one.
-- require'lspconfig'.denols.setup{
--   root_dir = root_pattern("mod.ts")
-- }

-- TODO: Enable once I figure out how to run nvim nightly
-- Configure treesitter
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}
