(local paq (require :paq))
(paq [
  :savq/paq-nvim

  ;; icons
  :nvim-tree/nvim-web-devicons

  ;; support for fennel config
  :udayvir-singh/tangerine.nvim
	;:udayvir-singh/hibiscus.nvim ; fennel nvim macros

  ;; lsp
  :neovim/nvim-lspconfig
  {1 :ms-jpq/coq_nvim :branch :coq} ; autocompletion
  {1 :ms-jpq/coq.artifacts :branch :artifacts} ; snippets
  
  :tmsvg/pear-tree

  {1 :echasnovski/mini.nvim :branch :stable}

  {1 :mg979/vim-visual-multi :branch :master}

  :lewis6991/gitsigns.nvim
  :tpope/vim-fugitive

  ;; syntax highlighting
  {1 :nvim-treesitter/nvim-treesitter :build (fn []
    ((. (require :nvim-treesitter.install) :update) {:with_sync true}))}

  ;; greeter
  :goolord/alpha-nvim

  ;; colorscheme
  {1 :catppuccin/nvim :as :catppuccin}
])
