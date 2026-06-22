vim.pack.add { 'https://github.com/akinsho/toggleterm.nvim' }
require('toggleterm').setup { shade_terminals = false }

vim.keymap.set('n', '<leader>t', ':ToggleTerm size=15<cr>')
vim.keymap.set('t', '<leader>t', '<C-\\><C-n><CMD>ToggleTerm size=15<cr>')
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
