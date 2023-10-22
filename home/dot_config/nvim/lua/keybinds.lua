local map = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.mapleader = ' '


-- . notes .
-- ==gi means go back to insert mode


-- . insert mode .
map('i', '<A-Down>', '<Esc>:m .+1<CR>==gi', opts) -- move current line up
map('i', '<A-Up>',   '<Esc>:m .-2<CR>==gi', opts)   -- move current line down


-- . normal mode .
map('n', '<C-s>', ':w<CR>', opts)      -- save
map('n', '<C-z>', 'za', opts)          -- toggle current fold
map('n', '<Esc>', ':noh<Esc>', opts)   -- hide highlights

-- * tab and buffer management
map('n', '<C-t>',     ':enew<CR>', opts)      -- make a new buffer in the current window
map('n', '<Leader>h', ':split<CR>', opts)     -- split current buffer horizontally
map('n', '<Leader>v', ':vsplit<CR>', opts)    -- split current buffer vertically
map('n', '<C-S-Tab>', ':bprevious<CR>', opts) -- go to previous buffer
map('n', '<C-Left>',  ':bprevious<CR>', opts)
map('n', '<C-Tab>',   ':bnext<CR>', opts)     -- go to next buffer
map('n', '<C-Right>', ':bnext<CR>', opts)
map('n', '<C-q>',     ':bdelete<CR>', opts)   -- close current buffer
--map('n', '<C-w>',     ':bdelete<CR>', opts)
