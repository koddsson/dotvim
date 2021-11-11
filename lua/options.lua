-- Set leader key to `,`
vim.g.mapleader = ','

-- Show numbers
vim.opt.number = true
-- show existing tab with 4 spaces width
vim.opt.tabstop = 2
-- when indenting with '>', use 4 spaces width
vim.opt.shiftwidth=2
-- On pressing tab, insert 4 spaces
vim.opt.expandtab = true
-- Speling is good
vim.opt.spell = true
-- Yank to system clipboard
vim.opt.clipboard = 'unnamedplus'
-- Live substitution
-- http://vimcasts.org/episodes/neovim-eyecandy/#shownotes
vim.opt.inccommand = 'nosplit'
-- I prefer light themes over dark themes.
vim.opt.background = 'light'

-- Set the theme to solarized
vim.cmd 'colorscheme solarized'
-- Don't display `-- INSERT --` when in insert mode, since lightline does that already.
vim.cmd 'set noshowmode'

-- Jump to the existing window if possible
vim.g.fzf_buffers_jump = 1
-- Show full filename in lightline
vim.g.lightline = {component = {filename = '%F'}}
