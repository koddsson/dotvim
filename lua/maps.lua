local map = vim.api.nvim_set_keymap

-- Open the fuzzy finder with ,p (only tracked git files)
map('n', '<leader>p', ':GFiles<CR>', {noremap = true})
-- Open the fuzzy finder with ,o (include files not tracked in git)
map('n', '<leader>o', ':Files<CR>', {noremap = true})
