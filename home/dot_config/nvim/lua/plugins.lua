vim.g['ale_disable_lsp'] = 1

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

-- plugins
require("lazy").setup({
    -- Dependencies
    { 'nvim-tree/nvim-web-devicons', lazy = true },

    -- LSP
    'neovim/nvim-lspconfig', -- LSP config
    'hrsh7th/nvim-cmp', -- autocompletion
    'L3MON4D3/LuaSnip', -- snippets
    'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
    'saadparwaiz1/cmp_luasnip', -- snippets source for nvim-cmp

    'dense-analysis/ale', -- code linting
    'editorconfig/editorconfig-vim', -- support for .editorconfig
    'preservim/nerdcommenter', -- automatic text commenter
    'scrooloose/nerdtree', -- tree file management
    'tmsvg/pear-tree', -- pair quotes, parentheses, html tags, etc
    'tpope/vim-sleuth', -- indentation management
    {'mg979/vim-visual-multi', branch = 'master'},

    -- * git-related
    'lewis6991/gitsigns.nvim', -- git decorations
    'tpope/vim-fugitive', -- git command support
    
    -- * alpha - greeter (dashboard theme)
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    },

    -- * barbar - tab/bufferline
    {
        'romgrk/barbar.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- * lualine - a statusline written in lua
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- * treesitter - better code highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end
    },

    -- * catppuccin colorscheme
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
})
