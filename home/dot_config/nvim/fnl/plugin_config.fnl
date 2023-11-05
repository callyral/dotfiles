;; colorscheme
(set vim.opt.background :dark)
((. (require :catppuccin) :setup)
  {:integrations {:alpha true :gitsigns true :treesitter true}})
(vim.cmd "colorscheme catppuccin-macchiato")

;; trim trailing whitespace
((. (require :tidy) :setup) {
  :opts {:filetype_exclude [:diff]}})

;; underline cursor word
((. (require :stcursorword) :setup)
  {:excluded {:filetypes [:alpha]
              :buftypes  [:help :nofile :terminal]}})

;; tabline/bufferline, statusline, etc
((. (require :mini.tabline) :setup) {
  :show_icons false})
((. (require :mini.statusline) :setup) {
  :set_vim_settings false})
((. (require :mini.comment)    :setup) {})
((. (require :mini.jump2d)     :setup) {}) ; navigate around a file
((. (require :mini.pairs)      :setup) {}) ; pair parentheses and brackets
((. (require :mini.pick)       :setup) {}) ; pick files, buffers, etc.
((. (require :mini.starter)    :setup) {}) ; start screen

;; auto indent size (does not override .editorconfig)
((. (require :guess-indent) :setup) {})

;; git
((. (require :gitsigns) :setup)
  {:signs {:add   {:hl :GitSignsAdd    :text :+  :numhl :GitSignsAddNr    :linehl :GitSignsAddLn}
    :change       {:hl :GitSignsChange :text "~" :numhl :GitSignsChangeNr :linehl :GitSignsChangeLn}
    :delete       {:hl :GitSignsDelete :text :-  :numhl :GitSignsDeleteNr :linehl :GitSignsDeleteLn}
    :untracked    {:hl :GitSignsAdd    :text :+  :numhl :GitSignsAddNr    :linehl :GitSignsAddLn}
    :changedelete {:hl :GitSignsChange :text "~" :numhl :GitSignsChangeNr :linehl :GitSignsChangeLn}
    :topdelete    {:hl :GitSignsDelete :text :-  :numhl :GitSignsDeleteNr :linehl :GitSignsDeleteLn}}})

;; syntax highlighting
((. (require :nvim-treesitter.configs) :setup)
  {:ensure_installed [:bash :c :fennel :lua :rust :zig] :auto_install false :highlight {:enable true}})

;;; lsp config
;; mason
((. (require :mason) :setup)
  {:PATH :skip ; don't modify $PATH
   :ui {:icons {:package_installed :i :package_pending "~" :package_uninstalled :X}}})
((. (require :mason-lspconfig) :setup)
  {:automatic_installation true})
;; lspconfig
(tset vim.g :coq_settings {:auto_start :shut-up})
(local lspconfig (require :lspconfig))
(local servers [:clangd :rust_analyzer :pyright :zls])

(each [_ lsp (ipairs servers)]
  ((. (. lspconfig lsp) :setup) ((. (require :coq) :lsp_ensure_capabilities) {})))
