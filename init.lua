require("config")

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", "<cmd>.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- :lua =vim
-- :lua =vim.api
-- :lua =vim.api.nvim_create_autocmd
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("stephen-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end
})

local severity = vim.diagnostic.severity

-- Diagnostic Config & Keymaps
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },

  --virtal_lines = { current_line = true },
  -- Can switch between these as you prefer
  virtual_text = true,   -- Text shows up at the end of the line
  virtual_lines = false, -- Teest shows up underneath the line, with virtual lines

  signs = {
    text = {
      [severity.ERROR] = " ",
      [severity.WARN] = " ",
      [severity.HINT] = "󰠠 ",
      [severity.INFO] = " ",
    },
  },
  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = { float = true },
}
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

--[[
local job_id = 0
vim.keymap.set("n", "<leader>st", function()
  -- create a vertical split
  vim.cmd.vnew()

  -- open terminal in the new window
  vim.cmd.term()

  -- move this window to the bottom (full-width)
  vim.cmd.wincmd("J")

  -- set terminal height
  vim.api.nvim_win_set_height(0, 10)

  -- optional: enter insert mode automatically
  --vim.cmd.startinsert()
  job_id = vim.bo.channel
end, { desc = "Open terminal at bottom" })

vim.keymap.set("n", "<space>ex", function()
  vim.fn.chansend(job_id, { "echo $(date)\r\n" })
end)
--]]

-- :echo stdpath("data") -- equals vim.fn.stdpath("data") -- aka. :lua print(vim.fn.stdpath("data"))
-- :Inspect
-- :hi @function.builtin guifg=pink
-- vim.cmd [[hi @function.builtin guifg=cyan ]]
--
-- :InspectTree
-- (function_call) @fn
-- :lua print(vim.treesitter)
-- :lua vim.print(vim.treesitter)
-- :hi @conditional
-- :hi Statement
-- :hi @keyword
-- :lua vim.treesitter.start()
-- :lua vim.treesitter.stop()
--
-- :h lspconfig-all
-- :echo executable("lua-language-server")
-- :h ins-completion
-- :h lsp
--
-- :lua vim.print(vim.lsp)
-- :=vim.lsp
-- :lua vim.diagnostics.config({ virtual_text = true })
-- :lua vim.diagnostics.show()
-- :h vim.lsp.buf.format()
-- :lua vim.print(vim.lsp.protocol.make_client_capabilities())
-- :lua vim.snipper.expand("if $1 then\n  $2\nend")
-- :Telescope find_files
-- :Telescope builtin
-- complete line -> ctrl_x ctrl_l
--  g_v select previous selection
--  telescope -> when in insert mode press ctrl_/ to get for keymaps
--  :=vim.uv.cwd() (current working directory)
--  :h wincmd
--  :h windows
--  ctrl_w r (rotate windows)
--  :h quickfix
--  ctrl_q (add to quickfix list)
--  :cnext (move to next list item)
--  :cprev, :cclose, :copen
--  :cdo s/client/c/gc
--  :h substitute
--  :h setqflish
--  :h vim.diagnostic.setqflist
--  For the diagnostics quickfix, I have ":Telescope diagnostics bufnr=0<CR>" (and one without bufnr) mapped. This makes it super easy to filter diagnostics as needed and then Ctrl+Q to send the results to the quickfix list.
--   TJ, the function you were looking for to put only the buffer local diagnostics into a list is "setloclist" and uses the location list instead of the quickfix list.
