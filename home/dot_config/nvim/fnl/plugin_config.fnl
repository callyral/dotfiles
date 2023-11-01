;;; greeter
((. (require :alpha) :setup) (. (require :alpha.themes.dashboard) :config))
;;; git
((. (require :gitsigns) :setup)
  {:signs {:add   {:hl :GitSignsAdd    :text :+  :numhl :GitSignsAddNr    :linehl :GitSignsAddLn}
    :change       {:hl :GitSignsChange :text "~" :numhl :GitSignsChangeNr :linehl :GitSignsChangeLn}
    :delete       {:hl :GitSignsDelete :text :-  :numhl :GitSignsDeleteNr :linehl :GitSignsDeleteLn}
    :untracked    {:hl :GitSignsAdd    :text :+  :numhl :GitSignsAddNr    :linehl :GitSignsAddLn}
    :changedelete {:hl :GitSignsChange :text "~" :numhl :GitSignsChangeNr :linehl :GitSignsChangeLn}
    :topdelete    {:hl :GitSignsDelete :text :-  :numhl :GitSignsDeleteNr :linehl :GitSignsDeleteLn}}})
;;; syntax highlighting
((. (require :nvim-treesitter.configs) :setup)
  {:ensure_installed [:bash :c :fennel :lua :rust :zig] :auto_install false :highlight {:enable true}})
;;; mini.nvim
((. (require :mini.tabline) :setup) {})
((. (require :mini.statusline) :setup) {})
((. (require :mini.comment) :setup) {})
;((. (require :mini.pick) :setup) {})
((. (require :mini.jump2d) :setup) {})

;;; colorscheme
(set vim.opt.background :dark)
((. (require :catppuccin) :setup)
  {:integrations {:alpha true :gitsigns true :treesitter true}})
(vim.cmd "colorscheme catppuccin-macchiato")

;;; mason
((. (require :mason) :setup)
  {:PATH :skip ; don't modify $PATH
    :ui {:icons {:package_installed :i :package_pending "~" :package_uninstalled :X}}})
((. (require :mason-lspconfig) :setup)
  {:automatic_installation true})

;;; lsp config
;; lspconfig
(tset vim.g :coq_settings {:auto_start :shut-up})
(local lspconfig (require :lspconfig))
(local servers [:clangd :rust_analyzer :pyright :zls])

(each [_ lsp (ipairs servers)]
  ((. (. lspconfig lsp) :setup) ((. (require :coq) :lsp_ensure_capabilities) {})))
