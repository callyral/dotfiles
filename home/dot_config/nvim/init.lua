-- . modules .
require('plugins')
require('nvim_variables')
require('lsp')
require('keybinds')
if vim.g['neovide'] then
	require('neovide')
end


-- . shorthands .
local set = vim.opt


-- . tab .
set.expandtab = true -- vim-sleuth
set.shiftwidth = 4 -- vim-sleuth
set.softtabstop = 4 -- vim-sleuth
set.tabstop = 4 -- vim-sleuth
set.wildmode = 'longest,list' -- tab completions


-- . plugins .
-- * barbar
require('bufferline').setup {
	icons = {
		button = 'x',
		modified = {
			button = '*'
		},
		pinned = {
			button = 'v'
		},
		filetype = {
			custom_colors = true
		},
		inactive = {
			separator = {left = '|', right = ''}
		},
		separator = {left = '|', right = ''}
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

-- * lualine
require('lualine').setup {
	options = {
		theme = 'catppuccin',
		section_separators = { left = '', right = '' },
	    component_separators = { left = '|', right = '|' },
	},
}

-- * treesitter
require('nvim-treesitter.configs').setup {
	highlight = { enable = true }
}


-- . colorschemes .
set.background = 'dark'
-- * catppuccin
require('catppuccin').setup {
	integrations = {
		alpha = true,
		barbar = true,
		gitsigns = true,
		treesitter = true,
	}
}
vim.cmd('colorscheme catppuccin-macchiato')
