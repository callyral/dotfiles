-- . vim api .
local set = vim.opt -- local buffer options
local o = vim.o     -- global options


-- . neovim .
if vim.fn.has('filetype') then
    vim.cmd('filetype indent plugin on')
end


-- . leader key .
vim.g.mapleader =   ' '


-- . indentation .
set.autoindent =  true
set.expandtab =   true 
set.shiftwidth =  4
set.softtabstop = 4
set.tabstop =     4
set.wildmode =   'longest,list' -- tab completions


-- . folding .
set.foldenable =  false
set.foldlevel =   99
o.foldexpr =   'nvim_treesitter#foldexpr()'
o.foldmethod = 'expr'
set.foldcolumn =  '1'


-- . search .
set.hlsearch =   true -- highlighted matched patterns in search
set.incsearch =  true
set.ignorecase = true -- ignore search case
set.smartcase =  true -- ignore search case only if all letters are lowercase


-- . vi compatibility .
set.backspace =  'indent,eol,start'
set.compatible = false
set.ttyfast =    true -- speed up scrolling


-- . appearance .
set.cmdheight =     2
set.number =        true -- show line numbers
set.showcmd =       true -- show command in last line of screen
set.showmatch =     true -- show matching brackets
set.termguicolors = true
--  enable syntax highlighting if possible
if vim.fn.has('syntax') then
    vim.syntax = 'on'
end


-- . split order .
set.splitbelow =    true
set.splitright =    true


-- . timeout .
set.timeout =     false
set.ttimeout =    true
set.ttimeoutlen = 200


-- . quality-of-life .
set.clipboard =   'unnamedplus' -- use system clipboard
set.confirm =     true          -- ask for confirmation when quitting
set.cursorline =  true          -- highlight selected line
set.hidden =      true          -- open multiple files at once
set.ruler =       true          -- show cursor position somewhere
set.visualbell =  true          -- use visual bell instead of beeping
--  enable mouse if possible
if vim.fn.has('mouse') then
    set.mouse = 'a'
end


-- . other .
set.encoding =    'UTF-8'
set.laststatus =  2
set.startofline = false
set.pastetoggle = '<F11>'
