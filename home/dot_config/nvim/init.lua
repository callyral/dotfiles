-- . modules .
require('plugins')
require('options')
require('lsp')
require('keybinds')
if vim.g['neovide'] then
    require('neovide')
end


-- . shorthands .
local set = vim.opt


-- . plugins .
-- * cmp
local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local snippy = require('snippy')
local cmp = require('cmp')
require('cmp').setup {
    snippet = {
        expand = function(args)
            snippy.expand_snippet(args.body)
        end
    },
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif snippy.can_expand_or_advance() then
                snippy.expand_or_advance()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif snippy.can_jump(-1) then
                snippy.previous()
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = {
        { name = 'snippy' },
        { name = 'path' },
        { name = 'nvim_lsp' }
    }
}

-- * git signs
require('gitsigns').setup {
    signs = {
        add          = { hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
        change       = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
        delete       = { hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
        topdelete    = { hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
        untracked    = { hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
    }
}

-- * treesitter
require('nvim-treesitter.configs').setup {
    ensure_installed = { "bash", "c", "lua", "rust", "zig" },
    auto_install = false,
    highlight = { enable = true },
}

-- * mini.nvim
require('mini.tabline').setup{}    -- a tabline
require('mini.statusline').setup{} -- a statusline
require('mini.comment').setup{}    -- quick commenting
require('mini.pick').setup{}       -- pick a file, use grep, etc
require('mini.jump2d').setup{}     -- jump to anywhere with keyboard (enter<letter>)


-- . colorschemes .
set.background = 'dark'
-- * catppuccin
require('catppuccin').setup {
    integrations = {
        alpha = true,
        gitsigns = true,
        treesitter = true,
    }
}
vim.cmd('colorscheme catppuccin-macchiato')
