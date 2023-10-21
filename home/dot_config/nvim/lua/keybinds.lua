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
