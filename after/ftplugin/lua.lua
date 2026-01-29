--require('config.ftplugin').indent(2).treesitter()
--vim.treesitter.start()
--local set = vim.opt_local
--set.shiftwidth = 2
--vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
--vim.wo[0][0].foldmethod = 'expr'
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
