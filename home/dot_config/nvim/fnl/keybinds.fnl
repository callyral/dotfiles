;;;; key binds
(local keymap vim.keymap.set)
(local map-opts {:noremap true :silent true})
(set vim.g.mapleader " ")
;;; normal mode
(keymap :n :<C-s> ::w<CR> map-opts)    ; save with ctrl+s
(keymap :n :<Esc> ::noh<Esc> map-opts) ; remove highlights with esc
;; buffer management 
(keymap :n :<C-t>     ::enew<CR>      map-opts) ; make a new buffer in the current window
(keymap :n :<Leader>h ::split<CR>     map-opts) ; split current buffer horizontally
(keymap :n :<Leader>v ::vsplit<CR>    map-opts) ; split current buffer vertically
(keymap :n :<C-S-Tab> ::bprevious<CR> map-opts) ; go to previous buffer
(keymap :n :<C-Left>  ::bprevious<CR> map-opts)
(keymap :n :<C-Tab>   ::bnext<CR>     map-opts) ; go to next buffer
(keymap :n :<C-Right> ::bnext<CR>     map-opts)
(keymap :n :<C-q>     ::bdelete<CR>   map-opts) ; close current buffer
;;; insert mode
(keymap :i :<A-Up>   "<Esc>:m .-2<CR>==gi" map-opts)
(keymap :i :<A-Down> "<Esc>:m .+1<CR>==gi" map-opts)
