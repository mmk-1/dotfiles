local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)

    use { "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" } -- Have packer manage itself
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }
    use { "nvim-treesitter/nvim-treesitter", commit = "8e763332b7bf7b3a426fd8707b7f5aa85823a5ac" }

    -- Comment with gcc
    use { "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" }

    -- Colorscheme
    use { "NLKNguyen/papercolor-theme" }

    -- Snippet related plugins
    use { "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" } --snippet engine
    use { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" } -- a bunch of snippets to use

    -- cmp plugins
    use { "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" } -- The completion plugin
    use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
    use { "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" } -- path completions
    use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
    use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
    use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }

    -- LSP stuff
    use { "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" } -- enable LSP
    use { "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12"}
    use { "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" }

    -- md notetaking
    use {
        "nvim-neorg/neorg",
    }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

