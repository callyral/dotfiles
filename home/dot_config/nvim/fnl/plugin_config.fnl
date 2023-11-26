;; colorscheme
(set vim.opt.background :dark)
((. (require :catppuccin) :setup)
  {:integrations {:gitsigns true :treesitter true}
    :highlight {:enable true :additional_vim_regex_highlighting false}})
(vim.cmd "colorscheme catppuccin-macchiato")

;; trim trailing whitespace
((. (require :tidy) :setup) {
  :opts {:filetype_exclude [:diff]}})

;; underline cursor word
((. (require :stcursorword) :setup)
  {:excluded {:filetypes []
              :buftypes  [:help :nofile :terminal]}})

;; tabline/bufferline, statusline, etc
((. (require :mini.tabline) :setup) {
  :show_icons false})
((. (require :mini.statusline) :setup) {
  :set_vim_settings false})
((. (require :mini.comment) :setup) {})
((. (require :mini.jump2d)  :setup) {}) ; navigate around a file
((. (require :mini.pairs)   :setup) {}) ; pair parentheses and brackets
((. (require :mini.pick)    :setup) {}) ; pick files, buffers, etc.
((. (require :mini.starter) :setup) {}) ; start screen

;; automatic indent size
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
; nushell support (treesitter)
((. (require :nu) :setup) {:use_lsp_features false})

;;; lsp config
;; mason
((. (require :mason) :setup)
  {:PATH :skip ; don't modify $PATH
   :ui {:icons {:package_installed :i :package_pending "~" :package_uninstalled :X}}})
((. (require :mason-lspconfig) :setup)
  {:automatic_installation true})
;; cmp
(local cmp (require :cmp))
(local snippy (require :snippy))

(fn has-words-before [] ; no idea what goes on here lol
  (local unpack (or unpack table.unpack))
  (local (line col) (unpack (vim.api.nvim_win_get_cursor 0)))
  (and (not= col 0) (= (: (: (. (vim.api.nvim_buf_get_lines 0 (- line 1) line true) 1) :sub col col) :match "%s") nil)))

(cmp.setup {
  :snippet {
    :expand (fn [args] (snippy.expand_snippet args.body))}
  :mapping (cmp.mapping.preset.insert {
    :<C-Space> (cmp.mapping.complete)
    :<C-b> (cmp.mapping.scroll_docs -4)
    :<C-e> (cmp.mapping.abort)
    :<C-f> (cmp.mapping.scroll_docs 4)
    :<CR>  (cmp.mapping.confirm {:select true})}
    :<Tab> (cmp.mapping (fn [fallback] (if 
          (cmp.visible) (cmp.select_next_item)
          (snippy.can_expand_or_advance) (snippy.expand_or_advance)
          (has-words-before) (cmp.complete)
          (fallback))) [:i :s])
    :<S-Tab> (cmp.mapping (fn [fallback] (if
          (cmp.visible) (cmp.select_prev_item)
          (snippy.can_jump -1) (snippy.previous)
          (fallback))) [:i :s]))
  :sources (cmp.config.sources [
    {:name :nvim_lsp}
    {:name :snippy}] [{:name :buffer}])})
;; lspconfig
(local capabilities ((. (require :cmp_nvim_lsp) :default_capabilities)))
(local lspconfig (require :lspconfig))
(local servers [:clangd :rust_analyzer :pylsp])

(each [_ lsp (ipairs servers)]
  ((. (. lspconfig lsp) :setup) {:capabilities capabilities}))
