--Lua.diagnostics.globals`: add element `"vim"

-- Get the lsp configs listed in /after/lua
-- local lsp_configs = {}
-- for _, f in pairs(vim.api.nvim_get_runtime_file("after/lsp/*.lua", true)) do
--   local server_name = vim.fn.fnamemodify(f, ':t:r')
--   table.insert(lsp_configs, server_name)
-- end
-- vim.lsp.enable(lsp_configs)

vim.lsp.enable({ "gopls", "lua_ls", "bashls" })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end

    --[[
    vim.api.nvim_create_autocmd('ModeChanged', {
      group = vim.api.nvim_create_augroup('diagnostic_redraw', {}),
      callback = function()
        pcall(vim.diagnostic.show)
      end
    })
    --]]
  end,
})

--[[
local og_virt_text
local og_virt_line

vim.api.nvim_create_autocmd({ 'CursorMoved', 'DiagnosticChanged' }, {
  group = vim.api.nvim_create_augroup('diagnostic_only_virtlines', {}),
  callback = function()
    if og_virt_line == nil then
      og_virt_line = vim.diagnostic.config().virtual_lines
    end

    -- ignore if virtual_lines.current_line is disabled
    if not (og_virt_line and og_virt_line.current_line) then
      if og_virt_text then
        vim.diagnostic.config({ virtual_text = og_virt_text })
        og_virt_text = nil
      end
      return
    end

    if og_virt_text == nil then
      og_virt_text = vim.diagnostic.config().virtual_text
    end

    local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1

    if vim.tbl_isempty(vim.diagnostic.get(0, { lnum = lnum })) then
      vim.diagnostic.config({ virtual_text = og_virt_text })
    else
      vim.diagnostic.config({ virtual_text = false })
    end
  end
})
--]]
