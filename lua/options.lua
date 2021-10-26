-- Set leader key to `,`
vim.g.mapleader = ','

-- Don't display `-- INSERT --` when in insert mode, since airline does that
-- already.
vim.cmd 'set noshowmode'
-- Show numbers
vim.opt.number = true
-- I really don't know what this does
vim.cmd('filetype plugin indent on')
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

-- Solarized theme and syntax highlighting with line numbers
vim.cmd 'syntax enable'
vim.opt.background = 'light'
vim.cmd 'colorscheme solarized'

-- Don't know what this is.
vim.g.fzf_buffers_jump = 1
-- Show full filename in lightline
vim.g.lightline = {component = {filename = '%F'}}
