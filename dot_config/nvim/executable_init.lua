-- . modules .
require('plugins')
require('nvim_variables')

-- . shorthands .
local set = vim.opt

-- . colorschemes .
--	some color settings may also be in the neovide support section.
set.background = 'dark'

-- . neovide .
if vim.g['neovide'] then
	-- * neovide-only
	vim.g['neovide_confirm_quit'] = true
	vim.g['neovide_cursor_animation_length'] = 0.15
	vim.g['neovide_cursor_trail_size'] = 0.05
	vim.g['neovide_cursor_vfx_mode'] = 'pixiedust'
	vim.g['neovide_cursor_vfx_particle_density'] = 30.0
	vim.g['neovide_hide_mouse_when_typing'] = true

	set.guifont = 'Jetbrains_Mono:h10'
end

-- . tab .
set.expandtab = true -- vim-sleuth
set.shiftwidth = 4 -- vim-sleuth
set.softtabstop = 4 -- vim-sleuth
set.tabstop = 4 -- vim-sleuth
set.wildmode = 'longest,list' -- tab completions

-- . plugins .
vim.g['fzf_layout'] = {window = {width = 0.8, height = 0.5, highlight = 'Comment'}}

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
		theme = 'nord',
		section_separators = { left = '', right = '' },
	    component_separators = { left = '|', right = '|' },
	},
}

-- * nvim-nu
require('nu').setup {
	use_lsp_features = false -- requires null-ls.nvim
}

-- * treesitter
require('nvim-treesitter.configs').setup {
	highlight = { enable = true }
}

vim.cmd('colorscheme catppuccin-macchiato')

-- . keybinds .
--[[
	==gi returns back to insert mode.
	<CR> is the return key.
]]
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.mapleader = ' '

map('i', '<A-Down>', '<Esc>:m .+1<CR>==gi', opts) -- move the selected line up
map('i', '<A-Up>', '<Esc>:m .-2<CR>==gi', opts) -- move the selected line down

map('i', '<A-y>', '<Esc>:redo<CR>==gi', opts)
map('i', '<A-z>', '<Esc>:undo<CR>==gi', opts)

map('n', '<C-s>', ':w<CR>', opts)
map('n', '<C-z>', 'za', opts)
map('n', '<Esc>', ':noh<Esc>', opts)
map('n', '<A-t>', ':tabnew<CR>', opts)

map('n', '<Leader>v', ':vsplit<CR>', opts)
map('n', '<Leader>h', ':split<CR>', opts)

-- >> Tab/buffer management
--	this uses barbar
-- go to previous/next tab/buffer
map('n', '<C-Left>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-Right>', '<Cmd>BufferNext<CR>', opts)

-- (un)pin tab/buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- close tab/buffer
map('n', '<C-q>', '<Cmd>BufferClose<CR>', opts)

-- . keybinds (vim) .
--[[
	these are specifically for changing the coc completion key to tab.
	i was unable to figure this out in lua.
]]
vim.cmd('inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\\<C-g>u\\<TAB>"')
vim.cmd('inoremap <silent><expr> <CR> "\\<c-g>u\\<CR>"')
