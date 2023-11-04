(local paq (require :paq))
(paq [
  :savq/paq-nvim

  ;; icons
  :nvim-tree/nvim-web-devicons

  ;; support for fennel config
  :udayvir-singh/tangerine.nvim
	;:udayvir-singh/hibiscus.nvim ; fennel nvim macros

  ;; quality-of-life
  :mcauley-penney/tidy.nvim ; trim trailing whitespace
  :sontungexpt/stcursorword
  :tmsvg/pear-tree          ; pair brackets
  :tpope/vim-sleuth         ; automatic tab size
  {1 :echasnovski/mini.nvim  :branch :stable}
  {1 :mg979/vim-visual-multi :branch :master}

  ;; git
  :lewis6991/gitsigns.nvim
  :tpope/vim-fugitive

  ;; syntax highlighting
  {1 :nvim-treesitter/nvim-treesitter :build (fn []
    ((. (require :nvim-treesitter.install) :update) {:with_sync true}))}

  ;; greeter
  :goolord/alpha-nvim

  ;; lsp
  :williamboman/mason.nvim                     ; manage lsp servers
  :williamboman/mason-lspconfig.nvim           ; lspconfig support
  :neovim/nvim-lspconfig                       ;
  {1 :ms-jpq/coq_nvim :branch :coq}            ; autocompletion
  {1 :ms-jpq/coq.artifacts :branch :artifacts} ; code snippets

  ;; colorscheme
  {1 :catppuccin/nvim :as :catppuccin}])
