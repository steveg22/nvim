local tokyonight = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    vim.cmd [[colorscheme tokyonight]]
  end,
}

local kanagawa = {
  "rebelot/kanagawa.nvim",
  config = function()
    --vim.cmd.colorscheme("kanagawa-wave")
    vim.cmd.colorscheme("kanagawa-dragon")
  end,
}

return { kanagawa }
