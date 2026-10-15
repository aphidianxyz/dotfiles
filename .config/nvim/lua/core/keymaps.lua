-- general
vim.keymap.set({'i', 'v'}, 'jk', '<Esc>')
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], {noremap = true})

-- nvim-tree
vim.keymap.set('n', '<Leader>n', ':NvimTreeToggle<CR>', { silent = true })
