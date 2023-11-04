(local autocmd vim.api.nvim_create_autocmd)
(local vopt vim.opt)

;; disable relative line numbers in insert mode
(set vopt.relativenumber true)
(autocmd ["InsertEnter"] {:callback (fn [] (set vopt.relativenumber false))})
(autocmd ["InsertLeave"] {:callback (fn [] (set vopt.relativenumber true))})
