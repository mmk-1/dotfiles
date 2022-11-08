-- require 
require "user.plugins"
require "user.cmp"

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
