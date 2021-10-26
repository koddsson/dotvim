-- Return to last edit position when opening files (You want this!)
vim.cmd([[
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
     ]])

-- Make sure .cjs files are identified as js
vim.cmd('autocmd BufNewFile,BufRead *.js,*.javascript,*.es,*.mjs,*.cjs   setf javascript')

-- TODO: I don't know why this triggers on other files when `:EslintFixAll`
-- doesn't exist??
-- autocmd BufWritePre <buffer> :EslintFixAll
-- Fix all ESLint errors right before saving.
vim.cmd('autocmd BufWritePre *.js,*.ts,*.cjs,*.mjs :EslintFixAll')
