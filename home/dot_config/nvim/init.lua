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

-- * catppuccin
require('catppuccin').setup {
	integrations = {
		alpha = true,
		barbar = true,
		gitsigns = true,
		treesitter = true,
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

-- . LSP section .
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'zls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- * luasnip
local luasnip = require('luasnip')

-- * nvim-cmp
local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- * LSP keybinds
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local keybinds
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
