vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
--vim.keymap.set("n", "]b", ":bnext<CR>", { noremap = true, silent = true })
--vim.keymap.set("n", "[b", ":bprev<CR>", { noremap = true, silent = true })

vim.opt.wildignore:append { "*.pyc", "node_modules" }

--function hello() print "my func()" end
--print(vim.opt.number:get())
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = false
vim.opt.splitright = true

vim.opt.wrap = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.scrolloff = 999

--vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

-- :netrw
-- vim.opt.ignorecase = true

vim.opt.termguicolors = true
