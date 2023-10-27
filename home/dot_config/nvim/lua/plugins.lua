vim.g['ale_disable_lsp'] = 1
vim.g['ale_use_neovim_diagnostics_api'] = 1

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- . plugins .
require('lazy').setup({
    -- Dependencies
    { 'nvim-tree/nvim-web-devicons', lazy = true },

    -- * LSP
    'neovim/nvim-lspconfig', -- LSP config
    --  nvim-cmp
    'hrsh7th/cmp-nvim-lsp', -- nvim-cmp LSP integration
    --'hrsh7th/cmp-buffer',
    --'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
    'hrsh7th/nvim-cmp', -- autocompletion
    --  code snippets
    'dcampos/nvim-snippy',
    'dcampos/cmp-snippy',
    'honza/vim-snippets',

    'dense-analysis/ale',            -- code linting
    'preservim/nerdcommenter',       -- automatic text commenter
    'tmsvg/pear-tree',               -- pair quotes, parentheses, html tags, etc
    'tpope/vim-sleuth',              -- indentation management

    -- * mini.nvim - a bunch of tiny modules that make neovim better
    {
        'echasnovski/mini.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        version = false
    },

    -- * vim-visual-multi - multiple cursors and better selection
    { 'mg979/vim-visual-multi', branch = 'master' },

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

    -- * lualine - a statusline written in lua
    --[[{
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },]]

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
