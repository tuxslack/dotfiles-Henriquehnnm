return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
  -- Carrega o tema de cores Rosé Pine
  vim.cmd("colorscheme rose-pine")

  -- Habilita o destaque da linha do cursor
  vim.opt.cursorline = true

  -- Remove o destaque do texto da linha, mantendo-o apenas no gutter
  vim.cmd("highlight CursorLine guibg=NONE")
  end,
}
