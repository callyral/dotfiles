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
    -- Dependecy section
    { "nvim-tree/nvim-web-devicons", lazy = true },

    'dense-analysis/ale', -- code linting
    'editorconfig/editorconfig-vim', -- support for .editorconfig
    'fladson/vim-kitty', -- support for kitty.conf
    'honza/vim-snippets', -- some snippets
    'mhinz/vim-startify', -- start screen
    'preservim/nerdcommenter', -- automatic text commenter
    'scrooloose/nerdtree', -- tree file management
    'tmsvg/pear-tree', -- pair quotes, parentheses, html tags, etc
    'tpope/vim-sleuth', -- indentation management
    {'mg979/vim-visual-multi', branch = 'master'},
    {'neoclide/coc.nvim', branch = 'release'}, -- code completion

    -- * git-related
    'lewis6991/gitsigns.nvim', -- git decorations
    'tpope/vim-fugitive', -- git command support

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
