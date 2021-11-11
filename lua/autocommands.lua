-- Return to last edit position when opening files (You want this!)
vim.cmd([[
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
]])

-- Make sure .cjs files are identified as js
vim.cmd('autocmd BufNewFile,BufRead *.js,*.javascript,*.es,*.mjs,*.cjs   setf javascript')

-- Fix all ESLint errors right before saving. This sometimes errors, not sure why.
vim.cmd 'autocmd BufWritePre *.js,*.mjs,*.cjs,*.ts silent! :EslintFixAll'

