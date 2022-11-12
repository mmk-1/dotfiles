-- Set space as leader key
vim.g.mapleader = ' '
local keymap = vim.keymap.set
local opts = { silent = true }

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
local builtin = require('telescope.builtin')
keymap('n', '<leader>ff', builtin.find_files, {})
keymap('n', '<leader>fg', builtin.live_grep, {})
keymap('n', '<leader>fb', builtin.buffers, {})
keymap('n', '<leader>fh', builtin.help_tags, {})

