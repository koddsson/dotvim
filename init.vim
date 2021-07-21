" Set leader key to `,`
let mapleader = ","

" Open the fuzzy finder with ,p (only tracked git files)
map <leader>p :GFiles<CR>
" Open the fuzzy finder with ,o (include files not tracked in git)
map <leader>o :Files<CR>

" Open up notes with ,m
map <leader>m :Files ~/notes/<CR>

" Don't know what this is.
let g:fzf_buffers_jump = 1

"Install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" The best way to find files
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  " Both options are optional. You don't have to install fzf in ~/.fzf
  " and you don't have to run install script if you use fzf only in Vim.

" for `:Ag`
Plug 'junegunn/fzf.vim'

" The cool line at the bottom
Plug 'itchyny/lightline.vim'

" For node plugings
Plug 'neovim/node-host', { 'do': 'npm install -g neovim' }

" Linting and formatting
Plug 'dense-analysis/ale'

" Solarized
Plug 'altercation/vim-colors-solarized'

" Git & GitHub
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" cs'" to replace ' with ", ds' to remove '
Plug 'tpope/vim-surround'

" For repeating plugin commands
Plug 'tpope/vim-repeat'

" `g c` to comment and uncomment lines
Plug 'tpope/vim-commentary'

" To make emojis render correctly
Plug 'junegunn/vim-emoji'

" Access the terminal with `:Term`
Plug 'mklabs/split-term.vim'

" Languages and syntaxes
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'sheerun/vim-polyglot'

" Dependency version info
Plug 'meain/vim-package-info', { 'do': 'npm install' }

" So that TypeScript is usable.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" For YARDoc in Ruby
Plug 'noprompt/vim-yardoc'

" Initialize plugin system
call plug#end()

" Don't display `-- INSERT --` when in insert mode, since airline does that
" already.
set noshowmode

" Solarized theme and syntax highlighting with line numbers
syntax enable
set background=light
colorscheme solarized
set number

" Set ALE linters and fixes.
let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'erb': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop', 'trim_whitespace'],
\   'typescript': ['eslint', 'tsserver', 'prettier', 'prettier-eslint'],
\   'javascript': ['eslint', 'flow', 'prettier', 'prettier-eslint'],
\   'css': ['stylelint', 'prettier'],
\   'sass': ['stylelint', 'prettier'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace', 'prettier'],
\   'ruby': ['rubocop', 'trim_whitespace'],
\   'typescript': ['eslint', 'prettier', 'prettier-eslint'],
\   'javascript': ['eslint', 'prettier', 'prettier-eslint'],
\   'css': ['stylelint', 'prettier'],
\   'sass': ['stylelint', 'prettier'],
\}
let g:ale_linter_aliases = {
\   'typescript': ['javascript']
\}

let g:ale_fix_on_save = 1

"TODO: Can I somehow conditionally enable this when I'm working in
"`github/github`?
"let g:ale_ruby_rubocop_executable = 'bin/rubocop'

" I really don't know what this does
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab
" Speling is good
set spell

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Yank to system clipboard
set clipboard=unnamedplus

" Show full filename in lightline
let g:lightline = {'component': {'filename': '%F',}}

" Make sure .cjs files are identified as js
au BufNewFile,BufRead *.js,*.javascript,*.es,*.mjs,*.cjs   setf javascript

" Use K to show COC documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Live substitution
" http://vimcasts.org/episodes/neovim-eyecandy/#shownotes
set inccommand=nosplit

" Custom command to allow you to turn of fixer such as prettier.
"
" https://github.com/dense-analysis/ale/issues/1353
command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"

" When in markdown, having selected some text, press Ctrl+K to have it wrapped
" in [](). So `foo` becomes `[foo]()` with the cursor placed inbetween ()
xmap <C-k> "zdi[<C-R>z]()<Left>
