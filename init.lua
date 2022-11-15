-- Disabling netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- require 
require "user.plugins"
require "user.cmp"
require "user.lsp"
require "user.keymaps"
require "user.nvim-tree"
require "user.treesitter"

-- Set colorscheme
local colorscheme = "PaperColor"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end


-- Options

-- Tabs
local set = vim.opt
set.shiftwidth = 4
set.tabstop = 4
set.expandtab = true
set.swapfile = false
set.mouse = "a"
vim.opt.clipboard = "unnamedplus"

-- no wrapping
set.wrap = false

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = {'*.md', '*.txt'},
 -- group = group,
  command = 'setlocal wrap'
})

set.number = true
set.relativenumber = true
-- Netrw settings
--vim.g.netrw_winsize= 10
-- vim.g.netrw_banner = 0

-- Autocomplete pairs no need for a plugin!!!
vim.api.nvim_exec(
[[
    inoremap { {}<Esc>ha
    inoremap ( ()<Esc>ha
    inoremap [ []<Esc>ha
    inoremap " ""<Esc>ha
    inoremap ' ''<Esc>ha
    inoremap ` ``<Esc>ha
]],
true)
