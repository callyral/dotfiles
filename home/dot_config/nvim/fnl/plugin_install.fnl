(local paq (require :paq))
(paq [
  :savq/paq-nvim

  ;; icons
  :nvim-tree/nvim-web-devicons

  ;; filetype support
  :udayvir-singh/tangerine.nvim
  ;:udayvir-singh/hibiscus.nvim ; fennel nvim macros

  :LhKipp/nvim-nu ; nushell

  ;; quality-of-life
  :sontungexpt/stcursorword  ; underline cursor word
  :NMAC427/guess-indent.nvim ; automatic indent size
  :echasnovski/mini.nvim     ; many useful modules that improve neovim
  :mg979/vim-visual-multi    ; multiple cursors (vimscript)

  ;; code style
  :mcauley-penney/tidy.nvim  ; trim trailing whitespace

  ;; git
  :lewis6991/gitsigns.nvim
  :tpope/vim-fugitive

  ;; syntax highlighting
  {1 :nvim-treesitter/nvim-treesitter :build (fn []
    ((. (require :nvim-treesitter.install) :update) {:with_sync true}))}

  ;; lsp
  :williamboman/mason.nvim                     ; manage lsp servers
  :williamboman/mason-lspconfig.nvim           ; lspconfig support for mason
  :neovim/nvim-lspconfig
  :hrsh7th/nvim-cmp
  :hrsh7th/cmp-nvim-lsp
  :hrsh7th/cmp-path
  :hrsh7th/cmp-buffer

  ;; snippets
  :dcampos/nvim-snippy
  :dcampos/cmp-snippy

  ;; colorscheme
  {1 :catppuccin/nvim :as :catppuccin}])
