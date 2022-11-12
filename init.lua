-- Disabling netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- require 
require "user.plugins"
require "user.cmp"
require "user.lsp"
require "user.keymaps"
require "user.nvim-tree"

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
-- no wrapping
set.wrap = false

set.number = true
set.relativenumber = true
-- Netrw settings
vim.g.netrw_winsize= 10
vim.g.netrw_banner = 0

set.swapfile = false

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
