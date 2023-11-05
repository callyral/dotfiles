;;;; key binds
(local keymap vim.keymap.set)
(local map-opts {:noremap true :silent true})
(set vim.g.mapleader " ")
;;; normal mode
(keymap :n :<C-s> ::w<CR>      map-opts) ; save with ctrl+s
(keymap :n :<Esc> ::noh<Esc>   map-opts) ; remove highlights with esc
(keymap :n :ak    ":m .-2<CR>" map-opts) ; move line up
(keymap :n :aj    ":m .+1<CR>" map-opts) ; move line down
;; window management
(keymap :n :<Leader>h ::split<CR>       map-opts) ; split current buffer horizontally
(keymap :n :<Leader>v ::vsplit<CR>      map-opts) ; split current buffer vertically
(keymap :n :<Leader>q ::hide<CR>        map-opts) ; close (hide) current window
(keymap :n :<Leader>f ":Pick files<CR>" map-opts) ; use mini.pick to pick files
;; buffer management
(keymap :n :<C-t>     ::enew<CR>          map-opts) ; make a new buffer in the current window
(keymap :n :<C-q>     ::bdelete<CR>       map-opts) ; close current buffer
(keymap :n :<C-Left>  ::bprevious<CR>     map-opts) ; go to previous buffer
(keymap :n :<C-Right> ::bnext<CR>         map-opts) ; go to next buffer
(keymap :n :<Leader>b ":Pick buffers<CR>" map-opts) ; use mini.pick to pick buffers
;;; insert mode
(keymap :i :<A-k> "<Esc>:m .-2<CR>==gi" map-opts) ; move line up
(keymap :i :<A-j> "<Esc>:m .+1<CR>==gi" map-opts)   ; move line down
;(keymap :i :<A-Up>   "<Esc>:m .-2<CR>==gi" map-opts)
;(keymap :i :<A-Down> "<Esc>:m .+1<CR>==gi" map-opts)
