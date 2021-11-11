-- Install vim-plug
local data_dir = vim.fn.stdpath('data') .. '/site/autoload/plug.vim'
if vim.fn.empty(vim.fn.glob(data_dir)) == 1 then
  vim.cmd('silent execute \'!curl -fLo ' .. data_dir .. ' --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim\'')
 vim.cmd 'autocmd VimEnter * PlugInstall --sync | source $MYVIMRC'
end

-- Set up Plug function 
local Plug = vim.fn['plug#']

-- Specify a directory for plugins. Avoid using standard Vim directory names
-- like 'plugin'.
local plug_path = vim.fn.stdpath('data') .. '/plugged'
vim.call('plug#begin', plug_path)

-- Add LSP support
Plug 'neovim/nvim-lspconfig'

-- The best way to find files.
--
-- PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
-- Both options are optional. You don't have to install fzf in ~/.fzf and you
-- don't have to run install script if you use fzf only in Vim.
Plug('junegunn/fzf', {dir = '~/.fzf', ['do'] = './install --all' })
Plug 'junegunn/fzf.vim'

-- The cool line at the bottom
Plug 'itchyny/lightline.vim'

-- Solarized
Plug 'altercation/vim-colors-solarized'

-- cs'" to replace ' with ", ds' to remove '
Plug 'tpope/vim-surround'

-- `g c` to comment and uncomment lines
Plug 'tpope/vim-commentary'

-- To make emojis render correctly
Plug 'junegunn/vim-emoji'

-- Treesitter for syntax highlighting
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

-- Initialize plugin system
vim.call('plug#end')

vim.cmd('set completeopt=menu,menuone,noselect')

