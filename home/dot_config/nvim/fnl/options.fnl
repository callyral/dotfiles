(local vopt vim.opt)
(local vo vim.o)
;; indentation
(local tabsize 4)
(set vopt.autoindent true)
(set vopt.expandtab true)
(set vopt.shiftwidth tabsize)
(set vopt.softtabstop tabsize)
(set vopt.tabstop tabsize)
(set vopt.wildmode "longest,list")
;; search
(set vopt.hlsearch true)   ; highlight matching patterns
(set vopt.ignorecase true) ; ignore search case
(set vopt.incsearch true)
(set vopt.smartcase true)
;; appearance
(set vopt.cmdheight 2)
(set vopt.list true)
(set vopt.listchars :trail:·)
(set vopt.showmatch true)
(set vopt.showmode false)
(set vopt.termguicolors true)
(set vopt.visualbell true)
;; display line numbers
(set vopt.number true)
;; folding
(set vopt.foldenable false)
(set vopt.foldlevel 99)
(set vopt.cursorline true)
(set vo.foldexpr "nvim_treesitter#foldexpr()")
(set vo.foldmethod :expr)
(set vopt.foldcolumn :1)
;; quality of life
(set vopt.backspace "indent,eol,start")
(set vopt.clipboard :unnamedplus)
(set vopt.confirm true)
(set vopt.compatible false)
(set vopt.hidden true)
(set vopt.laststatus 3) ; global statusline
(set vopt.ruler true)
(set vopt.splitbelow true)
(set vopt.splitright true)
(set vopt.ttyfast true)
;; timeout
(set vopt.timeout false)
(set vopt.ttimeout true)
(set vopt.ttimeoutlen 200)
;; other
(set vopt.encoding :UTF-8)
(set vopt.startofline false)
(when (vim.fn.has :filetype)
	(vim.cmd "filetype indent plugin on"))
(when (vim.fn.has :mouse)
  (set vopt.mouse :a))
(when (vim.fn.has :syntax)
  (set vim.syntax :on))
